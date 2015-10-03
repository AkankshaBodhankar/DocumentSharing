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
using System.Text;
using System.Net.Mail;
using System.Net;

namespace Project
{
    
    public partial class Teacherprofile : System.Web.UI.Page
    {
        public string store=null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] != null)
            {
                //Response.Write("Welcome");
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            LogoutB.CssClass = "logout";
            TextBoxSub.Visible = false;

            SqlConnection con = new SqlConnection("Data Source=AKANKSHA;Initial Catalog=Project;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("select TeacherName from TeacherData where Teacherid='"+Session["New"].ToString()+"'",con);
            string name = cmd.ExecuteScalar().ToString();
            LName.Text = "Welcome "+name;

            
           
       }

        protected void finalpostButton_Click1(object sender, EventArgs e)
        {
            try
            {
                finalpostButton.Enabled = true;
                SqlConnection con = new SqlConnection("Data Source=AKANKSHA;Initial Catalog=Project;Integrated Security=True");
                con.Open();
                string tid = Session["id"].ToString();
                SqlCommand pcom = new SqlCommand("select PC from TeacherData where TeacherID='" + tid + "'", con);
                string pid = pcom.ExecuteScalar().ToString();
                int pc = Convert.ToInt16(pid);
                int pinc = pc + 1;
                Session["pinc"] = pinc;
                string p = Convert.ToString(pinc);
                string path = @"F:\Project\Project\Posts\" + tid;
                bool hasfile = FileUploadTpost.HasFiles;
                Session["hasfile"] = hasfile;
                if (FileUploadTpost.HasFiles)
                {
                    try
                    {
                        string fileExtension = System.IO.Path.GetExtension(FileUploadTpost.FileName);
                        if (fileExtension.ToLower() != ".doc" && fileExtension.ToLower() != ".docx")
                        {
                            Labeluploaded.Text = "only files of .doc or .docx are allowed";
                        }
                        else
                        {

                            string filename = Path.GetFileName(FileUploadTpost.FileName);
                            FileInfo fi = new FileInfo(filename);
                            string ext = fi.Extension;
                            filename = p +ext;
                            FileUploadTpost.SaveAs(@"F:\Project\Project\Posts\" + tid + "\\" + filename);
                            string name = FileUploadTpost.FileName;

                            string textpath = @"F:\Project\Project\Posts\" + tid + "\\" + p + ".txt";
                            var mytextfile = File.Create(textpath);

                            string extpath = @"F:\Project\Project\Posts\" + tid + "\\" + p + "e.txt";
                            var myexfile = File.Create(extpath);

                            mytextfile.Close();
                            myexfile.Close();
                            if (File.Exists(textpath) && posttext.Text != null)
                            {
                                try
                                {
                                    using (TextWriter writer = File.CreateText(textpath))
                                    {

                                        writer.Write(posttext.Text);
                                      
                                        writer.Close();
                                    }
                                   
                                }
                                catch (IOException ex)
                                {
                                    Response.Write("<script>alert('" + ex.Message + "')</script>");
                                }
                            }
                            else
                            {
                                  Labeluploaded.Text = "TextField can't be blank";
                            }
                            using (System.IO.StreamWriter file =
                                                     new System.IO.StreamWriter(extpath, true))
                            {
                                file.WriteLine(ext);
                                file.Close();
                            }

                        }

                        if (File.Exists(@"F:\Project\Project\Posts\" + tid + "\\" + p + ".txt"))
                        {
                            posttext.Text = " ";
            
                            SqlCommand incrementp = new SqlCommand("update TeacherData set PC='" + pinc + "' where TeacherID='" + tid + "'", con);
                            incrementp.ExecuteNonQuery();
                            SqlCommand insert = new SqlCommand("insert into TeacherPost(TeacherID,PostID) values('" + tid + "','" + p + "')", con);
                            insert.ExecuteNonQuery();

                           // sendEmail();

                           // Labeluploaded.Text = "Posted Successfully";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('POSTED SUCCESSFULLY');", true);
                        }
                        con.Close();
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('" + ex.Message + "')</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error:" + ex.Message);
            }

        }

        protected void LogoutB_Click(object sender, EventArgs e)
        {
            Session["New"] = null;
            Response.Redirect("Login.aspx");
           
        }

        protected void ButtonSub_Click(object sender, EventArgs e)
        {
            TextBoxSub.Visible = true;
            try
            {
                SqlConnection con = new SqlConnection("Data Source=AKANKSHA;Initial Catalog=Project;Integrated Security=True");
                con.Open();
                SqlCommand getname = new SqlCommand("select TeacherName from TeacherData where TeacherID='" + Session["New"].ToString() + "'", con);
                string name = getname.ExecuteScalar().ToString();
                SqlCommand sub = new SqlCommand("update Teaches set Sub='"+TextBoxSub.Text+"' where TeacherID='"+Session["New"].ToString()+"'",con);
               // SqlCommand setsub = new SqlCommand("insert into Teaches values('" + Session["New"].ToString() + "','" + TextBoxSub.Text + "','" + name + "')", con);
                sub.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
        protected void sendEmail()
        {

            SqlConnection con = new SqlConnection("Data Source=AKANKSHA;Initial Catalog=Project;Integrated Security=True");
            con.Open();
            string tid = Session["id"].ToString();
            SqlCommand cmd2 = new SqlCommand("select StudentID,PostID from TeacherPost inner join StudentSubscribed on TeacherID=SubscribedTID where  TeacherID ='"+tid+"'and PostID='"+Session["pinc"].ToString()+"'", con);
            SqlDataReader reads = cmd2.ExecuteReader();
            int index = 0;
            string[,] storeval = new string[100, 2];
            if (reads.HasRows)
            {

                while (reads.Read())
                {

                    storeval[index, 0] = reads.GetString(0);
                    storeval[index, 1] = reads.GetString(1);
                    index++;
                }

            }
            reads.Dispose();
            for (int i = 0; i < index; i++)
            {
                string getEmail = "select Email from StudentData where StudentID='" + storeval[i,0] + "'";
                SqlCommand EmailQ = new SqlCommand(getEmail, con);
                string Email = EmailQ.ExecuteScalar().ToString();
                SqlCommand getname = new SqlCommand("select TeacherName from TeacherData where TeacherID='" + Session["New"].ToString() + "'", con);
                string name = getname.ExecuteScalar().ToString();
                string path = "F:\\Project\\Project\\Posts\\"+tid+"\\"+storeval[i,1]+".txt";
                StreamReader reading = new StreamReader(path);
                string text = reading.ReadToEnd();
                reading.Dispose();

                SqlCommand EMAILQ = new SqlCommand("select Email from MailDetails", con);
                SqlCommand PASSWORDQ = new SqlCommand("select Password from MailDetails", con);
                String EMAIL = EMAILQ.ExecuteScalar().ToString().Trim();
                String PASSWORD = PASSWORDQ.ExecuteScalar().ToString().Trim();


                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                client.EnableSsl = true;
                client.Timeout = 100000;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new NetworkCredential(EMAIL, PASSWORD);
                MailMessage message = new MailMessage();
                message.To.Add(Email);
                message.From = new MailAddress(EMAIL);
                message.Subject = "KAKSHA: New Post from Prof."+name;
                message.Body = "There is a new post available from Prof." + name + "\n" + "'" + text + "'";
                if(Convert.ToBoolean(Session["hasfile"]))
                    message.Body += "\nLog on to the KAKSHA website to get the attachment";
                client.Send(message);
            }


                        

        }


      /*  protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
       
        private void GetData()
        {
            DataTable dt;
            if (ViewState["SelectedRecords"] != null)
                dt = (DataTable)ViewState["SelectedRecords"];
            else
                dt = CreateDataTable();
            CheckBox chkAll =(CheckBox)GridView1.HeaderRow
                        .Cells[0].FindControl("Ckall");
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                if (chkAll.Checked)
                {
                    dt = AddRow(GridView1.Rows[i], dt);
                }
                else
                {
                    CheckBox chk = (CheckBox)GridView1.Rows[i].Cells[3].FindControl("CheckBox1");
                    if (chk.Checked)
                    {
                        dt = AddRow(GridView1.Rows[i], dt);
                    }
                    else
                    {
                        dt = RemoveRow(GridView1.Rows[i], dt);
                    }
                }
            }
            ViewState["SelectedRecords"] = dt;
        }

      private void SetData()
      {
          CheckBox chkAll = (CheckBox)GridView1.HeaderRow
                        .Cells[0].FindControl("Ckall");
          chkAll.Checked = true;
          if (ViewState["SelectedRecords"] != null)
          {
              DataTable dt = (DataTable)ViewState["SelectedRecords"];
              for (int i = 0; i < GridView1.Rows.Count; i++)
              {
                  CheckBox chk = (CheckBox)GridView1.Rows[i].Cells[3].FindControl("CheckBox1");
                  if (chk != null)
                  {
                      DataRow[] dr = dt.Select("Year = '" + GridView1.Rows[i].Cells[0].Text + "' and Dept ='" + GridView1.Rows[i].Cells[1].Text + "' and Section='" + GridView1.Rows[i].Cells[2].Text + "'");
                      chk.Checked = dr.Length > 0;
                      if (!chk.Checked)
                      {
                          chkAll.Checked = false;
                      }
                  }
              }
          }
      }
        private DataTable CreateDataTable()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Year");
            dt.Columns.Add("Dept");
            dt.Columns.Add("Section");
            dt.AcceptChanges();
            return dt;
        }
        private DataTable AddRow(GridViewRow gvRow, DataTable dt)
        {
            DataRow[] dr = dt.Select("Year = '" + gvRow.Cells[0].Text + "' and Dept ='"+gvRow.Cells[1].Text+"' and Section='"+gvRow.Cells[2].Text+"'");
            if (dr.Length <= 0)
            {
                dt.Rows.Add();
                dt.Rows[dt.Rows.Count - 1]["Year"] = gvRow.Cells[0].Text;
                dt.Rows[dt.Rows.Count - 1]["Section"] = gvRow.Cells[1].Text;
                dt.Rows[dt.Rows.Count - 1]["Dept"] = gvRow.Cells[2].Text;
                dt.AcceptChanges();
            }
            return dt;
        }
        private DataTable RemoveRow(GridViewRow gvRow, DataTable dt)
        {
            DataRow[] dr = dt.Select("Year = '" + gvRow.Cells[0].Text + "' and Dept ='"+gvRow.Cells[1].Text+"' and Section='"+gvRow.Cells[2].Text+"'");
            if (dr.Length > 0)
            {
                dt.Rows.Remove(dr[3]);
                dt.AcceptChanges();
            }
            return dt;
        }
        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GetData();
            GridView1.PageIndex = e.NewPageIndex;
            SetData();
        }
        protected void CheckBox_CheckChanged(object sender, EventArgs e)
        {
            GetData();
            SetData();
            BindSecondaryGrid();
        }
        private void BindSecondaryGrid()
        {
            DataTable dt = (DataTable)ViewState["SelectedRecords"];
            GridView2.DataSource = dt;
            GridView2.DataBind();
        }

        protected void Ckall_CheckedChanged1(object sender, EventArgs e)
        {
            CheckBox ChkBoxHeader = (CheckBox)GridView1.HeaderRow
                        .Cells[0].FindControl("Ckall");
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox ChkBoxRows = (CheckBox)row.FindControl("CheckBox1");
                if (ChkBoxHeader.Checked == true)
                {
                    ChkBoxRows.Checked = true;
                }
                else
                {
                    ChkBoxRows.Checked = false;
                }
            }

        }*/

      

    }

}