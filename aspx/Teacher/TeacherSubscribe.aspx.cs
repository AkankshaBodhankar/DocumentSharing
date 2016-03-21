using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

namespace Project
{
    public partial class StudentSubscribe : System.Web.UI.Page
    {
       
        int index = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            LogoutB.CssClass = "logout";
            GridView1.Rows[index].Cells[4].Enabled = true;
            //ButtonNewNotif.Visible = false;
            
        }

        protected void select_clicked(object sender, EventArgs e)
        {
          
               
            GridViewRow grdrow = (GridViewRow)((Button)sender).NamingContainer;
            string id = grdrow.Cells[0].Text;
            SqlConnection con = new SqlConnection("Data Source=AKANKSHA;Initial Catalog=Project;Integrated Security=True;");
            con.Open();
            if (TextBoxNotif.Text != null)
            {
                SqlCommand insernotif = new SqlCommand("insert into Notif(StudentID,Notifs) values('" + id + "','" + TextBoxNotif.Text + "')", con);
                insernotif.ExecuteNonQuery();
            }
            con.Close();
            grdrow.Cells[4].Enabled = false;
           // ButtonNewNotif.Visible = true;
            
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

            index = GridView1.SelectedIndex;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBoxNotif.Text = "  ";
            GridView1.Rows[index].Cells[4].Enabled = true;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("TeacherHome.aspx");
        }
        protected void LogoutB_Click(object sender, EventArgs e)
        {
            Session["New"] = null;
            Response.Redirect("Login.aspx");

        }


      
        


       
    }
}