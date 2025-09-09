using System;
using System.Web.Security;
using System.Web.UI;
using myportfolio.Models;

namespace myportfolio.Pages
{
    public partial class Register : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is already logged in
            if (User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Pages/Default.aspx");
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                // Validation
                if (string.IsNullOrEmpty(txtUsername.Text.Trim()))
                {
                    ShowMessage("Username is required.", "warning");
                    return;
                }

                if (string.IsNullOrEmpty(txtEmail.Text.Trim()))
                {
                    ShowMessage("Email is required.", "warning");
                    return;
                }

                if (string.IsNullOrEmpty(txtPassword.Text))
                {
                    ShowMessage("Password is required.", "warning");
                    return;
                }

                if (txtPassword.Text.Length < 6)
                {
                    ShowMessage("Password must be at least 6 characters long.", "warning");
                    return;
                }

                if (txtPassword.Text != txtConfirmPassword.Text)
                {
                    ShowMessage("Passwords do not match.", "warning");
                    txtConfirmPassword.Text = "";
                    return;
                }

                // Email format validation
                if (!IsValidEmail(txtEmail.Text.Trim()))
                {
                    ShowMessage("Please enter a valid email address.", "warning");
                    return;
                }

                // Create new user
                User newUser = new User
                {
                    Username = txtUsername.Text.Trim(),
                    Email = txtEmail.Text.Trim().ToLower(),
                    Password = txtPassword.Text,
                    FirstName = txtFirstName.Text.Trim(),
                    LastName = txtLastName.Text.Trim()
                };

                bool success = newUser.Register();

                if (success)
                {
                    ShowMessage("Registration successful! You can now login with your credentials.", "success");
                    ClearForm();

                    // Redirect to login page after 2 seconds
                    Response.AddHeader("REFRESH", "2;URL=Login.aspx");
                }
                else
                {
                    ShowMessage("Registration failed. Username or email may already exist.", "danger");
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Registration failed: " + ex.Message, "danger");
            }
        }

        private bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }

        private void ClearForm()
        {
            txtUsername.Text = "";
            txtEmail.Text = "";
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
        }

        private void ShowMessage(string message, string type)
        {
            pnlMessage.Visible = true;
            pnlMessage.CssClass = $"alert alert-{type} alert-dismissible fade show";
            lblMessage.Text = message;
        }
    }
}