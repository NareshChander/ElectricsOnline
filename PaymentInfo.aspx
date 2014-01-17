<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.master" AutoEventWireup="true"
    CodeFile="paymentInfo.aspx.cs" Inherits="paymentInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style12
        {
        width: 556px;
    }
    .style13
    {
        width: 39px;
    }
    .style1
    {
       Font-Names="Verdana" Font-Size="1.8em"
    }
    
    
   
        .style15
        {
            width: 659px;
            text-decoration: underline;
        }   
   
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server"></asp:Label>
                <strong>Billing Details</strong>
            </td>
        </tr>
        <tr>
            <td>
                <table align="center">
                    <tr>
                        <td>
                            First Name
                        </td>
                        <td class="style13">
                            <asp:TextBox ID="txtFName" runat="server" MaxLength="50" Width="200px" Font-Names="Verdana"
                                Font-Size="Small"></asp:TextBox>
                        </td>
                        <td class="style15">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorFName" runat="server" ControlToValidate="txtFName"
                                ErrorMessage="Please enter First Name"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Last Name
                        </td>
                        <td class="style13">
                            <asp:TextBox ID="txtLName" runat="server" MaxLength="50" Width="200px"></asp:TextBox>
                        </td>
                        <td class="style15">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorLName" runat="server" ControlToValidate="txtLName"
                                ErrorMessage="Please enter Last Name"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Phone No.
                        </td>
                        <td class="style13">
                            <asp:TextBox ID="txtPhone" runat="server" Width="200px" CausesValidation="True"></asp:TextBox>
                        </td>
                        <td class="style15">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPhone" runat="server" ControlToValidate="txtPhone"
                                ErrorMessage="Please enter Phone Number"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorPhone" runat="server"
                                ControlToValidate="txtPhone" ErrorMessage="Please enter a valid australian phone number"
                                ValidationExpression="^\({0,1}((0|\+61)(2|4|3|7|8)){0,1}\){0,1}(\ |-){0,1}[0-9]{2}(\ |-){0,1}[0-9]{2}(\|-){0,1}[0-9]{1}(\ |-){0,1}[0-9]{3}$"
                                ForeColor="#FF3300"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Address 1
                        </td>
                        <td class="style13">
                            <asp:TextBox ID="txtAddress1" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
                        </td>
                        <td class="style15">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorAddress1" runat="server" ControlToValidate="txtAddress1"
                                ErrorMessage="Please enter Address"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Address 2
                        </td>
                        <td class="style13">
                            <asp:TextBox ID="txtAddress2" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
                        </td>
                        <td class="style15">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Suburb
                        </td>
                        <td class="style13">
                            <asp:TextBox ID="txtSuburb" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
                        </td>
                        <td class="style15">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorSuburb" runat="server" ControlToValidate="txtSuburb"
                                ErrorMessage="Please enter suburb name"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            State
                        </td>
                        <td class="style13">
                            <asp:DropDownList ID="DropDownListState" runat="server" Width="200px">
                                <asp:ListItem>VIC</asp:ListItem>
                                <asp:ListItem>NSW</asp:ListItem>
                                <asp:ListItem>ACT</asp:ListItem>
                                <asp:ListItem>NT</asp:ListItem>
                                <asp:ListItem>WA</asp:ListItem>
                                <asp:ListItem>TAS</asp:ListItem>
                                <asp:ListItem>QLD</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="style15">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Postcode
                        </td>
                        <td class="style13">
                            <asp:TextBox ID="txtPostcode" runat="server" Width="200px"></asp:TextBox>
                        </td>
                        <td class="style15">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPostcode" runat="server" ControlToValidate="txtPostcode"
                                ErrorMessage="Please enter 4 digit Postcode"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorPostcode" runat="server"
                                ControlToValidate="txtPostcode" ErrorMessage="Please enter a four digit Postcode."
                                ValidationExpression="\d{4}" ForeColor="#FF3300"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td class="style13">
                            &nbsp;
                        </td>
                        <td class="style15">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Card Type
                        </td>
                        <td class="style13">
                            <asp:DropDownList ID="DropDownListCType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListCType_SelectedIndexChanged"
                                Width="200px">
                                <asp:ListItem>Visa</asp:ListItem>
                                <asp:ListItem>Master Card</asp:ListItem>
                                <asp:ListItem>Amex</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="style15">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Card No.
                        </td>
                        <td class="style13" valign="middle">
                            <asp:TextBox ID="txtCardNo" runat="server" AutoPostBack="True" MaxLength="16" Width="200px"
                                ToolTip="Must be 16 digits"></asp:TextBox>
                            <asp:TextBox ID="txtCardNoAMEX" runat="server" AutoPostBack="True" MaxLength="15"
                                Width="200px" Visible="false" ToolTip="Must be 15 digits"></asp:TextBox>
                        </td>
                        <td class="style15">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorCardNo" runat="server" ControlToValidate="txtCardNo"
                                ErrorMessage="Please enter card number"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorCardNoAmex" runat="server"
                                ControlToValidate="txtCardNoAMEX" ErrorMessage="Please enter card number"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorVM" runat="server"
                                ControlToValidate="txtCardNo" ErrorMessage="Must be sixteen digits" ValidationExpression="\d{16}"
                                ForeColor="#FF3300"></asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorAMEX" runat="server"
                                ControlToValidate="txtCardNoAMEX" ErrorMessage="Must be fifteen digits" ValidationExpression="\d{15}"
                                ForeColor="#FF3300"></asp:RegularExpressionValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Expiry Date
                        </td>
                        <td class="style13">
                            <asp:Calendar ID="CalendarExpDate" runat="server" BackColor="White" BorderColor="#999999"
                                CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
                                ForeColor="Black" Height="29px" Width="200px" OnSelectionChanged="CalendarExpDate_SelectionChanged"
                                SelectedDate="2014-12-02">
                                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                                <NextPrevStyle VerticalAlign="Bottom" />
                                <OtherMonthDayStyle ForeColor="#808080" />
                                <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                <SelectorStyle BackColor="#CCCCCC" />
                                <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                <WeekendDayStyle BackColor="#FFFFCC" />
                            </asp:Calendar>
                        </td>
                        <td class="style15">
                            <br />
                            <asp:Label ID="lblExpiredCreditCard" runat="server" ForeColor="#FF3300"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Email
                        </td>
                        <td class="style13">
                            <asp:TextBox ID="txtEmail" runat="server" Width="194px"></asp:TextBox>
                        </td>
                        <td class="style15">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="Please enter an Email address"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="Not a valid email address." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ForeColor="#FF3300"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td class="style13" align="center">
                            <asp:LinkButton ID="LinkButtonSubmitPaymentInfo" runat="server" OnClick="LinkButtonSubmitPaymentInfo_Click">Submit</asp:LinkButton>
                        </td>
                        <td class="style15">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
