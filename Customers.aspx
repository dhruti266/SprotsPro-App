<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Customers.aspx.cs" Inherits="Customers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
        }
    .auto-style3 {
        width: 144px;
        height: 23px;
    }
    .auto-style4 {
        height: 23px;
    }
     h2 {
            margin-right: 20%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content">
        <div class="header">
            <h2> Customers - Search and view your customer contact information</h2>
        </div>
    
        <div>

            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">Select customer:</td>
                    <td>
                        <asp:DropDownList ID="ddCustomers" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="CustomerID" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Customers]"></asp:SqlDataSource>
                    
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">Address:</td>
                    <td class="auto-style4">
                        <asp:Label ID="lblAddress" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Phone:</td>
                    <td>
                        <asp:Label ID="lblPhone" runat="server" ForeColor="#0066FF"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Email:</td>
                    <td>
                        <asp:Label ID="lblEmail" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="btnAddContact" runat="server" Text="Add to Contact List" Width="138px" Height="30px" OnClick="btnAddContact_Click" />
                    </td>
                    <td>
                        <asp:Button ID="btnDisplayContact" runat="server" Text="Display Contact List" Width="147px" Height="30px" style="margin-left: 12px" OnClick="btnDisplayContact_Click" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="3">
                        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="3">
                        &nbsp;</td>
                </tr>
            </table>

        </div>
    </div>
</asp:Content>

