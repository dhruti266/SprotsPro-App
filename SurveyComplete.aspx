<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SurveyComplete.aspx.cs" Inherits="SurveyComplete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
     h2 {
            margin-right: 65%;
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content">
        <div class="header">
            <h2>Survey Complete</h2>
        </div>
    
        <p>
            <asp:Label ID="lblThankYou" runat="server" Text="Thank you for your feedback!"></asp:Label>
        </p>
        <p>
            <asp:Label ID="lblContactBack" runat="server" Text="A customer service representative will contact you within 24 hours." Visible="False"></asp:Label>
        </p>
        <p>
            <asp:Button ID="btnReturnSurvey" runat="server" OnClick="btnReturnSurvey_Click" Text="Return to Survey" Height="30px" />
        </p>
        <p>
            &nbsp;</p>
    </div>
</asp:Content>

