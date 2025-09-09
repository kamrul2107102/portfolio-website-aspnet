using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using myportfolio.Models;
using myportfolio.Utils;

namespace myportfolio.Pages
{
    public partial class Projects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var currentUser = AuthHelper.GetCurrentUser();
            if (currentUser == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                BindProjectsGrid();
                addProjectForm.Visible = false; // Hide form initially
            }
        }

        private void BindProjectsGrid()
        {
            try
            {
                var projects = Project.GetAllProjects();
                gvProjects.DataSource = projects;
                gvProjects.DataBind();
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading projects: " + ex.Message, "alert-danger");
            }
        }

        protected void btnAddProject_Click(object sender, EventArgs e)
        {
            ClearForm();
            addProjectForm.Visible = true;
            btnAddProject.Visible = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    Project project = new Project();
                    int projectId = Convert.ToInt32(hdnProjectId.Value);

                    if (projectId > 0)
                    {
                        project = Project.GetProjectById(projectId);
                        if (project == null)
                        {
                            ShowMessage("Project not found.", "alert-danger");
                            return;
                        }
                    }

                    project.Title = txtTitle.Text.Trim();
                    project.Description = txtDescription.Text.Trim();
                    project.TechnologiesUsed = txtTechnologies.Text.Trim();
                    project.ProjectUrl = txtProjectUrl.Text.Trim();
                    project.GithubUrl = txtGithubUrl.Text.Trim();
                    project.ImageUrl = txtImageUrl.Text.Trim();

                    if (project.Save())
                    {
                        string message = projectId > 0 ? "Project updated successfully!" : "Project added successfully!";
                        ShowMessage(message, "alert-success");
                        ClearForm();
                        BindProjectsGrid();
                        addProjectForm.Visible = false;
                        btnAddProject.Visible = true;
                    }
                    else
                    {
                        ShowMessage("Failed to save project. Please try again.", "alert-danger");
                    }
                }
                catch (Exception ex)
                {
                    ShowMessage("An error occurred: " + ex.Message, "alert-danger");
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearForm();
            addProjectForm.Visible = false;
            btnAddProject.Visible = true;
        }

        // ------------------ DELETE PROJECT ------------------
        protected void gvProjects_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int projectId = Convert.ToInt32(e.CommandArgument);

                if (e.CommandName == "EditProject")
                {
                    LoadProjectForEdit(projectId);
                }
                else if (e.CommandName == "DeleteProject")
                {
                    DeleteProject(projectId);
                }
            }
            catch (Exception ex)
            {
                ShowMessage("An error occurred: " + ex.Message, "alert-danger");
            }
        }

        private void DeleteProject(int projectId)
        {
            try
            {
                string query = "DELETE FROM Projects WHERE ProjectId = @projectId";
                SqlParameter[] parameters = { new SqlParameter("@projectId", projectId) };

                DatabaseHelper.ExecuteNonQuery(query, parameters);
                BindProjectsGrid(); // Refresh the grid after deletion
                ShowMessage("Project deleted successfully!", "alert-success");
            }
            catch (Exception ex)
            {
                ShowMessage("Error deleting project: " + ex.Message, "alert-danger");
            }
        }

        // ------------------ ADD / EDIT ------------------
        private void LoadProjectForEdit(int projectId)
        {
            try
            {
                Project project = Project.GetProjectById(projectId);
                if (project != null)
                {
                    hdnProjectId.Value = project.ProjectId.ToString();
                    txtTitle.Text = project.Title;
                    txtDescription.Text = project.Description;
                    txtTechnologies.Text = project.TechnologiesUsed;
                    txtProjectUrl.Text = project.ProjectUrl;
                    txtGithubUrl.Text = project.GithubUrl;
                    txtImageUrl.Text = project.ImageUrl;

                    lblFormTitle.Text = "Edit Project";
                    btnSave.Text = "Update Project";

                    addProjectForm.Visible = true;
                    btnAddProject.Visible = false;

                    ScriptManager.RegisterStartupScript(this, GetType(), "ScrollToForm",
                        "document.querySelector('.card').scrollIntoView({ behavior: 'smooth' });", true);
                }
                else
                {
                    ShowMessage("Project not found.", "alert-danger");
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading project: " + ex.Message, "alert-danger");
            }
        }

        private void ClearForm()
        {
            hdnProjectId.Value = "0";
            txtTitle.Text = "";
            txtDescription.Text = "";
            txtTechnologies.Text = "";
            txtProjectUrl.Text = "";
            txtGithubUrl.Text = "";
            txtImageUrl.Text = "";

            lblFormTitle.Text = "Add New Project";
            btnSave.Text = "Save Project";
        }

        private void ShowMessage(string message, string cssClass)
        {
            lblMessage.Text = message;
            pnlMessage.CssClass = "alert " + cssClass;
            pnlMessage.Visible = true;

            ScriptManager.RegisterStartupScript(this, GetType(), "HideMessage",
                "setTimeout(function() { var alertElement = document.querySelector('.alert'); if(alertElement) alertElement.style.display = 'none'; }, 5000);", true);
        }

        // ------------------ EMPTY ROW DATA BOUND HANDLER ------------------
        protected void gvProjects_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // Leave empty if no special formatting is required
        }
    }
}
