<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductsAdmin.aspx.cs" Inherits="ProductsAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
        }
        .auto-style3 {
            width: 178px;
        }
        table tr {
            height: 40px;
        }
        .auto-style4 {
        }
        .auto-style5 {
            width: 126px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content">
       <div class="header">
            <h2> Maintain Products</h2>
        </div>
        <h3> Product List</h3>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
        <br />
        <asp:GridView ID="grdProducts" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductCode" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" BackColor="#F2F2F2" BorderColor="#CCCCCC" BorderStyle="Solid" CellPadding="5" CellSpacing="2" OnRowUpdated="grdProducts_RowUpdated" OnRowDeleted="grdProducts_RowDeleted">
            <Columns>
                <asp:TemplateField HeaderText="ProductCode" SortExpression="ProductCode">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProductCode") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ProductCode") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"  ControlToValidate="TextBox1" ForeColor="Red" ErrorMessage="Name is Required"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Version" SortExpression="Version">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Version") %>'></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"  ControlToValidate="TextBox2" ForeColor="Red" ErrorMessage="Version is requierd"></asp:RequiredFieldValidator>
                        <br />
                        <asp:CompareValidator ID="CompareValidator3" runat="server"  ErrorMessage="Version must be decimal" ControlToValidate="TextBox2"  ForeColor="Red" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator> 
                         </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Version") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ReleaseDate" SortExpression="ReleaseDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ReleaseDate") %>'></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"  ControlToValidate="TextBox3"  ForeColor="Red" ErrorMessage="Release date is required"></asp:RequiredFieldValidator>
                        <br />
                         <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="TextBox3"  ErrorMessage="Enter date in valid format" ForeColor="Red" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("ReleaseDate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True">
                <ControlStyle BackColor="#A6BF80" Height="30px" Width="60px" />
                </asp:CommandField>
            </Columns>
            <EditRowStyle ForeColor="Black" />
            <FooterStyle BackColor="White" ForeColor="#90B061" />
            <HeaderStyle ForeColor="#90B061" />
            <PagerStyle ForeColor="#90B061" />
            <RowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Products]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Products] WHERE [ProductCode] = @original_ProductCode AND [Name] = @original_Name AND [Version] = @original_Version AND [ReleaseDate] = @original_ReleaseDate" InsertCommand="INSERT INTO [Products] ([ProductCode], [Name], [Version], [ReleaseDate]) VALUES (@ProductCode, @Name, @Version, @ReleaseDate)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Products] SET [Name] = @Name, [Version] = @Version, [ReleaseDate] = @ReleaseDate WHERE [ProductCode] = @original_ProductCode AND [Name] = @original_Name AND [Version] = @original_Version AND [ReleaseDate] = @original_ReleaseDate">
            <DeleteParameters>
                <asp:Parameter Name="original_ProductCode" Type="String" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Version" Type="Decimal" />
                <asp:Parameter Name="original_ReleaseDate" Type="DateTime" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ProductCode" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Version" Type="Decimal" />
                <asp:Parameter Name="ReleaseDate" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Version" Type="Decimal" />
                <asp:Parameter Name="ReleaseDate" Type="DateTime" />
                <asp:Parameter Name="original_ProductCode" Type="String" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Version" Type="Decimal" />
                <asp:Parameter Name="original_ReleaseDate" Type="DateTime" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        To add new product, enter the product information and click add product...<br />
        <br />
        <table class="auto-style1" >
            <tr>
                <td class="auto-style4" colspan="3">
                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" ValidationGroup="TableSummary" />
                </td>
            </tr>
            <tr>
                <td class="auto-style5">Product Code :</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtProductCode" runat="server" Height="25px" Width="150px" MaxLength="10"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtProductCode" ErrorMessage="Product code is required" ForeColor="Red" Display="Dynamic" ValidationGroup="TableSummary"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">Name :</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtName" runat="server" Height="25px" Width="150px" MaxLength="50"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtName" ErrorMessage="Name is required" ForeColor="Red" Display="Dynamic" ValidationGroup="TableSummary"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">Version : </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtVersion" runat="server" Height="25px" Width="150px" MaxLength="18"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtVersion" ErrorMessage="Version is required" ForeColor="Red" Display="Dynamic" ValidationGroup="TableSummary"></asp:RequiredFieldValidator>
                &nbsp;
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtVersion" Display="Dynamic" ErrorMessage="Version should be decimal" ForeColor="Red" Operator="DataTypeCheck" Type="Double" ValidationGroup="TableSummary"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">Release Date :</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtReleaseDate" runat="server" Height="25px" Width="150px" TextMode="Date"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtReleaseDate" ErrorMessage="Release date is required" ForeColor="Red" Display="Dynamic" ValidationGroup="TableSummary"></asp:RequiredFieldValidator>
                &nbsp;
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtReleaseDate" Display="Dynamic" ErrorMessage="Enter date in valid format" ForeColor="Red" Operator="DataTypeCheck" Type="Date" ValidationGroup="TableSummary"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style3">
                    <asp:Button ID="btnAddProduct" runat="server" BackColor="#A6BF80" Height="35px" OnClick="btnAddProduct_Click" Text="Add Product" ValidationGroup="TableSummary" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="3">
                    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
   </div>
</asp:Content>

