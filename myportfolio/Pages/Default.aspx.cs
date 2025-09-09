using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace PortfolioWebApp
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadFeaturedProjects();
            }
        }

        private void LoadFeaturedProjects()
        {
            // Use the correct connection string name from web.config
            string connString = ConfigurationManager.ConnectionStrings["kamrulDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                try
                {
                    conn.Open();

                    string query = @"
                        SELECT TOP 4 ProjectId, Title, Description, TechnologiesUsed, ProjectUrl, GithubUrl, ImageUrl, CreatedDate, UpdatedDate, IsActive
                        FROM Projects
                        WHERE IsActive = 1
                        ORDER BY CreatedDate DESC";

                    SqlDataAdapter da = new SqlDataAdapter(query, conn);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    FeaturedProjectsRepeater.DataSource = dt;
                    FeaturedProjectsRepeater.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<div style='color:red;'>Error loading featured projects: " + ex.Message + "</div>");
                }
            }
        }
    }
}
