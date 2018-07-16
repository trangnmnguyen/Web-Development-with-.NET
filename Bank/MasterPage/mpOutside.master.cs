using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage_mpOutside : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("~/Pages/Login.aspx", false);
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Pages/Login.aspx", false);
    }
}
