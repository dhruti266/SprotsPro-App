using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomersAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Text = "";
    }

    protected void dtlCustomer_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        if (e.Exception != null)//if exception occurrs
        {
            lblError.Text = "A database error has occured. ";
            e.ExceptionHandled = true;// handles all the exception that occurres
            e.KeepInEditMode = true; // stays in edit mode
        }
        else if (e.AffectedRows == 0)// if affected row is zero then nthing is changed in the database.
        {
            lblError.Text = "Another user may have updated this customer. Please try again.";
        }
        else
            grdCustomers.DataBind();//updates the changes in gridview1
    }


    protected void dtlCustomer_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A database error has occured. Please check your data and try again";
            e.ExceptionHandled = true; // handles all the exception that occures

        }
        else if (e.AffectedRows == 0)// if affected row is zero then nthing is change in database.
        {
            lblError.Text = "Another user may have deleted this customer. Please try again ";
        }
        else
            grdCustomers.DataBind();

    }

    protected void dtlCustomer_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A Database error occured while inseting new customer";
            e.ExceptionHandled = true;// handles all the exception that occurres
            e.KeepInInsertMode = true; // stays in insert mode
        }
        else
            grdCustomers.DataBind();//updates the changes in gridview1
    }

}