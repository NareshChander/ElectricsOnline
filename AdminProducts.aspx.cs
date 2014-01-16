using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Pages_adminProducts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void LinkButtonAddNewProduct_Click(object sender, EventArgs e)
    {
        showProductForm();
        ClearForm();
        LinkButtonAddNewProduct.Visible = false;
        LinkButtonProductSave.Visible = false;
        LinkButtonProductAdd.Visible = true;
        LinkButtonProductCancel.Visible = false;
    }


    protected void GridViewProducts_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cmdEditProduct")
        {
            showProductForm();
            linqTestingDataContext db = new linqTestingDataContext();
            db.Connection.ConnectionString =
    System.Configuration.ConfigurationManager.AppSettings["linqTest"];
            var prod =
                from p in db.Products
                where (p.PID == Convert.ToInt32(e.CommandArgument.ToString()))
                select p;
            lblProductID.Text = e.CommandArgument.ToString();

            foreach (Product pp in prod)
            {
                txtPName.Text = pp.PName;
                txtPBrand.Text = pp.Brand;
                txtPUnitPrice.Text = pp.UnitPrice.ToString();
                txtPUnitsInStock.Text = pp.UnitsInStock.ToString();
                txtPCategory.Text = pp.Category;
                txtPdescription.Text = pp.Description;
                DropDownListPSupplierID.Text = pp.SID.ToString();
                txtPReOrderLevel.Text = pp.ROL.ToString();
            }
        }


        if (e.CommandName == "cmdDeleteProduct")
        {

            linqTestingDataContext db = new linqTestingDataContext();
            db.Connection.ConnectionString =
    System.Configuration.ConfigurationManager.AppSettings["linqTest"];
            var prod =
                from p in db.Products
                where (p.PID == Convert.ToInt32(e.CommandArgument.ToString()))
                select p;
            if (Convert.ToInt32(e.CommandArgument.ToString()) != 18)
            {
                try
                {
                    db.Products.DeleteAllOnSubmit(prod);
                    db.SubmitChanges();
                    ViewData();
                }
                catch
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('This product is on the some order list. Delete orders first.');", true);
                }
            }
        }
    }


    protected void LinkButtonProductSave_Click(object sender, EventArgs e)
    {
        linqTestingDataContext db = new linqTestingDataContext();
        db.Connection.ConnectionString =
        System.Configuration.ConfigurationManager.AppSettings["linqTest"];
        var pro = db.Products.Single
            (p => p.PID == Convert.ToInt32(lblProductID.Text));

        pro.PName = txtPName.Text;
        pro.Brand = txtPBrand.Text;
        pro.UnitPrice = Convert.ToDecimal(txtPUnitPrice.Text);
        pro.UnitsInStock = Convert.ToInt32(txtPUnitsInStock.Text);
        pro.Category = txtPCategory.Text;
        pro.Description = txtPdescription.Text;
        pro.SID = Convert.ToInt32(DropDownListPSupplierID.Text);
        pro.ROL = Convert.ToInt32(txtPReOrderLevel.Text);
        db.SubmitChanges();

        ViewData();
    }

    private void ViewData()
    {
        ClearForm();
        linqTestingDataContext db = new linqTestingDataContext();
        db.Connection.ConnectionString =
        System.Configuration.ConfigurationManager.AppSettings["linqTest"];
        var prod =
            from p in db.Products
            select p;

        GridViewAdminProducts.DataBind();
        GridViewAdminProducts.Visible = true;
        tblProductForm.Visible = false;
        LinkButtonAddNewProduct.Visible = true;
    }

    private void ClearForm()
    {
        txtPName.Text = "";
        txtPBrand.Text = "";
        txtPUnitPrice.Text = "";
        txtPUnitsInStock.Text = "";
        txtPCategory.Text = "";
        txtPdescription.Text = "";
        txtPReOrderLevel.Text = "";
    }

    protected void showProductForm()
    {
        tblProductForm.Visible = true;
        GridViewAdminProducts.Visible = false;
        LinkButtonProductAdd.Visible = false;
        LinkButtonProductSave.Visible = true;

    }


    protected void LinkButtonSupplierCancel_Click(object sender, EventArgs e)
    {
        tblProductForm.Visible = false;
        GridViewAdminProducts.Visible = true;
        LinkButtonAddNewProduct.Visible = true;
    }


    protected void LinkButtonSupplierAdd_Click(object sender, EventArgs e)
    {

        linqTestingDataContext db = new linqTestingDataContext();
        db.Connection.ConnectionString =
 System.Configuration.ConfigurationManager.AppSettings["linqTest"];


        Product pro = new Product
        {
            PName = txtPName.Text.Trim(),
            Brand = txtPBrand.Text.Trim(),
            UnitPrice = Convert.ToDecimal(txtPUnitPrice.Text),
            UnitsInStock = Convert.ToInt32(txtPUnitsInStock.Text),
            Category = txtPCategory.Text.Trim(),
            Description = txtPdescription.Text.Trim(),
            SID = Convert.ToInt32(DropDownListPSupplierID.Text),
            ROL = Convert.ToInt32(txtPReOrderLevel.Text)
        };

        db.Products.InsertOnSubmit(pro);
        db.SubmitChanges();
        ViewData();
    }
    protected void LoginStatus2_LoggedOut(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }
}
