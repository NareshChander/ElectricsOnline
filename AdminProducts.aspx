

<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.master" AutoEventWireup="true"
    CodeFile="adminProducts.aspx.cs" Inherits="Admin_Pages_adminProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table align="center">
        <tr>
            <td align="right">
                <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="linqTestingDataContext"
                    EntityTypeName="" GroupBy="SID" OrderBy="SID" OrderGroupsBy="key" Select="new (key as SID, it as Suppliers)"
                    TableName="Suppliers">
                </asp:LinqDataSource>
                <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="linqTestingDataContext"
                    EntityTypeName="" TableName="Products" OrderBy="SID">
                </asp:LinqDataSource>
                <asp:LoginStatus ID="LoginStatus2" runat="server" OnLoggedOut="LoginStatus2_LoggedOut" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="lblProductID" runat="server" Visible="False"></asp:Label>
                <asp:LinkButton ID="LinkButtonAddNewProduct" runat="server" OnClick="LinkButtonAddNewProduct_Click">Add New Product</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridViewAdminProducts" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="PID" DataSourceID="LinqDataSource1" OnRowCommand="GridViewProducts_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="PID" HeaderText="Product ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="PID" />
                        <asp:BoundField DataField="PName" HeaderText="Product Name" SortExpression="PName" />
                        <asp:BoundField DataField="Brand" HeaderText="Brand" SortExpression="Brand" />
                        <asp:BoundField DataField="UnitPrice" HeaderText="Unit Price" SortExpression="UnitPrice" />
                        <asp:BoundField DataField="UnitsInStock" HeaderText="Units In Stock" SortExpression="UnitsInStock" />
                        <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                        <asp:BoundField DataField="SID" HeaderText="Supplier ID" SortExpression="SID" />
                        <asp:BoundField DataField="ROL" HeaderText="Re-order-level" SortExpression="ROL" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEditProduct" runat="server" CommandArgument='<%# Eval("PID")%>'
                                    CommandName="cmdEditProduct" Text="   Edit   " ToolTip="Edit this product.">
                                </asp:LinkButton>
                                <asp:LinkButton ID="lnkDeleteProduct" runat="server" CommandArgument='<%# Eval("PID")%>'
                                    CommandName="cmdDeleteProduct" Text="   Delete   " ToolTip="Delete this product."
                                    OnClientClick="return confirm('Do you want to delete this product?')">
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <table id="tblProductForm" runat="server" visible="false">
                    <tr>
                        <td colspan="3" class="style15">
                            <strong>Product&#39;s Details</strong>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Name
                        </td>
                        <td>
                            <asp:TextBox ID="txtPName" runat="server" MaxLength="50" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPName" runat="server" ControlToValidate="txtPName"
                                ErrorMessage="Please enter Product's name" ForeColor="#FF3300" Style="color: #FF3300"></asp:RequiredFieldValidator>
                            .
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Brand
                        </td>
                        <td>
                            <asp:TextBox ID="txtPBrand" runat="server" MaxLength="50" Width="200px"></asp:TextBox>
                        </td>
                        <td align="left">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPBrand" runat="server" ControlToValidate="txtPBrand"
                                ErrorMessage="Please enter Product's brand." Style="color: #FF3300"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Unit Price
                        </td>
                        <td>
                            <asp:TextBox ID="txtPUnitPrice" runat="server" MaxLength="50" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPUnitPrice" runat="server"
                                ControlToValidate="txtPUnitPrice" ErrorMessage="Please enter Product's unit price."
                                Style="color: #FF3300"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Units in Stock&nbsp;
                        </td>
                        <td>
                            <asp:TextBox ID="txtPUnitsInStock" runat="server" MaxLength="50" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPUnitsInStock" runat="server"
                                ControlToValidate="txtPUnitsInStock" ErrorMessage="Please enter Units in Stock"
                                Style="color: #FF3300"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Category
                        </td>
                        <td>
                            <asp:TextBox ID="txtPCategory" runat="server" MaxLength="50" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Description
                        </td>
                        <td>
                            <asp:TextBox ID="txtPdescription" runat="server" MaxLength="50" Width="200px" Height="21px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPDescription" runat="server"
                                ControlToValidate="txtPdescription" ErrorMessage="Please enter Product's description."
                                Style="color: #FF3300"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Supplier ID
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListPSupplierID" runat="server" Width="200px" DataSourceID="LinqDataSource2"
                                DataTextField="SID" DataValueField="SID">
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Re-Order-Level
                        </td>
                        <td>
                            <asp:TextBox ID="txtPReOrderLevel" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPReOrderLevel" runat="server"
                                ControlToValidate="txtPReOrderLevel" ErrorMessage="Please enter Product's re-order-level."
                                Style="color: #FF3300"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td align="center">
                            <asp:LinkButton ID="LinkButtonProductSave" runat="server" OnClick="LinkButtonProductSave_Click">Save</asp:LinkButton>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="LinkButtonProductAdd"
                                runat="server" OnClick="LinkButtonSupplierAdd_Click">Add</asp:LinkButton>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="LinkButtonProductCancel"
                                runat="server" OnClick="LinkButtonSupplierCancel_Click">Cancel</asp:LinkButton>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
