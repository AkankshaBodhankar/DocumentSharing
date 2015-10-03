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
using System.Net.Mail;
using System.Net;

namespace Project
{
    public partial class Reg : System.Web.UI.Page
    {
        public static string randomizer;
        protected void Page_Load(object sender, EventArgs e)
        {
            verify.Visible = false;
            vtextbox.Visible = false;
            vlabel.Visible = false;
            Regpass.Visible = false;
            Regpassagain.Visible = false;
            PasswordLabel.Visible = false;
            CPasswordLabel.Visible = false;

            
        }


        protected void RegisterUser(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection("Data Source=AKANKSHA;Initial Catalog=Project;Integrated Security=True");
                conn.Open();
                bool isstudent;
                isstudent = Regid.Text.Contains("BD");

                if (isstudent)
                {
                    SqlCommand checkexist = new SqlCommand("select count(StudentID) from StudentData where StudentID='" + Regid.Text + "'", conn);
                    string i = checkexist.ExecuteScalar().ToString();
                    if (i == "0")
                    {
                        string getEmail = "select CSEmail from CStudentData where CStudentID='" + Regid.Text + "'";
                        SqlCommand getEmailQ = new SqlCommand(getEmail, conn);
                        string Email = getEmailQ.ExecuteScalar().ToString();
                        Session["email"] = Email;

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('USER ALREADY REGISTERED');", true);
                    }
                }
                else
                {
                    SqlCommand checkexist = new SqlCommand("select count(TeacherID) from TeacherData where TeacherID='" + Regid.Text + "'", conn);
                    string i = checkexist.ExecuteScalar().ToString();
                    if (i == "0")
                    {
                        string getEmail = "select CTEmail from CTeacherData where CTeacherID='" + Regid.Text + "'";
                        SqlCommand getEmailQ = new SqlCommand(getEmail, conn);
                        string Email = getEmailQ.ExecuteScalar().ToString();
                        Session["email"] = Email;
                    }
                    else
                    {
                        Response.Write("<script>alert('User Already Registrated')</script>");
                        Response.Redirect("Login.aspx");
                    }
                }


                randomizer = random_fun();
                SqlCommand EMAILQ = new SqlCommand("select Email from MailDetails", conn);
                SqlCommand PASSWORDQ = new SqlCommand("select Password from MailDetails", conn);

                String EMAIL = EMAILQ.ExecuteScalar().ToString().Trim();
                String PASSWORD = PASSWORDQ.ExecuteScalar().ToString().Trim();

                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                client.EnableSsl = true;
                client.Timeout = 100000;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new NetworkCredential(EMAIL, PASSWORD);
                MailMessage message = new MailMessage();
                string email = Session["email"].ToString();
                message.To.Add(email);
                message.From = new MailAddress(EMAIL);
                message.Subject = "Kaksha : Verification Code";
                message.Body = "The Verification code for the entered " + Regid.Text + " is \n" + randomizer;
                client.Send(message);
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }


            verify.Visible = true;
            vtextbox.Visible = true;
            vlabel.Visible = true;
            Submit.Visible = false;
            Regpass.Visible = true;
            Regpassagain.Visible = true;
            PasswordLabel.Visible = true;
            CPasswordLabel.Visible = true;

            vlabel.Text = "Enter the 5 letter code sent to your Email(submitted to KMIT)";

        }

        public String random_fun()
        {
            Guid g = Guid.NewGuid();
            string GuidString = Convert.ToBase64String(g.ToByteArray());
            GuidString = GuidString.Replace("=", "");
            GuidString = GuidString.Replace("+", "");
            GuidString = GuidString.Replace("/", "");
            GuidString = GuidString.Replace("-", "");
            GuidString = GuidString.Replace("*", "");
            string code = "";
            for (int i = 0; i < 5; i++)
            {
                code += GuidString[i];
            }
            return code;
        }


        protected void verify_Click(object sender, EventArgs e)
        {
            if (randomizer.Equals(vtextbox.Text))
            {
                vtextbox.Visible = false;
                vlabel.Visible = false;
                verify.Visible = false;
                // finalSubmit.Visible = true;
                try
                {

                    SqlConnection conn = new SqlConnection("Data Source=AKANKSHA;Initial Catalog=Project;Integrated Security=True");
                    conn.Open();
                    bool isstudent;
                    isstudent = Regid.Text.Contains("BD");

                    if (isstudent)
                    {
                        string checkid = "select CStudentID from CStudentData where CStudentID='" + Regid.Text + "'";
                        SqlCommand checkidQ = new SqlCommand(checkid, conn);
                        string a = checkidQ.ExecuteScalar().ToString();

                        if (Regid.Text.Contains(a))
                        {
                            SqlCommand getdept = new SqlCommand("select CDept from CStudentData where CStudentID='" + Regid.Text + "'", conn);
                            SqlCommand getsec = new SqlCommand("select CSec from CStudentData where CStudentID='" + Regid.Text + "'", conn);
                            SqlCommand getsex = new SqlCommand("select CSSex from CStudentData where CStudentID='" + Regid.Text + "'", conn);
                            SqlCommand getemail = new SqlCommand("select CSEmail from CStudentData where CStudentID='" + Regid.Text + "'", conn);
                            string dept = getdept.ExecuteScalar().ToString();
                            string sec = getsec.ExecuteScalar().ToString();
                            string sex = getsex.ExecuteScalar().ToString();
                            string email = getemail.ExecuteScalar().ToString();
                            SqlCommand insertQ = new SqlCommand("insert into StudentData(StudentID,StudentName,Dept,Sec,SSex,SPassword,Email) values('" + Regid.Text + "','" + Regname.Text + "','" + dept + "','" + sec + "','" + sex + "','" + Regpassagain.Text + "','"+email+"')", conn);
                            insertQ.ExecuteNonQuery();
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('REGISTRATION SUCCESSFULLY');", true);
                            Response.Redirect("Login.aspx");
                            // conn.Close();
                        }
                        else
                        {
                            Response.Write("Name and ID didn't match with Data in college database");
                        }


                    }
                    else
                    {
                        string checkid = "select CTeacherID from CTeacherData where CTeacherID='" + Regid.Text + "'";
                        SqlCommand checkidQ = new SqlCommand(checkid, conn);

                        string a = checkidQ.ExecuteScalar().ToString();

                        if (Regid.Text.Contains(a))
                        {
                            SqlCommand getsex = new SqlCommand("select CTSex from CTeacherData where CTeacherID='" + Regid.Text + "'", conn);
                            string sex = getsex.ExecuteScalar().ToString();
                            SqlCommand getsubs = new SqlCommand("select CSub from CTeaches where CTeacherID='" + Regid.Text + "'", conn);
                            string subs = getsubs.ExecuteScalar().ToString();
                            SqlCommand insertsub = new SqlCommand("insert into Teaches (TeacherID,Sub,TeacherName)values('" + Regid.Text + "','" + subs + "','" + Regname.Text + "')", conn);
                            insertsub.ExecuteNonQuery();
                            string insert = "insert into TeacherData(TeacherID,TeacherName,TSex,TPassword) values('" + Regid.Text + "','" + Regname.Text + "','" + sex + "','" + Regpassagain.Text + "')";
                            SqlCommand insertQ = new SqlCommand(insert, conn);

                            insertQ.ExecuteNonQuery();
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('REGISTRATION SUCCESSFULLY');", true);
                            string path = @"D:\Posts\" + Regid.Text;
                            if (!(Directory.Exists(path)))
                            {
                                Directory.CreateDirectory(path);
                            }
                            Response.Redirect("Login.aspx");
                        }
                        else
                        {
                            Response.Write("Name and ID didn't match with Data in college database");
                        }

                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);

                }
            }

            else
            {
                Response.Write("Entered Verification is INCORRECT");
            }
        }

        protected void Regpassagain_TextChanged(object sender, EventArgs e)
        {

        }

    }
}