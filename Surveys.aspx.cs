using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text.RegularExpressions;

public partial class Surveys : System.Web.UI.Page
{
    private DataView incidentsTable;
    Survey survey = new Survey();

    protected void Page_Load(object sender, EventArgs e)
    {
        txtCustomerID.Focus();
    }
    
    protected void btnGetIncidents_Click(object sender, EventArgs e)
    {
        incidentsTable = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        incidentsTable.RowFilter = "CustomerID = " + txtCustomerID.Text
            + " And DateClosed Is Not Null";
        if (incidentsTable.Count > 0)
        {
            this.DisplayClosedIncidents();
            chckboxContactMe.Enabled = true;
            RadioBtnListResponse.Enabled = true;
            RadioBtnListTechnician.Enabled = true;
            RadioBtnListProblem.Enabled = true;
            RadioBtnListContactBy.Enabled = true;
            txtboxAdditionalComments.Enabled = true;
            btnSubmit.Enabled = true;
            lstBoxIncidents.Focus();
        }
        else
        {
            lblNoIncidentInfo.Visible = true;
            lblNoIncidentInfo.Text = "There are no incidents for the requested customer.";
            survey.Clear();
            lstBoxIncidents.Items.Clear();

        }

    }

    private void DisplayClosedIncidents()
    {
        foreach (DataRowView row in incidentsTable)
        {
            Incident incident = new Incident();
            incident.IncidentID = Convert.ToInt32(row["IncidentID"]);
            incident.ProductCode = row["ProductCode"].ToString();
            incident.DateClosed = Convert.ToDateTime(row["DateClosed"]);

            incident.Title = row["Title"].ToString();

            lstBoxIncidents.Items.Add(new ListItem(incident.CustomerIncidentDisplay(), incident.IncidentID.ToString()));
        }
        lstBoxIncidents.SelectedIndex = 0;
        lblNoIncidentInfo.Text = "";
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            survey.CustomerID = Convert.ToInt32(txtCustomerID.Text);
            survey.IncidentID = Convert.ToInt32(lstBoxIncidents.SelectedIndex.ToString());

            if (RadioBtnListResponse.SelectedIndex != -1)
            {
                survey.ResponseTime = Convert.ToInt32(RadioBtnListResponse.SelectedValue);
            }
            if (RadioBtnListTechnician.SelectedIndex != -1)
            {
                survey.TechEfficiency = Convert.ToInt32(RadioBtnListTechnician.SelectedValue);
            }
            if (RadioBtnListProblem.SelectedIndex != -1)
            {
                survey.Resolution = Convert.ToInt32(RadioBtnListProblem.SelectedValue);
            }
            survey.Comments = txtCustomerID.Text;

            if (chckboxContactMe.Checked)
            {
                survey.Contact = true;
                if (RadioBtnListContactBy.SelectedIndex == 0)
                    survey.ContactBy = "Email";
                else if (RadioBtnListContactBy.SelectedIndex == 1)
                    survey.ContactBy = "Phone";
                Session.Add("Contact", true);
            }
            else
            {
                survey.Contact = false;
                Session.Add("Contact", false);
            }
            Response.Redirect("SurveyComplete.aspx");
        }
    }
}