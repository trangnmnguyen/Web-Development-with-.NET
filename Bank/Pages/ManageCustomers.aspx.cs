using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_ManageCustomers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void dsCustomerUpdate_Deleted(object sender, SqlDataSourceStatusEventArgs e)
    {
        dsCustomerList.DataBind();
        grvCustomer.DataBind();
    }
    protected void dsCustomerUpdate_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        dsCustomerList.DataBind();
        grvCustomer.DataBind();
    }
    protected void dsCustomerUpdate_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        dsCustomerList.DataBind();
        grvCustomer.DataBind();
    }
}