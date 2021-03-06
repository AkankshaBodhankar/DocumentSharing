﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePasswordT.aspx.cs" Inherits="Project.ChangePasswordT" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
      <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/index.css" rel="stylesheet"/>
    <style type="text/css">
        .design {
            border-style: double;
            width: 31%;
            height: 317px;
            z-index: 1;
            left: 463px;
            top: 170px;
            position: absolute;
            background-color:lightgray;
            opacity : 0.9;
             
        }

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
        .auto-style1 {
            position: absolute;
            top: 212px;
            left: 293px;
            z-index: 1;
        }
        .auto-style2 {
            position: absolute;
            top: 153px;
            left: 614px;
            z-index: 1;
            width: 97px;
        }
        .auto-style3 {
            position: absolute;
            top: 109px;
            left: 325px;
            z-index: 1;
        }
        .auto-style4 {
            position: absolute;
            top: 162px;
            left: 324px;
            z-index: 1;
        }
        .auto-style5 {
            z-index: 1;
            left: -6px;
            top: 182px;
            position: absolute;
            width: 159px;
            height: 29px;
        }
        .auto-style6 {
            z-index: 1;
            left: -48px;
            top: 125px;
            position: absolute;
            width: 161px;
            height: 27px;
            right: 266px;
        }
        .auto-style7 {
            z-index: 1;
            left: 11px;
            top: 63px;
            position: absolute;
            width: 101px;
            height: 25px;
        }
        .auto-style8 {
            border-style: double;
            width: 39%;
            height: 317px;
            z-index: 1;
            left: 409px;
            top: 170px;
            position: absolute;
            background-color: lightgray;
            opacity : 0.8;
        }
        .auto-style9 {
            z-index: 1;
            left: 170px;
            top: 60px;
            position: absolute;
            width: 130px;
            height: 18px;
        }
        .auto-style10 {
            z-index: 1;
            left: 171px;
            top: 114px;
            position: absolute;
            height: 22px;
            width: 132px;
        }
        .auto-style11 {
            z-index: 1;
            left: 171px;
            top: 169px;
            position: absolute;
            height: 25px;
            width: 128px;
        }
        .auto-style12 {
            z-index: 1;
            left: 128px;
            top: 256px;
            position: absolute;
            width: 133px;
        }
        .auto-style13 {
            height: 54px;
            position: absolute;
            top: 63px;
            left: 314px;
            z-index: 1;
            width: 97px;
        }
    </style>
</head>
<body class="bac">
            <div class="header">
            <h1>KAKSHA</h1>
            </div>
    <form id="form1" runat="server">
     <div class="container" >
    <nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Teacher Profile</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">

      

              <li class="active"><a href="TeacherHome.aspx">Home</a></li>
              
              
            </ul>
            <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="TeacherSubscribe.aspx">Send Notifications</a></li>
                 <li class="active"><a href="ChangePassword.aspx">ChangePassword</a></li>
                <li class="active"><asp:Button class="logout" ID="LogoutB" runat="server" Text="Logout" OnClick="LogoutB_Click"/></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>
      
             </div>

    <div class="auto-style8">
        <asp:TextBox ID="NewPassText" runat="server" TextMode="Password" CssClass="auto-style10"></asp:TextBox>
        <p>
            <asp:Label ID="NewPassword" runat="server" style="text-align: right; " Text="New Password" CssClass="auto-style6"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NewPassText" CssClass="auto-style3" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="OldPassText" CssClass="auto-style13" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:TextBox ID="OldPassText" runat="server" TextMode="Password" CssClass="auto-style9"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="CNewPassText" CssClass="auto-style4" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <asp:TextBox ID="CNewPassText" runat="server" TextMode="Password" CssClass="auto-style11"></asp:TextBox>
        <asp:Label ID="OldPassword" runat="server" style="text-align: right" Text="Old Password" CssClass="auto-style7"></asp:Label>
        <asp:Label ID="CNewPassword" runat="server" style="text-align: right" Text="Confirm New Password" CssClass="auto-style5"></asp:Label>
        <asp:Button ID="ChangePass" runat="server" OnClick="ChangePass_Click" Text="Change Password" CssClass="auto-style12" />
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="CNewPassText" ControlToValidate="NewPassText" CssClass="auto-style1" ErrorMessage="Passwords Must Match" ForeColor="Red"></asp:CompareValidator>
    </div>
        </form>
         <footer class="footer">
        Copyright ©
     </footer>
</body>
</html>
