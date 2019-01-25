﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

/*
Zachary Curry

On my honor, I have neither given nor received any unauthorized assistance on
this academic work
*/

public partial class MasterPage : System.Web.UI.MasterPage {
    System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
    SqlCommand myCommand = new SqlCommand();
    SqlDataReader myReader = null;
    string sqlQuery;
    

    protected void Page_Load(object sender, EventArgs e) {
            clearDB();
    }

    protected void clearDB() {
        if (Session["firstLoad"] == null) {

            try {
                sqlQuery = (
                    "SELECT TOP 1 ContractorID " +
                    "FROM Contractor " +
                    "ORDER BY ContractorID DESC;");
                sendDBCommand(sqlQuery);
                myReader = getSqlCommand.ExecuteReader();

                if (myReader.HasRows)
                    while (myReader.Read()) {
                        Session["contractorIDSesh"] = (Convert.ToInt32(myReader["ContractorID"]) + 1).ToString();
                    }
            }
            catch (Exception) {
                tbMDisplayData.Text = "Error retrieving ContractorID";
            }
            sc.Close();

            try {
                sqlQuery = (
                    "SELECT TOP 1 DriverID " +
                    "FROM Driver " +
                    "ORDER BY DriverID DESC;");
                sendDBCommand(sqlQuery);
                myReader = getSqlCommand.ExecuteReader();

                if (myReader.HasRows)
                    while (myReader.Read()) {
                        Session["driverIDSesh"] = (Convert.ToInt32(myReader["DriverID"]) + 1).ToString();
                    }
            }
            catch (Exception) {
                tbMDisplayData.Text = "Error retrieving DriverID";
            }
            sc.Close();

            try {
                sqlQuery = (
                    "SELECT TOP 1 ID " +
                    "FROM Equipment " +
                    "ORDER BY ID DESC;");
                sendDBCommand(sqlQuery);
                myReader = getSqlCommand.ExecuteReader();

                if (myReader.HasRows)
                    while (myReader.Read()) {
                        Session["equipmentIDSesh"] = (Convert.ToInt32(myReader["ID"]) + 1).ToString();
                    }
            }
            catch (Exception) {
                tbMDisplayData.Text = "Error retrieving Equipment ID";
            }
            sc.Close();

            //Delete current Equipment Table
            sqlQuery = "DELETE FROM EQUIPMENT";
            sendDBCommand(sqlQuery);
            myReader = getSqlCommand.ExecuteReader();
            sc.Close();
            //Delete current DriverContractor Table
            sqlQuery = "DELETE FROM DRIVERCONTRACTOR";
            sendDBCommand(sqlQuery);
            myReader = getSqlCommand.ExecuteReader();
            sc.Close();
            //Delete current Driver Table
            sqlQuery = "DELETE FROM DRIVER";
            sendDBCommand(sqlQuery);
            myReader = getSqlCommand.ExecuteReader();
            sc.Close();
            //Delete current Contractor Table
            sqlQuery = "DELETE FROM CONTRACTOR";
            sendDBCommand(sqlQuery);
            myReader = getSqlCommand.ExecuteReader();
            sc.Close();
            Session["firstLoad"] = false;
        }
    }

    public void deleteEquipment(Equipment e) {
        sc.ConnectionString = ConfigurationManager.ConnectionStrings["Lab2ConnectionString"].ConnectionString;
        myCommand = sc.CreateCommand();
        SqlParameter equipmentIDPara = new SqlParameter("@eqipmentID", SqlDbType.Int);
        myCommand.Parameters.Add(equipmentIDPara);
        equipmentIDPara.Value = e.getID();
        myCommand.CommandText = @"DELETE FROM Equipment WHERE ID = @equipmentID";
        sc.Open();
        myCommand.ExecuteNonQuery();
        sc.Close();
    }

    protected void btnMContractor_Click(object sender, EventArgs e) {
        Response.Redirect("ContractorPage.aspx");
    }

    protected void btnMDriver_Click(object sender, EventArgs e) {
        Response.Redirect("DriverPage.aspx");
    }

    protected void btnMEquipment_Click(object sender, EventArgs e) {
        Response.Redirect("EquipmentPage.aspx");
    }

    protected void btnMDisplayFee_Click(object sender, EventArgs e) {
        //Declare string and set to null
        String totalFees = null;
        try {
            //Count Contractors in the database
            sqlQuery = "SELECT COUNT(CONTRACTORID) FROM CONTRACTOR";
            sendDBCommand(sqlQuery);
            myReader = getSqlCommand.ExecuteReader();
            //If atleast one contractor in database then continue
            while (myReader.Read()) {
                if (int.Parse(myReader[0].ToString()) > 0) {
                    sc.Close();
                    try {
                        //Get the sum of all commited Contractor's fees
                        sqlQuery = "SELECT SUM(FEE) FROM CONTRACTOR";
                        sendDBCommand(sqlQuery);
                        myReader = getSqlCommand.ExecuteReader();
                        while (myReader.Read()) {
                            if (myReader[0].ToString() != "") {
                                //Display Total Fees and format to Dollars
                                totalFees = "Total amount of Fees for all committed Contractors\n"
                                + " -------------------------------------------\n"
                                + "$" + String.Format("{0:f2}",
                                        Double.Parse(myReader[0].ToString()));
                                String coolio = myReader[0].ToString();
                                String collio2 = myReader[0].ToString();
                                //Show String in bottom field
                                tbMDisplayData.Text = totalFees;
                            }
                            else {//if no fees enter for any contractor, display
                                tbMDisplayData.Text = "No Contractor Fees entered into Database" + Environment.NewLine +
                                    "Please commit atleast one Contractor Fee to the Database";
                                break;
                            }
                        }
                        
                    }
                    catch (Exception) {
                        tbMDisplayData.Text = "Error Displaying Total Fees";
                    }
                }
                else {
                    //if no contractors in database, display
                    tbMDisplayData.Text = "No Contractors entered into Dabase" + Environment.NewLine +
                            "Please commit atleast one Contractor to the Database";
                }
                sc.Close();
                break;
            }
        }
        catch (Exception) {
            tbMDisplayData.Text = "Error Displaying Total Fees";
        }
    }

    protected void btnMDisplayDriverEquipment_Click(object sender, EventArgs e) {
        //select data to show Equipment for each driver
        sqlQuery = "SELECT DRIVER.DRIVERID, FIRSTNAME, MIDDLEINITIAL, LASTNAME, "
                + "ID, VINNUMBER, MAKE, MODEL, EQUIPMENTYEAR, PRICEACQUIRED, LICENSENUMBER "
                + "FROM DRIVER "
                + "LEFT OUTER JOIN EQUIPMENT "
                + "ON DRIVER.DRIVERID = EQUIPMENT.DRIVERID "
                + "ORDER BY DRIVER.DRIVERID";
        sendDBCommand(sqlQuery);
        myReader = getSqlCommand.ExecuteReader();
        String displayDE = "";
        try {
            //if database has result, begin populating String
            while (myReader.Read()) {
                //populate string from database
                displayDE += myReader[0].ToString() + " - ";
                displayDE +=  myReader["FirstName"].ToString() + " ";
                if (myReader["MiddleInitial"].ToString() != "") {
                    displayDE += myReader["MiddleInitial"].ToString() + " ";
                }
                displayDE += myReader["LastName"].ToString() + "\t";
                //if no equipment for driver, skip, otherwise contine
                if (myReader["ID"].ToString() != "") {
                    displayDE += "Equipment Id: " + myReader["ID"].ToString() + "\t"; //id
                    displayDE += "Vin: " + myReader["VinNumber"].ToString() + "\t"; //vinNumber
                    if (myReader["Make"].ToString() != "")
                        displayDE += "Make: " + myReader["Make"].ToString() + "\t"; //Make
                    if (myReader["Model"].ToString() != "")
                        displayDE += "Model: " + myReader["Model"].ToString() + "\t"; //Model
                    if (myReader["EquipmentYear"].ToString() != "")
                        displayDE += "Year: " + myReader["EquipmentYear"].ToString() + "\t"; //equipmentYear
                    if (myReader["PriceAcquired"].ToString() != "")
                        displayDE += "Price Acquired: " + myReader["PriceAcquired"].ToString() + "\t"; //priceAcquired
                    if (myReader["LicenseNumber"].ToString() != "")
                        displayDE += "License Plate: " + myReader["LicenseNumber"].ToString() + "\n"; //licenseNumber
                    displayDE += Environment.NewLine;
                }
                else {
                    displayDE += Environment.NewLine;
                }
            }
            if (displayDE == "")
                displayDE = "No Drivers or Equipment in the database";
            tbMDisplayData.Text = displayDE;
            sc.Close();
        }
        catch (Exception) {
            tbMDisplayData.Text = "Error Displaying Drivers / Equipment";
        }
    }

    public TextBox DisplayOnMaster {
        get{
            return this.tbMDisplayData;
        }
    }

    public SqlCommand getSqlCommand {
        get {
            return this.myCommand;
        }
    }

    public SqlConnection getConnection {
        get {
            return this.sc;
        }
    }
    
    public String getCurrentTimestamp() {
        DateTime value = DateTime.Now;
        return value.ToString("MM/dd/yyyy");
    }

    public void sendDBCommand(String sqlQuery) {
        //try to connect
        try{
            //Create a new sql connection and links the application to the lab2 database
            sc.ConnectionString = ConfigurationManager.ConnectionStrings["Lab2ConnectionString"].ConnectionString;
            //@"Server=LOCALHOST;Database=Lab2;Trusted_Connection=Yes;";
            sc.Open();
            myCommand.Connection = sc;
            myCommand.CommandText = sqlQuery;
            myCommand.CommandType = CommandType.Text;
            myCommand.ExecuteNonQuery();

        }
        catch (Exception) {
            tbMDisplayData.Text = "Error Connecting to Database";
        }
    }


    public void callStoredProcedure() {
        //try to connect
        try{
            //Create a new sql connection and links the application to the lab2 database
            sc.ConnectionString = ConfigurationManager.ConnectionStrings["Lab2ConnectionString"].ConnectionString;
            //@"Server=LOCALHOST;Database=Lab2;Trusted_Connection=Yes;";
            String strprocName = "ZacharyCurry_Lab3";
            myCommand.CommandText = strprocName;
            myCommand.CommandType = CommandType.StoredProcedure;
            myCommand.Connection = sc;
            sc.Open();
            myCommand.ExecuteNonQuery();
            sc.Close();
        }
        catch (Exception) {
            tbMDisplayData.Text = "Error Connecting to Database Part 2";
        }
    }

    public void closeDB() {
        sc.Close();
    }
}
