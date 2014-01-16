<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.master" AutoEventWireup="true" CodeFile="adminCustomers.aspx.cs" Inherits="Admin_Pages_adminCustomers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table align="center">
    <tr>
        <td align="right">
                    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
                        ContextTypeName="linqTestingDataContext" EntityTypeName="" 
                        TableName="Customers">
                    </asp:LinqDataSource>
        <asp:LoginStatus ID="LoginStatus1" runat="server" style="text-align: right" 
                        onloggedout="LoginStatus1_LoggedOut" />
                    <br />
                </td>
    </tr>
    <tr>
        <td>
                    <asp:GridView ID="GridViewCustomers" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="CID" DataSourceID="LinqDataSource1" OnRowCommand="GridViewCustomers_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="CID" HeaderText="Customer ID" InsertVisible="False" 
                                ReadOnly="True" SortExpression="CID" />
                            <asp:BoundField DataField="FName" HeaderText="First Name" SortExpression="FName" />
                            <asp:BoundField DataField="LName" HeaderText="Last Name" SortExpression="LName" />
                            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                            <asp:BoundField DataField="Address1" HeaderText="Address1" 
                                SortExpression="Address1" />
                            <asp:BoundField DataField="Address2" HeaderText="Address2" 
                                SortExpression="Address2" />
                            <asp:BoundField DataField="Suburb" HeaderText="Suburb" 
                                SortExpression="Suburb" />
                            <asp:BoundField DataField="Postcode" HeaderText="Postcode" 
                                SortExpression="Postcode" />
                            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                            <asp:BoundField DataField="Ctype" HeaderText="Card Type" SortExpression="Ctype" />
                            <asp:BoundField DataField="CardNo" HeaderText="Card No." 
                                SortExpression="CardNo" />
                            <asp:BoundField DataField="ExpDate" HeaderText="Expiry Date" 
                                SortExpression="ExpDate" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        
                          <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="deleteCustomer" runat="server" 
                                ImageUrl="~/images/delete.jpg"
                                Width="12px" Height="12px" CommandName="cmdDeleteCustomer" 
                                ToolTip="Delete this customer" OnClientClick="return confirm('Do you want to delete this customer?')"
                                CommandArgument='<%#Eval("CID")%>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
    </tr>
</table>
</asp:Content>

