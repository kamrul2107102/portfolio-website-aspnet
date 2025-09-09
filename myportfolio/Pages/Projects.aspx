<%@ Page Title="Projects Management" Language="C#" MasterPageFile="~/Pages/Site.Master" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="myportfolio.Pages.Projects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">

        <h2>Project Management</h2>

        <!-- Success/Error Messages -->
        <asp:Panel ID="pnlMessage" runat="server" Visible="false" CssClass="message-box">
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </asp:Panel>

        <!-- Add Project Button -->
        <div class="button-container">
            <asp:Button ID="btnAddProject" runat="server" Text="Add Project" CssClass="btn-add" OnClick="btnAddProject_Click" />
        </div>

        <!-- Add/Edit Project Form -->
        <div id="addProjectForm" runat="server" class="card" Visible="false">
            <div class="card-header">
                <asp:Label ID="lblFormTitle" runat="server" Text="Add New Project"></asp:Label>
            </div>
            <div class="card-body">
                <asp:HiddenField ID="hdnProjectId" runat="server" Value="0" />

                <div class="form-row">
                    <div class="form-group">
                        <label for="txtTitle">Title *</label>
                        <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" MaxLength="200" />
                    </div>
                    <div class="form-group">
                        <label for="txtTechnologies">Technologies Used</label>
                        <asp:TextBox ID="txtTechnologies" runat="server" CssClass="form-control" MaxLength="500" />
                    </div>
                    <div class="form-group">
                        <label for="txtProjectUrl">Project URL</label>
                        <asp:TextBox ID="txtProjectUrl" runat="server" CssClass="form-control" MaxLength="500" />
                    </div>
                    <div class="form-group">
                        <label for="txtDescription">Description</label>
                        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
                    </div>
                    <div class="form-group">
                        <label for="txtGithubUrl">GitHub URL</label>
                        <asp:TextBox ID="txtGithubUrl" runat="server" CssClass="form-control" MaxLength="500" />
                    </div>
                    <div class="form-group">
                        <label for="txtImageUrl">Image URL</label>
                        <asp:TextBox ID="txtImageUrl" runat="server" CssClass="form-control" MaxLength="500" />
                    </div>
                </div>

                <div class="form-actions">
                    <asp:Button ID="btnSave" runat="server" Text="Save Project" CssClass="btn-save" OnClick="btnSave_Click" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn-cancel" OnClick="btnCancel_Click" />
                </div>
            </div>
        </div>

        <!-- Projects Grid -->
        <div class="card">
            <div class="card-header">
                Existing Projects
            </div>
            <div class="card-body">
                <asp:GridView ID="gvProjects" runat="server"
                              CssClass="gridview"
                              AutoGenerateColumns="false"
                              DataKeyNames="ProjectId"
                              OnRowCommand="gvProjects_RowCommand"
                              OnRowDataBound="gvProjects_RowDataBound"
                              GridLines="Both">
                    <Columns>
                        <asp:BoundField DataField="Title" HeaderText="Title" />
                        <asp:BoundField DataField="Description" HeaderText="Description" />
                        <asp:BoundField DataField="TechnologiesUsed" HeaderText="Technologies" />
                        <asp:BoundField DataField="ProjectUrl" HeaderText="Project URL" />
                        <asp:BoundField DataField="GithubUrl" HeaderText="GitHub URL" />
                        <asp:BoundField DataField="UpdatedDate" HeaderText="Last Updated" DataFormatString="{0:MM/dd/yyyy}" />

                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" Text="Edit"
                                            CommandName="EditProject"
                                            CommandArgument='<%# Eval("ProjectId") %>'
                                            CssClass="btn-edit" />
                                <asp:Button ID="btnDelete" runat="server" Text="Delete"
                                            CommandName="DeleteProject"
                                            CommandArgument='<%# Eval("ProjectId") %>'
                                            CssClass="btn-delete"
                                            OnClientClick="return confirm('Are you sure you want to delete this project?');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div class="empty-text">No projects found. Add a project above.</div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>
    </div>

    <style>
        .container {
            width: 90%;
            margin: 0 auto;
            font-family: Arial, sans-serif;
        }
        h2 {
            margin-bottom: 20px;
        }
        .message-box {
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            display: none;
        }
        .btn-add, .btn-save, .btn-cancel, .btn-edit, .btn-delete {
            padding: 5px 10px;
            margin-right: 5px;
            cursor: pointer;
        }
        .btn-add { background-color: #28a745; color: #fff; border: none; }
        .btn-save { background-color: #007bff; color: #fff; border: none; }
        .btn-cancel { background-color: #6c757d; color: #fff; border: none; }
        .btn-edit { background-color: #ffc107; color: #000; border: none; }
        .btn-delete { background-color: #dc3545; color: #fff; border: none; }
        .card {
            border: 1px solid #ccc;
            border-radius: 6px;
            margin-bottom: 20px;
            overflow: hidden;
        }
        .card-header {
            background-color: #f0f0f0;
            padding: 10px;
            font-weight: bold;
        }
        .card-body {
            padding: 10px;
        }
        .form-group {
            margin-bottom: 10px;
        }
        .form-control {
            width: 100%;
            padding: 6px;
            box-sizing: border-box;
        }
        .form-actions {
            margin-top: 10px;
        }
        .gridview {
            width: 100%;
            border-collapse: collapse;
        }
        .gridview th, .gridview td {
            padding: 8px;
            border: 1px solid #ccc;
        }
        .gridview th {
            background-color: #f0f0f0;
            font-weight: bold;
        }
        .empty-text {
            text-align: center;
            color: #777;
            padding: 10px;
        }
    </style>
</asp:Content>
