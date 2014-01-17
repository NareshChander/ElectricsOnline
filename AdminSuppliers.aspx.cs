using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Pages_adminSupplier : System.Web.UI.Page
{
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void LinkButtonAddNewSupplier_Click(object sender, EventArgs e)
        {
            showSupplierForm();
            ClearForm();
            LinkButtonAddNewSupplier.Visible = false;
            LinkButtonSupplierSave.Visible = false;
            LinkButtonSupplierAdd.Visible = true;
            LinkButtonSupplierCancel.Visible = false;
        }


        protected void GridViewSuppliers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmdEditSupplier")
            {
                showSupplierForm();
                linqTestingDataContext db = new linqTestingDataContext();
                db.Connection.ConnectionString =
        System.Configuration.ConfigurationManager.AppSettings["linqTest"];
                var supp =
                    from s in db.Suppliers
                    where (s.SID == Convert.ToInt32(e.CommandArgument.ToString()))
                    select s;
                lblSupplierID.Text = e.CommandArgument.ToString();

                foreach (Supplier sup in supp)
                {
                    txtSName.Text=sup.SName;
                    txtSPhone.Text = sup.Phone;
                    txtSEmail.Text = sup.Email;
                    txtSAddress1.Text = sup.Address1;
                    txtSAddress2.Text = sup.Address2;
                    txtSSuburb.Text = sup.Suburb;
                    DropDownListSState.Text = sup.State;
                    txtSPostcode.Text = sup.Postcode;
                }
            }


        if (e.CommandName == "cmdDeleteSupplier")
        {
            
            linqTestingDataContext db = new linqTestingDataContext();
            db.Connection.ConnectionString =
    System.Configuration.ConfigurationManager.AppSettings["linqTest"];
            var supp =
                from s in db.Suppliers
                where (s.SID == Convert.ToInt32(e.CommandArgument.ToString()))
                select s;

            try
            {
                db.Suppliers.DeleteAllOnSubmit(supp);
                db.SubmitChanges();
                ViewData();
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Products supplied by this supplier are already on the order list. Delete orders first.');", true);
            }
        }
    }


        protected void LinkButtonSupplierSave_Click(object sender, EventArgs e)
        {
            linqTestingDataContext db = new linqTestingDataContext();
            db.Connection.ConnectionString =
            System.Configuration.ConfigurationManager.AppSettings["linqTest"];

            var supp = db.Suppliers.Single
                (p => p.SID == Convert.ToInt32(lblSupplierID.Text));

            supp.SName = txtSName.Text.Trim();
            supp.Phone = txtSPhone.Text.Trim();
            supp.Email = txtSEmail.Text.Trim();
            supp.Address1 = txtSAddress1.Text.Trim();
            supp.Address2 = txtSAddress2.Text.Trim();
            supp.Suburb = txtSSuburb.Text.Trim();
            supp.State = DropDownListSState.Text.Trim();
            supp.Postcode = txtSPostcode.Text.Trim();

            db.SubmitChanges();
            ViewData();
        }

        private void ViewData()
        {
            ClearForm();
            linqTestingDataContext db = new linqTestingDataContext();
            db.Connection.ConnectionString =
            System.Configuration.ConfigurationManager.AppSettings["linqTest"];
            var supp =
                from s in db.Suppliers
                select s;

        //    GridViewSuppliers.DataSource = supp;
            GridViewSuppliers.DataBind();
            GridViewSuppliers.Visible = true;
            tblSupplierForm.Visible = false;
            LinkButtonAddNewSupplier.Visible = true;
        }

        private void ClearForm()
        {
            txtSName.Text = "";
            txtSPhone.Text = "";
            txtSEmail.Text = "";
            txtSAddress1.Text = "";
            txtSAddress2.Text = "";
            txtSSuburb.Text = "";
            txtSPostcode.Text = "";
        }

        protected void showSupplierForm()
        {
            tblSupplierForm.Visible=true;
            GridViewSuppliers.Visible=false;
            LinkButtonSupplierAdd.Visible = false;
            LinkButtonSupplierSave.Visible = true;
        }


        protected void LinkButtonSupplierCancel_Click(object sender, EventArgs e)
        {
            tblSupplierForm.Visible = false;
            GridViewSuppliers.Visible = true;
            LinkButtonAddNewSupplier.Visible = true;
        }


        protected void LinkButtonSupplierAdd_Click(object sender, EventArgs e)
        {
            linqTestingDataContext db = new linqTestingDataContext();
            db.Connection.ConnectionString =
     System.Configuration.ConfigurationManager.AppSettings["linqTest"];
            Supplier s = new Supplier
            {
                SName = txtSName.Text,
                Phone = txtSPhone.Text,
                Email = txtSEmail.Text,
                Address1 = txtSAddress1.Text,
                Address2 = txtSAddress2.Text,
                Suburb = txtSSuburb.Text,
                State = DropDownListSState.Text,
                Postcode = txtSPostcode.Text
            };

            db.Suppliers.InsertOnSubmit(s);
            db.SubmitChanges();
            ViewData();
        }
        protected void LoginStatus1_LoggedOut(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
}
