<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeacherSubscribe.aspx.cs" Inherits="Project.StudentSubscribe" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/index.css" rel="stylesheet"/>
    <style type="text/css">
        .auto-style1 {
             text-align: center;
            position: absolute;
            width: 993px;
            height: 261px;
            top: 208px;
            left: 470px;
            z-index: 1;
         
        }
        .auto-style2 {
            position: absolute;
            top: 15px;
            left: 1090px;
            z-index: 1;
            width: 171px;
            height: 19px;
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
            background-color:lightgray;
            color:black;
            clear:both;
            text-align:center;
            padding:5px;
      }
        .auto-style3 {
            position: absolute;
            top: 413px;
            left: 160px;
            z-index: 1;
            height: 61px;
        }
        .auto-style5 {
            position: absolute;
            top: 373px;
            left: 169px;
            z-index: 1;
        }
    </style>
</head>
<body class="bac" style="position: absolute; width: 1028px; height: 238px; top: 0px; left: 0px; z-index: 1">
     <div class="header">
            <h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; KAKSHA</h1>
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
                 <li class="active"><a href="ChangePasswordT.aspx">ChangePassword</a></li>
                <li class="active"><asp:Button class="logout" ID="LogoutB" runat="server" Text="Logout" OnClick="LogoutB_Click"/></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>
      
             </div>

       
    <div>
    
    </div>
        <div class="auto-style1">
            
            
        </div>
        <div class="auto-style1">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID" />
                <asp:BoundField DataField="StudentName" HeaderText="StudentName" SortExpression="StudentName" />
                <asp:BoundField DataField="Dept" HeaderText="Dept" SortExpression="Dept" />
                <asp:BoundField DataField="Sec" HeaderText="Sec" SortExpression="Sec" />
                 <asp:TemplateField HeaderText="Send Here">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="false" OnClick="select_clicked" CommandName="select" Text="Send" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="Gray" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" SelectCommand="SELECT [StudentID], [StudentName], [Dept], [Sec] FROM [notifsrc] WHERE ([SubscribedTID] = @SubscribedTID)">
            <SelectParameters>
                <asp:SessionParameter Name="SubscribedTID" SessionField="New" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
     <div>
           <p>&nbsp;</p>
        <asp:TextBox ID="TextBoxNotif" runat="server" Width="884px" TextMode="MultiLine" CssClass="auto-style3"/>
         <asp:Button ID="ButtonN" runat="server" Text="New Notif" CssClass="auto-style5" OnClick="Button2_Click" />
      </div>
        
        
        </form>
     <footer class="footer">
        Copyright ©
     </footer>
</body>
</html>
