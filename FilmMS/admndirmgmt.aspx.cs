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
    public partial class admnauthmgmt : System.Web.UI.Page
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
            admndir_GridView.DataBind();
        }

        //add btn click start
        protected void admndir_add_Click(object sender, EventArgs e)
        {
            if (checkIfDirectorNameExists())
            {
                Response.Write("<script>alert('Director with this name already exists!');</script>");
            }
            else
            {
                addnewDirector();
            }
        }
        //add btn click end

        //update btn click start
        protected void admndir_update_Click(object sender, EventArgs e)
        {
            if (checkIfDirectorNameExists())
            {
                Response.Write("<script>alert('Director name already exist with that ID!');</script>");
            }
            else if (checkIfDirectorIDExists())
            {
                updateDirector();
            }
            else
            {
                //  updateDirector();
                Response.Write("<script>alert('Director with that ID does not exist');</script>");
            }
        }
        //update btn click end

        //delete btn click start
        protected void admndir_delete_Click(object sender, EventArgs e)
        {
            if (checkIfDirectorIDExists() == false)
            {
                Response.Write("<script>alert('Director does not exist with that ID!');</script>");
            }
            else if (checkIfDirectorIDExists())
            {
                deleteDirector();
            }
        }
        //delete btn click end

        //search btn click start
        protected void admndir_searchbtn_Click(object sender, EventArgs e)
        {
            getDirectorByID();
        }
        //search btn click end


        //user def. func start
        void addnewDirector()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO director_master_tbl (director_name)" +
                    "VALUES ('" + admndir_dirnametbx.Text + "')", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('New Director added successfully!');</script>");
                clearForm();
                admndir_GridView.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void updateDirector()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE director_master_tbl SET director_name = '" + admndir_dirnametbx.Text + "' " +
                    "WHERE director_id ='" + admndir_dirIDtbx.Text + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Director Updated successfully');</script>");
                clearForm();
                admndir_GridView.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void deleteDirector()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM  director_master_tbl WHERE director_id = '" + admndir_dirIDtbx.Text + "' ", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Director deleted sucessfully!');</script>");
                clearForm();
                admndir_GridView.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");

            }
        }

        void getDirectorByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM director_master_tbl WHERE director_id = '" + admndir_dirIDtbx.Text + "' ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    admndir_dirnametbx.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Director ID');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");

            }
        }

        bool checkIfDirectorNameExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from director_master_tbl where director_name='" + admndir_dirnametbx.Text + "';", con);
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

        bool checkIfDirectorIDExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from director_master_tbl where director_id='" + admndir_dirIDtbx.Text + "';", con);
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

        void clearForm()
        {
            admndir_dirIDtbx.Text = "";
            admndir_dirnametbx.Text = "";
        }
        //user def. func end
    }
}