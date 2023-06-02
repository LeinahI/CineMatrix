using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Reflection.Emit;

namespace FilmMS
{
    public partial class userprofile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null || !Session["role"].ToString().Equals("user"))
                {

                    Response.Redirect("homepage.aspx");
                }
                if (Session["username"] == null || string.IsNullOrEmpty(Session["username"].ToString()))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Session Expired! Log in again to continue');window.location ='userlogin.aspx';", true);
                }
                
                else
                {
                    getUserFilmData();

                    if (!Page.IsPostBack)
                    {
                        getProfileData();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //update btn start
        protected void uprofile_updatebtn_Click(object sender, EventArgs e)
        {
            if (Session["username"] == null || string.IsNullOrEmpty(Session["username"].ToString()))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                "alert('Session Expired! Log in again to continue');window.location ='userlogin.aspx';", true);
            }
            else
            {
                updateUserData();
            }

        }
        //update btn end

        // user def. func
        void getUserFilmData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT member_id, member_fullname, film_id, film_name, issue_date, due_date from film_issue_tbl WHERE member_fullname = '" + Session["fullname"].ToString() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                usrProfile_GridView.DataSource = dt;
                usrProfile_GridView.DataBind();

            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        void getProfileData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl WHERE username = '" + Session["username"].ToString() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                uprofile_fnametbx.Text = dt.Rows[0]["full_name"].ToString();
                uprofile_dobtbx.Text = Convert.ToDateTime(dt.Rows[0]["dob"]).ToString("yyyy-MM-dd");
                uprofile_ctnumtbx.Text = dt.Rows[0]["contact_no"].ToString();
                uprofile_emailtbx.Text = dt.Rows[0]["email"].ToString();
                uprofile_region.Text = dt.Rows[0]["region"].ToString();
                uprofile_province.Text = dt.Rows[0]["province"].ToString();
                uprofile_cities.Text = dt.Rows[0]["city_muncipality"].ToString();
                uprofile_fulladdr.Text = dt.Rows[0]["full_address"].ToString();
                uprofile_unametbx.Text = dt.Rows[0]["username"].ToString();
                uprofile_passtbx.Text = dt.Rows[0]["password"].ToString();

                Label1.Text = dt.Rows[0]["account_status"].ToString().Trim();

                if (dt.Rows[0]["account_status"].ToString().Trim() == "active")
                {
                    Label1.Attributes["style"] = "color:#fff; font-weight:600; background: #198754; border:3px solid #198754; border-radius:10px;";
                }
                else if (dt.Rows[0]["account_status"].ToString().Trim() == "pending")
                {
                    Label1.Attributes["style"] = "color:#fff; font-weight:600; background: #ffc107; border:3px solid #ffc107; border-radius:10px;";
                }
                else if (dt.Rows[0]["account_status"].ToString().Trim() == "deactivated")
                {
                    Label1.Attributes["style"] = "color:#fff; font-weight:600; background: #dc3545; border:3px solid #dc3545; border-radius:10x;";
                }
                else
                {
                    Label1.Attributes.Add("class", "badge text-bg-info text-light");

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void updateUserData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE member_master_tbl SET full_name ='" + uprofile_fnametbx.Text + "', dob ='" + uprofile_dobtbx.Text + "'," +
                    "contact_no = '" + uprofile_ctnumtbx.Text + "', email='" + uprofile_emailtbx.Text + "'," +
                    "region = '" + uprofile_region.Text + "', province = '" + uprofile_province.Text + "'," +
                    "city_muncipality = '" + uprofile_cities.Text + "', full_address = '" + uprofile_fulladdr.Text + "'," +
                    "password = '" + uprofile_passtbx.Text + "' WHERE username ='" + uprofile_unametbx.Text + "'", con);
                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    con.Close();
                    Response.Write("<script>alert('Your Account Details Updated Successfully!');</script>");
                    getProfileData();
                    getUserFilmData();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Entry');</script>");
                }
                //Response.Write("<script>alert('Member Account Status Updated');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void usrProfile_GridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    //Check condition
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today = DateTime.Today;
                    if (today > dt)
                    {//Make the row purple red if date today is higher than due date
                        e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}