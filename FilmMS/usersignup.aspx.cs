using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Web.Services;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.Http;
using System.Text.RegularExpressions;

namespace FilmMS
{
    public partial class usersignup : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void usrsnp_snpbtn_Click(object sender, EventArgs e)
        {
            string ctninput = usrsnp_ctnumtbx.Text.Trim();
            string ctnpattern = @"^09\d{9}$";
            if (checkMemberExists())
            {
             //   Response.Write("<script>alert('Username Already Exist with this username, try other username!');</script>");
                usrsnp_unamelbl.Text = "Username Already Exist with this username, try other username!";
                usrsnp_unamelbl.Visible = true;
          
            }
            if (checkEmailExists())
            {
                //Response.Write("<script>alert('Email already exists, try other email!');</script>");
                usrsnp_emladdrlbl.Text = "Email already exists, try other email!";
                usrsnp_emladdrlbl.Visible = true;
          
            }
            if (!Regex.IsMatch(ctninput, ctnpattern))
            {
                //Response.Write("<script>alert('Invalid phone number format!');</script>");
                usrsnp_ctnumlbl.Text = "Invalid phone number format!";
                usrsnp_ctnumlbl.Visible = true;
                return;
            }
            else
            {
                signUpNewUser();
            }

            

        }

        // check email exists start
        bool checkEmailExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl where email='" + usrsnp_emladdrtbx.Text + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }
        // check email exists end

        // check user exists start
        bool checkMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl where username='" + usrsnp_unametbx.Text + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }
        // check user exists end

        //signup new user start
        void signUpNewUser()
        {
            //   Response.Write("<script>alert('testing lang ya')</script>");
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO member_master_tbl (full_name, dob, contact_no, email, " +
                    "region, province, city_muncipality, full_address, username, password, account_status)" +
                    "VALUES ('" + usrsnp_fullnametbx.Text + "','" + usrsnp_dobtbx.Text + "','" + usrsnp_ctnumtbx.Text + "','" + usrsnp_emladdrtbx.Text + "'" +
                    ",'" + usrsnp_ddregion.Text + "','" + usrsnp_ddprovince.Text + "'" +
                    ",'" + usrsnp_ddcity.Text + "','" + usrsnp_fulladdrtbx.Text + "'" +
                    ",'" + usrsnp_unametbx.Text + "','" + usrsnp_passtbx.Text + "','pending')", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Sign Up Successfully! You can Log in Now.');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
                
            }
        }
        //signup new user end

    }
}