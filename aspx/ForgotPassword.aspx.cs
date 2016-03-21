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
using System.Net.Mail;
using System.Net;

namespace Project
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        public static string randomizer;
        public static bool isstudent;
        protected void Page_Load(object sender, EventArgs e)
        {
            Verify.Visible = false;
            Label2.Visible = false;
            VerifyBox.Visible = false;
            NewPasswordLabel.Visible = false;
            CNewPasswordLabel.Visible = false;
            NewPassword.Visible = false;
            CNewPassword.Visible = false;
            ForgotSubmit.Visible = false;
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

        protected void Submit1_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection("Data Source=AKANKSHA;Initial Catalog=Project;Integrated Security=True");
            con.Open();

            Verify.Visible = true;
            Label2.Visible = true;
            VerifyBox.Visible = true;

            Label1.Visible = false;
            IDBox.Visible = false;
            Submit1.Visible = false;

            if (IDBox.Text.Contains("BD"))
            {
                isstudent = true;
                SqlCommand CheckExistQ = new SqlCommand("select count(StudentID) from StudentData where StudentID='" + IDBox.Text + "'", con);
                string i = CheckExistQ.ExecuteScalar().ToString().Trim();
                if (i == "1")
                {
                    string getEmail = "select CSEmail from CStudentData where CStudentID='" + IDBox.Text + "'";
                    SqlCommand getEmailQ = new SqlCommand(getEmail, con);
                    string Email = getEmailQ.ExecuteScalar().ToString();
                    Session["email"] = Email;

                }
                else
                {
                    Response.Write("User Not Registrated");
                }
            }
            else
            {
                isstudent = false;
                SqlCommand CheckExistQ = new SqlCommand("select count(TeacherID) from TeacherData where TeacherID='" + IDBox.Text + "'", con);
                string i = CheckExistQ.ExecuteScalar().ToString().Trim();
                if (i == "1")
                {
                    string getEmail = "select CTEmail from CTeacherData where CTeacherID='" + IDBox.Text + "'";
                    SqlCommand getEmailQ = new SqlCommand(getEmail, con);
                    string Email = getEmailQ.ExecuteScalar().ToString();
                    Session["email"] = Email;

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
            message.Subject = "Kaksha : Recovery Code";
            message.Body = "The Recovery code for the entered account: " + IDBox.Text + " is \n" + randomizer;
            client.Send(message);
        }

        protected void Verify_Click(object sender, EventArgs e)
        {


            Verify.Visible = false;
            Label2.Visible = false;
            VerifyBox.Visible = false;
            Label1.Visible = false;
            IDBox.Visible = false;
            Submit1.Visible = false;



            if (VerifyBox.Text.Equals(randomizer))
            {
                NewPasswordLabel.Visible = true;
                CNewPasswordLabel.Visible = true;
                NewPassword.Visible = true;
                CNewPassword.Visible = true;
                ForgotSubmit.Visible = true;
            }
            else
            {
                Response.Redirect("Login.aspx");
                Response.Write("Invalid Recovery Code");
            }

        }

        protected void ForgotSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=AKANKSHA;Initial Catalog=Project;Integrated Security=True");
            con.Open();

            if (isstudent)
            {
                SqlCommand putNewPassQ = new SqlCommand("update StudentData set SPassword = '" + CNewPassword.Text + "' where StudentID = '" + IDBox.Text + "'", con);
                putNewPassQ.ExecuteNonQuery();

                Response.Write("Password Changed Succesfully!");
            }
            else
            {
                SqlCommand putNewPassQ = new SqlCommand("update TeacherData set TPassword = '" + CNewPassword.Text + "' where TeacherID = '" + IDBox.Text + "'", con);
                putNewPassQ.ExecuteNonQuery();

                Response.Write("Password Changed Succesfully!");
            }
        }

    }
}