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
    public partial class admnmembermgmt : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null || !Session["role"].ToString().Equals("admin"))
                {

                    Response.Redirect("homepage.aspx");
                }
                if (Session["fullname"] == null || string.IsNullOrEmpty(Session["fullname"].ToString()))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Admin Session Expired! Log in again to continue');window.location ='adminlogin.aspx';", true);
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            admnmmgmt_GridView.DataBind();
        }

        //search id btn start
        protected void admnmmgmt_searchbtn_Click(object sender, EventArgs e)
        {
            if (admnmmgmt_memidtbx.Text == "")
            {
                clearform();
            }
            else if (checkIfMemberIDExists() == false)
            {
                Response.Write("<script>alert('Member does not exist with that ID!');</script>");
                clearform();
            }
            else if (checkIfMemberIDExists())
            {
                getMemberByID();
            }

        }
        //search id btn end

        //active btn start
        protected void admnmmgmt_btnActive_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("active");
        }
        //active btn end

        //pending btn start
        protected void admnmmgmt_btnPending_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("pending");
        }
        //pending btn end

        //deactivated btn start
        protected void admnmmgmt_btnDeactivated_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("deactivated");
        }
        //deactivated btn end

        //update btn start
        protected void admnmmgmt_update_Click(object sender, EventArgs e)
        {
            if (checkIfMemberIDExists())
            {
                updateMemberByID();
                Response.Write("<script>alert('Member details updated successfully!');</script>");
            }
            else
            {
                Response.Write("<script>alert('Member does not exist with that ID!');</script>");
                clearform();
            }
        }
        //update btn end

        //delete btn start
        protected void admnmmgmt_delete_Click(object sender, EventArgs e)
        {
            if (checkIfMemberIDExists() == false)
            {
                Response.Write("<script>alert('Member does not exist with that ID!');</script>");
            }
            else if (checkIfMemberIDExists())
            {
                deleteMemberByID();
            }

        }
        //delete btn end

        //user def. func start
        void getMemberByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM member_master_tbl where member_id ='" + admnmmgmt_memidtbx.Text + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        admnmmgmt_fntbx.Text = dr.GetValue(1).ToString();
                        admnmmgmt_accstattbx.Text = dr.GetValue(11).ToString();

                        admnmmgmt_dob.Text = Convert.ToDateTime(dr[2]).ToString("yyyy-MM-dd");
                        admnmmgmt_contactnumtbx.Text = dr.GetValue(3).ToString();
                        admnmmgmt_emailaddrtbx.Text = dr.GetValue(4).ToString();
                        admnmmgmt_regiontbx.Text = dr.GetValue(5).ToString();
                        admnmmgmt_provincetbx.Text = dr.GetValue(6).ToString();
                        admnmmgmt_citytbx.Text = dr.GetValue(7).ToString();
                        admnmmgmt_fulladdrtbx.Text = dr.GetValue(8).ToString();
                        admnmmgmt_unametbx.Text = dr.GetValue(9).ToString();
                        admnmmgmt_passtbx.Text = dr.GetValue(10).ToString();
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid Member ID');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void updateMemberStatusByID(string status)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE member_master_tbl SET account_status='" + status + "'" +
                    " WHERE member_id ='" + admnmmgmt_memidtbx.Text + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                //Response.Write("<script>alert('Member Account Status Updated');</script>");
                admnmmgmt_GridView.DataBind();
                clearform();



            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void updateMemberByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE member_master_tbl SET full_name ='" + admnmmgmt_fntbx.Text + "', dob ='" + admnmmgmt_dob.Text + "'," +
                    "contact_no = '" + admnmmgmt_contactnumtbx.Text + "', email='" + admnmmgmt_emailaddrtbx.Text + "'," +
                    "region = '" + admnmmgmt_regiontbx.Text + "', province = '" + admnmmgmt_provincetbx.Text + "'," +
                    "city_muncipality = '" + admnmmgmt_citytbx.Text + "', full_address = '" + admnmmgmt_fulladdrtbx.Text + "'," +
                    "username = '" + admnmmgmt_unametbx.Text + "', password = '" + admnmmgmt_passtbx.Text + "' WHERE member_id ='" + admnmmgmt_memidtbx.Text + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                //Response.Write("<script>alert('Member Account Status Updated');</script>");
                admnmmgmt_GridView.DataBind();
                clearform();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void deleteMemberByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM member_master_tbl WHERE member_id = '" + admnmmgmt_memidtbx.Text + "' ", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Member deleted sucessfully!');</script>");
                clearform();
                admnmmgmt_GridView.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        bool checkIfMemberIDExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl where member_id ='" + admnmmgmt_memidtbx.Text + "';", con);
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
        void clearform()
        {
            admnmmgmt_memidtbx.Text = "";
            admnmmgmt_fntbx.Text = "";
            admnmmgmt_accstattbx.Text = "";
            admnmmgmt_dob.Text = "";
            admnmmgmt_contactnumtbx.Text = "";
            admnmmgmt_emailaddrtbx.Text = "";
            admnmmgmt_regiontbx.Text = "";
            admnmmgmt_provincetbx.Text = "";
            admnmmgmt_citytbx.Text = "";
            admnmmgmt_fulladdrtbx.Text = "";
            admnmmgmt_unametbx.Text = "";
            admnmmgmt_passtbx.Text = "";
        }
        //user def. func end
    }
}