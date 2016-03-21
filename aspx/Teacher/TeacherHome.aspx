<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeacherHome.aspx.cs" Inherits="Project.Teacherprofile" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Teacher Page</title>

    <!-- Bootstrap -->
       <link href="css/index.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="">
   

  
      <style type="text/css">
          .profile {
              width:100%;
              background-color:lightgray;
              opacity:0.8;
              border:2px solid black;
              border-right:5px;
          }
          .data {
    width: 100%;
    height: 300px;
    border-radius: 25px;
    border: 2px solid black;
    padding: 20px;
    background-color:lightgray;
  
}
       .header
       {
            font-family:'Comic Sans MS';
         font-size:200%;
          color:black;
         text-align:center;

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

          .auto-style2 {
              height: 54px;
          }
          .bac {
    background-image: url('../class.jpg');
    background-repeat: no-repeat;
    background-size: cover;
    background-attachment: fixed;
}

          </style>

  
      </head>
  <body class="bac">
       <div class="header">
            <h1 class="auto-style2">KAKSHA</h1>
        </div>
       <form id="Form1" runat="server">
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
                 <li class="active"><a href="ChangePasswordT.aspx">ChangePassword</a></li>
                <li class="active"><asp:Button class="logout" ID="LogoutB" runat="server" Text="Logout" OnClick="LogoutB_Click"/></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>
      <div>
          <asp:Label style="color:black;font-size:30px" ID="LName" runat="server" Text="Label"></asp:Label>
      </div>
       
       <div class="data">
           <h4 style="color:black"> Subjects</h4>
            <div>
              <asp:TextBox ID="TextBoxSub" runat="server"></asp:TextBox>
              <asp:Button ID="ButtonSub" runat="server" Text="Add Subject" Height="29px" Width="122px" OnClick="ButtonSub_Click"/>
          </div>
             <H4 style="color:black"> Upload Files:</H4>
              <label for="inputtext" class="sr-only">New Post</label>
              <asp:TextBox ID="posttext" runat="server" Height="55px" Width="706px"></asp:TextBox>
              <asp:FileUpload ID="FileUploadTpost" style="color:black" runat="server" />

             <!-- <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                  <Columns>
                      <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
                      <asp:BoundField DataField="Dept" HeaderText="Dept" SortExpression="Dept" />
                      <asp:BoundField DataField="Section" HeaderText="Section" SortExpression="Section" />
                      <asp:CheckBoxField />
                  </Columns>
           </asp:GridView>

           Search Customer:
    <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
    <asp:Button ID="btnSearch" runat="server" Text="Search"/>
    <hr />
              -->
           <asp:Button ID="finalpostButton" runat="server" Text="Submit"  class="btn btn-lg btn-primary btn-block  submitbutton" type="submit" OnClick="finalpostButton_Click1"/>
             
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" SelectCommand="SELECT * FROM [ClassDetails] ORDER BY [Year], [Dept], [Section]"
                FilterExpression="Year like '%{0}%' or Dept like '%{1}%' or Section like '%{2}%'">
                
                 <FilterParameters>
                   <asp:ControlParameter Name="TeacherID" ControlID="txtSearch" PropertyName="Text" />
                   <asp:ControlParameter Name="TeacherName" ControlID="txtSearch" PropertyName="Text" />
                    <asp:ControlParameter Name="Sub" ControlID="txtSearch" PropertyName="Text" />
                </FilterParameters>
          </asp:SqlDataSource>-->

           
           
           <div>
               <asp:Label ID="Labeluploaded" runat="server" Text="Label" Visible="false"></asp:Label>
           </div>
          </div>


          
   </div><!--Container-->
           <footer class="footer">
        Copyright ©
     </footer>


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    </form>
  </body>
</html>
