<%@ Page Title="Projects Management" Language="C#" MasterPageFile="~/Pages/Site.Master" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="myportfolio.Pages.Projects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <div class="row">
            <div class="col-12">
                <h2 class="mb-4">Project Management</h2>
                
                <!-- Success/Error Messages -->
                <asp:Panel ID="pnlMessage" runat="server" Visible="false" CssClass="alert">
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </asp:Panel>

                <!-- Add/Edit Project Form -->
                <div class="card mb-4">
                    <div class="card-header">
                        <h4 class="mb-0">
                            <asp:Label ID="lblFormTitle" runat="server" Text="Add New Project"></asp:Label>
                        </h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="txtTitle" class="form-label">Project Title *</label>
                                    <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" MaxLength="200" Required="true"></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <label for="txtTechnologies" class="form-label">Technologies Used</label>
                                    <asp:TextBox ID="txtTechnologies" runat="server" CssClass="form-control" MaxLength="500" 
                                                placeholder="e.g., ASP.NET, C#, SQL Server, Bootstrap"></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <label for="txtProjectUrl" class="form-label">Project URL</label>
                                    <asp:TextBox ID="txtProjectUrl" runat="server" CssClass="form-control" MaxLength="500" 
                                                placeholder="https://your-project-url.com"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="txtDescription" class="form-label">Description</label>
                                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" 
                                                TextMode="MultiLine" Rows="3"></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <label for="txtGithubUrl" class="form-label">GitHub URL</label>
                                    <asp:TextBox ID="txtGithubUrl" runat="server" CssClass="form-control" MaxLength="500" 
                                                placeholder="https://github.com/username/project"></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <label for="txtImageUrl" class="form-label">Image URL</label>
                                    <asp:TextBox ID="txtImageUrl" runat="server" CssClass="form-control" MaxLength="500" 
                                                placeholder="/images/project-screenshot.jpg"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="d-flex gap-2">
                            <asp:Button ID="btnSave" runat="server" Text="Save Project" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClick="btnCancel_Click" />
                            <asp:HiddenField ID="hdnProjectId" runat="server" Value="0" />
                        </div>
                    </div>
                </div>

                <!-- Projects Grid -->
                <div class="card">
                    <div class="card-header">
                        <h4 class="mb-0">Existing Projects</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <asp:GridView ID="gvProjects" runat="server" CssClass="table table-striped table-hover" 
                                        AutoGenerateColumns="false" DataKeyNames="ProjectId" 
                                        OnRowCommand="gvProjects_RowCommand" OnRowDataBound="gvProjects_RowDataBound">
                                <Columns>
                                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                                    <asp:TemplateField HeaderText="Description">
                                        <ItemTemplate>
                                            <%# Eval("Description").ToString().Length > 50 ? 
                                                Eval("Description").ToString().Substring(0, 50) + "..." : 
                                                Eval("Description").ToString() %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="TechnologiesUsed" HeaderText="Technologies" SortExpression="TechnologiesUsed" />
                                    <asp:TemplateField HeaderText="URLs">
                                        <ItemTemplate>
                                            <div class="d-flex flex-column gap-1">
                                                <%# !string.IsNullOrEmpty(Eval("ProjectUrl").ToString()) ? 
                                                    "<a href='" + Eval("ProjectUrl") + "' target='_blank' class='btn btn-sm btn-outline-primary'>Live Demo</a>" : "" %>
                                                <%# !string.IsNullOrEmpty(Eval("GithubUrl").ToString()) ? 
                                                    "<a href='" + Eval("GithubUrl") + "' target='_blank' class='btn btn-sm btn-outline-dark'>GitHub</a>" : "" %>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="UpdatedDate" HeaderText="Last Updated" SortExpression="UpdatedDate" 
                                                  DataFormatString="{0:MM/dd/yyyy}" />
                                    <asp:TemplateField HeaderText="Actions" ItemStyle-Width="150px">
                                        <ItemTemplate>
                                            <div class="btn-group btn-group-sm" role="group">
                                                <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-outline-primary btn-sm" 
                                                          CommandName="EditProject" CommandArgument='<%# Eval("ProjectId") %>' />
                                                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-outline-danger btn-sm" 
                                                          CommandName="DeleteProject" CommandArgument='<%# Eval("ProjectId") %>' 
                                                          OnClientClick="return confirm('Are you sure you want to delete this project?');" />
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <div class="text-center py-4">
                                        <p class="text-muted">No projects found. Add your first project above!</p>
                                    </div>
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
        .table th {
            background-color: #f8f9fa;
            font-weight: 600;
        }
        .btn-group-sm .btn {
            padding: 0.25rem 0.5rem;
            font-size: 0.875rem;
        }
        .alert {
            border-radius: 0.5rem;
        }
        .card {
            border-radius: 0.75rem;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
    </style>
</asp:Content>
