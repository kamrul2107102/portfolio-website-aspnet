using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace myportfolio.Utils
{
    public class DatabaseHelper
    {
        private static string connectionString = ConfigurationManager.ConnectionStrings["kamrulDB"].ConnectionString;

        public static SqlConnection GetConnection()
        {
            return new SqlConnection(connectionString);
        }

        public static bool ExecuteNonQuery(string query, params SqlParameter[] parameters)
        {
            try
            {
                using (SqlConnection conn = GetConnection())
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        if (parameters != null)
                        {
                            cmd.Parameters.AddRange(parameters);
                        }
                        int result = cmd.ExecuteNonQuery();
                        return result > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Database operation failed: " + ex.Message);
            }
        }

        public static DataTable ExecuteQuery(string query, params SqlParameter[] parameters)
        {
            try
            {
                using (SqlConnection conn = GetConnection())
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        if (parameters != null)
                        {
                            cmd.Parameters.AddRange(parameters);
                        }
                        using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            adapter.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Database query failed: " + ex.Message);
            }
        }

        public static object ExecuteScalar(string query, params SqlParameter[] parameters)
        {
            try
            {
                using (SqlConnection conn = GetConnection())
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        if (parameters != null)
                        {
                            cmd.Parameters.AddRange(parameters);
                        }
                        return cmd.ExecuteScalar();
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Database scalar operation failed: " + ex.Message);
            }
        }

        // ✅ Added so AuthHelper can work
        public static SqlDataReader ExecuteReader(string query, params SqlParameter[] parameters)
        {
            SqlConnection conn = GetConnection();
            SqlCommand cmd = new SqlCommand(query, conn);

            if (parameters != null)
            {
                cmd.Parameters.AddRange(parameters);
            }

            conn.Open();
            return cmd.ExecuteReader(CommandBehavior.CloseConnection);
        }
    }
}
