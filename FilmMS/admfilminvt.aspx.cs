using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FilmMS
{
    public partial class admnbookinvt : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        //global variables start
        static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_films;
        //global variables end

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if(Session["role"] == null || !Session["role"].ToString().Equals("admin"))
                {

                    Response.Redirect("homepage.aspx");
                }
                else if (Session["fullname"] == null || string.IsNullOrEmpty(Session["fullname"].ToString()))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Admin Session Expired! Log in again to continue');window.location ='adminlogin.aspx';", true);
                }
                else
                {
                    if (!IsPostBack)
                    {
                        fillDirPubValues();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            
            admnflminvt_GridView.DataBind();

        }
        //search btn start
        protected void admnflminvt_searchbtn_Click(object sender, EventArgs e)
        {
            if (admnflminvt_filmidtbx.Text == "")
            {
                clearForm();
            }
            else
            {
                searchFilmByID();
            }

        }
        //search btn end

        //add btn start
        protected void admnflminvt_add_Click(object sender, EventArgs e)
        {
            if (checkIfFilmNameIDExists())
            {
                Response.Write("<script>alert('Book with this name already exists!');</script>");
                clearForm();
            }
            else
            {
                addNewFilm();
            }
        }
        //add btn end

        //update btn start
        protected void admnflminvt_update_Click(object sender, EventArgs e)
        {
            
            if (checkIfFilmNameIDExists())
            {
                updateFilmByID();
                Response.Write("<script>alert('Film details updated successfully!');</script>");
            }
            else
            {
                Response.Write("<script>alert('Film does not exist with that ID!');</script>");
                clearForm();
            }
        }
        //update btn end

        //delete btn start
        protected void admnflminvt_delete_Click(object sender, EventArgs e)
        {
            if (checkIfFilmNameIDExists() == false)
            {
                Response.Write("<script>alert('Film does not exist with that ID!');</script>");
            }
            else if (checkIfFilmNameIDExists())
            {
                deleteFilmByID();
            }
        }
        //delete btn end

        //user def. functions start
        void fillDirPubValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT director_name from director_master_tbl ORDER BY director_name ASC", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                admnflminvt_director.DataSource = dt;
                admnflminvt_director.DataValueField = "director_name";
                admnflminvt_director.DataBind();

                cmd = new SqlCommand("SELECT prod_com_name from production_company_master_tbl ORDER BY prod_com_name ASC", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                admnflminvt_production.DataSource = dt;
                admnflminvt_production.DataValueField = "prod_com_name";
                admnflminvt_production.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool checkIfFilmNameIDExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from film_master_tbl where film_id ='" + admnflminvt_filmidtbx.Text + "';", con);
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

        void addNewFilm()
        {
            try
            {
                //save genres start
                string genres = "";
                foreach (int i in admnflminvt_genretbx.GetSelectedIndices())
                {
                    genres = genres + admnflminvt_genretbx.Items[i] + ",";
                }
                genres = genres.Remove(genres.Length - 1);
                //save genres end

                //save film cover start
                string filepath = "~/film_cover_invt/placeholder.jpg";
                string filename = Path.GetFileName(admnflminvt_imgFileUpload.PostedFile.FileName);
                admnflminvt_imgFileUpload.SaveAs(Server.MapPath("film_cover_invt/" + filename));
                filepath = "~/film_cover_invt/" + filename;
                //save film cover end

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO film_master_tbl (film_name, genre, director_name, production_company_name," +
                    "release_date, language, film_cost, film_length_min, film_description, actual_stock, current_stock, book_img_link) VALUES" +
                    "('" + admnflminvt_fntbx.Text + "', '" + genres + "', '" + admnflminvt_director.SelectedItem.Value + "'," +
                    " '" + admnflminvt_production.SelectedItem.Value + "', '" + admnflminvt_reldt.Text + "'," +
                    " '" + admnflminvt_lang.Text + "', '" + admnflminvt_filmcost.Text + "', '" + admnflminvt_filmlength.Text + "'," +
                    " '" + admnflminvt_desc.Text + "', '" + admnflminvt_actstock.Text + "', '" + admnflminvt_actstock.Text + "', " +
                    " '" + filepath + "')", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('New Film added successfully!');</script>");
                admnflminvt_GridView.DataBind();
                clearForm();
            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void searchFilmByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from film_master_tbl WHERE film_id = '" + admnflminvt_filmidtbx.Text + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {


                    admnflminvt_fntbx.Text = dt.Rows[0]["film_name"].ToString();

                    admnflminvt_director.SelectedValue = dt.Rows[0]["director_name"].ToString();
                    admnflminvt_production.SelectedValue = dt.Rows[0]["production_company_name"].ToString();

                    admnflminvt_genretbx.ClearSelection();
                    string[] genre = dt.Rows[0]["genre"].ToString().Trim().Split(',');
                    for (int i = 0; i < genre.Length; i++)
                    {
                        for (int j = 0; j < admnflminvt_genretbx.Items.Count; j++)
                        {
                            if (admnflminvt_genretbx.Items[j].ToString() == genre[i])
                            {
                                admnflminvt_genretbx.Items[j].Selected = true;
                            }
                        }
                    }

                    admnflminvt_lang.Text = dt.Rows[0]["language"].ToString();
                    admnflminvt_reldt.Text = Convert.ToDateTime(dt.Rows[0]["release_date"]).ToString("yyyy-MM-dd");

                    decimal moneyval = (decimal)dt.Rows[0]["film_cost"];
                    string formattedval = moneyval.ToString("0.00");
                    admnflminvt_filmcost.Text = formattedval;
                    admnflminvt_filmlength.Text = dt.Rows[0]["film_length_min"].ToString();

                    admnflminvt_actstock.Text = dt.Rows[0]["actual_stock"].ToString().Trim();
                    admnflminvt_curstock.Text = dt.Rows[0]["current_stock"].ToString().Trim();
                    admnflminvt_issuedfilms.Text = "" + (Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString()) -
                        Convert.ToInt32(dt.Rows[0]["current_stock"].ToString()));

                    admnflminvt_desc.Text = dt.Rows[0]["film_description"].ToString();

                    global_actual_stock = Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString().Trim());
                    global_current_stock = Convert.ToInt32(dt.Rows[0]["current_stock"].ToString().Trim());
                    global_issued_films = global_actual_stock - global_current_stock;
                    global_filepath = dt.Rows[0]["book_img_link"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Film ID');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void updateFilmByID()
        {
            try
            {
                //update genres start
                string genres = "";
                foreach (int i in admnflminvt_genretbx.GetSelectedIndices())
                {
                    genres = genres + admnflminvt_genretbx.Items[i] + ",";
                }
                genres = genres.Remove(genres.Length - 1);
                //update genres end

                //save film cover start
                string filepath = "~/film_cover_invt/placeholder.jpg";
                string filename = Path.GetFileName(admnflminvt_imgFileUpload.PostedFile.FileName);
                if (filename == "" || filename == null)
                {
                    filepath = global_filepath;
                }
                else
                {
                    admnflminvt_imgFileUpload.SaveAs(Server.MapPath("film_cover_invt/" + filename));
                    filepath = "~/film_cover_invt/" + filename;
                }
                //save film cover end

                //save actual & curr stock start
                int actual_stock = Convert.ToInt32(admnflminvt_actstock.Text.Trim());
                int current_stock = Convert.ToInt32(admnflminvt_curstock.Text.Trim());

                if (global_actual_stock == actual_stock)
                {

                }
                else
                {
                    if (actual_stock < global_issued_films)
                    {
                        Response.Write("<script>alert('Actual Stock value can't be less than the Issued films!');</script>");
                        return;
                    }
                    else
                    {
                        current_stock = actual_stock - global_issued_films;
                        admnflminvt_curstock.Text = "" + current_stock;
                    }
                }
                //save actual & curr stock end

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE film_master_tbl SET film_name = @film_name, genre = @genre, " +
                    "director_name = @director_name, production_company_name = @production_company_name, release_date = @release_date," +
                    "language = @language, film_cost = @film_cost, film_length_min = @film_length_min, film_description = @film_description," +
                    "actual_stock = @actual_stock, current_stock = @current_stock, book_img_link = @book_img_link" +
                    " WHERE film_id = '" + admnflminvt_filmidtbx.Text + "'", con);

                cmd.Parameters.AddWithValue("@film_name", admnflminvt_fntbx.Text);
                cmd.Parameters.AddWithValue("@genre", genres);
                cmd.Parameters.AddWithValue("@director_name", admnflminvt_director.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@production_company_name", admnflminvt_production.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@release_date", admnflminvt_reldt.Text.Trim());
                cmd.Parameters.AddWithValue("@language", admnflminvt_lang.Text);
                cmd.Parameters.AddWithValue("@film_cost", admnflminvt_filmcost.Text);
                cmd.Parameters.AddWithValue("@film_length_min", admnflminvt_filmlength.Text);
                cmd.Parameters.AddWithValue("@film_description", admnflminvt_desc.Text);
                cmd.Parameters.AddWithValue("@actual_stock", actual_stock.ToString());
                cmd.Parameters.AddWithValue("@current_stock", current_stock.ToString());
                cmd.Parameters.AddWithValue("@book_img_link", filepath);

                cmd.ExecuteNonQuery();
                con.Close();
                admnflminvt_GridView.DataBind();
                clearForm();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void deleteFilmByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM film_master_tbl WHERE film_id = '" + admnflminvt_filmidtbx.Text + "' ", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Film deleted sucessfully!');</script>");
                clearForm();
                admnflminvt_GridView.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void clearForm()
        {
            admnflminvt_filmidtbx.Text = string.Empty;
            admnflminvt_fntbx.Text = string.Empty;
            admnflminvt_lang.Text = string.Empty;
            admnflminvt_reldt.Text = string.Empty;
            admnflminvt_filmcost.Text = string.Empty;
            admnflminvt_filmlength.Text = string.Empty;
            admnflminvt_desc.Text = string.Empty;
            admnflminvt_actstock.Text = string.Empty;
            admnflminvt_curstock.Text = string.Empty;

            admnflminvt_genretbx.ClearSelection();
        }
        //user def. functions end
    }
}