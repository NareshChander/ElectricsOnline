<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.master" AutoEventWireup="true" CodeFile="shoppingCart.aspx.cs" Inherits="CustomerPages_shoppingCart" EnableEventValidation="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .style12
        {
            width: 800px;
            height: 20px;
        }
        .style13
        {
            width: 562px;
            height: 122px;
        }
        .style14
        {
            width: 800px;
        }
        .blink
        {
        text-decoration:blink
        }
        .style15
    {
            width: 742px;
        }
        .style16
        {
        width: 1176px;
    }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table align="center">
    <tr>
        <td class="style16">
            <table>
                        <tr>
                            <td>
                                Search By&nbsp; Brand
                            </td>
                            <td>
                                <asp:DropDownList ID="ddListBrands" runat="server" 
                                    DataSourceID="LinqDataSource1" DataTextField="Brand" DataValueField="Brand" 
                                    Height="25px" Width="140px" AutoPostBack="True" 
                                    onselectedindexchanged="ddListBrands_SelectedIndexChanged">
                                    <asp:ListItem Selected="True">All Brands</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                    <asp:LinqDataSource ID="LinqDataSource2" runat="server" 
                        ContextTypeName="linqTestingDataContext" EntityTypeName="" GroupBy="Category" 
                        OrderBy="Category" OrderGroupsBy="key" 
                        Select="new (key as Category, it as Products)" TableName="Products">
                    </asp:LinqDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Search By Category</td>
                            <td>
                                <asp:DropDownList ID="ddListCategories" runat="server" 
                                    DataSourceID="LinqDataSource2" DataTextField="Category" 
                                    DataValueField="Category" Height="25px" Width="140px" AutoPostBack="True" 
                                    onselectedindexchanged="ddListCategories_SelectedIndexChanged">
                                    <asp:ListItem>All Categories</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </td>
        <td class="style15">
                    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
                        ContextTypeName="linqTestingDataContext" EntityTypeName="" GroupBy="Brand" 
                        OrderBy="Brand" OrderGroupsBy="key" Select="new (key as Brand, it as Products)" 
                        TableName="Products" EnableDelete="True" EnableInsert="True" 
                        EnableUpdate="True">
                    </asp:LinqDataSource>
                    <asp:Label ID="LabelAlreadyThere" runat="server" 
                        ForeColor="Blue"></asp:Label>
                    </td>
    </tr>
    <tr>
        <td class="style16">
            <strong>Product Catalogue</strong></td>
        <td class="style15" align="left" valign="top">
                    <asp:LinkButton ID="LinkButtonEmptyShoppingCart" runat="server" 
                        onclick="LinkButtonEmptyShoppingCart_Click">Empty Shopping Cart</asp:LinkButton>
                    &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblTotal" runat="server" style="text-align: right" 
                        Text="Total: "></asp:Label>
                    <asp:Label ID="lblTotalValue" runat="server"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton1" runat="server" 
                        PostBackUrl="~/paymentInfo.aspx" 
                        >Check Out</asp:LinkButton>
                </td>
    </tr>
    <tr>
        <td class="style16">
    <asp:GridView ID="GridViewProducts" runat="server" AutoGenerateColumns="False" 
        OnRowCommand="GridViewProducts_RowCommand"
                        Font-Size="Smaller" Width="1044px" 
                        EmptyDataText="Sorry, No Matching products found in the catalogue" 
                        style="color: #003366" Font-Names="Verdana" 
                HorizontalAlign="Left" >
                    <Columns>
<%--                        <asp:BoundField DataField="PID" HeaderText="Product ID"/>--%>
                        <asp:BoundField DataField="PName" HeaderText="Product Name"/>
                        <asp:BoundField DataField="unitPrice" HeaderText="Unit Price"/>
<%--                        <asp:BoundField DataField="unitsinStock" HeaderText="Units in Stock" />--%>
                        <asp:BoundField DataField="Brand" HeaderText="Brand"/>
                        <asp:BoundField DataField="Category" HeaderText="Category"/>
                        <asp:BoundField DataField="Description" HeaderText="Description"/>
<%--                        <asp:BoundField DataField="ROL" HeaderText="Re-Order-Level"/>--%>
<%--                        <asp:BoundField DataField="SID" HeaderText="Supplier ID."/>--%>
                        <asp:TemplateField>
                            <ItemTemplate>

                                <asp:LinkButton ID="lnkAddToShoppingCart" runat="server" CommandArgument='<%# Eval("PID")%>'
                                    CommandName="cmdAddToShoppingCart" Text="Add To Shopping Cart">
                                </asp:LinkButton>

     <%--                       <asp:ImageButton ID="addToShoppingCart" runat="server" 
                                ImageUrl="~/images/addToShoppingCart.jpg"
                                Width="24px" Height="24px" CommandName="cmdAddToShoppingCart" 
                                ToolTip="Add To Shopping Cart"
                                CommandArgument='<%# Eval("PID")%>'/>--%>

                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                </td>
        <td class="style15" valign="top">
                    <asp:GridView ID="GridViewShoppingCart" runat="server" 
        AutoGenerateColumns="False"
        OnRowCommand="GridViewShoppingCart_RowCommand"  EmptyDataText="Your Shopping Cart is EMPTY......" 
                        Font-Names="Verdana" Font-Size="Smaller" Height="16px" Width="398px" 
                        
                        
                        
                        style="margin-top: 0px; margin-bottom: 0px; margin-left: 11px; color: #003366;" 
                        HorizontalAlign="Left" >
                    <Columns>
<%--                        <asp:BoundField DataField="TempOrderID" HeaderText="Temp Order ID" />--%>
<%--                        <asp:BoundField DataField="PID" HeaderText="Product ID" ItemStyle-Width="50" />--%>
                        
                        <asp:BoundField DataField="PName" HeaderText="Product Name" >
                        </asp:BoundField>

                        <asp:BoundField DataField="UnitPrice" HeaderText="Unit Price">
                        </asp:BoundField>
                       
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity">
                        </asp:BoundField>
                        
                        <asp:TemplateField>
                            <ItemTemplate>

<%--                            Text='<%# Eval("UnitPrice").ToString() %>'--%>

<%--                                <asp:Label ID="label4" runat="server" Text='<%# Bind("UnitPrice") %>'*'<%# Bind("Quantity") %>'/>--%>

                                <asp:LinkButton ID="lnkMore" runat="server" CommandArgument='<%# Eval("TempOrderID")%>'
                                    CommandName="cmdMore" Text="'   +   '" ToolTip="Increase by one">
                                </asp:LinkButton>

                                <asp:LinkButton ID="lnkLess" runat="server" CommandArgument='<%# Eval("TempOrderID")%>'
                                    CommandName="cmdLess" Text="'   -   '" ToolTip="Decrease by one">
                                </asp:LinkButton>

                                <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%# Eval("TempOrderID")%>'
                                    CommandName="cmdDelete" Text="'   Remove   '" ToolTip="Remove this item from my shopping cart" OnClientClick="return confirm('Do you want to remove this product from shopping cart?')">
                                </asp:LinkButton>

<%--                                <asp:ImageButton ID="increase" runat="server" 
                                ImageUrl="~/images/increase.png"
                                Width="12px" Height="12px" CommandName="cmdMore" 
                                ToolTip="Increase by one"
                                CommandArgument='<%#Eval("TempOrderID")%>'/>

                                <asp:ImageButton ID="decrease" runat="server" 
                                ImageUrl="~/images/decrease.png"
                                Width="12px" Height="12px" CommandName="cmdLess" 
                                ToolTip="Decrease by one"
                                CommandArgument='<%#Eval("TempOrderID")%>'/>

                                <asp:ImageButton ID="delete" runat="server" 
                                ImageUrl="~/images/delete.jpg"
                                Width="12px" Height="12px" CommandName="cmdDelete" 
                                ToolTip="Delete this item"
                                CommandArgument='<%#Eval("TempOrderID")%>'/>--%>

                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                </td>
    </tr>
    </table>
</asp:Content>

