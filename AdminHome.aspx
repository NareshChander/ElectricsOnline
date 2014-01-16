<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.master" AutoEventWireup="true" CodeFile="adminHome.aspx.cs" Inherits="Admin_Pages_adminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center">
    <tr>
        <td align="right">
                     <asp:LinqDataSource ID="LinqDataSource2" runat="server" 
                    ContextTypeName="linqTestingDataContext" EntityTypeName="" 
                    TableName="Order_Products">
                </asp:LinqDataSource>  

        <asp:DropDownList ID="DropDownList1" runat="server" Title="Change Display modes" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>
        
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:LoginStatus ID="LoginStatus1" runat="server" 
            LogoutPageUrl="~/Default.aspx" onloggedout="LoginStatus1_LoggedOut" />

        <asp:WebPartManager ID="WebPartManager1" runat="server">
        </asp:WebPartManager>

        <asp:CatalogZone ID="CatalogZone1" runat="server">
            <ZoneTemplate>
                <asp:PageCatalogPart ID="PageCatalogPart1" runat="server" />
            </ZoneTemplate>
        </asp:CatalogZone>

                    </td>
    </tr>
    <tr align="center">
        <td>
       
        <asp:WebPartZone ID="WebPartZoneHeader" runat="server" Height="1px" Width="865px" 
                HeaderText="Big Fish">
            <ZoneTemplate>
<%--                <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
                    ContextTypeName="linqTestingDataContext" EntityTypeName="" 
                    TableName="Order_Products">
                </asp:LinqDataSource>--%>
                <asp:GridView ID="GridViewVIPOrders" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="OrderID,PID" title="Expensive Orders (more than 500 dollars)">
                    <Columns>
                        <asp:BoundField DataField="OrderID" HeaderText="Order ID" ReadOnly="True" 
                            SortExpression="OrderID" />
                        <asp:BoundField DataField="PID" HeaderText="Product ID" ReadOnly="True" 
                            SortExpression="PID" />
                        <asp:BoundField DataField="Qty" HeaderText="Quantity" SortExpression="Qty" />
                        <asp:BoundField DataField="TotalSale" HeaderText="Total Sale" 
                            SortExpression="TotalSale" />
                    </Columns>
                </asp:GridView>
            </ZoneTemplate>
        </asp:WebPartZone>

        <asp:WebPartZone ID="WebPartZoneContent" runat="server" Height="1px" Width="865px" HeaderText="Calendar">
            <ZoneTemplate>
                
                
                
                <asp:Calendar ID="CalendarWebPArt" runat="server" title="Today" 
                    BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" 
                    Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" 
                    SelectedDate="12/05/2013 13:27:48" Width="755px">
                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                        VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" 
                        Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                    <TodayDayStyle BackColor="#CCCCCC" />
                </asp:Calendar>

            </ZoneTemplate>
        </asp:WebPartZone>

        </td>
    </tr>
</table>
</asp:Content>

