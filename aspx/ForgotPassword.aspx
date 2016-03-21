<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Project.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">

       
       .header {
            font-family: 'Comic Sans MS';
            font-size: 150%;
            color: black;
            text-align: center;
        }
        
          .bac {
    background-image: url('../class.jpg');
    background-repeat: no-repeat;
    background-size: cover;
    background-attachment: fixed;
} 

         .footer {
            position:fixed;
            bottom:0;
            left:0;
            right:0;
            height:20px;
            background-color:lightgray;
            color:black;
            clear:both;
            text-align:center;
            padding:5px;
        }


         .tableclass{
            background-color:lightgray;
            opacity: 0.7;
            color: white;
         }  


        .auto-style1 {
            height: 354px;
        }
        .auto-style2 {
            z-index: 1;
            left: 375px;
            top: 66px;
            position: absolute;
        }
        .auto-style3 {
            position: absolute;
            top: 145px;
            left: 398px;
            z-index: 1;
        }
        .auto-style4 {
            position: absolute;
            top: 111px;
            left: 399px;
            z-index: 1;
        }
        .auto-style5 {
            position: absolute;
            left: 394px;
            z-index: 1;
            top: 144px;
            width: 111px;
 

        }
    </style>
</head>
<body class="bac" style="height: 477px; width: 954px">
<div class="header">
            <h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; KAKSHA</h1>
        </div>
    <form id="form1" runat="server">
    <div style="height: 352px">
    
        <table class="tableclass" style="border-style: solid; border-width: 1px; padding: 1px 4px; width: 60%; height: 177px; z-index: 1; left: 274px; top: 125px; position: absolute;">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 56px;color:black; top: 68px; position: absolute; width: 126px; text-align: right" Text="Student/Teacher ID:"></asp:Label>
                    <asp:Label ID="Label2" runat="server" style="z-index: 1; left: 3px; color:black;top: 66px; position: absolute; width: 286px; height: 27px; right: 281px" Text="Enter the Recovery Code is sent to your eMail"></asp:Label>
                    <asp:Label ID="CNewPasswordLabel" runat="server" style="z-index: 1; color:black;left: 77px; top: 145px; position: absolute; text-align: right" Text="Confirm New Password"></asp:Label>
                    <asp:Label ID="NewPasswordLabel" runat="server" style="z-index: 1; color:black;left: 125px; top: 107px; position: absolute; text-align: right; height: 22px; width: 99px" Text="New Password"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="IDBox" runat="server" style="z-index: 1; top: 66px; position: absolute; left: 192px; right: 250px"></asp:TextBox>
                    <asp:Button ID="Submit1" runat="server" OnClick="Submit1_Click" Text="Submit" CssClass="auto-style2" />
                    <asp:TextBox ID="VerifyBox" runat="server" style="z-index: 1; left: 298px; top: 63px; position: absolute; height: 23px; width: 143px"></asp:TextBox>
                    <asp:Button ID="ForgotSubmit" runat="server" OnClick="ForgotSubmit_Click" style="z-index: 1; left: 213px; top: 176px; position: absolute" Text="Submit" />
                    <asp:TextBox ID="NewPassword" runat="server" style="z-index: 1; left: 250px; top: 109px; position: absolute" TextMode="Password"></asp:TextBox>
                    <asp:TextBox ID="CNewPassword" runat="server" style="z-index: 1; left: 250px; top: 145px; position: absolute" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:Button ID="Verify" runat="server" OnClick="Verify_Click" style="z-index: 1; top: 62px; position: absolute; left: 463px" Text="Verify" />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="CNewPassword" ControlToValidate="NewPassword" CssClass="auto-style3" ErrorMessage="Passwords Must Match" ForeColor="Red"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="CNewPassword" CssClass="auto-style5" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="NewPassword" CssClass="auto-style4" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
    
        <br />
        <br />
        <br />
        <br />
    
    </div>
    </form>
     <footer class="footer">
        Copyright ©
     </footer>
</body>
</html>
