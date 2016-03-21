<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentSubscibe.aspx.cs" Inherits="Project.TeacherSubscribe" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/index.css" rel="stylesheet"/>
    <style type="text/css">
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
        .auto-style1 {
            text-align: center;
            position: absolute;
            width: 993px;
            height: 261px;
            top: 208px;
            left: 470px;
            z-index: 1;
        }
        </style>
</head>
<body class="bac">
       <div class="header">
            <h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;KAKSHA</h1>
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
             </div>
    <div>
 
    </div>
        <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click"/>
    <hr />
            <label id="msg" runat="server"></label>
        <div class="auto-style1">

       
           
        
        <asp:GridView ID="gv" align="centre" runat="server"  HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
    AutoGenerateColumns="False"  Height="213px"  OnSelectedIndexChanged ="GridView1_SelectedIndexChanged1" Width="386px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="TeacherID" HeaderText="TeacherID"  />
                <asp:BoundField DataField="TeacherName" HeaderText="TeacherName"  />
                <asp:BoundField DataField="Sub" HeaderText="Subject"  />
                <asp:TemplateField HeaderText="Subscribe Here">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="false" OnClick="subscribe_clicked" CommandName="insert" Text="Subscribe" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
          
<HeaderStyle BackColor="#3AC0F2" ForeColor="White"></HeaderStyle>
       </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" SelectCommand="SELECT * FROM [Teaches] ORDER BY [TeacherID]"
                FilterExpression="TeacherId like '%{0}%' or TeacherName like '%{1}%' or Sub like '%{2}%'">
                <FilterParameters>
                   <asp:ControlParameter Name="TeacherID" ControlID="txtSearch" PropertyName="Text" />
                   <asp:ControlParameter Name="TeacherName" ControlID="txtSearch" PropertyName="Text" />
                    <asp:ControlParameter Name="Sub" ControlID="txtSearch" PropertyName="Text" />
                </FilterParameters>
          </asp:SqlDataSource>

          

            
            
            <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="quicksearch.js"></script>
<script type="text/javascript">
    $(function () {
        $('.search_textbox').each(function (i) {
            $(this).quicksearch("[id*=gv] tr:not(:has(th))", {
                'testQuery': function (query, txt, row) {
                    return $(row).children(":eq(" + i + ")").text().toLowerCase().indexOf(query[0].toLowerCase()) != -1;
                }
            });
        });
    });
</script>
        </div>
       

    </form>
     <footer class="footer">
        Copyright ©
     </footer>


</body>
</html>
