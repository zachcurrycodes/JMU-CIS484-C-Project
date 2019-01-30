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

/*
 *  http://www.c-sharpcorner.com/UploadFile/1e050f/edit-and-update-record-in-gridview-in-Asp-Net/
 *  this link helped setting up the gridview editing
 * */

public partial class ContractorPage : System.Web.UI.Page {
    SqlDataReader myReader = null;
    string sqlQuery;
    static int identityBookmark = 0;
    Contractor myContractor;
    //static int nextIdentity = 0;

    protected void Page_Load(object sender, EventArgs e) {
        if (!IsPostBack)
            loadStates();
        if (!IsPostBack)
            loadCountries();

        if (identityBookmark == 0) {
            if (HttpContext.Current.Session["contractorIDSesh"] != null) {
                tbCContractorID.Text = (String)HttpContext.Current.Session["contractorIDSesh"];
                identityBookmark = Convert.ToInt32(tbCContractorID.Text);
            }
            else {
                tbCContractorID.Text = "1";
                identityBookmark = Convert.ToInt32(tbCContractorID.Text);
            }
        }
        else tbCContractorID.Text = identityBookmark.ToString();
    }

    protected void insertContractorIntoDB() {
        //Format a SQL Statement to insert Contractor Values
        sqlQuery = "INSERT INTO CONTRACTOR VALUES(" +
                        "@firstName, " + 
                        "@lastName, " +
                        "@middleInitial, " +
                        "@houseNumber, " +
                        "@street, " +
                        "@cityCounty, " +
                        "@stateAbb, " +
                        "@countryAbb, " +
                        "@zipCode, " +
                        "@fee, " +
                        "@lastUpdatedBy, " +
                        "@lastUpdated)";
        Master.getSqlCommand.Parameters.AddWithValue("@firstName", myContractor.getFirstName());
        Master.getSqlCommand.Parameters.AddWithValue("@lastName", myContractor.getLastName());
        if (myContractor.getMiddleInitial() == "NULL")
            Master.getSqlCommand.Parameters.AddWithValue("@middleInitial", DBNull.Value);
        else Master.getSqlCommand.Parameters.AddWithValue("@middleInitial", myContractor.getMiddleInitial());
        if (myContractor.getHouseNumber() == "NULL")
            Master.getSqlCommand.Parameters.AddWithValue("@houseNumber", DBNull.Value);
        else Master.getSqlCommand.Parameters.AddWithValue("@houseNumber", myContractor.getHouseNumber());
        if (myContractor.getStreet() == "NULL")
            Master.getSqlCommand.Parameters.AddWithValue("@street", DBNull.Value);
        else Master.getSqlCommand.Parameters.AddWithValue("@street", myContractor.getStreet());
        if (myContractor.getCityCounty() == "NULL")
            Master.getSqlCommand.Parameters.AddWithValue("@cityCounty", DBNull.Value);
        else Master.getSqlCommand.Parameters.AddWithValue("@cityCounty", myContractor.getCityCounty());
        if (myContractor.getStateAbb() == "NULL")
            Master.getSqlCommand.Parameters.AddWithValue("@stateAbb", DBNull.Value);
        else Master.getSqlCommand.Parameters.AddWithValue("@stateAbb", myContractor.getStateAbb());
        if (myContractor.getCountryAbb() == "NULL")
            Master.getSqlCommand.Parameters.AddWithValue("@countryAbb", DBNull.Value);
        else Master.getSqlCommand.Parameters.AddWithValue("@countryAbb", myContractor.getCountryAbb());
        if (myContractor.getZipCode() == "NULL")
            Master.getSqlCommand.Parameters.AddWithValue("@zipCode", DBNull.Value);
        else Master.getSqlCommand.Parameters.AddWithValue("@zipCode", myContractor.getZipCode());
        if (myContractor.getFee() == "NULL")
            Master.getSqlCommand.Parameters.AddWithValue("@fee", DBNull.Value);
        else Master.getSqlCommand.Parameters.AddWithValue("@fee", myContractor.getFee());
        Master.getSqlCommand.Parameters.AddWithValue("@lastUpdatedBy", myContractor.getLastUpdatedBy());
        Master.getSqlCommand.Parameters.AddWithValue("@lastUpdated", myContractor.getLastUpdated());
                
        Master.sendDBCommand(sqlQuery);
        Master.closeDB();
        //reset contractor
        myContractor.reset();
        tableContractor.DataBind();


        try {
            sqlQuery = (
                "SELECT TOP 1 ContractorID " +
                "FROM Contractor " +
                "ORDER BY ContractorID DESC;");
            Master.sendDBCommand(sqlQuery);
            myReader = Master.getSqlCommand.ExecuteReader();

            if (myReader.HasRows)
                while (myReader.Read()) {
                    identityBookmark = Convert.ToInt32(myReader["ContractorID"]);
                }
        }
        catch (Exception) {
            Master.DisplayOnMaster.Text = "Error retrieving ContractorID";
        }
        Master.closeDB();
    }

    protected void loadStates() {
        ddCState.Items.Clear();
        try {
            sqlQuery = "SELECT StateAbb, StateName " +
                    "FROM HomeState;";
            Master.sendDBCommand(sqlQuery);
            myReader = Master.getSqlCommand.ExecuteReader();
            ddCState.Items.Add(new ListItem("  "));

            while (myReader.Read()) {
                ddCState.Items.Add(new ListItem(myReader["StateAbb"] + " - " + myReader["StateName"]));
            }
            Master.closeDB();
        }
        catch (Exception) {
            Master.DisplayOnMaster.Text = "Error populating State dd from database";
        }
    }

    protected void loadCountries() {
        ddCCountry.Items.Clear();
        try {
            sqlQuery = "SELECT CountryAbb, CountryName " +
                    "FROM Country;";
            Master.sendDBCommand(sqlQuery);
            myReader = Master.getSqlCommand.ExecuteReader();
            ddCCountry.Items.Add(new ListItem("  "));

            while (myReader.Read()) {
                ddCCountry.Items.Add(new ListItem(myReader["CountryAbb"] + " - " + myReader["CountryName"]));
            }
            Master.closeDB();
        }
        catch (Exception) {
            Master.DisplayOnMaster.Text = "Error populating Country dd from database";
        }
    }

    protected void btnCCommit_Click(object sender, EventArgs e) {
        //Check first location in contractor array
        Master.DisplayOnMaster.Text = "Insert to db Successfull";
        if (checkForSameContractorName()) {
            //Alert "Contractor Name unique"
            Master.DisplayOnMaster.Text = "Contractor Name Must be Unique" + Environment.NewLine +
                "Please insert a unique Contractor Name";
        }
        else {
            try {
                myContractor = new Contractor(
                    tbCContractorID.Text,
                    tbCFirstName.Text,
                    tbCLastName.Text,
                    tbCMI.Text,
                    tbCHouseNumber.Text,
                    tbCStreet.Text,
                    tbCCityCounty.Text,
                    ddCState.SelectedItem.Text.Substring(0, 2),
                    ddCCountry.SelectedItem.Text.Substring(0, 2),
                    tbCZipCode.Text,
                    tbCFee.Text,
                    "Zachary Curry",
                    Master.getCurrentTimestamp());

                insertContractorIntoDB();

                identityBookmark++;
                tbCContractorID.Text = identityBookmark.ToString();
                tbCFirstName.Focus();
            }
            catch (Exception) {
                Master.DisplayOnMaster.Text = "Error adding Contractor to Database";
            }
        }
    }

    protected Boolean checkForSameContractorName() {
        try {
            sqlQuery = "SELECT FIRSTNAME, LASTNAME, MIDDLEINITIAL FROM CONTRACTOR";
            Master.sendDBCommand(sqlQuery);
            myReader = Master.getSqlCommand.ExecuteReader();

            while (myReader.Read()) {
                String dbNameConcatenated = null;
                String tfNameConcatenated = null;

                dbNameConcatenated = myReader["FirstName"].ToString().ToUpper();
                if (myReader["MiddleInitial"].ToString() != "")
                    dbNameConcatenated += " " + myReader["MiddleInitial"].ToString().ToUpper();
                dbNameConcatenated += " " + myReader["LastName"].ToString().ToUpper();

                tfNameConcatenated = tbCFirstName.Text.ToUpper();
                if (tbCMI.Text != "")
                    tfNameConcatenated += " " + tbCMI.Text.ToUpper();
                tfNameConcatenated += " " + tbCLastName.Text.ToUpper();
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

}