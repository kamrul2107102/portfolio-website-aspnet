using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using myportfolio.Utils;

namespace myportfolio.Models
{
    public class Project
    {
        public int ProjectId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string TechnologiesUsed { get; set; }
        public string ProjectUrl { get; set; }
        public string GithubUrl { get; set; }
        public string ImageUrl { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime UpdatedDate { get; set; }
        public bool IsActive { get; set; }

        // CRUD Operations
        public static List<Project> GetAllProjects()
        {
            List<Project> projects = new List<Project>();
            string query = @"SELECT ProjectId, Title, Description, TechnologiesUsed, ProjectUrl, 
                            GithubUrl, ImageUrl, CreatedDate, UpdatedDate, IsActive 
                            FROM Projects WHERE IsActive = 1 ORDER BY UpdatedDate DESC";

            DataTable dt = DatabaseHelper.ExecuteQuery(query);

            foreach (DataRow row in dt.Rows)
            {
                projects.Add(new Project
                {
                    ProjectId = Convert.ToInt32(row["ProjectId"]),
                    Title = row["Title"].ToString(),
                    Description = row["Description"].ToString(),
                    TechnologiesUsed = row["TechnologiesUsed"].ToString(),
                    ProjectUrl = row["ProjectUrl"].ToString(),
                    GithubUrl = row["GithubUrl"].ToString(),
                    ImageUrl = row["ImageUrl"].ToString(),
                    CreatedDate = Convert.ToDateTime(row["CreatedDate"]),
                    UpdatedDate = Convert.ToDateTime(row["UpdatedDate"]),
                    IsActive = Convert.ToBoolean(row["IsActive"])
                });
            }

            return projects;
        }

        public static Project GetProjectById(int projectId)
        {
            string query = @"SELECT ProjectId, Title, Description, TechnologiesUsed, ProjectUrl, 
                            GithubUrl, ImageUrl, CreatedDate, UpdatedDate, IsActive 
                            FROM Projects WHERE ProjectId = @ProjectId";

            DataTable dt = DatabaseHelper.ExecuteQuery(query,
                new SqlParameter("@ProjectId", projectId));

            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];
                return new Project
                {
                    ProjectId = Convert.ToInt32(row["ProjectId"]),
                    Title = row["Title"].ToString(),
                    Description = row["Description"].ToString(),
                    TechnologiesUsed = row["TechnologiesUsed"].ToString(),
                    ProjectUrl = row["ProjectUrl"].ToString(),
                    GithubUrl = row["GithubUrl"].ToString(),
                    ImageUrl = row["ImageUrl"].ToString(),
                    CreatedDate = Convert.ToDateTime(row["CreatedDate"]),
                    UpdatedDate = Convert.ToDateTime(row["UpdatedDate"]),
                    IsActive = Convert.ToBoolean(row["IsActive"])
                };
            }

            return null;
        }

        public bool Save()
        {
            if (ProjectId == 0)
            {
                return Create();
            }
            else
            {
                return Update();
            }
        }

        private bool Create()
        {
            string query = @"INSERT INTO Projects (Title, Description, TechnologiesUsed, ProjectUrl, 
                            GithubUrl, ImageUrl, CreatedDate, UpdatedDate, IsActive) 
                            VALUES (@Title, @Description, @TechnologiesUsed, @ProjectUrl, 
                            @GithubUrl, @ImageUrl, @CreatedDate, @UpdatedDate, @IsActive)";

            return DatabaseHelper.ExecuteNonQuery(query,
                new SqlParameter("@Title", Title ?? ""),
                new SqlParameter("@Description", Description ?? ""),
                new SqlParameter("@TechnologiesUsed", TechnologiesUsed ?? ""),
                new SqlParameter("@ProjectUrl", ProjectUrl ?? ""),
                new SqlParameter("@GithubUrl", GithubUrl ?? ""),
                new SqlParameter("@ImageUrl", ImageUrl ?? ""),
                new SqlParameter("@CreatedDate", DateTime.Now),
                new SqlParameter("@UpdatedDate", DateTime.Now),
                new SqlParameter("@IsActive", true));
        }

        private bool Update()
        {
            string query = @"UPDATE Projects SET Title = @Title, Description = @Description, 
                            TechnologiesUsed = @TechnologiesUsed, ProjectUrl = @ProjectUrl, 
                            GithubUrl = @GithubUrl, ImageUrl = @ImageUrl, UpdatedDate = @UpdatedDate 
                            WHERE ProjectId = @ProjectId";

            return DatabaseHelper.ExecuteNonQuery(query,
                new SqlParameter("@Title", Title ?? ""),
                new SqlParameter("@Description", Description ?? ""),
                new SqlParameter("@TechnologiesUsed", TechnologiesUsed ?? ""),
                new SqlParameter("@ProjectUrl", ProjectUrl ?? ""),
                new SqlParameter("@GithubUrl", GithubUrl ?? ""),
                new SqlParameter("@ImageUrl", ImageUrl ?? ""),
                new SqlParameter("@UpdatedDate", DateTime.Now),
                new SqlParameter("@ProjectId", ProjectId));
        }

        // ENHANCED DELETE METHOD WITH PROPER ERROR HANDLING
        public static bool Delete(int projectId)
        {
            try
            {
                System.Diagnostics.Debug.WriteLine($"Project.Delete called with ID: {projectId}");

                // First check if the project exists and is active
                string checkQuery = "SELECT COUNT(*) FROM Projects WHERE ProjectId = @ProjectId AND IsActive = 1";
                object count = DatabaseHelper.ExecuteScalar(checkQuery,
                    new SqlParameter("@ProjectId", projectId));

                System.Diagnostics.Debug.WriteLine($"Active project count found: {count}");

                if (Convert.ToInt32(count) == 0)
                {
                    System.Diagnostics.Debug.WriteLine("Project not found or already deleted");
                    return false;
                }

                // Perform the soft delete
                string query = "UPDATE Projects SET IsActive = 0, UpdatedDate = @UpdatedDate WHERE ProjectId = @ProjectId";
                bool result = DatabaseHelper.ExecuteNonQuery(query,
                    new SqlParameter("@ProjectId", projectId),
                    new SqlParameter("@UpdatedDate", DateTime.Now));

                System.Diagnostics.Debug.WriteLine($"Update query result: {result}");
                return result;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Exception in Project.Delete: {ex.Message}");
                System.Diagnostics.Debug.WriteLine($"Stack Trace: {ex.StackTrace}");
                throw new Exception("Failed to delete project: " + ex.Message, ex);
            }
        }
    }
}