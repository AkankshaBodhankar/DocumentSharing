<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentHome.aspx.cs" Inherits="Project.StudentProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
     

      <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/index.css" rel="stylesheet"/>
    <style type="text/css">
       
        
        .notifs {
    height: 300px;
    width: 200px;
    margin: 15px;
    margin-right: 30px;
    border-radius: 25px;
    border: 2px solid black;
    padding: 20px;
    background-color:lightgray;
   
}
#marquee {
    font-style: italic;
    color: #000066;
    font-weight: bold;
}
.updates{
    width: 100%;
    height:500px;
    overflow:auto;
    border-radius: 25px;
    border: 2px solid black;
    padding: 20px;
    background-color:lightgray;
    padding-right:10px;
}
          .header
       {
            font-family:'Comic Sans MS';
         font-size:200%;
          color:black;
         text-align:center;

      }
          .bac {
    background-image: url('../class.jpg');
    background-repeat: no-repeat;
    background-size: cover;
    background-attachment: fixed;
}

      .footer{
           position:fixed;
            bottom:0;
            left:0;
            right:0;
            height:20px;
            background-color:black;
            color:black;
            clear:both;
            text-align:center;
            padding:5px;
      }
      .label {
    font-family: 'Bodoni MT';
    color:black;
    font-size: large;
    text-decoration:underline;
   
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
            <a class="navbar-brand" href="#">Student Profile</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">

            <!-- change the link here -->


              <li class="active"><a href="StudentHome.aspx">Home</a></li>
              
              
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <li class="active"><a href="StudentSubscibe.aspx">Subscribe</a></li>
                 <li class="active"><a href="ChangePassword.aspx">ChangePassword</a></li>
                <li class="active"><asp:Button class="logout" ID="LogoutB" runat="server" Text="Logout" onServerClick="logout" OnClick="LogoutB_Click"/></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>


       <!-- Insert profile picture here -->
<div class="DisplayInline">
      <div>

           <asp:Label style="color:black;font-size:20px" ID="LName" runat="server" Text="Label"></asp:Label>
          
         
      </div>

<div class="updates">
  <h4 style="color:black">News Feed:</h4>
       <div>
           <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="45px">
               <asp:ListItem Selected="True">All</asp:ListItem>
               <asp:ListItem>5</asp:ListItem>
               <asp:ListItem>10</asp:ListItem>
           </asp:DropDownList>
           <table runat="server" id="mytable">
               <tr>
                   <td>&nbsp;</td>
               </tr>
               
           </table>
             
         

       </div>

</div>

<div >

<div class="notifs">
    <h3 style="font-weight:bold">Notifs:</h3>
    <marquee id="marquee" scrollamount="2"  direction="up" loop="true" width="100%" height="140" onmouseover="this.stop();" onmouseout="this.start();">
     <table class="nav-justified" runat="server" id="notiftable">
               <tr>
                   <td>&nbsp;</td>
               </tr>
           </table>
    </marquee>
</div>
</div>



    </div> 
        </div>
            </form>
      <footer class="footer">
        Copyright ©
     </footer>



    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>

