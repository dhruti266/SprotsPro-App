using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Customers : System.Web.UI.Page
{
    private Customer custObj;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            ddCustomers.DataBind();

        String s = ddCustomers.SelectedItem.ToString();

        custObj = getSelectedCustomer();
        lblAddress.Text = custObj.address;
        lblPhone.Text = custObj.phone;
        lblEmail.Text = custObj.email;
    }

    private Customer getSelectedCustomer()
    {
        lblError.Text = "";
        Customer cust = new Customer();
        DataView customerTable = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        customerTable.RowFilter = string.Format("CustomerID ='{0}'", ddCustomers.SelectedValue);
        DataRowView row = (DataRowView)customerTable[0];

        cust.name = row["Name"].ToString();
        cust.address = row["Address"].ToString();
        cust.city = row["City"].ToString();
        cust.state = row["State"].ToString();
        cust.zipCode = row["Zipcode"].ToString();
        cust.phone = row["Phone"].ToString();
        cust.email = row["Email"].ToString();

        return cust;
    }

    protected void btnAddContact_Click(object sender, EventArgs e)
    {
        CustomerList contacts = CustomerList.GetCustomers();
        Customer customer = contacts[getSelectedCustomer().name];
        if (customer == null)
        {
            contacts.AddItem(getSelectedCustomer());
            Response.Redirect("ContactList.aspx");
        }
        else
        {
            lblError.Text = "This customer is already added to the contact list.";
        }
    }
    protected void btnDisplayContact_Click(object sender, EventArgs e)
    {
        Response.Redirect("ContactList.aspx");
    }
}