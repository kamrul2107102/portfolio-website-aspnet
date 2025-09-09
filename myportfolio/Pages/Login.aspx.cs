using System;
using System.Web.Security;
using System.Web.UI;
using myportfolio.Models;
using MPUser = myportfolio.Models.User; // Alias to avoid conflict with Page.User

namespace myportfolio.Pages
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is already logged in
            if (User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Pages/Default.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(txtUsername.Text.Trim()) || string.IsNullOrEmpty(txtPassword.Text))
                {
                    ShowMessage("Please enter both username/email and password.", "warning");
                    return;
                }

                // Use the alias MPUser instead of User
                MPUser user = MPUser.Login(txtUsername.Text.Trim(), txtPassword.Text);

                if (user != null)
                {
                    // Create authentication ticket
                    FormsAuthentication.SetAuthCookie(user.Username, false);

                    // Store user info in session
                    Session["UserId"] = user.UserId;
                    Session["Username"] = user.Username;
                    Session["Email"] = user.Email;
                    Session["FullName"] = $"{user.FirstName} {user.LastName}".Trim();

                    // Redirect to the page user was trying to access or default page
                    string returnUrl = Request.QueryString["ReturnUrl"];
                    if (!string.IsNullOrEmpty(returnUrl))
                    {
                        Response.Redirect(returnUrl);
                    }
                    else
                    {
                        Response.Redirect("~/Pages/Default.aspx");
                    }
                }
                else
                {
                    ShowMessage("Invalid username/email or password. Please try again.", "danger");
                    txtPassword.Text = ""; // Clear password field
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Login failed: " + ex.Message, "danger");
                txtPassword.Text = "";
            }
        }

        private void ShowMessage(string message, string type)
        {
            pnlMessage.Visible = true;
            pnlMessage.CssClass = $"alert alert-{type} alert-dismissible fade show";
            lblMessage.Text = message;
        }
    }
}
