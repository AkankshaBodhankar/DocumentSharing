using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace Project
{
    public partial class Teacherprofile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] != null)
            {
                WelcomeLabel.Text += Session["New"].ToString();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
                try
            {
                attachfileButton.Visible = false;
                finalpostButton.Visible = false;
                posttext.Visible = false;        

            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }



        }
        protected void BTLogout_Click(object sender, EventArgs e)
        {
            Session["New"] = null;
            Response.Redirect("Login.aspx");
            

        }

        protected void Addfilebutton_Click(object sender, EventArgs e)
        {
            finalpostButton.Visible = true;
            attachfileButton.Visible = true;
            Postbutton.Visible = false;
            posttext.Visible = true;     

        }

        protected void UploadButton_Click(object sender, EventArgs e)
        {

        }


        protected void ButtonSprofile_Click(object sender, EventArgs e)
        {
            Response.Redirect("Teacherprofile.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("TeacherHome.aspx");
            
        }

        protected void finalpostButton_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection("Data Source=AKANKSHA;Initial Catalog=Project;Integrated Security=True");
                con.Open();
                string tid = Session["id"].ToString();
                SqlCommand icom = new SqlCommand("select TeacherID from TeacherData where TeacherID='" + tid + "'", con);
                string id = icom.ExecuteScalar().ToString();
                SqlCommand pcom = new SqlCommand("select PC from TeacherData where TeacherID='" + tid + "'", con);
                string pid = pcom.ExecuteScalar().ToString();
                int pc = Convert.ToInt16(pid);
                string path = @"D:\Posts\" + id;
                if ((Directory.Exists(path)))
                {

                    Directory.CreateDirectory(path + "\\" + (pc++));

                }
                SqlCommand insert = new SqlCommand("insert into TeacherPost(TeacherFile,PostID) values('" + tid + "','" + (pc++) + "')", con);
                insert.ExecuteNonQuery();


            }
            catch (Exception ex)
            {
                Response.Write("Error:" + ex.Message);
            }



        }

        
        
       

        

    }
}