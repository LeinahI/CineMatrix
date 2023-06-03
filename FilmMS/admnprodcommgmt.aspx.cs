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
    public partial class admnpubmgmt : System.Web.UI.Page
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
                else if (Session["fullname"] == null || string.IsNullOrEmpty(Session["fullname"].ToString()))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Admin Session Expired! Log in again to continue');window.location ='adminlogin.aspx';", true);
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            admnprodcom_GridView.DataBind();
        }

        //add btn start
        protected void prodcom_add_Click(object sender, EventArgs e)
        {
            if (prodcom_nametbx.Text == string.Empty || prodcom_nametbx.Text == "")
            {
                Response.Write("<script>alert('Production Company name field shouldn't be empty!');</script>");
            }
            else if (checkIfProdComNameExists())
            {
                Response.Write("<script>alert('Production Company with this name already exists!');</script>");
            }
            else
            {
                addnewProdCom();
            }
        }
        //add btn end

        //update btn start
        protected void prodcom_update_Click(object sender, EventArgs e)
        {
            if (checkIfProdComNameExists())
            {
                Response.Write("<script>alert('Production Company name already exist with that ID!');</script>");
            }
            else if (checkIfProdComIDExists())
            {
                updateProdCom();
            }
            else
            {
                Response.Write("<script>alert('Production Company with that ID does not exist');</script>");
            }
        }
        //update btn end

        //delete btn start
        protected void prodcom_delete_Click(object sender, EventArgs e)
        {
            if (checkIfProdComIDExists() == false)
            {
                Response.Write("<script>alert('Production Company does not exist with that ID!');</script>");
            }
            else if (checkIfProdComIDExists())
            {
                deleteProdCom();
            }
        }
        //delete btn end

        //search btn start
        protected void prodcom_searchbtn_Click(object sender, EventArgs e)
        {
            geProdComByID();
        }
        //search btn end

        //user def. func start
        void addnewProdCom()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO production_company_master_tbl (prod_com_name)" +
                    "VALUES ('" + prodcom_nametbx.Text + "')", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('New Production Company added successfully!');</script>");
                clearForm();
                admnprodcom_GridView.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void updateProdCom()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE production_company_master_tbl SET prod_com_name = '" + prodcom_nametbx.Text + "' " +
                    "WHERE prod_com_id ='" + prodcom_idtbx.Text + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Production Company Updated successfully');</script>");
                clearForm();
                admnprodcom_GridView.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void deleteProdCom()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM  production_company_master_tbl WHERE prod_com_id = '" + prodcom_idtbx.Text + "' ", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Production Company deleted sucessfully!');</script>");
                clearForm();
                admnprodcom_GridView.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void geProdComByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM production_company_master_tbl WHERE prod_com_id = '" + prodcom_idtbx.Text + "' ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    prodcom_nametbx.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Production Company ID');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");

            }
        }

        bool checkIfProdComNameExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from production_company_master_tbl where prod_com_name='" + prodcom_nametbx.Text + "';", con);
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

        bool checkIfProdComIDExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from production_company_master_tbl where prod_com_id='" + prodcom_idtbx.Text + "';", con);
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
            prodcom_idtbx.Text = "";
            prodcom_nametbx.Text = "";
        }
        //user def. func end
    }
}