﻿using System;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using myportfolio;            // ✅ To access DatabaseHelper
using myportfolio.Models;    // ✅ To access User

namespace myportfolio.Utils    // ✅ Keep namespace consistent with your project
{
    public static class AuthHelper
    {
        public static string HashPassword(string password)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(password));
                return Convert.ToBase64String(bytes);
            }
        }

        public static User AuthenticateUser(string username, string password)
        {
            string hashedPassword = User.HashPassword(password); // ✅ use same hashing logic
            string query = "SELECT * FROM Users WHERE Username = @username AND Password = @password AND IsActive = 1";

            SqlParameter[] parameters = {
                new SqlParameter("@username", username),
                new SqlParameter("@password", hashedPassword)
            };

            using (SqlDataReader reader = DatabaseHelper.ExecuteReader(query, parameters))
            {
                if (reader.Read())
                {
                    return new User
                    {
                        UserId = (int)reader["UserId"],
                        Username = reader["Username"].ToString(),
                        Email = reader["Email"].ToString(),
                        FirstName = reader["FirstName"].ToString(),
                        LastName = reader["LastName"].ToString(),
                        CreatedDate = (DateTime)reader["CreatedDate"],
                        IsActive = (bool)reader["IsActive"]
                    };
                }
            }
            return null;
        }

        public static bool IsUserLoggedIn()
        {
            return HttpContext.Current.Session["UserId"] != null;
        }

        public static User GetCurrentUser()
        {
            if (!IsUserLoggedIn()) return null;

            int userId = (int)HttpContext.Current.Session["UserId"];
            string query = "SELECT * FROM Users WHERE UserId = @userId AND IsActive = 1";
            SqlParameter[] parameters = { new SqlParameter("@userId", userId) };

            using (SqlDataReader reader = DatabaseHelper.ExecuteReader(query, parameters))
            {
                if (reader.Read())
                {
                    return new User
                    {
                        UserId = (int)reader["UserId"],
                        Username = reader["Username"].ToString(),
                        Email = reader["Email"].ToString(),
                        FirstName = reader["FirstName"].ToString(),
                        LastName = reader["LastName"].ToString(),
                        CreatedDate = (DateTime)reader["CreatedDate"],
                        IsActive = (bool)reader["IsActive"]
                    };
                }
            }
            return null;
        }

        public static void SetRememberMeCookie(string username)
        {
            HttpCookie cookie = new HttpCookie("RememberMe", username);
            cookie.Expires = DateTime.Now.AddDays(30);
            HttpContext.Current.Response.Cookies.Add(cookie);
        }

        public static void RemoveRememberMeCookie()
        {
            HttpCookie cookie = new HttpCookie("RememberMe");
            cookie.Expires = DateTime.Now.AddDays(-1);
            HttpContext.Current.Response.Cookies.Add(cookie);
        }

        public static void LogOut()
        {
            HttpContext.Current.Session.Clear();
            HttpContext.Current.Session.Abandon();
            RemoveRememberMeCookie();
        }
    }
}
