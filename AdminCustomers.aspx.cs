using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Pages_adminCustomers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LoginStatus1_LoggedOut(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }

    protected void GridViewCustomers_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cmdDeleteCustomer")
        {
            linqTestingDataContext db = new linqTestingDataContext();
            db.Connection.ConnectionString =
    System.Configuration.ConfigurationManager.AppSettings["linqTest"];
            var country =
                from c in db.Customers
                where (c.CID == Convert.ToInt32(e.CommandArgument.ToString()))
                select c;

            db.Customers.DeleteAllOnSubmit(country);
            db.SubmitChanges();
            ViewData();
        }
    }

    private void ViewData()
    {
        linqTestingDataContext db = new linqTestingDataContext();
        db.Connection.ConnectionString =
        System.Configuration.ConfigurationManager.AppSettings["linqTest"];
        var cust =
            from c in db.Customers
            select c;

        GridViewCustomers.DataBind();
    }
}
