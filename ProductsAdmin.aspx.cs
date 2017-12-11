using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProductsAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Text = "";
    }
    protected void btnAddProduct_Click(object sender, EventArgs e)
    {
        SqlDataSource1.InsertParameters["ProductCode"].DefaultValue = txtProductCode.Text;
        SqlDataSource1.InsertParameters["Name"].DefaultValue = txtName.Text;
        SqlDataSource1.InsertParameters["Version"].DefaultValue = txtVersion.Text;
        SqlDataSource1.InsertParameters["ReleaseDate"].DefaultValue = txtReleaseDate.Text;

        try
        {
            SqlDataSource1.Insert();
            txtProductCode.Text = "";
            txtVersion.Text = "";
            txtName.Text = "";
            txtReleaseDate.Text = "";
        }
        catch (Exception ex)
        {
            lblError.Text = "A database error has occured. Please enter valid data.";
        }
    }
    protected void grdProducts_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A database error has occured. PLease check your data and try again";
            e.ExceptionHandled = true; // handles all the exception that occures
            e.KeepInEditMode = true; // stays in edit mode
        }
        else if (e.AffectedRows == 0)// if affected row is zero then nothing is change in database.
        {
            lblError.Text = "Another user may have updated this product. Please try again ";
        }
        else
            grdProducts.DataBind();
    }


    protected void grdProducts_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A database error has occured. Please check your data and try again";
            e.ExceptionHandled = true; // handles all the exception that occures
            
        }
        else if (e.AffectedRows == 0)// if affected row is zero then nthing is change in database.
        {
            lblError.Text = "Another user may have deleted this product. Please try again ";
        }
        else
            grdProducts.DataBind();
    }


}