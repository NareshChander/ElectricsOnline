<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.master" AutoEventWireup="true"
    CodeFile="adminSupplier.aspx.cs" Inherits="Admin_Pages_adminSupplier" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style14
        {
            width: 8px;
        }
        .style15
        {
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table align="center">
        <tr>
            <td align="right">
                <asp:LoginStatus ID="LoginStatus1" runat="server" OnLoggedOut="LoginStatus1_LoggedOut" />
                <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="linqTestingDataContext"
                    EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName=""
                    TableName="Suppliers">
                </asp:LinqDataSource>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="lblSupplierID" runat="server" Visible="False"></asp:Label>
                <asp:LinkButton ID="LinkButtonAddNewSupplier" runat="server" OnClick="LinkButtonAddNewSupplier_Click">Add New Supplier</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridViewSuppliers" runat="server" AutoGenerateColumns="False" DataKeyNames="SID"
                    DataSourceID="LinqDataSource1" OnRowCommand="GridViewSuppliers_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="SID" HeaderText="Supplier ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="SID" />
                        <asp:BoundField DataField="SName" HeaderText="Supplier Name" SortExpression="SName" />
                        <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        <asp:BoundField DataField="Address1" HeaderText="Address1" SortExpression="Address1" />
                        <asp:BoundField DataField="Address2" HeaderText="Address2" SortExpression="Address2" />
                        <asp:BoundField DataField="Suburb" HeaderText="Suburb" SortExpression="Suburb" />
                        <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                        <asp:BoundField DataField="Postcode" HeaderText="Postcode" SortExpression="Postcode" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEditSupplier" runat="server" CommandArgument='<%# Eval("SID")%>'
                                    CommandName="cmdEditSupplier" Text="   Edit   " ToolTip="Edit this supplier.">
                                </asp:LinkButton>
                                <asp:LinkButton ID="lnkDeleteSupplier" runat="server" CommandArgument='<%# Eval("SID")%>'
                                    CommandName="cmdDeleteSupplier" Text="   Delete   " ToolTip="Delete this supplier."
                                    OnClientClick="return confirm('Do you want to delete this supplier?')">
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <table id="tblSupplierForm" runat="server" visible="false">
                    <tr>
                        <td colspan="3" class="style15">
                            <strong>Supplier&#39;s Details</strong>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Name
                        </td>
                        <td>
                            <asp:TextBox ID="txtSName" runat="server" MaxLength="50" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorSName" runat="server" ControlToValidate="txtSName"
                                ErrorMessage="Please enter Supplier's name"></asp:RequiredFieldValidator>
                            .
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Phone
                        </td>
                        <td>
                            <asp:TextBox ID="txtSPhone" runat="server" MaxLength="50" Width="200px"></asp:TextBox>
                        </td>
                        <td align="left">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorSPhone" runat="server" ControlToValidate="txtSPhone"
                                ErrorMessage="Please enter Supplier's phone."></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorSPhone" runat="server"
                                ControlToValidate="txtSPhone" ErrorMessage="Not a valid australian phone number."
                                ValidationExpression="^\({0,1}((0|\+61)(2|4|3|7|8)){0,1}\){0,1}(\ |-){0,1}[0-9]{2}(\ |-){0,1}[0-9]{2}(\|-){0,1}[0-9]{1}(\ |-){0,1}[0-9]{3}$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Email
                        </td>
                        <td>
                            <asp:TextBox ID="txtSEmail" runat="server" MaxLength="50" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorSEmail" runat="server" ControlToValidate="txtSEmail"
                                ErrorMessage="Please enter Supplier's email address."></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorSEmail" runat="server"
                                ControlToValidate="txtSEmail" ErrorMessage="Not a valid email address." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Address1&nbsp;&nbsp;
                        </td>
                        <td>
                            <asp:TextBox ID="txtSAddress1" runat="server" MaxLength="50" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorSAddress1" runat="server" ControlToValidate="txtSAddress1"
                                ErrorMessage="Please enter Supplier's address."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Address2&nbsp;
                        </td>
                        <td>
                            <asp:TextBox ID="txtSAddress2" runat="server" MaxLength="50" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Suburb
                        </td>
                        <td>
                            <asp:TextBox ID="txtSSuburb" runat="server" MaxLength="50" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorSSuburb" runat="server" ControlToValidate="txtSSuburb"
                                ErrorMessage="Please enter Supplier's address."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            State
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListSState" runat="server" Width="200px">
                                <asp:ListItem Selected="True">Victoria</asp:ListItem>
                                <asp:ListItem>New South Wales</asp:ListItem>
                                <asp:ListItem>Australian Capital Territory</asp:ListItem>
                                <asp:ListItem>Northern Territory</asp:ListItem>
                                <asp:ListItem>Western Australia</asp:ListItem>
                                <asp:ListItem>South Australia</asp:ListItem>
                                <asp:ListItem>Tasmania</asp:ListItem>
                                <asp:ListItem>Queensland</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Postcode
                        </td>
                        <td>
                            <asp:TextBox ID="txtSPostcode" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorSPostcode" runat="server" ControlToValidate="txtSPostcode"
                                ErrorMessage="Please enter Supplier's postcode."></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorSPostcode" runat="server"
                                ControlToValidate="txtSPostcode" ErrorMessage="Must be four digits." ValidationExpression="\d{4}"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td align="center">
                            <asp:LinkButton ID="LinkButtonSupplierSave" runat="server" OnClick="LinkButtonSupplierSave_Click">Save</asp:LinkButton>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="LinkButtonSupplierAdd"
                                runat="server" OnClick="LinkButtonSupplierAdd_Click">Add</asp:LinkButton>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="LinkButtonSupplierCancel"
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
