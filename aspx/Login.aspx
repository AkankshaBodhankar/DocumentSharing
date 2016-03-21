<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
     <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title></title>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/index.css" rel="stylesheet"/>
    <script type="text/javascript" src="js/index.js"></script>
  <link rel="stylesheet" type="text/css" href="Login.css"/>
    
   
    <style type="text/css">
        .header
     {
     font-family:'Comic Sans MS';
     font-size:200%;
    color:black;
    text-align:center;
    
 


       }
        .auto-style19 {
            border-style: double;
            width: 31%;
            height: 317px;
            z-index: 1;
            left: 463px;
            top: 170px;
            position: absolute;
            background-color:lightgray;
            opacity : 0.8;
             
        }
        .auto-style21 {
            width: 368px;
            text-align: center;
            height: 101px;
            color:black;
        }
        .auto-style22 {
            width: 368px;
            height: 59px;
        }
        .auto-style24 {
            z-index: 1;
            left: 105px;
            top: 240px;
            color:black;
            position: absolute;
        }
        .auto-style25 {
            z-index: 1;
            left: 112px;
            top: 271px;
            position: absolute;
            width: 129px;
        }
        .auto-style26 {
            z-index: 1;
            left: 109px;
            top: 307px;
            position: absolute;
            width: 148px;
            right: 142px;
        }
        .auto-style27 {
            height: 131px;
            width: 353px;
            text-align: left;
            border-radius: 25px;
        }
        .auto-style28 {
            width: 368px;
            text-align: center;
            height: 131px;
            color:black;
        }
        .auto-style29 {
            height: 131px;
            color: #FF0000;
            width: 212px;
        }
        .auto-style30 {
            width: 353px;
            color: lightgoldenrodyellow;
            padding-right: 1px;
            height: 59px;
        }
        .auto-style31 {
            width: 212px;
            height: 59px;
        }
        .auto-style32 {
            width: 353px;
            color: lightgoldenrodyellow;
            height: 69px;
        }
        .auto-style33 {
            width: 368px;
            height: 69px;
        }
        .auto-style34 {
            width: 212px;
            height: 69px;
        }
        .auto-style35 {
            text-align: center;
            color: #FFFFFF;
            font-size: xx-large;
            font-family: 'Monotype Corsiva';
            font-style: italic;
            text-transform: none;
        }
       
       
        .auto-style36 {
             width:100%;
              height: 40px;
             position:fixed;
            text-align: center;
            color:white;
            font-size: xx-large;
            font-family: "Monotype Corsiva";
            font-style: italic;
            text-transform: none;
            width: 1048px;
            height: 39px;
            position: absolute;
            top: 63px;
            left: 120px;
            z-index: 1;
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
        .bac {
    background-image: url('../class.jpg');
    background-repeat: no-repeat;
    background-size: cover;
    background-attachment: fixed;
}
    </style>
   
</head>
<body style="height: 459px" class="bac">
    <div class="header">
            <h1>KAKSHA</h1>
        </div>
   
    
    <form id="form1" runat="server">
         <!--  <div class="navbar navbar-default navbar-fixed-top">
   <div class="container">
        <div class="navbar-header">
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">KAKSHA</a>
            <!-- <a href="/index.html"><img src="logo.png" alt="logo" /></a>
        </div>
        <center>
            <div class="navbar-collapse collapse" id="navbar-main">
                <div class="navbar-form navbar-right" role="search">
                    <div class="form-group">
                         <asp:TextBox ID="tbuserid" class="form-control" placeholder="UserID" runat="server" Width="199px" Height="24px"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="tbpassword" class="form-control" placeholder="Password" runat="server" Width="199px" Height="24px" TextMode="Password"></asp:TextBox>
                    </div>
                    <button type="submit" class="btn btn-default">Log In</button>
                </div>
            </div>
        </center>
    </div>
</div>-->
        <table class="auto-style19" align="center">
            <tr>
                <td class="auto-style28">Username:<br class="auto-style15" />
                </td>
                <td class="auto-style27">
                    <asp:TextBox ID="TextBoxun" runat="server" Width="199px" Height="24px"></asp:TextBox>
                </td>
                <td class="auto-style29">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorun" runat="server" ControlToValidate="TextBoxun" ErrorMessage="Please enter valid username"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style21">Password:</td>
                <td class="auto-style9">
                    <asp:TextBox ID="TextBoxpss" runat="server" Width="198px" Height="26px" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorpss" runat="server" ControlToValidate="TextBoxpss" ErrorMessage="Please enter correct password"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style22"></td>
                <td class="auto-style30">
                    <asp:Button ID="Button1" runat="server" Text="Login"  Height="28px" OnClick="Button1_Click" Width="123px" CssClass="auto-style24" />
                &nbsp;&nbsp;
                    <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="Blue" NavigateUrl="~/ForgotPassword.aspx" CssClass="auto-style25">Forgot Password?</asp:HyperLink>
                </td>
                <td class="auto-style31"></td>
            </tr>
            <tr>
                <td class="auto-style33"></td>
                <td class="auto-style32">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Reg.aspx" CssClass="auto-style26">New? Register Here</asp:HyperLink>
                </td>
                <td class="auto-style34"></td>
            </tr>
        </table>
    </form>
    <p>
        &nbsp;</p>
     <footer class="footer">
        Copyright ©
     </footer>
 

</body>
</html>
