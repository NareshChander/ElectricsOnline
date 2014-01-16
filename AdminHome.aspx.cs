using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class Admin_Pages_adminHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // welcomeWebPart.Text = TextBoxName.Text;
        if (IsPostBack == false)
        {
            foreach (WebPartDisplayMode mode in WebPartManager1.SupportedDisplayModes)
            {
                DropDownList1.Items.Add(mode.Name);
            }
            DropDownList1.SelectedValue = WebPartManager1.DisplayMode.ToString();
        }

        linqTestingDataContext db = new linqTestingDataContext();
        db.Connection.ConnectionString =
        System.Configuration.ConfigurationManager.AppSettings["linqTest"];
        var ord_prod =
            from o_p in db.Order_Products
            where (o_p.TotalSale>500)
            select o_p;

        GridViewVIPOrders.DataSource = ord_prod;
        GridViewVIPOrders.DataBind();

    }
    protected void LoginStatus1_LoggedOut(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (WebPartManager1.SupportedDisplayModes[DropDownList1.SelectedValue] != null)
        {
            WebPartManager1.DisplayMode = WebPartManager1.SupportedDisplayModes
                [DropDownList1.SelectedValue];
        }
    }
}
