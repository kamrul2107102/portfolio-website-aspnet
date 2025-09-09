<%@ Page Title="Register" Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="myportfolio.Pages.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register - Kamrul Islam Portfolio</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            padding: 2rem 0;
        }
        .register-container {
            max-width: 500px;
            margin: 0 auto;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
        .card-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 15px 15px 0 0 !important;
            text-align: center;
            padding: 2rem 1rem 1rem;
        }
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
        }
        .btn-primary:hover {
            background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);
        }
        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="register-container">
                <div class="card">
                    <div class="card-header">
                        <h3 class="mb-0"><i class="fas fa-user-plus me-2"></i>Register</h3>
                        <p class="mb-0 mt-2 opacity-75">Create your account</p>
                    </div>
                    <div class="card-body p-4">
                        <!-- Success/Error Messages -->
                        <asp:Panel ID="pnlMessage" runat="server" Visible="false" CssClass="alert">
                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                        </asp:Panel>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="txtFirstName" class="form-label">
                                    <i class="fas fa-user me-2"></i>First Name
                                </label>
                                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" 
                                            placeholder="Enter first name"></asp:TextBox>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="txtLastName" class="form-label">
                                    <i class="fas fa-user me-2"></i>Last Name
                                </label>
                                <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" 
                                            placeholder="Enter last name"></asp:TextBox>
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="txtUsername" class="form-label">
                                <i class="fas fa-user-tag me-2"></i>Username *
                            </label>
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" 
                                        placeholder="Choose a username" Required="true"></asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <label for="txtEmail" class="form-label">
                                <i class="fas fa-envelope me-2"></i>Email *
                            </label>
                            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" 
                                        placeholder="Enter your email" Required="true"></asp:TextBox>
                        </div>
                        
                        <div class="mb-3">
                            <label for="txtPassword" class="form-label">
                                <i class="fas fa-lock me-2"></i>Password *
                            </label>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" 
                                        placeholder="Create a password" Required="true"></asp:TextBox>
                            <div class="form-text">Password should be at least 6 characters long.</div>
                        </div>

                        <div class="mb-3">
                            <label for="txtConfirmPassword" class="form-label">
                                <i class="fas fa-lock me-2"></i>Confirm Password *
                            </label>
                            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" 
                                        placeholder="Confirm your password" Required="true"></asp:TextBox>
                        </div>

                        <div class="d-grid gap-2">
                            <asp:Button ID="btnRegister" runat="server" Text="Create Account" CssClass="btn btn-primary btn-lg" 
                                      OnClick="btnRegister_Click" />
                        </div>

                        <div class="text-center mt-3">
                            <p class="mb-0">Already have an account? 
                                <a href="Login.aspx" class="text-decoration-none fw-bold">Login here</a>
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
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>