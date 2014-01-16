using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Pages_adminStockLevel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        linqTestingDataContext db = new linqTestingDataContext();
        db.Connection.ConnectionString =
        System.Configuration.ConfigurationManager.AppSettings["linqTest"];

        var products =
            from p in db.Products
            where (p.ROL > p.UnitsInStock)
            select p;

        GridViewBelowROL.DataSource = products;
        GridViewBelowROL.DataBind();
    }
    protected void LoginStatus1_LoggedOut(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }
}
