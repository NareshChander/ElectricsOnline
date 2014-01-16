<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.master" AutoEventWireup="true"
    CodeFile="adminStockLevel.aspx.cs" Inherits="Admin_Pages_adminStockLevel" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style15
        {
            height: 81px;
        }
        .style16
        {
            height: 283px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table align="center">
        <tr>
            <td align="right">
                <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="linqTestingDataContext"
                    EntityTypeName="" TableName="Products">
                </asp:LinqDataSource>
                <asp:LoginStatus ID="LoginStatus1" runat="server" OnLoggedOut="LoginStatus1_LoggedOut" />
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:GridView ID="GridViewBelowROL" runat="server" AutoGenerateColumns="False" DataKeyNames="PID">
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
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Chart ID="Chart1" runat="server" DataSourceID="LinqDataSource1" RightToLeft="Yes"
                    Width="1271px" BackColor="194, 197, 214" BackGradientStyle="LeftRight" BackImageTransparentColor="Black"
                    BackSecondaryColor="DarkGray" DataMember="DefaultView" Height="474px">
                    <Series>
                        <asp:Series Name="Series1" ChartType="StackedBar" XValueMember="PName" YValueMembers="UnitsInStock"
                            YValuesPerPoint="2" IsXValueIndexed="True">
                            <Points>
                                <asp:DataPoint Font="Verdana, 9.75pt" YValues="0,0" />
                            </Points>
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <AxisX2 Crossing="Min">
                            </AxisX2>
                            <Position Height="94" Width="94" X="1" Y="1" />
                            <Area3DStyle Enable3D="True" />
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
            </td>
        </tr>
    </table>
</asp:Content>
