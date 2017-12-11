<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContactList.aspx.cs" Inherits="ContactList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 430px;
        }
        h2 {
            margin-right: 45%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content">
        <div class="header">
            <h2> Contact List - Manage your contact list</h2>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">Contact List :</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                </tr>
                <tr>
                    <td class="auto-style2" rowspan="2">
                        <asp:ListBox ID="lstBoxContact" runat="server" Height="100px" Width="435px"></asp:ListBox>
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnRemoveContact" runat="server" Height="30px" Text="Remove Contact" Width="140px" OnClick="btnRemoveContact_Click" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnEmptyList" runat="server" Height="30px" Text="Empty List" Width="140px" OnClick="btnEmptyList_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="btnSelectAddCust" runat="server" Height="30px" Text="Select Additional Customer" OnClick="btnSelectAddCust_Click" Width="226px" />
                        &nbsp;<br /></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>

        </div>
     </div>
</asp:Content>

