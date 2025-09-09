<%@ Page Title="Login" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="myportfolio.Pages.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - Kamrul Portfolio</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <style>
        body {
            background: #121212; /* Dark background */
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #ffffff; /* Default text color */
            font-family: 'Segoe UI', sans-serif;
        }
        .login-container {
            width: 100%;
            max-width: 400px;
        }
        .card {
            background-color: #1e1e1e; /* Dark card */
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.5);
            color: #ffffff;
        }
        .card-header {
            background-color: #000000; /* Black header */
            color: #ffffff;
            border-radius: 15px 15px 0 0 !important;
            text-align: center;
            padding: 2rem 1rem 1rem;
        }
        .form-label {
            color: #ffffff; /* White label text */
        }
        .form-control {
            background-color: #2a2a2a; /* Dark input */
            color: #ffffff;
            border: 1px solid #444;
        }
        .form-control:focus {
            border-color: #ff9800;
            box-shadow: 0 0 0 0.2rem rgba(255,152,0,0.25);
            background-color: #2a2a2a;
            color: #ffffff;
        }
        .btn-primary {
            background-color: #ff9800;
            border: none;
            color: #000;
            font-weight: bold;
        }
        .btn-primary:hover {
            background-color: #e67e22;
        }
        a {
            color: #ff9800;
        }
        a:hover {
            color: #e67e22;
            text-decoration: underline;
        }
        .text-muted {
            color: #bbb !important;
        }
        .opacity-75 {
            opacity: 0.75;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <div class="card">
                <div class="card-header">
                    <h3 class="mb-0"><i class="fas fa-user-circle me-2"></i>Login</h3>
                    <p class="mb-0 mt-2 opacity-75">Welcome back to Sayeem's Portfolio</p>
                </div>
                <div class="card-body p-4">
                    <!-- Success/Error Messages -->
                    <asp:Panel ID="pnlMessage" runat="server" Visible="false" CssClass="alert">
                        <asp:Label ID="lblMessage" runat="server"></asp:Label>
                    </asp:Panel>

                    <div class="mb-3">
                        <label for="txtUsername" class="form-label">
                            <i class="fas fa-user me-2"></i>Username or Email
                        </label>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" 
                                    placeholder="Enter your username or email" Required="true"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label for="txtPassword" class="form-label">
                            <i class="fas fa-lock me-2"></i>Password
                        </label>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" 
                                    placeholder="Enter your password" Required="true"></asp:TextBox>
                    </div>

                    <div class="d-grid gap-2">
                        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary btn-lg" 
                                  OnClick="btnLogin_Click" />
                    </div>

                    <div class="text-center mt-3">
                        <p class="mb-0">Don't have an account? 
                            <a href="Register.aspx" class="text-decoration-none fw-bold">Register here</a>
                        </p>
                    </div>

                    <div class="text-center mt-3">
                        <a href="Default.aspx" class="text-muted text-decoration-none">
                            <i class="fas fa-arrow-left me-1"></i>Back to Home
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>
