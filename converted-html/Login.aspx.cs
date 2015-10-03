using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Security;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
namespace Project
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] != null)
            {   
                string id= Session["New"].ToString();
                if (id.Contains("BD"))
                {
                    Response.Redirect("StudentHome.aspx");
                }
                else
                {
                    Response.Redirect("Home.aspx");
                }
            }
            

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
                    SqlConnection conn = new SqlConnection("Data Source=AKANKSHA;Initial Catalog=Project;Integrated Security=True");
                    conn.Open();
                    string st = "select TeacherID from TeacherData where TeacherID='"+TextBoxun.Text+"'";
                    SqlCommand com = new SqlCommand(st, conn);
                    Boolean temp = false;
                    try
                    {

                        com.ExecuteScalar();
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.Message);
                    }
                    if (!temp)
                    {

                        string s = "BD";
                        bool b;
                        b = TextBoxun.Text.Contains(s);
                        if(b)
                        {
                             string scheckpasswordquery = "select SPassword from StudentData where SPassword='" + TextBoxpss.Text + "'";
                             SqlCommand spasscom = new SqlCommand(scheckpasswordquery, conn);
                             string spassword = spasscom.ExecuteScalar().ToString();
                             if (spassword == TextBoxpss.Text)
                             {
                                 Session["New"] = TextBoxun.Text;
                                 
                                 Response.Write("Password is correct");

                                 Response.Redirect("StudentHome.aspx");
                             }
                            else
                                  Response.Write("Password is incorrect");
                        }
                       else
                        {
                            
                          string checkpasswordquery = "select TPassword from TeacherData where TPassword='" + TextBoxpss.Text + "'";
                          SqlCommand passcom = new SqlCommand(checkpasswordquery, conn);
                           string password = passcom.ExecuteScalar().ToString();
                            if (password == TextBoxpss.Text)
                             {
                                 Session["New"] = TextBoxun.Text;
                                 
                                 Response.Write("Password is correct");
                                 Session["id"] = TextBoxun.Text;
                                 Response.RedirectPermanent("TeacherHome.aspx");
                                 
                             }
                            else
                                 Response.Write("Password is incorrect");
                        
                                 
                        }
                            

                        }
                    else
                        Response.Write("Username is not correct");
                    conn.Close();



        }

    }
}