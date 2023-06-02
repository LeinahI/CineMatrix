using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FilmMS
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null)
                {
                    SM_signup.Visible = true;
                    SM_logout.Visible = false;
                    SM_profile.Visible = false;

                    SM_admnlogin.Visible = true;
                    SM_dirmgmt.Visible = false;
                    SM_prodcommgmt.Visible = false;
                    SM_bookinvt.Visible = false;
                    SM_bookissuing.Visible = false;
                    SM_membermgmt.Visible = false;
                }
                else if (Session["role"].Equals("user"))
                {
                    dropdown_login.Visible = false;

                    SM_signup.Visible = false;
                    SM_logout.Visible = true;
                    SM_profile.Visible = true; //Hello user
                    SM_profile.Text = "Hello " + Session["username"].ToString();

                    SM_admnlogin.Visible = true;
                    SM_dirmgmt.Visible = false;
                    SM_prodcommgmt.Visible = false;
                    SM_bookinvt.Visible = false;
                    SM_bookissuing.Visible = false;
                    SM_membermgmt.Visible = false;
                }
                else if (Session["role"].Equals("admin"))
                {
                    dropdown_login.Visible = false;

                    SM_signup.Visible = false;
                    SM_logout.Visible = true;
                    SM_profile.Visible = false; //Hello user
                    SM_profileadmin.Visible = true;
                    SM_profileadmin.Text = "Hello admin " + Session["fullname"].ToString();

                    SM_admnlogin.Visible = false;
                    SM_dirmgmt.Visible = true;
                    SM_prodcommgmt.Visible = true;
                    SM_bookinvt.Visible = true;
                    SM_bookissuing.Visible = true;
                    SM_membermgmt.Visible = true;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //At top start
        protected void SM_memberlogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }
        protected void SM_adminlogin1_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }
        protected void SM_signup_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersignup.aspx");
        }
        protected void SM_viewfilms_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewfilms.aspx");
        }
        //At top end

        //At top start
        protected void SM_admnlogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }

        protected void SM_dirmgmt_Click(object sender, EventArgs e)
        {
            Response.Redirect("admndirmgmt.aspx");
        }

        protected void SM_prodcommgmt_Click(object sender, EventArgs e)
        {
            Response.Redirect("admnprodcommgmt.aspx");
        }

        protected void SM_bookinvt_Click(object sender, EventArgs e)
        {
            Response.Redirect("admfilminvt.aspx");
        }

        protected void SM_bookissuing_Click(object sender, EventArgs e)
        {
            Response.Redirect("admnfilmissuing.aspx");
        }

        protected void SM_membermgmt_Click(object sender, EventArgs e)
        {
            Response.Redirect("admnmembermgmt.aspx");
        }

        protected void SM_profile_Click(object sender, EventArgs e)
        {
            Response.Redirect("userprofile.aspx");
        }

        protected void SM_logout_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["full name"] = "";
            Session["role"] = "";
            Session["status"] = "";

            SM_signup.Visible = true;
            SM_logout.Visible = false;
            SM_profile.Visible = false;

            SM_admnlogin.Visible = true;
            SM_dirmgmt.Visible = false;
            SM_prodcommgmt.Visible = false;
            SM_bookinvt.Visible = false;
            SM_bookissuing.Visible = false;
            SM_membermgmt.Visible = false;
            Response.Redirect("homepage.aspx");
        }

        //At bottom end

    }
}