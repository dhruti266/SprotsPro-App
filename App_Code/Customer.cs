using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Customer
/// </summary>
public class Customer
{
    public string customerId;
    public string name;
    public string address;
    public string city;
    public string state;
    public string zipCode;
    public string phone;
    public string email;

    public Customer()
    {

    }

    public Customer(string cid, string nam, string add, string cit, string stat, string zip, string pho, string ema)
    {
        customerId = cid;
        name = nam;
        address = add;
        city = cit;
        state = stat;
        zipCode = zip;
        phone = pho;
        email = ema;
    }

    public string getCustomerId() { return customerId; }
    public string getName() { return name; }
    public string getAddress() { return address; }
    public string getCity() { return city; }
    public string getState() { return state; }
    public string getZipCode() { return zipCode; }
    public string getPhone() { return phone; }
    public string getEmail() { return email; }

    public string toString()
    {
        string s = "";
        s = name + "," + phone + "," + email;
        return s;
    }
}