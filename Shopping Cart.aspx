using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;

public partial class CustomerPages_shoppingCart : System.Web.UI.Page
{
    int pID;
    string pName = "";
    decimal unitPrice;
    //static int counter = 1;

    protected void Page_Load(object sender, EventArgs e)
    {
        displayCatalogue();
        DisplayShoppingCart();
       // Label1.Text = counter.ToString();
        LabelAlreadyThere.Text = "";
        //counter++;
        LabelAlreadyThere.Attributes.Add("style", "text-decoration:blink");
    }

    protected void GridViewProducts_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cmdAddToShoppingCart")
        {
            linqTestingDataContext db = new linqTestingDataContext();
            db.Connection.ConnectionString =
    System.Configuration.ConfigurationManager.AppSettings["linqTest"];
            var prod =
                from p in db.Products
                where (p.PID == Convert.ToInt32(e.CommandArgument.ToString()))
                select p;

            var shopping =
                    from scd in db.ShoppingCartDatas
                    where (scd.PID == Convert.ToInt32(e.CommandArgument.ToString()))
                    select scd;
            bool alreadyThere = false;
            foreach(ShoppingCartData scd in shopping)
                alreadyThere = true;

            if (!alreadyThere)
            {
                foreach (Product pp in prod)
                {
                    pID = pp.PID;
                    pName = pp.PName;
                    unitPrice = pp.UnitPrice;
                }

                ShoppingCartData scd = new ShoppingCartData
                {
                    PID = pID,
                    PName = pName,
                    UnitPrice = unitPrice,
                    Quantity = 1
                };

                db.ShoppingCartDatas.InsertOnSubmit(scd);
                db.SubmitChanges();

                DisplayShoppingCart();
                displayCatalogue();
            }
            else
                LabelAlreadyThere.Text="Item Already in the shopping Cart";
        }
    }


    protected void GridViewShoppingCart_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cmdMore")
        {
            linqTestingDataContext db = new linqTestingDataContext();
            db.Connection.ConnectionString =
            System.Configuration.ConfigurationManager.AppSettings["linqTest"];
            var shopping =
                    from scd in db.ShoppingCartDatas
                    where (scd.TempOrderID == Convert.ToInt32(e.CommandArgument.ToString()))
                    select scd;
            foreach (ShoppingCartData sp in shopping)
            {
                sp.Quantity = sp.Quantity + 1;
            }
            db.SubmitChanges();

            DisplayShoppingCart();
        }

        if (e.CommandName == "cmdLess")
        {
            linqTestingDataContext db = new linqTestingDataContext();
            db.Connection.ConnectionString =
            System.Configuration.ConfigurationManager.AppSettings["linqTest"];
            var shopping =
                    from scd in db.ShoppingCartDatas
                    where (scd.TempOrderID == Convert.ToInt32(e.CommandArgument.ToString()))
                    select scd;
            foreach (ShoppingCartData sp in shopping)
            {
                if (sp.Quantity > 1)
                    sp.Quantity = sp.Quantity - 1;
            }
            db.SubmitChanges();

            DisplayShoppingCart();
        }

        if (e.CommandName == "cmdDelete")
        {
            linqTestingDataContext db = new linqTestingDataContext();
            db.Connection.ConnectionString =
            System.Configuration.ConfigurationManager.AppSettings["linqTest"];

            var shopping1 =
                    from scd in db.ShoppingCartDatas
                    where (scd.TempOrderID == Convert.ToInt32(e.CommandArgument.ToString()))
                    select scd;

            db.ShoppingCartDatas.DeleteAllOnSubmit(shopping1);
            db.SubmitChanges();

            displayCatalogue();
            DisplayShoppingCart();
        }
    }

    protected void DisplayShoppingCart()
    {
        linqTestingDataContext db = new linqTestingDataContext();
        db.Connection.ConnectionString =
        System.Configuration.ConfigurationManager.AppSettings["linqTest"];
        var shopping =
            from scd in db.ShoppingCartDatas
            select scd;

        GridViewShoppingCart.DataSource = shopping;
        GridViewShoppingCart.DataBind();
        showTotal();
    }

    protected void showTotal()
    {
        decimal subTotal = 0;
        decimal grandTotal = 0;
        linqTestingDataContext db = new linqTestingDataContext();
        db.Connection.ConnectionString =
        System.Configuration.ConfigurationManager.AppSettings["linqTest"];
        var shopping =
            from scd in db.ShoppingCartDatas
            select scd;

        foreach (ShoppingCartData sp in shopping)
        {
            subTotal = sp.UnitPrice * sp.Quantity;
            grandTotal += subTotal;
        }
        lblTotalValue.Text = grandTotal.ToString();
    }


    protected void EmptyShoppingCart()
    {
        linqTestingDataContext db = new linqTestingDataContext();
        db.Connection.ConnectionString =
        System.Configuration.ConfigurationManager.AppSettings["linqTest"];

        var shopping =
                from scd in db.ShoppingCartDatas
                select scd;
        foreach (ShoppingCartData xProducts in shopping)
        {
            db.ShoppingCartDatas.DeleteAllOnSubmit(shopping);
            db.SubmitChanges();
        }
        DisplayShoppingCart();
    }


    protected void displayBrandCategoryProducts()
    {
        linqTestingDataContext db = new linqTestingDataContext();
        db.Connection.ConnectionString =
        System.Configuration.ConfigurationManager.AppSettings["linqTest"];

        var products =
            from p in db.Products
            where (p.Brand == ddListBrands.Text && p.Category == ddListCategories.Text)
            select p;

        GridViewProducts.DataSource = products;
        GridViewProducts.DataBind();
    }


    protected void displayBrandProducts()
    {
        linqTestingDataContext db = new linqTestingDataContext();
        db.Connection.ConnectionString =
        System.Configuration.ConfigurationManager.AppSettings["linqTest"];

        var products =
            from p in db.Products
            where (p.Brand == ddListBrands.Text)
            select p;

        GridViewProducts.DataSource = products;
        GridViewProducts.DataBind();
    }


    protected void displayCategoryProducts()
    {
        linqTestingDataContext db = new linqTestingDataContext();
        db.Connection.ConnectionString =
        System.Configuration.ConfigurationManager.AppSettings["linqTest"];

        var products =
            from p in db.Products
            where (p.Category == ddListCategories.Text)
            select p;

        GridViewProducts.DataSource = products;
        GridViewProducts.DataBind();
    }

    protected void displayAllProducts()
    {
        linqTestingDataContext db = new linqTestingDataContext();
        db.Connection.ConnectionString =
        System.Configuration.ConfigurationManager.AppSettings["linqTest"];

        var products =
            from p in db.Products
            where (p.Brand!="All Brands")
            select p;

        GridViewProducts.DataSource = products;
        GridViewProducts.DataBind();
        showTotal();
    }


    protected void displayProducts()
    {
        linqTestingDataContext db = new linqTestingDataContext();
        db.Connection.ConnectionString =
        System.Configuration.ConfigurationManager.AppSettings["linqTest"];
        var shopping =
            from scd in db.ShoppingCartDatas
            select scd;

        foreach (ShoppingCartData item in shopping)
        {
            var products =
                    from p in db.Products
                    where !(from scd in db.ShoppingCartDatas
                            select scd.PID).Contains(p.PID)
                    select p;

            GridViewProducts.DataSource = products;
            GridViewProducts.DataBind();
        }
    }


    protected void displayCatalogue()
    {
        if (ddListBrands.Text!="All Brands" && ddListCategories.Text!="All Categories")
            displayBrandCategoryProducts();
        if (ddListBrands.Text != "All Brands" && ddListCategories.Text == "All Categories")
            displayBrandProducts();
        if (ddListBrands.Text == "All Brands" && ddListCategories.Text != "All Categories")
            displayCategoryProducts();
        if (ddListBrands.Text == "All Brands" && ddListCategories.Text == "All Categories")
            displayAllProducts();
        showTotal();
    }


    protected void LinkButtonEmptyShoppingCart_Click(object sender, EventArgs e)
    {
        EmptyShoppingCart();
    }

    protected void ddListBrands_SelectedIndexChanged(object sender, EventArgs e)
    {
            displayCatalogue();
    }

    protected void ddListCategories_SelectedIndexChanged(object sender, EventArgs e)
    {
            displayCatalogue();
    }
}
