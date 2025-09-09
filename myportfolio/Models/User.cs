using System;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using myportfolio.Utils;

namespace myportfolio.Models
{
    public class User
    {
        public int UserId { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime CreatedDate { get; set; }
        public bool IsActive { get; set; }

        public string FullName => $"{FirstName} {LastName}".Trim();

        // Hash password using SHA256
        public static string HashPassword(string password)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(password + "SayeemPortfolio")); // Salt
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }

        // Register new user
        public bool Register()
        {
            try
            {
                string checkQuery = "SELECT COUNT(*) FROM Users WHERE Username = @Username OR Email = @Email";
                object count = DatabaseHelper.ExecuteScalar(checkQuery,
                    new SqlParameter("@Username", Username),
                    new SqlParameter("@Email", Email));

                if (Convert.ToInt32(count) > 0) return false;

                string insertQuery = @"INSERT INTO Users (Username, Email, Password, FirstName, LastName, CreatedDate, IsActive) 
                                       VALUES (@Username, @Email, @Password, @FirstName, @LastName, @CreatedDate, @IsActive)";

                return DatabaseHelper.ExecuteNonQuery(insertQuery,
                    new SqlParameter("@Username", Username),
                    new SqlParameter("@Email", Email),
                    new SqlParameter("@Password", HashPassword(Password)),
                    new SqlParameter("@FirstName", FirstName ?? ""),
                    new SqlParameter("@LastName", LastName ?? ""),
                    new SqlParameter("@CreatedDate", DateTime.Now),
                    new SqlParameter("@IsActive", true));
            }
            catch (Exception ex)
            {
                throw new Exception("Registration failed: " + ex.Message);
            }
        }

        // Login user
        public static User Login(string username, string password)
        {
            try
            {
                string hashedPassword = HashPassword(password);
                string query = @"SELECT UserId, Username, Email, FirstName, LastName, CreatedDate, IsActive 
                               FROM Users WHERE (Username = @Username OR Email = @Username) 
                               AND Password = @Password AND IsActive = 1";

                DataTable dt = DatabaseHelper.ExecuteQuery(query,
                    new SqlParameter("@Username", username),
                    new SqlParameter("@Password", hashedPassword));

                if (dt.Rows.Count > 0)
                {
                    DataRow row = dt.Rows[0];
                    return new User
                    {
                        UserId = Convert.ToInt32(row["UserId"]),
                        Username = row["Username"].ToString(),
                        Email = row["Email"].ToString(),
                        FirstName = row["FirstName"].ToString(),
                        LastName = row["LastName"].ToString(),
                        CreatedDate = Convert.ToDateTime(row["CreatedDate"]),
                        IsActive = Convert.ToBoolean(row["IsActive"])
                    };
                }
                return null;
            }
            catch (Exception ex)
            {
                throw new Exception("Login failed: " + ex.Message);
            }
        }

        // Get user by ID
        public static User GetUserById(int userId)
        {
            string query = @"SELECT UserId, Username, Email, FirstName, LastName, CreatedDate, IsActive 
                           FROM Users WHERE UserId = @UserId AND IsActive = 1";

            DataTable dt = DatabaseHelper.ExecuteQuery(query,
                new SqlParameter("@UserId", userId));

            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];
                return new User
                {
                    UserId = Convert.ToInt32(row["UserId"]),
                    Username = row["Username"].ToString(),
                    Email = row["Email"].ToString(),
                    FirstName = row["FirstName"].ToString(),
                    LastName = row["LastName"].ToString(),
                    CreatedDate = Convert.ToDateTime(row["CreatedDate"]),
                    IsActive = Convert.ToBoolean(row["IsActive"])
                };
            }
            return null;
        }
    }
}
