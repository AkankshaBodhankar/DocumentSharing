<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeacherHome.aspx.cs" Inherits="Project.Teacherprofile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 78px;
        }
        .auto-style2 {
            text-align: right;
            width: 860px;
        }
        .auto-style3 {
            width: 860px;
            height: 51px;
        }
        .auto-style4 {
            text-align: right;
        }
        .auto-style5 {
            width: 100%;
            height: 335px;
            margin-right: 0px;
        }
        .auto-style6 {
            height: 51px;
        }
        .auto-style7 {
            width: 517px;
            height: 47px;
        }
        .auto-style11 {
            text-align: center;
            height: 83px;
            width: 640px;
        }
        .auto-style12 {
            position: absolute;
            top: 24px;
            left: 726px;
            z-index: 1;
            height: 36px;
        }
        .auto-style13 {
            position: absolute;
            top: 227px;
            left: 456px;
            z-index: 1;
            width: 71px;
            height: 28px;
            right: 374px;
        }
        .auto-style14 {
            text-align: left;
            width: 640px;
            height: 47px;
        }
        .auto-style15 {
            position: absolute;
            top: 214px;
            left: 269px;
            z-index: 1;
            width: 166px;
            right: 437px;
            height: 30px;
        }
        .auto-style16 {
            position: absolute;
            top: 271px;
            left: 678px;
            z-index: 1;
            width: 153px;
            height: 21px;
        }
        .auto-style17 {
            width: 517px;
            height: 51px;
        }
        .auto-style18 {
            text-align: left;
            height: 51px;
            width: 640px;
        }
        .auto-style19 {
            position: absolute;
            top: 317px;
            left: 243px;
            font-family: Arial, Helvetica, sans-serif;
            font-style: italic;
            z-index: 1;
        }
        .auto-style20 {
            width: 517px;
            height: 83px;
        }
        .auto-style21 {
            height: 83px;
        }
        .auto-style24 {
            width: 517px;
            height: 61px;
        }
        .auto-style25 {
            height: 61px;
            width: 640px;
        }
        .auto-style26 {
            height: 61px;
        }
        .auto-style27 {
            width: 517px;
            height: 78px;
        }
        .auto-style28 {
            height: 78px;
            width: 640px;
        }
        .auto-style29 {
            height: 78px;
        }
        .auto-style30 {
            width: 517px;
            height: 65px;
        }
        .auto-style31 {
            height: 65px;
            width: 640px;
        }
        .auto-style32 {
            height: 65px;
        }
        .auto-style33 {
            width: 517px;
            height: 69px;
        }
        .auto-style34 {
            height: 69px;
            width: 640px;
        }
        .auto-style35 {
            height: 69px;
        }
        .auto-style36 {
            width: 517px;
            height: 76px;
        }
        .auto-style37 {
            height: 76px;
            width: 640px;
        }
        .auto-style38 {
            height: 76px;
        }
        .auto-style39 {
            height: 47px;
        }
        .auto-style40 {
            position: absolute;
            top: 83px;
            left: 24px;
            z-index: 1;
            width: 83px;
        }
        .auto-style41 {
            position: absolute;
            top: 83px;
            z-index: 1;
            width: 71px;
            left: 139px;
            }
        .auto-style43 {
            height: 98px;
            width: 640px;
        }
        .auto-style44 {
            width: 517px;
            height: 98px;
        }
        .auto-style45 {
            height: 98px;
        }
        .auto-style46 {
            position: absolute;
            top: 83px;
            z-index: 1;
            left: 259px;
        }
        .auto-style47 {
            position: absolute;
            top: 217px;
            left: 732px;
            z-index: 1;
            width: 110px;
            height: 30px;
        }
        .auto-style48 {
            margin-left: 0px;
        }
        .auto-style49 {
            position: absolute;
            top: 227px;
            left: 541px;
            z-index: 1;
            width: 71px;
            height: 27px;
        }
        .auto-style50 {
            position: absolute;
            top: 227px;
            z-index: 1;
            left: 627px;
            height: 27px;
            width: 71px;
        }
        body
        {
            color:black;
            background-image:url(bc1.jpg);
            background-attachment:fixed;
            background-size:cover;
            background-repeat:no-repeat;

        }
    </style>
</head>
<body onunload="disableBackButton()">
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="WelcomeLabel" runat="server" Text="Welcome "></asp:Label>
                    <asp:Button ID="BTLogout" runat="server" OnClick="BTLogout_Click" Text="Logout" Width="120px" CssClass="auto-style12" />
                </td>
                <td class="auto-style6">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <table class="auto-style5">
                        <tr>
                            <td class="auto-style7">
                                <asp:Button ID="ButtonThome" runat="server" CssClass="auto-style40" OnClick="Button2_Click" Text="Home" />
                            </td>
                            <td class="auto-style14">
                                <asp:Button ID="ButtonSprofile" runat="server" CssClass="auto-style41" OnClick="ButtonSprofile_Click" Text="Profile" />
                            </td>
                            <td class="auto-style39"></td>
                        </tr>
                        <tr>
                            <td class="auto-style20"></td>
                            <td class="auto-style11">
                                <asp:TextBox ID="posttext" runat="server" BackColor="White" BorderColor="Gray" CssClass="auto-style48" Height="65px" TextMode="MultiLine" Width="553px"></asp:TextBox>
                            </td>
                            <td class="auto-style21"></td>
                        </tr>
                        <tr>
                            <td class="auto-style44"></td>
                            <td class="auto-style43">
                                <asp:DropDownList ID="YearList" runat="server" CssClass="auto-style13">
                                    <asp:ListItem Enabled="False" Value="I">I Year</asp:ListItem>
                                    <asp:ListItem Value="II">II Year</asp:ListItem>
                                    <asp:ListItem Value="III">III Year</asp:ListItem>
                                    <asp:ListItem Value="IV">IV Year</asp:ListItem>
                                    <asp:ListItem Selected="True" Value="Year">Year</asp:ListItem>
                                </asp:DropDownList>
                                <asp:Button ID="attachfileButton" runat="server" CssClass="auto-style15" Text="Attach File" OnClick="UploadButton_Click" />
                                <asp:Button ID="Postbutton" runat="server" Text="Post" Width="161px" CssClass="auto-style46" OnClick="Addfilebutton_Click" />
                                <asp:Button ID="finalpostButton" runat="server" CssClass="auto-style47" OnClick="finalpostButton_Click" Text="Post" />
                                <asp:DropDownList ID="DeptList" runat="server" CssClass="auto-style49" >
                                    <asp:ListItem>CSE</asp:ListItem>
                                    <asp:ListItem>ECE</asp:ListItem>
                                    <asp:ListItem>EIE</asp:ListItem>
                                    <asp:ListItem>IT</asp:ListItem>
                                    <asp:ListItem Selected="True">Dept</asp:ListItem>
                                </asp:DropDownList>
                                <asp:DropDownList ID="SectionList" runat="server" CssClass="auto-style50">
                                    <asp:ListItem>Section</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style45"></td>
                        </tr>
                        <tr>
                            <td class="auto-style17"></td>
                            <td class="auto-style18">
                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="auto-style16">
                                    <asp:ListItem>Subjects</asp:ListItem>
                                    <asp:ListItem>Teacher</asp:ListItem>
                                    <asp:ListItem Selected="True">Filter By</asp:ListItem>
                                </asp:DropDownList>
                                <asp:Label ID="Label1" runat="server" CssClass="auto-style19" Text="Recent Updates:"></asp:Label>
                            </td>
                            <td class="auto-style6"></td>
                        </tr>
                        <tr>
                            <td class="auto-style24"></td>
                            <td class="auto-style25">&nbsp;</td>
                            <td class="auto-style26"></td>
                        </tr>
                        <tr>
                            <td class="auto-style27"></td>
                            <td class="auto-style28"></td>
                            <td class="auto-style29"></td>
                        </tr>
                        <tr>
                            <td class="auto-style30"></td>
                            <td class="auto-style31"></td>
                            <td class="auto-style32"></td>
                        </tr>
                        <tr>
                            <td class="auto-style33"></td>
                            <td class="auto-style34"></td>
                            <td class="auto-style35"></td>
                        </tr>
                        <tr>
                            <td class="auto-style36"></td>
                            <td class="auto-style37"></td>
                            <td class="auto-style38"></td>
                        </tr>
                    </table>
                </td>
                <td class="auto-style4">
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>

</body>
</html>
