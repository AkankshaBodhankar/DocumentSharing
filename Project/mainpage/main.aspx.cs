using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class mainpage_main : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["NexusConnectionString"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        string today = DateTime.Today.ToString("dd-MM-yyyy");
       string day = DateTime.Today.ToString("dd");
       string month = DateTime.Today.ToString("MM");
       if (day == "15" && month == "08")
       {
           HtmlGenericControl body = (HtmlGenericControl)this.Page.FindControl("ctl00$body");
           body.Attributes.Add("class", "bg-img-independence");

           HtmlGenericControl tile1 = (HtmlGenericControl)this.Page.FindControl("tile1");
           tile1.Attributes.Add("class", "tile-group-title fg-dark");

           HtmlGenericControl tile2 = (HtmlGenericControl)this.Page.FindControl("tile2");
           tile2.Attributes.Add("class", "tile-group-title fg-dark");
           HtmlGenericControl tile3 = (HtmlGenericControl)this.Page.FindControl("tile3");
           tile3.Attributes.Add("class", "tile-group-title fg-dark");
       }
       if (day == "26" && month == "01")
       {
           HtmlGenericControl body = (HtmlGenericControl)this.Page.FindControl("ctl00$body");
           body.Attributes.Add("class", "bg-img-republic");

           HtmlGenericControl tile1 = (HtmlGenericControl)this.Page.FindControl("tile1");
           tile1.Attributes.Add("class", "tile-group-title fg-dark");

           HtmlGenericControl tile2 = (HtmlGenericControl)this.Page.FindControl("tile2");
           tile2.Attributes.Add("class", "tile-group-title fg-dark");
           HtmlGenericControl tile3 = (HtmlGenericControl)this.Page.FindControl("tile3");
           tile3.Attributes.Add("class", "tile-group-title fg-dark");
       }
       con.Open();
       SqlCommand diwali =new SqlCommand("select * from festival where festival='diwali' ", con);
       SqlDataReader rdr = diwali.ExecuteReader();
       while (rdr.Read())
       {
           string s = rdr.GetValue(1).ToString();
           string date=s.Substring(0, 10);
           if (today == date)
           {
               HtmlGenericControl body = (HtmlGenericControl)this.Page.FindControl("ctl00$body");
               body.Attributes.Add("class", "bg-img-diwali");

               HtmlGenericControl tile1 = (HtmlGenericControl)this.Page.FindControl("tile1");
               tile1.Attributes.Add("class", "tile-group-title fg-dark");

               HtmlGenericControl tile2 = (HtmlGenericControl)this.Page.FindControl("tile2");
               tile2.Attributes.Add("class", "tile-group-title fg-dark");
               HtmlGenericControl tile3 = (HtmlGenericControl)this.Page.FindControl("tile3");
               tile3.Attributes.Add("class", "tile-group-title fg-dark");
           }
       }



       SqlCommand sankranthi = new SqlCommand("select * from festival where festival='sankranthi' ", con);
       SqlDataReader san = sankranthi.ExecuteReader();
       while (san.Read())
       {
           string s = san.GetValue(1).ToString();
           string date = s.Substring(0, 10);
           if (today == date)
           {
               HtmlGenericControl body = (HtmlGenericControl)this.Page.FindControl("ctl00$body");
               body.Attributes.Add("class", "bg-img-sankranthi");

               HtmlGenericControl tile1 = (HtmlGenericControl)this.Page.FindControl("tile1");
               tile1.Attributes.Add("class", "tile-group-title fg-white");

               HtmlGenericControl tile2 = (HtmlGenericControl)this.Page.FindControl("tile2");
               tile2.Attributes.Add("class", "tile-group-title fg-white");
               HtmlGenericControl tile3 = (HtmlGenericControl)this.Page.FindControl("tile3");
               tile3.Attributes.Add("class", "tile-group-title fg-white");
           }
       }




       SqlCommand vinayakachaturthi = new SqlCommand("select * from festival where festival='vinayaka chaturthi' ", con);
       SqlDataReader vin = vinayakachaturthi.ExecuteReader();
       while (vin.Read())
       {
           string s = vin.GetValue(1).ToString();
           string date = s.Substring(0, 10);
           if (today == date)
           {
               HtmlGenericControl body = (HtmlGenericControl)this.Page.FindControl("ctl00$body");
               body.Attributes.Add("class", "bg-img-ganesh");

               HtmlGenericControl tile1 = (HtmlGenericControl)this.Page.FindControl("tile1");
               tile1.Attributes.Add("class", "tile-group-title fg-white");

               HtmlGenericControl tile2 = (HtmlGenericControl)this.Page.FindControl("tile2");
               tile2.Attributes.Add("class", "tile-group-title fg-white");
               HtmlGenericControl tile3 = (HtmlGenericControl)this.Page.FindControl("tile3");
               tile3.Attributes.Add("class", "tile-group-title fg-white");
           }
       }
    }
}