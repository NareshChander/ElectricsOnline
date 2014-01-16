<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.master" AutoEventWireup="true" CodeFile="adminCustomerOrders.aspx.cs" Inherits="Admin_Pages_adminCustomerOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table align="center">
    <tr>
        <td align="right">
            <br />
        <asp:LoginStatus ID="LoginStatus1" runat="server" 
            LogoutPageUrl="~/Default.aspx" onloggedout="LoginStatus1_LoggedOut" />
                    <br />
                    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
                        ContextTypeName="linqTestingDataContext" EntityTypeName="" TableName="Orders">
                    </asp:LinqDataSource>
                    </td>
    </tr>
    <tr>
        <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="OrderID" DataSourceID="LinqDataSource1">
                        <Columns>
                            <asp:BoundField DataField="OrderID" HeaderText="Order ID" InsertVisible="False" 
                                ReadOnly="True" SortExpression="OrderID" />
                            <asp:BoundField DataField="OrderDate" HeaderText="Order Date" 
                                SortExpression="OrderDate" />
                            <asp:BoundField DataField="DeliveryDate" HeaderText="Delivery Date" 
                                SortExpression="DeliveryDate" />
                            <asp:BoundField DataField="CID" HeaderText="Customer ID" SortExpression="CID" />
                        </Columns>
                    </asp:GridView>
                </td>
    </tr>
</table>
</asp:Content>

