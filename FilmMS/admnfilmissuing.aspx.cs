using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace FilmMS
{
    public partial class admnbookissuing : System.Web.UI.Page
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
                else
                {
                    if (!IsPostBack)
                    {
                        DateTime maxDate = DateTime.Now.AddDays(7);
                        admnfilmissue_startdatetbx.Attributes["min"] = DateTime.Now.ToString("yyyy-MM-dd");
                        admnfilmissue_startdatetbx.Attributes["max"] = maxDate.ToString("yyyy-MM-dd");

                        admnfilmissue_enddatetbx.Attributes["min"] = DateTime.Now.ToString("yyyy-MM-dd");
                        admnfilmissue_enddatetbx.Attributes["max"] = maxDate.ToString("yyyy-MM-dd");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            
            admnfilmissue_GridView.DataBind();
        }

        //search memid & film name start
        protected void admnfilmissue_searchbtn_Click(object sender, EventArgs e)
        {
            getMemNameAndBook();
        }
        //search memid & film name end

        //film issue start
        protected void admnfilmissue_issue_Click(object sender, EventArgs e)
        {
            if (checkIfFilmExists() && checkIfMemberExists())
            {
                if (checkIfIssueEntryExists())
                {
                    Response.Write("<script>alert('This member already has this book!');</script>");
                }
                else
                {
                    issueFilm();
                    clearForm();
                }
                
            }
            else
            {
                Response.Write("<script>alert('Invalid Book or Member ID');</script>");
            }
        }
        //film issue end

        //film return start
        protected void admnfilmissue_return_Click(object sender, EventArgs e)
        {
            if (checkIfFilmExists() && checkIfMemberExists())
            {
                if (checkIfIssueEntryExists())
                {
                    returnFilm();
                    clearForm();
                }
                else
                {
                    Response.Write("<script>alert('This entry does not exists!');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Book or Member ID');</script>");
            }
        }
        //film return end

        protected void admnfilmissue_GridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if(e.Row.RowType == DataControlRowType.DataRow)
                {
                    //Check condition
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today = DateTime.Today;
                    if(today > dt)
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

        //user def. func start
        void getMemNameAndBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                //Get Film ID start
                SqlCommand cmd = new SqlCommand("SELECT film_name from film_master_tbl WHERE film_id = '" + admnfilmissue_filmidtbx.Text + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    admnfilmissue_filmnametbx.Text = dt.Rows[0]["film_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Book ID');</script>");
                    clearForm();
                }
                //Get Film ID end

                //Get member ID start
                cmd = new SqlCommand("SELECT full_name from member_master_tbl WHERE member_id = '" + admnfilmissue_memidtbx.Text + "'", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    admnfilmissue_memnametbx.Text = dt.Rows[0]["full_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Member ID');</script>");
                    clearForm();
                }
                //Get member ID end
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void issueFilm()
        {
            try
            {

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO film_issue_tbl (member_id, member_fullname, film_id, film_name, issue_date, due_date) " +
                    "VALUES ('" + admnfilmissue_memidtbx.Text + "', '" + admnfilmissue_memnametbx.Text + "', '" + admnfilmissue_filmidtbx.Text + "'," +
                    " '" + admnfilmissue_filmnametbx.Text + "', '" + admnfilmissue_startdatetbx.Text + "', '" + admnfilmissue_enddatetbx.Text + "')", con);
                cmd.ExecuteNonQuery();

                cmd = new SqlCommand("UPDATE film_master_tbl set current_stock = current_stock-1 WHERE film_id = '" + admnfilmissue_filmidtbx.Text + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Film Issued successfully!');</script>");
                admnfilmissue_GridView.DataBind();
                clearForm();
            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void returnFilm()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                
                SqlCommand cmd = new SqlCommand("DELETE from film_issue_tbl WHERE member_id = '" + admnfilmissue_memidtbx.Text.Trim() + "' " +
                    "AND film_id = '" + admnfilmissue_filmidtbx.Text.Trim() + "'", con);
                int result = cmd.ExecuteNonQuery();
                if(result > 0)
                {
                    
                    cmd = new SqlCommand("UPDATE film_master_tbl set current_stock = current_stock+1 WHERE film_id = '" + admnfilmissue_filmidtbx.Text + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Film Returned successfully!');</script>");
                    admnfilmissue_GridView.DataBind();
                    con.Close();
                }
                else
                {
                    Response.Write("<script>alert(Invalid member & film ID to execute!');</script>");
                }
                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                
            }
        }

        bool checkIfFilmExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                //Get Film ID start
                SqlCommand cmd = new SqlCommand("SELECT * from film_master_tbl WHERE film_id = '" + admnfilmissue_filmidtbx.Text.Trim() + "' " +
                    "AND current_stock > 0", con);
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
                //Get Film ID end
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        bool checkIfMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                //Get Film ID start
                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl WHERE member_id = '" + admnfilmissue_memidtbx.Text.Trim() + "'", con);
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
                //Get Film ID end
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        bool checkIfIssueEntryExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                //Get Film ID start
                SqlCommand cmd = new SqlCommand("SELECT * from film_issue_tbl WHERE member_id = '" + admnfilmissue_memidtbx.Text.Trim() + "' " +
                    "AND film_id = '" + admnfilmissue_filmidtbx.Text.Trim() + "'", con);
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
                //Get Film ID end
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        void clearForm()
        {
            admnfilmissue_memidtbx.Text = string.Empty;
            admnfilmissue_filmidtbx.Text = string.Empty;
            admnfilmissue_memnametbx.Text = string.Empty;
            admnfilmissue_filmnametbx.Text = string.Empty;
            admnfilmissue_startdatetbx.Text = string.Empty;
            admnfilmissue_enddatetbx.Text = string.Empty;
        }
        //user def. func end
    }
}