<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Surveys.aspx.cs" Inherits="Surveys" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 105%;
        }
        .auto-style4 {
            width: 206px;
        }
        .auto-style5 {
            width: 236px;
        }
        .auto-style18 {
            width: 134px;
        }
        .auto-style19 {
            width: 134px;
            height: 4px;
        }
        .auto-style26 {
            width: 134px;
            height: 44px;
        }
        #TextArea1 {
            height: 32px;
            width: 338px;
        }
        .auto-style31 {
            width: 107px;
            height: 44px;
        }
        .auto-style32 {
            width: 107px;
        }
        .auto-style33 {
            width: 107px;
            height: 4px;
        }
        .auto-style34 {
            width: 193px;
            height: 23px;
        }
        .auto-style35 {
            height: 23px;
        }
        #txtAreaAdditonalComments {
            width: 334px;
        }
        .auto-style36 {
            width: 188px;
        }
        .auto-style37 {
            width: 184px;
        }
         h2 {
            margin-right: 40%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content">
        <div class="header">
            <h2><b>Surveys</b> - Collect feedback from customers</h2>
        </div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="lblCustomerID" runat="server" Text="Enter your Customer ID :"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtCustomerID" runat="server" Width="205px" ValidationGroup="1" Height="20px" MaxLength="4"></asp:TextBox>
                </td>
                <td class="auto-style37">
                    <asp:Button ID="btnGetIncidents" runat="server" Text="Get Incidents" OnClick="btnGetIncidents_Click" ValidationGroup="1" Height="30px" />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CustomerID], [ProductCode], [DateOpened], [Title], [DateClosed], [TechID], [IncidentID] FROM [Incidents] ORDER BY [DateClosed]"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCustomerID" Display="Dynamic" ErrorMessage="CustomerID is required" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                    &nbsp;<br />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtCustomerID" CultureInvariantValues="True" Display="Dynamic" ErrorMessage="ID should be an integer" ForeColor="Red" Operator="DataTypeCheck" Type="Integer" ValidationGroup="1"></asp:CompareValidator>
                </td>
            </tr>
        </table>
        <p>

            <asp:ListBox ID="lstBoxIncidents" runat="server" Width="533px" Enabled="False" ValidationGroup="2" Height="76px"></asp:ListBox>

            &nbsp;

            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="lstBoxIncidents" Display="Dynamic" ErrorMessage="You must select an incident." ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
            &nbsp;
            <asp:Label ID="lblNoIncidentInfo" runat="server" Text="No incidents" Visible="False" ForeColor="Red"></asp:Label>

        </p>
            <h3>Please rate this incident by the following categories: </h3>

        <table class="auto-style1">
            <tr>
                <td class="auto-style26">Response time:</td>
                <td class="auto-style31">
                    <asp:RadioButtonList ID="RadioBtnListResponse" runat="server" Height="37px" RepeatDirection="Horizontal" Width="650px" Enabled="False">
                        <asp:ListItem Value="1">Not satisfied</asp:ListItem>
                        <asp:ListItem Value="2">Somewhat satisfied</asp:ListItem>
                        <asp:ListItem Value="3">Satisfied</asp:ListItem>
                        <asp:ListItem Value="4">Completely satisfied</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="auto-style18">Technician efficiency:</td>
                <td class="auto-style32">
                    <asp:RadioButtonList ID="RadioBtnListTechnician" runat="server" Height="37px" RepeatDirection="Horizontal" Width="650px" Enabled="False">
                        <asp:ListItem Value="1">Not satisfied</asp:ListItem>
                        <asp:ListItem Value="2">Somewhat satisfied</asp:ListItem>
                        <asp:ListItem Value="3">Satisfied</asp:ListItem>
                        <asp:ListItem Value="4">Completely satisfied</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="auto-style19">Problem resolution:</td>
                <GroupBox>
                <td class="auto-style33">
                    <asp:RadioButtonList ID="RadioBtnListProblem" runat="server" Height="37px" RepeatDirection="Horizontal" Width="650px" Enabled="False">
                        <asp:ListItem Value="1">Not satisfied</asp:ListItem>
                        <asp:ListItem Value="2">Somewhat satisfied</asp:ListItem>
                        <asp:ListItem Value="3">Satisfied</asp:ListItem>
                        <asp:ListItem Value="4">Completely satisfied</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                </GroupBox>
            </tr>
        </table>
        
        <table class="auto-style1">
                <tr>
                    <td class="auto-style34">
                        <asp:Label ID="lblAditionalComments" runat="server" Text="Aditional Comments :"></asp:Label>
                    </td>
                    <td class="auto-style35">
                        <asp:TextBox ID="txtboxAdditionalComments" runat="server" TextMode="MultiLine" Visible="False" Width="298px" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
        </table>
            <p>
                <asp:CheckBox ID="chckboxContactMe" runat="server" Text="Please contact me to discuss this incident" Enabled="False" />
            </p>
        <table class="auto-style1">
            <tr>
                <td class="auto-style36">
                    <asp:RadioButtonList ID="RadioBtnListContactBy" runat="server" RepeatDirection="Horizontal" Width="562px" Enabled="False">
                        <asp:ListItem Value="0">Contact by email</asp:ListItem>
                        <asp:ListItem Value="1">Contact by phone</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style36">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style36">
                <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" ValidationGroup="2" Height="30px" Width="102px" Enabled="False" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style36">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
     </div>
</asp:Content>

