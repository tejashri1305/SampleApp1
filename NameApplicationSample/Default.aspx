<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NameApplicationSample._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

   <div class="jumbotron">
        <h3>DevOpsT</h3>
        <p class="lead">Welcome to web developer</p>
       <%-- <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>--%>
    </div>

    <div class="row">
        <div class="col-md-4">
            <asp:Label ID="Label1" runat="server" Text="Enter your Name:"></asp:Label>
            <br />   
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox> &nbsp&nbsp;&nbsp;
            <asp:Button ID="btnName" runat="server" Text="Display Name" OnClick="btnName_Click" />
            <br /><br />
            <asp:Label ID="lblName" runat="server" Text="" Font-Bold="true" ForeColor="#003399"></asp:Label>
        </div>
        </div>

</asp:Content>
