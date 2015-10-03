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
          //  finalSubmit.Visible = false;
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
                        Response.Write("User Already Registrated");
                    }
                }
                else
                {
                    SqlCommand checkexist = new SqlCommand("select count(StudentID) from StudentData where StudentID='" + Regid.Text + "'", conn);
                    string i = checkexist.ExecuteScalar().ToString();
                    if (i == "0")
                    {
                        string getEmail = "select CTEmail from CStudentData where CTeacherID='" + Regid.Text + "'";
                        SqlCommand getEmailQ = new SqlCommand(getEmail, conn);
                        string Email = getEmailQ.ExecuteScalar().ToString();
                        Session["email"] = Email;
                    }
                    else
                    {
                        Response.Write("User Already Registrated");
                    }
                }
                
                
                randomizer = random_fun();
                String myemailid = "srinitt0804@gmail.com";
                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                client.EnableSsl = true;
                client.Timeout = 100000;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new NetworkCredential(myemailid, "badtameezdil");
                MailMessage message = new MailMessage();
                string email = Session["email"].ToString(); 
                message.To.Add(email);
                message.From = new MailAddress(myemailid);
                message.Subject = "Kaksha : Verification Code";
                message.Body = "The Verification code for the entered " + Regid.Text +" is \n" + randomizer;
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
                    SqlCommand checkexist = new SqlCommand("select count(StudentID) from StudentData where StudentID='" + Regid.Text + "'", conn);
                    string i = checkexist.ExecuteScalar().ToString();
                    if (i == "0")
                    {
                        string checkid = "select CStudentID from CStudentData where CStudentID='" + Regid.Text + "'";
                        SqlCommand checkidQ = new SqlCommand(checkid, conn);
                        string a = checkidQ.ExecuteScalar().ToString();

                        if (Regid.Text.Contains(a))
                        {
                            SqlCommand getdept = new SqlCommand("select CDept from CStudentData where CStudentID='" + Regid.Text + "'", conn);
                            SqlCommand getsec = new SqlCommand("select CSec from CStudentData where CStudentID='" + Regid.Text + "'", conn);
                            SqlCommand getsex = new SqlCommand("select CSSex from CStudentData where CStudentID='" + Regid.Text + "'", conn);
                            string dept = getdept.ExecuteScalar().ToString();
                            string sec = getsec.ExecuteScalar().ToString();
                            string sex = getsex.ExecuteScalar().ToString();

                            SqlCommand insertQ = new SqlCommand("insert into StudentData(StudentID,StudentName,Dept,Sec,SSex,SPassword) values('" + Regid.Text + "','" + Regname.Text + "','" + dept + "','" + sec + "','" + sex + "','" + Regpassagain.Text + "')", conn);

                            insertQ.ExecuteNonQuery();
                            Response.Write("Registration successfull");
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
                        Response.Write("User Already Registered");
                    }
                }
                else
                {
                    SqlCommand checkexist = new SqlCommand("select count(TeacherID) from TeacherData where TeacherID='" + Regid.Text + "'", conn);
                    string i = checkexist.ExecuteScalar().ToString();
                    if (i == "0")
                    {
                        string checkid = "select CTeacherID from CTeacherData where CTeacherID='" + Regid.Text + "'";
                        SqlCommand checkidQ = new SqlCommand(checkid, conn);

                        string a = checkidQ.ExecuteScalar().ToString();

                        if (Regid.Text.Contains(a))
                        {
                            SqlCommand getsex = new SqlCommand("select CTSex from CTeacherData where CTeacherID='" + Regid.Text + "'", conn);
                            string sex = getsex.ExecuteScalar().ToString();

                            string insert = "insert into TeacherData(TeacherID,TeacherName,TSex,TPassword) values('" + Regid.Text + "','" + Regname.Text + "','" + sex + "','" + Regpassagain.Text + "')";
                            SqlCommand insertQ = new SqlCommand(insert, conn);

                            insertQ.ExecuteNonQuery();
                            Response.Write("Registration successfull");
                            string path = @"D:\Posts\" + Regid.Text;
                            if (!(Directory.Exists(path)))
                            {
                                Directory.CreateDirectory(path);
                            }
                            Response.Redirect("Login.aspx");
                        }

                    }
                    else
                    {
                        Response.Write("Name and ID didn't match with Data in college database");
                    }

                }
                Response.Write("User Already Registered");




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
 
    }
}