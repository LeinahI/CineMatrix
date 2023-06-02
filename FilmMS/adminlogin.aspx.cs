using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FilmMS
{
    public partial class adminlogin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void admnlg_loginbtn_Click(object sender, EventArgs e)
        {
            //Response.Write("<script>alert('Admin Login Successfully!');</script>");
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM admin_login_tbl where admin_username='" + admnlg_admnunametbx.Text + "' " +
                    "AND admin_password='" + admnlg_admnpwtbx.Text + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                            "alert('Your admin username = " + dr.GetValue(1).ToString() + "');window.location ='homepage.aspx';", true);
                        Session["username"] = dr.GetValue(1).ToString().Trim();
                        Session["fullname"] = dr.GetValue(3).ToString().Trim();
                        Session["role"] = "admin";
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid Admin Credentials');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}