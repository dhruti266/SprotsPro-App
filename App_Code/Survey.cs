using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SurveyClass
/// </summary>
public class Survey
{
    private List<Incident> incidents;

    public Survey()
    { 
        incidents = new List<Incident>();
    }
    public int CustomerID { get; set; }
    public int IncidentID { get; set; }
    public int ResponseTime { get; set; }
    public int TechEfficiency { get; set; }
    public int Resolution { get; set; }
    public string Comments { get; set; }
    public bool Contact { get; set; }
    public string ContactBy { get; set; }

    public void Clear()
    {
        incidents.Clear();
    }
}