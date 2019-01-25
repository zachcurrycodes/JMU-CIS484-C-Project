using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

/*
Zachary Curry

On my honor, I have neither given nor received any unauthorized assistance on
this academic work
*/

public partial class DriverPage : System.Web.UI.Page {
    SqlDataReader myReader = null;
    string sqlQuery;
    static DateTime today = DateTime.Today;
    static int identityBookmark = 0;
    Driver myDriver;

    protected void Page_Load(object sender, EventArgs e) {
        if (!IsPostBack)
            loadContractors();
        if (!IsPostBack)
            loadStates();
        if (!IsPostBack)
            loadCountries();
        
        dateVal25YearsOld.ValueToCompare = today.AddYears(-25).AddDays(1).ToString("MM/dd/yyyy");
        dateVal75YearsOld.ValueToCompare = today.AddYears(-75).ToString("MM/dd/yyyy");
        dateValTodayCDLExperation.ValueToCompare = today.ToString("MM/dd/yyyy");

        if (identityBookmark == 0) {
            if (HttpContext.Current.Session["driverIDSesh"] != null) {
                tbDDriverID.Text = (String)HttpContext.Current.Session["driverIDSesh"];
                identityBookmark = Convert.ToInt32(tbDDriverID.Text);
            }
            else {
                tbDDriverID.Text = "1";
                identityBookmark = Convert.ToInt32(tbDDriverID.Text);
            }
        }
        else tbDDriverID.Text = identityBookmark.ToString();
    }

    protected void btnDCommit_Click(object sender, EventArgs e) {
        Master.DisplayOnMaster.Text = "Insert to db Successfull";
        if (checkForSameDriverName()) {
            //Alert "Driver Name unique"
            Master.DisplayOnMaster.Text = "Driver Name Must be Unique" + Environment.NewLine +
                "Please insert a unique Driver Name";
        }
        else {
            try {
                myDriver = new Driver(
                    tbDDriverID.Text,
                    tbDFirstName.Text,
                    tbDLastName.Text,
                    tbDMI.Text,
                    tbDHouseNumber.Text,
                    tbDStreet.Text,
                    tbDCityCounty.Text,
                    ddDState.SelectedItem.Text.Substring(0, 2),
                    ddDCountry.SelectedItem.Text.Substring(0, 2),
                    tbDZipCode.Text,
                    tbDDOB.Text,
                    tbDCDL.Text,
                    tbDCDLExperationDate.Text,
                    "Zachary Curry",
                    Master.getCurrentTimestamp(),
                    ddDContractor.SelectedItem.Text.Substring(0,
                        ddDContractor.SelectedItem.Text.IndexOf(" ")),
                    tbDHireDate.Text,
                    tbDTerminationDate.Text,
                    tbDSalary.Text);

                insertDriverIntoDB();
                identityBookmark++;
                tbDDriverID.Text = identityBookmark.ToString();
                tbDFirstName.Focus();

                lblDriverName.Text = tbDFirstName.Text;
                if (tbDMI.Text != "")
                    lblDriverName.Text += " " + tbDMI.Text;
                lblDriverName.Text += " " + tbDLastName.Text;

                DateTime driverDOB = DateTime.Parse(tbDDOB.Text);

                if (int.Parse(today.Month.ToString()) >= int.Parse(driverDOB.Month.ToString()))
                    if (int.Parse(today.Day.ToString()) >= int.Parse(driverDOB.Day.ToString()))
                        lblDriverAge.Text = (int.Parse(today.Year.ToString()) - int.Parse(driverDOB.Year.ToString())).ToString();
                    else lblDriverAge.Text = (int.Parse(today.Year.ToString()) - int.Parse(driverDOB.Year.ToString()) - 1).ToString();
                else lblDriverAge.Text = (int.Parse(today.Year.ToString()) - int.Parse(driverDOB.Year.ToString()) - 1).ToString();

                lblDAge.Text = "Age";
            }
            catch (Exception) {
                Master.DisplayOnMaster.Text = "Error adding Driver to database";
            }
        }
    }

    protected void loadStates() {
        ddDState.Items.Clear();
        try {
            sqlQuery = "SELECT StateAbb, StateName " +
                    "FROM HomeState;";
            Master.sendDBCommand(sqlQuery);
            myReader = Master.getSqlCommand.ExecuteReader();
            ddDState.Items.Add(new ListItem("  "));

            while (myReader.Read()) {
                ddDState.Items.Add(new ListItem(myReader["StateAbb"] + " - " + myReader["StateName"]));
            }
            Master.closeDB();
        }
        catch (Exception) {
            Master.DisplayOnMaster.Text = "Error populating State dd from database";
        }
    }

    protected void loadCountries() {
        ddDCountry.Items.Clear();
        try {
            sqlQuery = "SELECT CountryAbb, CountryName " +
                    "FROM Country;";
            Master.sendDBCommand(sqlQuery);
            myReader = Master.getSqlCommand.ExecuteReader();
            ddDCountry.Items.Add(new ListItem("  "));

            while (myReader.Read()) {
                ddDCountry.Items.Add(new ListItem(myReader["CountryAbb"] + " - " + myReader["CountryName"]));
            }
            Master.closeDB();
        }
        catch (Exception) {
            Master.DisplayOnMaster.Text = "Error populating Country dd from database";
        }
    }

    protected void loadContractors() {
        ddDContractor.Items.Clear();
        try {
            sqlQuery = "SELECT ContractorID, FirstName, MiddleInitial, LastName " +
                    "FROM Contractor;";
            Master.sendDBCommand(sqlQuery);
            myReader = Master.getSqlCommand.ExecuteReader();
            ddDContractor.Items.Add(new ListItem("Please select"));

            while (myReader.Read()) {
                String contractorFullName = "";
                contractorFullName = myReader["FirstName"].ToString();
                if (myReader["MiddleInitial"].ToString() != "")
                    contractorFullName += " " + myReader["MiddleInitial"].ToString();
                contractorFullName += " " + myReader["LastName"].ToString();

                ddDContractor.Items.Add(new ListItem(myReader["ContractorID"] + " - " + contractorFullName));
            }
            Master.closeDB();
        }
        catch (Exception) {
            Master.DisplayOnMaster.Text = "Error populating Contractor dd from database";
        }
    }

    protected void insertDriverIntoDB() {
        //Format a SQL Statement to insert Driver Values
        sqlQuery = "INSERT INTO DRIVER VALUES(" +
                        "@firstName, " +
                        "@lastName, " +
                        "@middleInitial, " +
                        "@houseNumber, " +
                        "@street, " +
                        "@cityCounty, " +
                        "@stateAbb, " +
                        "@countryAbb, " +
                        "@zipCode, " +
                        "@dateOfBirth, " +
                        "@cDL, " +
                        "@cDLDate, " +
                        "@lastUpdatedBy, " +
                        "@lastUpdated)";
        Master.getSqlCommand.Parameters.AddWithValue("@firstName", myDriver.getFirstName());
        Master.getSqlCommand.Parameters.AddWithValue("@lastName", myDriver.getLastName());
        if (myDriver.getMiddleInitial() == "NULL")
            Master.getSqlCommand.Parameters.AddWithValue("@middleInitial", DBNull.Value);
        else Master.getSqlCommand.Parameters.AddWithValue("@middleInitial", myDriver.getMiddleInitial());
        if (myDriver.getHouseNumber() == "NULL")
            Master.getSqlCommand.Parameters.AddWithValue("@houseNumber", DBNull.Value);
        else Master.getSqlCommand.Parameters.AddWithValue("@houseNumber", myDriver.getHouseNumber());
        if (myDriver.getStreet() == "NULL")
            Master.getSqlCommand.Parameters.AddWithValue("@street", DBNull.Value);
        else Master.getSqlCommand.Parameters.AddWithValue("@street", myDriver.getStreet());
        if (myDriver.getCityCounty() == "NULL")
            Master.getSqlCommand.Parameters.AddWithValue("@cityCounty", DBNull.Value);
        else Master.getSqlCommand.Parameters.AddWithValue("@cityCounty", myDriver.getCityCounty());
        if (myDriver.getStateAbb() == "NULL")
            Master.getSqlCommand.Parameters.AddWithValue("@stateAbb", DBNull.Value);
        else Master.getSqlCommand.Parameters.AddWithValue("@stateAbb", myDriver.getStateAbb());
        if (myDriver.getCountryAbb() == "NULL")
            Master.getSqlCommand.Parameters.AddWithValue("@countryAbb", DBNull.Value);
        else Master.getSqlCommand.Parameters.AddWithValue("@countryAbb", myDriver.getCountryAbb());
        if (myDriver.getZipCode() == "NULL")
            Master.getSqlCommand.Parameters.AddWithValue("@zipCode", DBNull.Value);
        else Master.getSqlCommand.Parameters.AddWithValue("@zipCode", myDriver.getZipCode());
        Master.getSqlCommand.Parameters.AddWithValue("@dateOfBirth", myDriver.getDateOfBirth());
        if (myDriver.getCDL() == "NULL")
            Master.getSqlCommand.Parameters.AddWithValue("@cDL", DBNull.Value);
        else Master.getSqlCommand.Parameters.AddWithValue("@cDL", myDriver.getCDL());
        if (myDriver.getCDLDate() == "NULL")
            Master.getSqlCommand.Parameters.AddWithValue("@cDLDate", DBNull.Value);
        else Master.getSqlCommand.Parameters.AddWithValue("@cDLDate", myDriver.getCDLDate());
        Master.getSqlCommand.Parameters.AddWithValue("@lastUpdatedBy", myDriver.getLastUpdatedBy());
        Master.getSqlCommand.Parameters.AddWithValue("@lastUpdated", myDriver.getLastUpdated());

        Master.sendDBCommand(sqlQuery);
        tableDriver.DataBind();
        Master.closeDB();

        //Format a SQL Statement to insert DriverContractor Values
        if (myDriver.getDriverID() == "1") {
            try {
                sqlQuery = (
                    "SELECT TOP 1 DriverID " +
                    "FROM Driver " +
                    "ORDER BY DriverID DESC;");
                Master.sendDBCommand(sqlQuery);
                myReader = Master.getSqlCommand.ExecuteReader();

                if (myReader.HasRows)
                    while (myReader.Read()) {
                        myDriver.setDriverID(myReader["DriverID"].ToString());
                    }
            }
            catch (Exception) {
                Master.DisplayOnMaster.Text = "Error retrieving ContractorID";
            }
            Master.closeDB();
        }

        sqlQuery = "INSERT INTO DRIVERCONTRACTOR VALUES(" +
                        "@contractorID, " +
                        "@driverID, " +
                        "@hireDate, " +
                        "@terminationDate, " +
                        "@salary, " +
                        "@lastUpdatedByB, " +  
                        "@lastUpdatedB)";
        Master.getSqlCommand.Parameters.AddWithValue("@contractorID", myDriver.getContractorID());
        Master.getSqlCommand.Parameters.AddWithValue("@driverID", myDriver.getDriverID());
        if (myDriver.getHireDate() == "NULL")
            Master.getSqlCommand.Parameters.AddWithValue("@hireDate", DBNull.Value);
        else Master.getSqlCommand.Parameters.AddWithValue("@hireDate", myDriver.getHireDate());
        if (myDriver.getTerminationDate() == "NULL")
            Master.getSqlCommand.Parameters.AddWithValue("@terminationDate", DBNull.Value);
        else Master.getSqlCommand.Parameters.AddWithValue("@terminationDate", myDriver.getTerminationDate());
        if (myDriver.getSalary() == "NULL")
            Master.getSqlCommand.Parameters.AddWithValue("@salary", DBNull.Value);
        else Master.getSqlCommand.Parameters.AddWithValue("@salary", myDriver.getSalary());
        Master.getSqlCommand.Parameters.AddWithValue("@lastUpdatedByB", myDriver.getLastUpdatedBy());
        Master.getSqlCommand.Parameters.AddWithValue("@lastUpdatedB", myDriver.getLastUpdated());
         
        Master.sendDBCommand(sqlQuery);
        tableDriverContractor.DataBind();
        Master.closeDB();

        //reset myDriver object
        myDriver.reset();

        try {
            sqlQuery = (
                "SELECT TOP 1 DriverID " +
                "FROM Driver " +
                "ORDER BY DriverID DESC;");
            Master.sendDBCommand(sqlQuery);
            myReader = Master.getSqlCommand.ExecuteReader();

            if (myReader.HasRows)
                while (myReader.Read()) {
                    identityBookmark = Convert.ToInt32(myReader["DriverID"]);
                }
        }
        catch (Exception) {
            Master.DisplayOnMaster.Text = "Error retrieving DriverID";
        }
        Master.closeDB();
    }

    protected Boolean checkForSameDriverName() {
        //check database for exact match of concatenated name
        try {
            sqlQuery = "SELECT FIRSTNAME, LASTNAME, MIDDLEINITIAL FROM DRIVER";
            Master.sendDBCommand(sqlQuery);
            myReader = Master.getSqlCommand.ExecuteReader();

            while (myReader.Read()) {
                String dbNameConcatenated = null;
                String tfNameConcatenated = null;

                dbNameConcatenated = myReader["FirstName"].ToString().ToUpper();
                if (myReader["MiddleInitial"].ToString() != "")
                    dbNameConcatenated += " " + myReader["MiddleInitial"].ToString().ToUpper();
                dbNameConcatenated += " " + myReader["LastName"].ToString().ToUpper();

                tfNameConcatenated = tbDFirstName.Text.ToUpper();
                if (tbDMI.Text != "")
                    tfNameConcatenated += " " + tbDMI.Text.ToUpper();
                tfNameConcatenated += " " + tbDLastName.Text.ToUpper();

                if (dbNameConcatenated == tfNameConcatenated)
                    return true;
            }
            Master.closeDB();
        }
        catch (Exception) {
            Master.DisplayOnMaster.Text = "Error Selecting DriverID from database";
        }
        return false;
    }

    protected String checkForApostrophe(String str) {
        String temp = str;
        if (str != "NULL") {
            temp = "'";
            for (int i = 1; i < str.Length - 1; i++) {
                if (str.Substring(i, 1) == "\'")
                    temp += "'";
                temp += str.Substring(i, 1);
            }
            temp += "'";
        }
        return temp;
    }
    protected void tableDriver_RowUpdated(object sender, GridViewUpdatedEventArgs e) {
        tableDriverContractor.DataBind();
    }
    protected void tableDriver_RowDeleted(object sender, GridViewDeletedEventArgs e) {
        tableDriverContractor.DataBind();
    }
}