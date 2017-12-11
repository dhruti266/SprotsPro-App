using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for IncidentClass
/// </summary>
public class Incident
{
    public Incident()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public int CustomerID { get; set; }
    public DateTime DateClosed { get; set; }
    public DateTime DateOpened { get; set; }
    public string Description { get; set; }
    public int IncidentID { get; set; }
    public string ProductCode { get; set; }
    public int TechID { get; set; }
    public string Title { get; set; }

    public string CustomerIncidentDisplay()
    {

        string show = ProductCode + " " + DateOpened + " " + DateClosed + " " + Title;
        return show;

    }
}