<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reg.aspx.cs" Inherits="Project.Reg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!--<link rel="stylesheet" type="text/css" href="templatemo_style.css"/>-->
    <style type="text/css">
        .auto-style1 {
            height: 22px;
        }
        .auto-style2 {
            color: #FF0000;
        }
        .auto-style3 {
            height: 75px;
        }
        .auto-style4 {
            position: absolute;
            top: 181px;
            left: 129px;
            z-index: 1;
            height: 25px;
            width: 111px;
        }
        .auto-style5 {
            width: 213px;
        }
        .auto-style6 {
            height: 22px;
            width: 213px;
        }
        .auto-style7 {
            height: 75px;
            width: 213px;
        }
        .auto-style8 {
            position: absolute;
            top: 181px;
            left: 262px;
            z-index: 1;
        }
        .auto-style9 {
            position: absolute;
            top: 218px;
            left: 32px;
            z-index: 1;
            width: 344px;
        }
        .auto-style10 {
            position: absolute;
            top: 182px;
            left: 130px;
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
        .auto-style11 {
            width: 107px;
        }
        .auto-style12 {
            height: 22px;
            width: 107px;
        }
        .auto-style13 {
            height: 75px;
            width: 107px;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
    <div class="main">
      
      
    </div>
   
<table border="0">
    <tr>
        <th colspan="3">
            Registration
        </th>
    </tr>
    <tr>
        <td class="auto-style11">
            ID</td>
        <td>
            <asp:TextBox ID="Regid" runat="server" />
        </td>
        <td class="auto-style5">
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorid" ErrorMessage="Required" ForeColor="Red" ControlToValidate="Regid"
                runat="server" />
        </td>
    </tr>
    <tr>
        <td class="auto-style12">
            Name</td>
        <td class="auto-style1">
            <asp:TextBox ID="Regname" runat="server" />
        </td>
        <td class="auto-style6">
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorname" ErrorMessage="Required" ForeColor="Red" ControlToValidate="Regname"
                runat="server" />
        </td>
    </tr>
    <tr>
        <td class="auto-style11">
            &nbsp;Password
        </td>
        <td>
            <asp:TextBox ID="Regpass" runat="server" TextMode="Password" />
        </td>
        <td class="auto-style5">
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorpass" runat="server" CssClass="auto-style2" ErrorMessage="Required" ControlToValidate="Regpass"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style11">
            Confirm Password</td>
        <td>
            <asp:TextBox ID="Regpassagain" runat="server" TextMode="Password" />
        </td>
        <td class="auto-style5">
            <asp:CompareValidator ID="CompareValidator1" ErrorMessage="Passwords do not match." ForeColor="Red" ControlToCompare="Regpass"
                ControlToValidate="Regpassagain" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="auto-style13">
        </td>
        <td class="auto-style3">
            <asp:TextBox ID="vtextbox" runat="server" CssClass="auto-style4"></asp:TextBox>
            <asp:Button ID="Submit" Text="Submit" runat="server" OnClick="RegisterUser" CssClass="auto-style10" />
            <asp:Label ID="vlabel" runat="server" CssClass="auto-style9"></asp:Label>
        </td>
        <td class="auto-style7">
            <asp:Button ID="verify" runat="server" CssClass="auto-style8" OnClick="verify_Click" Text="Verify" Width="91px" />
        </td>
    </tr>
</table>
















   
    </form>
    















   
</body>
</html>
