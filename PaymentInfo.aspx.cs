using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class paymentInfo : System.Web.UI.Page
{
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void LinkButtonSubmitPaymentInfo_Click(object sender, EventArgs e)
        {
            if (lblExpiredCreditCard.Text == "")
            {
                updateCustomersTable();
                updateProductsTable();
                Response.Redirect("~/thankYou.aspx");
            }
            else
                CalendarExpDate.Focus();
        }

        protected void updateCustomersTable()
        {
                linqTestingDataContext db = new linqTestingDataContext();
                db.Connection.ConnectionString =
                System.Configuration.ConfigurationManager.AppSettings["linqTest"];

                Customer cus = new Customer
                {
                    FName = txtFName.Text,
                    LName = txtLName.Text,
                    Phone = txtPhone.Text,
                    Address1 = txtAddress1.Text,
                    Address2 = txtAddress2.Text,
                    Suburb = txtSuburb.Text,
                    State = DropDownListState.Text,
                    Postcode = txtPostcode.Text,
                    Ctype = DropDownListCType.Text,
                    CardNo = DropDownListCType.Text=="Amex"? txtCardNoAMEX.Text:txtCardNo.Text,
                    ExpDate = CalendarExpDate.SelectedDate,
                    Email = txtEmail.Text,
                };

                db.Customers.InsertOnSubmit(cus);
                db.SubmitChanges();
                updateOrdersTable(cus.CID);
        }

        protected void updateOrdersTable(int cID)
        {
            linqTestingDataContext db = new linqTestingDataContext();
            db.Connection.ConnectionString =
            System.Configuration.ConfigurationManager.AppSettings["linqTest"];

            Order ord = new Order
            {
                OrderDate = DateTime.Now,
                DeliveryDate = DateTime.Now.AddDays(5),
                CID = cID,
            };
            db.Orders.InsertOnSubmit(ord);
            db.SubmitChanges();
            updateOrders_ProductsTable(ord.OrderID);
        }


        protected void updateOrders_ProductsTable(int ordID)
        {
            linqTestingDataContext db = new linqTestingDataContext();
            db.Connection.ConnectionString =
            System.Configuration.ConfigurationManager.AppSettings["linqTest"];
            var shopping =
                from scd in db.ShoppingCartDatas
                select scd;

            foreach (ShoppingCartData item in shopping)
            {
                Order_Product ord_prod = new Order_Product
                {
                    PID=item.PID,
                    OrderID=ordID,
                    Qty=item.Quantity,
                    TotalSale=item.Quantity*item.UnitPrice,
                };
                db.Order_Products.InsertOnSubmit(ord_prod);
                db.SubmitChanges();
            }
        }


        protected void updateProductsTable()
        {
            linqTestingDataContext db = new linqTestingDataContext();
            db.Connection.ConnectionString =
            System.Configuration.ConfigurationManager.AppSettings["linqTest"];
            var shopping =
                    from scd in db.ShoppingCartDatas
                    select scd;
            foreach (ShoppingCartData scd in shopping)
            {
                int unitsSold = scd.Quantity;
                int prodID = scd.PID;
                linqTestingDataContext db1 = new linqTestingDataContext();
                db1.Connection.ConnectionString =
                System.Configuration.ConfigurationManager.AppSettings["linqTest"];
                var pickedRecord =
                        from pr in db1.Products
                        where (pr.PID == prodID)
                        select pr;

                foreach (Product pp in pickedRecord)
                {
                    pp.UnitsInStock -= unitsSold;
                    db1.SubmitChanges();
                }
            }
            db.SubmitChanges();
        }


        protected void DropDownListCType_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtCardNo.Text = "";
            txtCardNoAMEX.Text = "";
            if (DropDownListCType.Text == "Amex")
            {
                txtCardNoAMEX.Visible = true;
                txtCardNo.Visible = false;
            }
            else
            {
                txtCardNoAMEX.Visible = false;
                txtCardNo.Visible = true;
            }
        }


        protected void CalendarExpDate_SelectionChanged(object sender, EventArgs e)
        {
            if (CalendarExpDate.SelectedDate < DateTime.Now)
                lblExpiredCreditCard.Text = "This credit card is expired.\n\nPlease use a valid Credit Card.";
            else
                lblExpiredCreditCard.Text = "";
        }
}
