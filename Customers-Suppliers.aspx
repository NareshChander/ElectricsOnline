<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.master" AutoEventWireup="true" CodeFile="customerSuppliers.aspx.cs" Inherits="customerSuppliers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center">
    <tr>
        <td>
    <asp:Image ID="brandsWeSell" runat="server" Height="506px" 
                ImageUrl="~/images/brandsWeSell.png" ToolTip="Brands we sell." 
                Width="655px" BorderColor="#003366" />
        </td>
    </tr>
    </table>
</asp:Content>
