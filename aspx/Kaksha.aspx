<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kaksha.aspx.cs" Inherits="Project.Kaksha" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/index.css" rel="stylesheet" type="text/css"/>
    <style type="text/css" >
        .auto-style1 {
            position: absolute;
            top: 623px;
            left: 576px;
            z-index: 1;
            width: 186px;
        }
    </style>
</head>
<body class="kaksha">
    <form id="form1" runat="server">
    <div id="box">
        <h1 id="head">Welcome To Kaksha</h1>
        <p>Put some Info</p>
    
    </div>
        <asp:Button ID="ButtonLogin" runat="server" Height="37px" OnClick="ButtonLogin_Click" Text="Enter" CssClass="auto-style1" />
    </form>
</body>
</html>
