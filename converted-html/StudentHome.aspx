<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentHome.aspx.cs" Inherits="Project.StudentProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 177px;
        }
        .auto-style3 {
            width: 420px;
            height: 111px;
        }
        .auto-style4 {
            position: absolute;
            top: 5px;
            left: 888px;
            z-index: 1;
        }
        .auto-style5 {
            position: absolute;
            top: 61px;
            z-index: 1;
            width: 165px;
            left: 253px;
        }
        .auto-style6 {
            position: absolute;
            top: 61px;
            left: 33px;
            z-index: 1;
            width: 138px;
        }
        .auto-style7 {
            width: 420px;
            text-align: center;
            height: 151px;
        }
        .auto-style8 {
            position: absolute;
            top: 171px;
            left: 211px;
            z-index: 1;
        }
        .auto-style9 {
            height: 111px;
        }
        .auto-style10 {
            height: 151px;
            text-align: center;
        }
        .auto-style11 {
            position: absolute;
            top: 175px;
            left: 697px;
            z-index: 1;
        }
        body
        {
            color:black;
            background-image:url(bc1.jpg);
            background-attachment:fixed;
            background-size:cover;
            background-repeat:no-repeat;

        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="SwelcomeLabel" runat="server" Text="Welcome"></asp:Label>
                    <asp:Button ID="B_Slogout" runat="server" OnClick="B_Slogout_Click1" Text="Logout" Width="100px" CssClass="auto-style4" />
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">
                    <asp:Button ID="ButtonShome" runat="server" CssClass="auto-style6" Text="Home" OnClick="ButtonShome_Click" />
                    <asp:Button ID="ButtonSprofile" runat="server" CssClass="auto-style5" Text="Profile" OnClick="ButtonSprofile_Click1" style="height: 26px" />
                </td>
                <td class="auto-style9">
                    <asp:Button ID="ButtonSSub" runat="server" Height="43px" Text="Subscribe" Width="231px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:HyperLink ID="HyperLinkgetupload1" runat="server">Download1</asp:HyperLink>
                    <asp:Label ID="Label1" runat="server" CssClass="auto-style8" Text="Label"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:Label ID="Label2" runat="server" CssClass="auto-style8" Text="Label"></asp:Label>
                    <asp:Label ID="Label3" runat="server" CssClass="auto-style11" Text="Label"></asp:Label>
                    <asp:HyperLink ID="HyperLink1" runat="server">HyperLink</asp:HyperLink>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
