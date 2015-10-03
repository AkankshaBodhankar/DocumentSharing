using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Drawing;

namespace Project
{
    public partial class StudentProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["New"] != null)
            {
                 SwelcomeLabel.Text = "Welcome";
            }
            else
                Response.Redirect("Login.aspx");
            SqlConnection con = new SqlConnection("Data Source=AKANKSHA;Initial Catalog=Project;Integrated Security=True;");
            con.Open();
            try
            {
               
                string id=Session["New"].ToString();
                SqlCommand values = new SqlCommand("select TeacherID,PC from TeacherData", con);
                SqlDataReader reads = values.ExecuteReader();
                int index = 0;
                string[ , ] storeval = new string[100,2];
                if (reads.HasRows)
                {

                       while(reads.Read())
                        {

                            storeval[index, 0] = reads.GetString(0);
                            storeval[index, 1] = reads.GetInt32(1).ToString();
                            index++;
                        }
                    
                }
                reads.Dispose();
                SqlCommand cmdprocedure = new SqlCommand( "sgets", con);
                cmdprocedure.CommandType = CommandType.StoredProcedure;
                cmdprocedure.Parameters.Add(new SqlParameter("@studentid",id));
                SqlDataReader reader = cmdprocedure.ExecuteReader();
                int loop = 0;
                 while (reader.Read())
                {
                    string postscount=null;
                    string tid = reader.GetString(0);
                    while (loop <=index)
                    {
                        if (tid == storeval[loop, 0])
                        {
                            postscount = storeval[loop, 1];
                            Session["postcount"] = postscount;
                            
                        }
                        loop++;
                    }
                    int uploadinto = 0;
                    int pcount = Convert.ToInt32(postscount);
                    int[] post=new int[100];
                    string tpath = "~Posts/" + tid + "/" + postscount + "/" + postscount + ".txt";
                    string path = "~Posts/" + tid + "/" + postscount +"/"+postscount+".docx";
                    Session["tpath"] = tpath;
                    Session["path"] = path;
                    while(uploadinto<pcount)
                    {
                        Session["uploadnum"] = uploadinto;
                        Create();
                       uploadinto++;
                    }
                    
                     
               }
                
               
            }
            catch(Exception ex)
            {
                Response.Write("Error:"+ex.Message);
            }
            finally
            {
                con.Close();
            }


        }
        protected void Create()
        {
            
            HtmlTableRow newrow = new HtmlTableRow();
            HtmlTableCell cell = new HtmlTableCell();
            HtmlTableCell cell1 = new HtmlTableCell();
            cell.Controls.Add(this.BuildLink());
            cell1.Controls.Add(this.BuildLabel());
            newrow.Cells.Add(cell);
            newrow.Cells.Add(cell1);
            mytable.Rows.Add(newrow);
            
        }
        protected virtual Label BuildLabel()
        {
            Label lbl = new Label();
            int uploadnum = Convert.ToInt16(Session["uploadnum"].ToString());
            string tpath = Session["tpath"].ToString();
            StreamReader read = new StreamReader(tpath);
            string text = read.ReadToEnd();
            read.Dispose();
            lbl.Text= text;
            return lbl;


        }
        protected virtual LinkButton BuildLink()
        {
            LinkButton link = new LinkButton();
            link.Text= "Download Here";
            link.Click += new EventHandler(this.LinkButton_Click);
            return link;
        }

        private void LinkButton_Click(object sender, EventArgs e)
        {

            Response.ContentType = "Application/doc/docx";
            string postcount = Session["uploadnum"].ToString();
            string path = Session["path"].ToString();
            Response.AddHeader("Content-Disposition", "attachment;filename=" + postcount);
            Response.TransmitFile(Server.MapPath(path));
            Response.End();
        }
       
        protected void TeachersB_Click(object sender, EventArgs e)
         {
             Response.Redirect("TeacherSubscribe.aspx");
         }

         protected void HomeB_Click(object sender, EventArgs e)
         {
             Response.Redirect("StudentHome.aspx");
         }

         protected void LogoutB_Click(object sender, EventArgs e)
         {
             Session["New"] = null;
             Response.Redirect("Login.aspx");
         }

         protected void Button1_Click(object sender, EventArgs e)
         {
             Response.Redirect("ChangePassword.aspx");
         }

      
    }
}