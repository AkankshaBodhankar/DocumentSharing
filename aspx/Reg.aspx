<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reg.aspx.cs" Inherits="Project.Reg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
     <link href="Reg.css" rel="stylesheet" type="text/css"/>
    <style type="text/css">
        .auto-style18 {
            background-color:lightgray !important;
            border-style: double;
            z-index: 1;
            left: 130px;
            top: 203px;
            position: absolute;
            height: 251px;
            width: 485px;
            opacity: 0.7;
            color: black;
        }
        .auto-style19 {
            z-index: 1;
            left: 7px;
            top: 96px;
            position: absolute;
            height: 19px;
            width: 99px;
            color:black;
        }
        .auto-style20 {
            z-index: 1;
            left: 100px;
            top: 135px;
            position: absolute;
            height: 21px;
            color:black;
        }
        .auto-style22 {
            width: 33%;
            height: 239px;
            position: absolute;
            top: 195px;
            left: 788px;
            z-index: 1;
            background-color:lightgray !important;
            opacity:0.7;
            color: black;
            
        }
        .auto-style23 {
            text-align: center;
        }
        .auto-style24 {
            font-family: Cambria, Cochin, Georgia, Times, "Times New Roman", serif;
            font-size: large;
            font-style: italic;
        }
        .header {
            font-family: 'Comic Sans MS';
            font-size: 200%;
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
    </style>
    </head>
<body class="bac">
      <div class="header">
            <h1>KAKSHA</h1>
        </div>
    
    <form id="form1" runat="server">
   
      
   
        <div class="auto-style23">
   
      
   
<table id="Table1"  runat="server" class="auto-style18" style="border-style: double;background-color:lightgray;padding: 1px 4px">
    <tr>
        <th colspan="3" class="auto-style14">
            Registration</th>
    </tr>
    <tr>
        <td class="auto-style11">
            ID</td>
        <td>
            <asp:TextBox ID="Regid" runat="server" placeholder="Eg.13BD1A0502 or Eg.1" />
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
            <asp:TextBox ID="Regname" runat="server" placeholder="Eg.Sushant"/>

        </td>
        <td class="auto-style6">
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorname" ErrorMessage="Required" ForeColor="Red" ControlToValidate="Regname"
                runat="server" />
        </td>
    </tr>
    <tr>
        <td class="auto-style11">
            &nbsp;</td>
        <td>
            <asp:TextBox ID="Regpass" runat="server" TextMode="Password" style="height: 22px" />
        </td>
        <td class="auto-style5">
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorpass" runat="server" CssClass="auto-style2" ErrorMessage="Required" ControlToValidate="Regpass"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style15">
            <asp:Label ID="PasswordLabel" runat="server" Text="Password" CssClass="auto-style19"></asp:Label>
            <asp:Label ID="CPasswordLabel" runat="server" style="z-index: 1;color:black; left: 10px; top: 128px; position: absolute; width: 72px; height: 22px; right: 399px" Text="Confirm Password"></asp:Label>
            <asp:TextBox ID="Regpassagain" runat="server" TextMode="Password" CssClass="auto-style20" OnTextChanged="Regpassagain_TextChanged" />
        </td>
        <td class="auto-style16">
            <asp:CompareValidator ID="CompareValidator1" ErrorMessage="Passwords Must Match." ForeColor="Red" ControlToCompare="Regpass"
                ControlToValidate="Regpassagain" runat="server" style="z-index: 1; left: 298px; top: 136px; position: absolute; height: 32px; width: 154px" />
        </td>
    </tr>
    <tr>
        <td class="auto-style13">
        </td>
        <td class="auto-style3">
            <asp:TextBox ID="vtextbox" runat="server" CssClass="auto-style4" ></asp:TextBox>
            <asp:Button ID="Submit" Text="Submit" runat="server" OnClick="RegisterUser" CssClass="auto-style10" />
            <asp:Label ID="vlabel" runat="server" CssClass="auto-style9"></asp:Label>
        </td>
        <td class="auto-style7">
            <asp:Button ID="verify" runat="server" CssClass="auto-style8" OnClick="verify_Click" Text="Verify" Width="91px" />
        </td>
    </tr>
</table>
  
       
            <table class="auto-style22">
                <tr>
                    <td>
                        <br />
                        <span class="auto-style24"><strong>Enter Your Registered College ID and Name</strong></span><strong><br class="auto-style24" />
                        <br class="auto-style24" />
                        <br class="auto-style24" />
                        </strong><span class="auto-style24"><strong>Check your email given to the college<br />
&nbsp;to verify</strong></span><strong><br class="auto-style24" />
                        <br class="auto-style24" />
                        <br class="auto-style24" />
                        </strong>
                        <br />
                    </td>
                </tr>
            </table>
            </div>
           
       

 </form>
     <footer class="footer">
        Copyright ©
     </footer>

    </body>
</html>
