using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContactList : System.Web.UI.Page
{
    private CustomerList contacts;

    protected void Page_Load(object sender, EventArgs e)
    {
        contacts = CustomerList.GetCustomers();
        if (!IsPostBack)
            this.DisplayContacts();
    }

    private void DisplayContacts()
    {
        lstBoxContact.Items.Clear();
        Customer customer;
        for (int i = 0; i < contacts.Count; i++)
        {
            customer = contacts[i];
            lstBoxContact.Items.Add(customer.toString());
        }
    }

    protected void btnRemoveContact_Click(object sender, EventArgs e)
    {
        if (lstBoxContact.SelectedIndex > -1 && contacts.Count > 0)
        {
            lblError.Text = "";
            contacts.RemoveAt(lstBoxContact.SelectedIndex);
            this.DisplayContacts();
        }
        else
            lblError.Text = "Please select the contact to remove from list.";
    }

    protected void btnEmptyList_Click(object sender, EventArgs e)
    {
        contacts.Clear();
        lstBoxContact.Items.Clear();
    }

    protected void btnSelectAddCust_Click(object sender, EventArgs e)
    {
        Response.Redirect("Customers.aspx");
    }
}