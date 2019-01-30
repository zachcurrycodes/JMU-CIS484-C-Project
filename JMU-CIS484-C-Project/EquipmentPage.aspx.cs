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

public partial class EquipmentPage : System.Web.UI.Page {
    SqlDataReader myReader = null;
    string sqlQuery;
    Equipment myEquipment;
    static int identityBookmark = 0;

    protected void Page_Load(object sender, EventArgs e) {
        if (!IsPostBack)
            loadDrivers();

        if (identityBookmark == 0) {
            if (HttpContext.Current.Session["equipmentIDSesh"] != null) {
                tbEEquipmentID.Text = (String)HttpContext.Current.Session["equipmentIDSesh"];
                identityBookmark = Convert.ToInt32(tbEEquipmentID.Text);
            }
            else {
                tbEEquipmentID.Text = "1";
                identityBookmark = Convert.ToInt32(tbEEquipmentID.Text);
            }
        }
        else tbEEquipmentID.Text = identityBookmark.ToString();
    }

    protected void loadDrivers() {
        ddEDriver.Items.Clear();
        try {
            sqlQuery = "SELECT DriverID, FirstName, MiddleInitial, LastName " +
                    "FROM Driver;";
            Master.sendDBCommand(sqlQuery);
            myReader = Master.getSqlCommand.ExecuteReader();
            ddEDriver.Items.Add(new ListItem("Please select"));

            while (myReader.Read()) {
                String driverFullName = "";
                driverFullName = myReader["FirstName"].ToString();
                if (myReader["MiddleInitial"].ToString() != "")
                    driverFullName += " " + myReader["MiddleInitial"].ToString();
                driverFullName += " " + myReader["LastName"].ToString();

                ddEDriver.Items.Add(new ListItem(myReader["DriverID"] + " - " + driverFullName));
            }
            Master.closeDB();
        }
        catch (Exception) {
            Master.DisplayOnMaster.Text = "Error populating Driver dd from database";
        }
    }

    protected void insertEquipmentIntoDB() {
        Master.getSqlCommand.Parameters.AddWithValue("@vinNumber", myEquipment.getVinNumber());
        if (myEquipment.getMake() == "NULL")
            Master.getSqlCommand.Parameters.AddWithValue("@make", DBNull.Value);
        else Master.getSqlCommand.Parameters.AddWithValue("@make", myEquipment.getMake());
        if (myEquipment.getModel() == "NULL")
            Master.getSqlCommand.Parameters.AddWithValue("@model", DBNull.Value);
        else Master.getSqlCommand.Parameters.AddWithValue("@model", myEquipment.getModel());
        if (myEquipment.getEquipmentYear() == "NULL")
            Master.getSqlCommand.Parameters.AddWithValue("@year", DBNull.Value);
        else Master.getSqlCommand.Parameters.AddWithValue("@year", myEquipment.getEquipmentYear());
        if (myEquipment.getPriceAcquired() == "NULL")
            Master.getSqlCommand.Parameters.AddWithValue("@priceAcquired", DBNull.Value);
        else Master.getSqlCommand.Parameters.AddWithValue("@priceAcquired", myEquipment.getPriceAcquired());
        if (myEquipment.getLicenseNumber() == "NULL")
            Master.getSqlCommand.Parameters.AddWithValue("@LicenseNumber", DBNull.Value);
        else Master.getSqlCommand.Parameters.AddWithValue("@LicenseNumber", myEquipment.getLicenseNumber());
        Master.getSqlCommand.Parameters.AddWithValue("@driverID", myEquipment.getDriverID());
        Master.getSqlCommand.Parameters.AddWithValue("@lastUpdatedBy", myEquipment.getLastUpdatedBy());
        Master.getSqlCommand.Parameters.AddWithValue("@lastUpdated", myEquipment.getLastUpdated());

        Master.callStoredProcedure();
        tableEquipment.DataBind();
        
        //reset myEquipment object
        myEquipment.reset();

        try {
            sqlQuery = (
                "SELECT TOP 1 ID " +
                "FROM Equipment " +
                "ORDER BY ID DESC;");
            Master.sendDBCommand(sqlQuery);
            myReader = Master.getSqlCommand.ExecuteReader();

            if (myReader.HasRows)
                while (myReader.Read()) {
                    identityBookmark = Convert.ToInt32(myReader["ID"]);
                }
        }
        catch (Exception) {
            Master.DisplayOnMaster.Text = "Error retrieving Equipment ID";
        }
        Master.closeDB();
    }

    protected void btnECommit_Click(object sender, EventArgs e) {
        Master.DisplayOnMaster.Text = "Insert to db Successfull";
        if (checkForSameVin()) {
            //Alert "Vin unique"
            Master.DisplayOnMaster.Text = "Vin Number Must be Unique" + Environment.NewLine +
                "Please insert a unique Vin";
        }
        else {
            try {
                myEquipment = new Equipment(
                    tbEEquipmentID.Text,
                    tbEVin.Text,
                    tbEMake.Text,
                    tbEModel.Text,
                    tbEYear.Text,
                    tbEPriceAcquired.Text,
                    tbELicensePlate.Text,
                    ddEDriver.SelectedItem.Text.Substring(0,
                        ddEDriver.SelectedItem.Text.IndexOf(" ")),
                    "Zachary Curry",
                    Master.getCurrentTimestamp());
                insertEquipmentIntoDB();
                identityBookmark++;
                tbEEquipmentID.Text = identityBookmark.ToString();
                tbEVin.Focus();
            }
            catch (Exception) {
                Master.DisplayOnMaster.Text = "Error inserting data to database";
            }
        }
    }

    protected Boolean checkForSameVin() {
        //check database for exact match of equipment vin number
        try{
            sqlQuery = "SELECT VINNUMBER FROM EQUIPMENT";
            Master.sendDBCommand(sqlQuery);
            myReader = Master.getSqlCommand.ExecuteReader();

            while (myReader.Read()) {
                String dbVinPlaceholder = null;
                String tfVinPlaceholder = null;
                dbVinPlaceholder = myReader["VINNUMBER"].ToString().ToUpper();
                
                tfVinPlaceholder = tbEVin.Text.ToUpper();

                if (tfVinPlaceholder == dbVinPlaceholder)
                    return true;
            }
            Master.closeDB();
        }
        catch (Exception) {
            Master.DisplayOnMaster.Text = "Error Selecting Vin from database";
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