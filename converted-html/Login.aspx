<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <!--  <link rel="stylesheet" type="text/css" href="templatemo_style.css">-->
    <title></title>
   
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 217px;
        }
        .auto-style3 {
            width: 217px;
            text-align: right;
            height: 71px;
        }
        .auto-style4 {
            width: 217px;
            text-align: right;
            height: 101px;
        }
        .auto-style5 {
            height: 101px;
            color: #FF0000;
        }
        .auto-style6 {
            text-align: center;
            color:black;
            font-size: xx-large;
        }
        .auto-style7 {
            height: 71px;
            color: #FF0000;
        }
        .auto-style8 {
            height: 71px;
            width: 353px;
            text-align: left;
        }
        .auto-style9 {
            height: 101px;
            width: 353px;
        }
        .auto-style10 {
            width: 353px;
            color:lightgoldenrodyellow;
             
        }


        .but1
        {
             border-top-left-radius: 20px;
            border-top-right-radius: 20px;
            border-bottom-left-radius: 20px;
            border-bottom-right-radius: 20px;
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
            width: 217px;
            height: 23px;
        }
        .auto-style12 {
            width: 353px;
            color: lightgoldenrodyellow;
            height: 23px;
        }
        .auto-style13 {
            height: 23px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="auto-style6">
    
        <strong><em>Login Page</em></strong></div>
        <table class="auto-style1" align="center">
            <tr>
                <td class="auto-style3">username: </td>
                <td class="auto-style8">
                    <asp:TextBox ID="TextBoxun" runat="server" Width="199px" Height="24px"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorun" runat="server" ControlToValidate="TextBoxun" ErrorMessage="Please enter valid username"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">password:</td>
                <td class="auto-style9">
                    <asp:TextBox ID="TextBoxpss" runat="server" Width="198px" Height="26px" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorpss" runat="server" ControlToValidate="TextBoxpss" ErrorMessage="Please enter correct password"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style10">
                    <asp:Button ID="Button1" runat="server" Text="Login" Height="28px" OnClick="Button1_Click" Width="123px" />
                &nbsp;&nbsp;
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11"></td>
                <td class="auto-style12">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Reg.aspx">New ? Click here to Register</asp:HyperLink>
                </td>
                <td class="auto-style13"></td>
            </tr>
        </table>
    </form>
</body>
</html>
