<%@ Page Title="Driver" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DriverPage.aspx.cs" Inherits="DriverPage" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <!--
Zachary Curry

On my honor, I have neither given nor received any unauthorized assistance on
this academic work
-->
    <style type="text/css">
        .align-right {
            text-align: right;
        }
        .middleInitial {
            width: 36px;
        }
        .textBoxWidth {
            width: 100px;
        }
        .auto-style1 {
            height: 170px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table background-color: #FFFFFF>
        <tr>
            <td>
                <h2>Driver</h2>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td>
                <asp:Button
                    ID="btnDCommit"
                    Text="Commit"
                    OnClick="btnDCommit_Click"
                    TabIndex="17"
                    runat="server" />
            </td>
        </tr>
        <tr>
            <td
                class="align-right">
                Driver:
            </td>
            <td>
                <asp:TextBox
                    ID="tbDDriverID"
                    runat="server"
                    BackColor="#D5D5D5"
                    ReadOnly="True" />
            </td>
            <td
                class="align-right">
                <strong>Contractor</strong>:
            </td>
            <td>
                <asp:DropDownList
                    ID="ddDContractor"
                    runat="server"
                    TabIndex="8" />
                <asp:RequiredFieldValidator
                    ID="requiredContractor"
                    ControlToValidate="ddDContractor"
                    ErrorMessage="Contractor - REQUIRED"
                    SetFocusOnError="True"
                    InitialValue="Please select"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td
                class="align-right">
                <strong>First</strong> <strong>Name</strong>:
            </td>
            <td>
                <asp:TextBox
                    ID="tbDFirstName"
                    placeholder="20 characters max"
                    runat="server"
                    TabIndex="1" />
                <asp:RequiredFieldValidator
                    ID="requiredFN"
                    ControlToValidate="tbDFirstName"
                    ErrorMessage="First Name - REQUIRED"
                    SetFocusOnError="True"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="constraintFN"
                    ControlToValidate="tbDFirstName"
                    ErrorMessage="First Name - ONLY ALPHABETIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' -"
                    SetFocusOnError="True"
                    ValidationExpression="^[a-zA-Z'-]{1,99}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="lengthFN"
                    ControlToValidate="tbDFirstName"
                    ErrorMessage="First Name - TOO LONG"
                    SetFocusOnError="True"
                    ValidationExpression="^[\s\S]{0,20}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="noSpacesFN"
                    ControlToValidate="tbDFirstName"
                    ErrorMessage="First Name - NO SPACES ALLOWED"
                    SetFocusOnError="True"
                    ValidationExpression="[^\s]+"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td
                class="align-right">
                House Number:
            </td>
            <td>
                <asp:TextBox
                    ID="tbDHouseNumber"
                    Placeholder="Positive Integer"
                    runat="server" Height="22px"
                    TabIndex="9" />
                <asp:RegularExpressionValidator
                    ID="positiveHN"
                    ControlToValidate="tbDHouseNumber"
                    ErrorMessage="House Number - MUST BE POSITIVE INTEGER"
                    SetFocusOnError="True"
                    ValidationExpression="^\d+$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RangeValidator
                    ID="maxValueHN"
                    ControlToValidate="tbDHouseNumber"
                    ErrorMessage="House Number - MAX VALUE ALLOWED IS 2,147,483,647"
                    SetFocusOnError="True"
                    MinimumValue="0"
                    MaximumValue="2147483647"
                    Type="Integer"
                    Display="Dynamic"
                    Text="*"
                    Forecolor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="lengthHN"
                    ControlToValidate="tbDHouseNumber"
                    ErrorMessage="House Number - NO SPACES ALLOWED" 
                    ValidationExpression="[^\s]+"
                    SetFocusOnError="True"
                    Display="Dynamic"
                    Text="*" 
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td
                class="align-right">
                Hire Date:
            </td>
            <td>
                <asp:TextBox
                    ID="tbDHireDate"
                    Placeholder="MM/DD/YYYY"
                    runat="server"
                    TabIndex="15" />
                <asp:CompareValidator
                    ID="dateValHireDate"
                    ControlToValidate="tbDHireDate"
                    ErrorMessage="Hire Date - MUST BE A VALID DATE"
                    SetFocusOnError="True"
                    Type="Date"
                    Operator="DataTypeCheck"
                    Display="Dynamic"
                    Text="*"
                    Forecolor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="formatHireDate"
                    ControlToValidate="tbDHireDate"
                    ErrorMessage="Hire Date - INCORRECT FORMAT MM/DD/YYYY"
                    SetFocusOnError="True"
                    ValidationExpression="^\d{2}/\d{2}/\d{4}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:CompareValidator
                    ID="dateValHireAfterDOB"
                    ControlToValidate="tbDHireDate"
                    ErrorMessage="Hire Date - HIRE DATE MUST BE AFTER DATE OF BIRTH"
                    SetFocusOnError="True"
                    ControlToCompare="tbDDOB"
                    Type="Date"
                    Operator="GreaterThan"
                    Display="Dynamic"
                    Text="*" 
                    ForeColor="Red"
                    runat="server" />
            </td>
        </tr>
        <tr>
            <td
                class="align-right">
                MI:
            </td>
            <td>
                <asp:TextBox
                    ID="tbDMI"
                    runat="server"
                    CssClass="middleInitial"
                    TabIndex="2" />
                <asp:RegularExpressionValidator
                    ID="constraintMI"
                    ControlToValidate="tbDMI"
                    ErrorMessage="Middle Initial - ALPHABETIC CHARACTER ONLY"
                    SetFocusOnError="True"
                    ValidationExpression="^[a-zA-Z]{1,25}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="lengthMI"
                    ControlToValidate="tbDMI"
                    ErrorMessage="Middle Initial - TOO LONG"
                    SetFocusOnError="True"
                    ValidationExpression="^[\s\S]{1}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td
                class="align-right">
                Street:
            </td>
            <td>
                <asp:TextBox
                    ID="tbDStreet"
                    Placeholder="50 characters max"
                    runat="server"
                    TabIndex="10" />
                <asp:RegularExpressionValidator
                    ID="constraintStreet"
                    ControlToValidate="tbDStreet"
                    ErrorMessage="Street - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - / &"
                    SetFocusOnError="True"
                    ValidationExpression="[\d\sa-zA-Z'-/&]{1,99}$"
                    Display="Dynamic" 
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="validateCertainSpecialCharactersStreet"
                    ControlToValidate="tbDStreet"
                    ErrorMessage="Street - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - / &"
                    SetFocusOnError="True"
                    ValidationExpression="[^\*\(\)]{1,99}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="lengthStreet"
                    ControlToValidate="tbDStreet"
                    ErrorMessage="Street - TOO LONG"
                    SetFocusOnError="True"
                    ValidationExpression="^[\s\S]{0,50}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td
                class="align-right">
                Termination Date:
            </td>
            <td>
                <asp:TextBox
                    ID="tbDTerminationDate"
                    Placeholder="MM/DD/YYYY"
                    runat="server"
                    TabIndex="16" />
                <asp:CompareValidator
                    ID="dateValTerminationDate"
                    ControlToValidate="tbDTerminationDate"
                    ErrorMessage="Termination Date - MUST BE A VALID DATE"
                    SetFocusOnError="True"
                    Type="Date"
                    Operator="DataTypeCheck"
                    Display="Dynamic"
                    Text="*"
                    Forecolor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="formatTerminationDate"
                    ControlToValidate="tbDTerminationDate"
                    ErrorMessage="Termination Date - INCORRECT FORMAT MM/DD/YYYY"
                    SetFocusOnError="True"
                    ValidationExpression="^\d{2}/\d{2}/\d{4}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:CompareValidator
                    ID="dateValTerminateAfterHire"
                    ControlToValidate="tbDTerminationDate"
                    ErrorMessage="Termination Date - TERMINATION DATE MUST BE AFTER HIRE DATE"
                    SetFocusOnError="True"
                    ControlToCompare="tbDHireDate"
                    Type="Date"
                    Operator="GreaterThan"
                    Display="Dynamic"
                    Text="*" 
                    ForeColor="Red"
                    runat="server" />
                <asp:CompareValidator
                    ID="dateValTerminateAfterDOB"
                    ControlToValidate="tbDHireDate"
                    ErrorMessage="Termination Date - TERMINATION DATE MUST BE AFTER DATE OF BIRTH"
                    SetFocusOnError="True"
                    ControlToCompare="tbDDOB"
                    Type="Date"
                    Operator="GreaterThan"
                    Display="Dynamic"
                    Text="*" 
                    ForeColor="Red"
                    runat="server" />
            </td>
        </tr>
        <tr>
            <td
                class="align-right">
                <strong>Last</strong> <strong>Name</strong>:
            </td>
            <td>
                <asp:TextBox
                    ID="tbDLastName"
                    Placeholder="20 characters Max"
                    runat="server"
                    TabIndex="3" />
                <asp:RequiredFieldValidator
                    ID="requiredLN"
                    ControlToValidate="tbDLastName"
                    ErrorMessage="Last Name - REQUIRED"
                    SetFocusOnError="True"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="constraintLN"
                    ControlToValidate="tbDLastName"
                    ErrorMessage="Last Name - ONLY ALPHABETIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' -"
                    SetFocusOnError="True"
                    ValidationExpression="^[a-zA-Z'-]{1,999}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="lengthLN"
                    ControlToValidate="tbDLastName"
                    ErrorMessage="Last Name - TOO LONG"
                    ValidationExpression="^[\s\S]{0,20}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="noSpacesLN"
                    ControlToValidate="tbDLastName"
                    ErrorMessage="Last Name - NO SPACES ALLOWED" 
                    SetFocusOnError="True"
                    ValidationExpression="[^\s]+"
                    Display="Dynamic"
                    Text="*" 
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td
                class="align-right">
                City or County:
            </td>
            <td>
                <asp:TextBox
                    ID="tbDCityCounty"
                    Placeholder="40 characters max"
                    runat="server"
                    TabIndex="11" />
                <asp:RegularExpressionValidator
                    ID="lengthCityCountry"
                    ControlToValidate="tbDCityCounty"
                    ErrorMessage="City/County - TOO LONG"
                    SetFocusOnError="True"
                    ValidationExpression="^[\s\S]{1,40}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                 <asp:RegularExpressionValidator
                    ID="constraintCityCounty"
                    ControlToValidate="tbDCityCounty"
                    ErrorMessage="City/County - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - /&"
                    SetFocusOnError="True"
                    ValidationExpression="^[\d\sa-zA-Z'-/&]{1,99}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="validateCertainSpecialCharactersCityCounty"
                    ControlToValidate="tbDCityCounty"
                    ErrorMessage="City/County - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - / &"
                    SetFocusOnError="True"
                    ValidationExpression="[^\*\(\)]{1,99}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
            </td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td ></td>
            <td></td>
            <td
                class="align-right">
                State:
            </td>
            <td>
                <asp:DropDownList
                    ID="ddDState"
                    runat="server"
                    TabIndex="12" />
            </td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td
                class="align-right">
                Salary:
            </td>
            <td>
                <asp:TextBox
                    ID="tbDSalary"
                    Placeholder="99999999.99 max"
                    runat="server"
                    TabIndex="4" />
                <asp:RegularExpressionValidator
                    ID="constraintSalary"
                    ControlToValidate="tbDSalary"
                    ErrorMessage="Salary - MUST BE NUMERIC (2 DECIMALS IF SHOWING CENTS) // NO COMMAS 
                            // INCORRECT FORMAT // MAX VALUE ALLOWED = 99999999.99 // POSITIVE VALUES ONLY"
                    SetFocusOnError="True"
                    ValidationExpression="(?!\.?$)\d{0,8}(\.\d{0,2})?$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="noSpacesSalary"
                    ControlToValidate="tbDSalary"
                    ErrorMessage="Salary - NO SPACES ALLOWED" 
                    SetFocusOnError="True"
                    ValidationExpression="[^\s]+"
                    Display="Dynamic"
                    Text="*" 
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td
                class="align-right">
                Zip Code:
            </td>
            <td>
                <asp:TextBox
                    ID="tbDZipCode"
                    Placeholder="5 Digits"
                    runat="server"
                    TabIndex="13" />
                <asp:RegularExpressionValidator
                    ID="constraintFee"
                    ControlToValidate="tbDZipCode"
                    ErrorMessage="Fee - MUST BE NUMERIC (2 DECIMALS IF SHOWING CENTS) // NO COMMAS 
                            // INCORRECT FORMAT // MAX VALUE ALLOWED = 999999.99 // POSITIVE VALUES ONLY"
                    SetFocusOnError="True"
                    ValidationExpression="(?!\.?$)\d{0,6}(\.\d{0,2})?$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="noSpacesZipCode"
                    ControlToValidate="tbDZipCode"
                    ErrorMessage="Fee - NO SPACES ALLOWED" 
                    SetFocusOnError="True"
                    ValidationExpression="[^\s]+"
                    Display="Dynamic"
                    Text="*" 
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td></td>
            <td>
                <asp:Label
                    ID="lblDAge"
                    runat="server" />
            </td>
        </tr>
        <tr>
            <td
                class="align-right">
                <strong>Date of Birth: </strong>
            </td>
            <td>
                <asp:TextBox
                    ID="tbDDOB"
                    Placeholder="MM/DD/YYYY"
                    runat="server"
                    TabIndex="5" />
                <asp:RequiredFieldValidator
                    ID="requiredDOB"
                    ControlToValidate="tbDDOB"
                    ErrorMessage="Date of Birth - REQUIRED"
                    SetFocusOnError="True"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:CompareValidator
                    ID="dateValDOB"
                    ControlToValidate="tbDDOB"
                    ErrorMessage="Date of Birth - MUST BE A VALID DATE"
                    SetFocusOnError="True"
                    Type="Date"
                    Operator="DataTypeCheck"
                    Display="Dynamic"
                    Text="*"
                    Forecolor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="formatDOB"
                    ControlToValidate="tbDDOB"
                    ErrorMessage="Date of Birth - INCORRECT FORMAT MM/DD/YYYY"
                    SetFocusOnError="True"
                    ValidationExpression="^\d{2}/\d{2}/\d{4}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:CompareValidator
                    ID="dateVal25YearsOld"
                    ControlToValidate="tbDDOB"
                    ErrorMessage="Date of Birth - DRIVER TOO YOUNG / MUST BE ATLEAST 25 YEARS OLD"
                    SetFocusOnError="True"
                    Type="Date"
                    Operator="LessThan"
                    Display="Dynamic"
                    Text="*" 
                    ForeColor="Red"
                    runat="server" />
                <asp:CompareValidator
                    ID="dateVal75YearsOld"
                    ControlToValidate="tbDDOB"
                    ErrorMessage="Date of Birth - DRIVER TOO OLD / MUST YOUNGER THAN 75 YEARS OLD"
                    SetFocusOnError="True"
                    Type="Date"
                    Operator="GreaterThan"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td
                class="align-right">
                Country:
            </td>
            <td>
                <asp:DropDownList
                    ID="ddDCountry"
                    runat="server"
                    TabIndex="14" />
            </td>
            <td
                class="align-right">
                <asp:Label
                    ID="lblDriverName"
                    runat="server" />
            </td>
            <td>
                <asp:Label
                    ID="lblDriverAge"
                    runat="server" />
            </td>
        </tr>
        <tr>
            <td
                class="align-right">
                CDL ID:
            </td>
            <td>
                <asp:TextBox
                    ID="tbDCDL"
                    Placeholder="40 characters max"
                    runat="server"
                    TabIndex="6" />
                <asp:RegularExpressionValidator
                    ID="lengthCDL"
                    ControlToValidate="tbDCDL"
                    ErrorMessage="City/County - TOO LONG"
                    SetFocusOnError="True"
                    ValidationExpression="^[\s\S]{1,40}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                 <asp:RegularExpressionValidator
                    ID="constraintCDL"
                    ControlToValidate="tbDCDL"
                    ErrorMessage="City/County - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE:  -"
                    SetFocusOnError="True"
                    ValidationExpression="^[\d\sa-zA-Z-]{1,99}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="specialCharactersCC"
                    ControlToValidate="tbDCDL"
                    ErrorMessage="City/County - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: -"
                    SetFocusOnError="True"
                    ValidationExpression="[^\*\(\)]{1,99}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td
                class="align-right">
                CDL Experation Date:
            </td>
            <td>
                <asp:TextBox
                    ID="tbDCDLExperationDate"
                    Placeholder="MM/DD/YYYY"
                    runat="server"
                    TabIndex="7" />
                <asp:CompareValidator
                    ID="dateValCDLExperation1"
                    ControlToValidate="tbDCDLExperationDate"
                    ErrorMessage="CDL Experation Date - MUST BE A VALID DATE"
                    SetFocusOnError="True"
                    Type="Date"
                    Operator="DataTypeCheck"
                    Display="Dynamic"
                    Text="*"
                    Forecolor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="formatCDLExperation"
                    ControlToValidate="tbDCDLExperationDate"
                    ErrorMessage="CDL Experation Date - INCORRECT FORMAT MM/DD/YYYY"
                    SetFocusOnError="True"
                    ValidationExpression="^\d{2}/\d{2}/\d{4}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                 <asp:CompareValidator
                    ID="dateValTodayCDLExperation"
                    ControlToValidate="tbDCDLExperationDate"
                    ErrorMessage="CDL Experation Date - CDL CANNOT BE EXPIRED"
                    SetFocusOnError="True"
                    Type="Date"
                    Operator="GreaterThan"
                    Display="Dynamic"
                    Text="*" 
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td colspan="6">
                <asp:ValidationSummary
                    ID="valSum"
                    DisplayMode="BulletList"
                    ShowMessageBox="false"
                    ShowSummary="true" 
                    HeaderText="Please correct these errors on the form:"
                    Font-Names="verdana" 
                    Font-Size="12"
                    runat="server" />
                </td>
        </tr>
        <tr>
            <td colspan="6" class="auto-style1">
                <asp:GridView
                    ID="tableDriver"
                    DataSourceID="SqlDataSourceDriver"
                    SortExpression="DriverID"
                    EmptyDataText="No records in Driver Table"
                    runat="server"
                    AutoGenerateColumns="False"
                    DataKeyNames="DriverID"
                    OnRowUpdated="tableDriver_RowUpdated"
                    OnRowDeleted="tableDriver_RowDeleted"
                    AutoGenerateEditButton="True"
                    AutoGenerateDeleteButton="True">
                    <Columns>
                        <asp:BoundField DataField="DriverID" HeaderText="DriverID" InsertVisible="False" ReadOnly="True" SortExpression="DriverID" />
                        <asp:TemplateField HeaderText="FirstName" SortExpression="FirstName">
                            <EditItemTemplate>
                                <asp:TextBox
                                    ID="tbEditFirstName"
                                    Class="textBoxWidth"
                                    runat="server"
                                    Text='<%# Bind("FirstName") %>' />
                                <asp:RequiredFieldValidator
                                    ID="requiredFNe"
                                    ControlToValidate="tbEditFirstName"
                                    ErrorMessage="First Name - REQUIRED"
                                    SetFocusOnError="True"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red"
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="constraintFNe"
                                    ControlToValidate="tbEditFirstName"
                                    ErrorMessage="First Name - ONLY ALPHABETIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' -"
                                    SetFocusOnError="True"
                                    ValidationExpression="^[a-zA-Z'-]{1,99}$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red"
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="lengthFNe"
                                    ControlToValidate="tbEditFirstName"
                                    ErrorMessage="First Name - TOO LONG"
                                    SetFocusOnError="True"
                                    ValidationExpression="^[\s\S]{0,20}$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red"
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="noSpacesFNe"
                                    ControlToValidate="tbEditFirstName"
                                    ErrorMessage="First Name - NO SPACES ALLOWED"
                                    SetFocusOnError="True"
                                    ValidationExpression="[^\s]+"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red"
                                    runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label
                                    ID="Label1"
                                    runat="server"
                                    Text='<%# Bind("FirstName") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="MI" SortExpression="MiddleInitial">
                            <EditItemTemplate>
                                <asp:TextBox
                                    ID="tbEditMiddleInitial"
                                    Width="30px"
                                    runat="server"
                                    Text='<%# Bind("MiddleInitial") %>' />
                                <asp:RegularExpressionValidator
                                    ID="constraintMIe"
                                    ControlToValidate="tbEditMiddleInitial"
                                    ErrorMessage="Middle Initial - ALPHABETIC CHARACTER ONLY"
                                    SetFocusOnError="True"
                                    ValidationExpression="^[a-zA-Z]{1,25}$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red"
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="lengthMIe"
                                    ControlToValidate="tbEditMiddleInitial"
                                    ErrorMessage="Middle Initial - TOO LONG"
                                    SetFocusOnError="True"
                                    ValidationExpression="^[\s\S]{1}$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red"
                                    runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label
                                    ID="Label3"
                                    runat="server"
                                    Text='<%# Bind("MiddleInitial") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="LastName" SortExpression="LastName">
                            <EditItemTemplate>
                                <asp:TextBox
                                    ID="tbEditLastName"
                                    Class="textBoxWidth"
                                    runat="server"
                                    Text='<%# Bind("LastName") %>' />
                                <asp:RequiredFieldValidator
                                    ID="requiredLNe"
                                    ControlToValidate="tbEditLastName"
                                    ErrorMessage="Last Name - REQUIRED"
                                    SetFocusOnError="True"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red"
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="constraintLNe"
                                    ControlToValidate="tbEditLastName"
                                    ErrorMessage="Last Name - ONLY ALPHABETIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' -"
                                    SetFocusOnError="True"
                                    ValidationExpression="^[a-zA-Z'-]{1,999}$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red"
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="lengthLNe"
                                    ControlToValidate="tbEditLastName"
                                    ErrorMessage="Last Name - TOO LONG"
                                    ValidationExpression="^[\s\S]{0,20}$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red"
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="noSpacesLNe"
                                    ControlToValidate="tbEditLastName"
                                    ErrorMessage="Last Name - NO SPACES ALLOWED" 
                                    SetFocusOnError="True"
                                    ValidationExpression="[^\s]+"
                                    Display="Dynamic"
                                    Text="*" 
                                    ForeColor="Red"
                                    runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label
                                    ID="Label2"
                                    runat="server"
                                    Text='<%# Bind("LastName") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="HouseNumber" SortExpression="HouseNumber">
                            <EditItemTemplate>
                                <asp:TextBox
                                    ID="tbEditHouseNumber"
                                    Placeholder="Positive Integer"
                                    Class="textBoxWidth"
                                    runat="server"
                                    Text='<%# Bind("HouseNumber") %>' />
                                <asp:RegularExpressionValidator
                                    ID="positiveHNe"
                                    ControlToValidate="tbEditHouseNumber"
                                    ErrorMessage="House Number - MUST BE POSITIVE INTEGER"
                                    SetFocusOnError="True"
                                    ValidationExpression="^\d+$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red" 
                                    runat="server" />
                                <asp:RangeValidator
                                    ID="maxValueHNe"
                                    ControlToValidate="tbEditHouseNumber"
                                    ErrorMessage="House Number - MAX VALUE ALLOWED IS 2,147,483,647"
                                    SetFocusOnError="True"
                                    MinimumValue="0"
                                    MaximumValue="2147483647"
                                    Type="Integer"
                                    Display="Dynamic"
                                    Text="*"
                                    Forecolor="Red"
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="lengthHNe"
                                    ControlToValidate="tbEditHouseNumber"
                                    ErrorMessage="House Number - NO SPACES ALLOWED" 
                                    ValidationExpression="[^\s]+"
                                    SetFocusOnError="True"
                                    Display="Dynamic"
                                    Text="*" 
                                    ForeColor="Red"
                                    runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label
                                    ID="Label4"
                                    runat="server"
                                    Text='<%# Bind("HouseNumber") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Street" SortExpression="Street">
                            <EditItemTemplate>
                                <asp:TextBox
                                    ID="tbEditStreet"
                                    Placeholder="50 characters max"
                                    Class="textBoxWidth"
                                    runat="server"
                                    Text='<%# Bind("Street") %>' />
                                <asp:RegularExpressionValidator
                                    ID="constraintStreete"
                                    ControlToValidate="tbEditStreet"
                                    ErrorMessage="Street - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - / &"
                                    SetFocusOnError="True"
                                    ValidationExpression="[\d\sa-zA-Z'-/&]{1,99}$"
                                    Display="Dynamic" 
                                    Text="*"
                                    ForeColor="Red" 
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="validateCertainSpecialCharactersStreete"
                                    ControlToValidate="tbEditStreet"
                                    ErrorMessage="Street - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - / &"
                                    SetFocusOnError="True"
                                    ValidationExpression="[^\*\(\)]{1,99}$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red" 
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="lengthStreete"
                                    ControlToValidate="tbEditStreet"
                                    ErrorMessage="Street - TOO LONG"
                                    SetFocusOnError="True"
                                    ValidationExpression="^[\s\S]{0,50}$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red"
                                    runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label
                                    ID="Label5"
                                    runat="server"
                                    Text='<%# Bind("Street") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="CityCounty" SortExpression="CityCounty">
                            <EditItemTemplate>
                                <asp:TextBox
                                    ID="tbEditCityCounty"
                                    Placeholder="40 characters max"
                                    Class="textBoxWidth"
                                    runat="server"
                                    Text='<%# Bind("CityCounty") %>' />
                                <asp:RegularExpressionValidator
                                    ID="lengthCityCountrye"
                                    ControlToValidate="tbEditCityCounty"
                                    ErrorMessage="City/County - TOO LONG"
                                    SetFocusOnError="True"
                                    ValidationExpression="^[\s\S]{1,40}$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red"
                                    runat="server" />
                                 <asp:RegularExpressionValidator
                                    ID="constraintCityCountye"
                                    ControlToValidate="tbEditCityCounty"
                                    ErrorMessage="City/County - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - /&"
                                    SetFocusOnError="True"
                                    ValidationExpression="^[\d\sa-zA-Z'-/&]{1,99}$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red" 
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="validateCertainSpecialCharactersCityCountye"
                                    ControlToValidate="tbEditCityCounty"
                                    ErrorMessage="City/County - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - / &"
                                    SetFocusOnError="True"
                                    ValidationExpression="[^\*\(\)]{1,99}$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red" 
                                    runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label
                                    ID="Label6"
                                    runat="server"
                                    Text='<%# Bind("CityCounty") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="State" SortExpression="StateAbb">
                            <EditItemTemplate>
                                <asp:DropDownList
                                    ID="ddEditState"
                                    runat="server"
                                    DataSourceID="ddStateDS"
                                    DataTextField="StateName"
                                    DataValueField="StateAbb"
                                    AppendDataBoundItems="True"
                                    SelectedValue='<%# Bind("StateAbb") %>'>
                                    <asp:ListItem
                                        Text=""
                                        Value="" />
                                </asp:DropDownList>
                                <asp:SqlDataSource
                                    ID="ddStateDS"
                                    runat="server"
                                    ConnectionString="<%$ ConnectionStrings:Lab2ConnectionString %>"
                                    SelectCommand="SELECT [StateAbb], [StateName] FROM [HomeState]">
                                </asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label
                                    ID="Label7"
                                    runat="server"
                                    Text='<%# Bind("StateAbb") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Country" SortExpression="CountryAbb">
                            <EditItemTemplate>
                                <asp:DropDownList
                                    ID="ddEditCountry"
                                    runat="server"
                                    DataSourceID="ddCountryDS"
                                    DataTextField="CountryName"
                                    DataValueField="CountryAbb"
                                    AppendDataBoundItems="True"
                                    SelectedValue='<%# Bind("CountryAbb") %>'>
                                    <asp:ListItem
                                        Text=""
                                        Value="" />
                                </asp:DropDownList>
                                <asp:SqlDataSource
                                    ID="ddCountryDS"
                                    runat="server"
                                    ConnectionString="<%$ ConnectionStrings:Lab2ConnectionString %>"
                                    SelectCommand="SELECT [CountryAbb], [CountryName] FROM [Country]">
                                </asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label
                                    ID="Label8"
                                    runat="server"
                                    Text='<%# Bind("CountryAbb") %>'>
                                </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ZipCode" SortExpression="ZipCode">
                            <EditItemTemplate>
                                <asp:TextBox
                                    ID="tbEditZipCode"
                                    Placeholder="5 Digits"
                                    Class="textBoxWidth"
                                    runat="server"
                                    Text='<%# Bind("ZipCode") %>' />
                                <asp:RegularExpressionValidator
                                    ID="constraintFeee"
                                    ControlToValidate="tbEditZipCode"
                                    ErrorMessage="Fee - MUST BE NUMERIC (2 DECIMALS IF SHOWING CENTS) // NO COMMAS 
                                            // INCORRECT FORMAT // MAX VALUE ALLOWED = 999999.99 // POSITIVE VALUES ONLY"
                                    SetFocusOnError="True"
                                    ValidationExpression="(?!\.?$)\d{0,6}(\.\d{0,2})?$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red" 
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="noSpacesZipCodee"
                                    ControlToValidate="tbEditZipCode"
                                    ErrorMessage="Fee - NO SPACES ALLOWED" 
                                    SetFocusOnError="True"
                                    ValidationExpression="[^\s]+"
                                    Display="Dynamic"
                                    Text="*" 
                                    ForeColor="Red"
                                    runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label
                                    ID="Label9" 
                                    runat="server"
                                    Text='<%# Bind("ZipCode") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="DOB" SortExpression="DateOfBirth">
                            <EditItemTemplate>
                                <asp:TextBox
                                    ID="tbEditDateOfBirth"
                                    Class="textBoxWidth"
                                    runat="server"
                                    Text='<%# Bind("DateOfBirth", "{0:d}") %>' />
                                <asp:RequiredFieldValidator
                                    ID="requiredDOBe"
                                    ControlToValidate="tbEditDateOfBirth"
                                    ErrorMessage="Date of Birth - REQUIRED"
                                    SetFocusOnError="True"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red"
                                    runat="server" />
                                <asp:CompareValidator
                                    ID="dateValDOBe"
                                    ControlToValidate="tbEditDateOfBirth"
                                    ErrorMessage="Date of Birth - MUST BE A VALID DATE"
                                    SetFocusOnError="True"
                                    Type="Date"
                                    Operator="DataTypeCheck"
                                    Display="Dynamic"
                                    Text="*"
                                    Forecolor="Red"
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="formatDOBe"
                                    ControlToValidate="tbEditDateOfBirth"
                                    ErrorMessage="Date of Birth - INCORRECT FORMAT MM/DD/YYYY"
                                    SetFocusOnError="True"
                                    ValidationExpression="^\d{2}/\d{2}/\d{4}$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red"
                                    runat="server" />
                                <asp:CompareValidator
                                    ID="dateVal25YearsOlde"
                                    ControlToValidate="tbEditDateOfBirth"
                                    ErrorMessage="Date of Birth - DRIVER TOO YOUNG / MUST BE ATLEAST 25 YEARS OLD"
                                    SetFocusOnError="True"
                                    Type="Date"
                                    Operator="LessThan"
                                    Display="Dynamic"
                                    valuetocompare="<%# DateTime.Today.AddYears(-25).AddDays(1).ToShortDateString() %>"
                                    Text="*" 
                                    ForeColor="Red"
                                    runat="server" />
                                <asp:CompareValidator
                                    ID="dateVal75YearsOlde"
                                    ControlToValidate="tbEditDateOfBirth"
                                    ErrorMessage="Date of Birth - DRIVER TOO OLD / MUST YOUNGER THAN 75 YEARS OLD"
                                    SetFocusOnError="True"
                                    Type="Date"
                                    Operator="GreaterThan"
                                    Display="Dynamic"
                                    valuetocompare="<%# DateTime.Today.AddYears(-75).ToShortDateString() %>"
                                    Text="*"
                                    ForeColor="Red"
                                    runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label
                                    ID="Label10"
                                    runat="server"
                                    Text='<%# Bind("DateOfBirth", "{0:d}") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="CDL" SortExpression="CDL">
                            <EditItemTemplate>
                                <asp:TextBox
                                    ID="tbEditCDL"
                                    Placeholder="40 characters max"
                                    Class="textBoxWidth"
                                    runat="server"
                                    Text='<%# Bind("CDL") %>' />
                                <asp:RegularExpressionValidator
                                    ID="lengthCDLe"
                                    ControlToValidate="tbEditCDL"
                                    ErrorMessage="City/County - TOO LONG"
                                    SetFocusOnError="True"
                                    ValidationExpression="^[\s\S]{1,40}$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red"
                                    runat="server" />
                                    <asp:RegularExpressionValidator
                                    ID="constraintCDLe"
                                    ControlToValidate="tbEditCDL"
                                    ErrorMessage="City/County - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE:  -"
                                    SetFocusOnError="True"
                                    ValidationExpression="^[\d\sa-zA-Z-]{1,99}$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red" 
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="specialCharactersCCe"
                                    ControlToValidate="tbEditCDL"
                                    ErrorMessage="City/County - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: -"
                                    SetFocusOnError="True"
                                    ValidationExpression="[^\*\(\)]{1,99}$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red" 
                                    runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label
                                    ID="Label11"
                                    runat="server"
                                    Text='<%# Bind("CDL") %>' /> 
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="CDLDate" SortExpression="CDLDate">
                            <EditItemTemplate>
                                <asp:TextBox
                                    ID="tbEditCDLDate"
                                    Placeholder="MM/DD/YYYY"
                                    Class="textBoxWidth"
                                    runat="server"
                                    Text='<%# Bind("CDLDate", "{0:d}") %>' />
                                <asp:CompareValidator
                                    ID="dateValCDLExperatione"
                                    ControlToValidate="tbEditCDLDate"
                                    ErrorMessage="CDL Experation Date - MUST BE A VALID DATE"
                                    SetFocusOnError="True"
                                    Type="Date"
                                    Operator="DataTypeCheck"
                                    Display="Dynamic"
                                    Text="*"
                                    Forecolor="Red"
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="formatCDLExperatione"
                                    ControlToValidate="tbEditCDLDate"
                                    ErrorMessage="CDL Experation Date - INCORRECT FORMAT MM/DD/YYYY"
                                    SetFocusOnError="True"
                                    ValidationExpression="^\d{2}/\d{2}/\d{4}$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red"
                                    runat="server" />
                                 <asp:CompareValidator
                                    ID="dateValTodayCDLExperatione"
                                    ControlToValidate="tbEditCDLDate"
                                    ErrorMessage="CDL Experation Date - CDL CANNOT BE EXPIRED"
                                    SetFocusOnError="True"
                                    Type="Date"
                                    Operator="GreaterThan"
                                    Display="Dynamic"
                                    valuetocompare="<%# DateTime.Today.ToShortDateString() %>"
                                    Text="*" 
                                    ForeColor="Red"
                                    runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label
                                    ID="Label12"
                                    runat="server"
                                    Text='<%# Bind("CDLDate", "{0:d}") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="LastUpdatedBy" SortExpression="LastUpdatedBy">
                            <EditItemTemplate>
                                <asp:Label
                                    ID="lblEditLastUpdatedBy"
                                    runat="server"
                                    Text='<%# Bind("LastUpdatedBy") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label
                                    ID="Label13"
                                    runat="server"
                                    Text='<%# Bind("LastUpdatedBy") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="LastUpdated" SortExpression="LastUpdated">
                            <EditItemTemplate>
                                <asp:Label
                                    ID="lblEditLastUpdated"
                                    runat="server"
                                    Text='<%# Bind("LastUpdated", "{0:d}") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label
                                    ID="Label14"
                                    runat="server"
                                    Text='<%# Bind("LastUpdated", "{0:d}") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource
                    ID="SqlDataSourceDriver"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:Lab2ConnectionString %>"
                    SelectCommand="SELECT * FROM [Driver]"
                    UpdateCommand="UPDATE Driver SET
                                FirstName = @firstName,
                                LastName = @lastName,
                                MiddleInitial = @middleInital,
                                HouseNumber = @houseNumber,
                                Street = @street,
                                CityCounty = @cityCounty,
                                StateAbb = @stateAbb,
                                CountryAbb = @countryAbb,
                                ZipCode = @zipCode,
                                LastUpdated = @lastUpdated,
                                LastUpdatedBy = @lastUpdatedBy,
                                DateOfBirth = @dateOfBirth,
                                CDL = @cDL,
                                CDLDate = @cDLDate
                                WHERE DriverID = @driverID"
                    DeleteCommand= "DELETE FROM EQUIPMENT WHERE (DriverID = @driverID)
                                    DELETE FROM DRIVERCONTRACTOR WHERE (DriverID = @driverID)
                                    DELETE FROM DRIVER WHERE (DriverID = @driverID)" >
                    <UpdateParameters>
                        <asp:Parameter Name="driverID" Type="Int32" />
                        <asp:Parameter Name="firstName" Type="String" />
                        <asp:Parameter Name="lastName" Type="String" />
                        <asp:Parameter Name="middleInital" Type="String" />
                        <asp:Parameter Name="houseNumber" Type="Int32" />
                        <asp:Parameter Name="street" Type="String" />
                        <asp:Parameter Name="cityCounty" Type="String" />
                        <asp:Parameter Name="stateAbb" Type="String" />
                        <asp:Parameter Name="countryAbb" Type="String" />
                        <asp:Parameter Name="zipCode" Type="String" />
                        <asp:Parameter Name="lastUpdated" Type="String" />
                        <asp:Parameter Name="lastUpdatedBy" Type="String" />
                        <asp:Parameter Name="dateOfBirth" Type="String" />
                        <asp:Parameter Name="cDL" Type="String" />
                        <asp:Parameter Name="cDLDate" Type="String" />
                    </UpdateParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="driverID" />
                    </DeleteParameters>
                </asp:SqlDataSource>
                </td>
        </tr>
        <tr>
            <td colspan="6">
                <asp:GridView
                    ID="tableDriverContractor"
                    DataSourceID="SqlDataSourceDriverContractor"
                    SortExpression="ContractorID"
                    EmptyDataText="No records in DriverContractor Table"
                    AutoGenerateColumns="False"
                    runat="server" >
                    <Columns>
                        <asp:BoundField DataField="ContractorID" HeaderText="Contractor" InsertVisible="False" ReadOnly="True" SortExpression="ContractorID" />
                        <asp:BoundField DataField="FirstName" HeaderText="First" SortExpression="FirstName" />
                        <asp:BoundField DataField="MiddleInitial" HeaderText="MI" SortExpression="MiddleInitial" />
                        <asp:BoundField DataField="LastName" HeaderText="Last" SortExpression="LastName" />
                        <asp:BoundField DataField="DriverID" HeaderText="Driver" SortExpression="DriverID" />
                        <asp:BoundField DataField="FirstName1" HeaderText="First" SortExpression="FirstName1" />
                        <asp:BoundField DataField="MiddleInitial1" HeaderText="Middle" SortExpression="MiddleInitial1" />
                        <asp:BoundField DataField="LastName1" HeaderText="Last" SortExpression="LastName1" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource
                    ID="SqlDataSourceDriverContractor"
                    runat="server"
                    ConnectionString="Server=LOCALHOST;Database=Lab2;Trusted_Connection=Yes;"
                    SelectCommand="SELECT A.ContractorID, A.FirstName,
                                        A.MiddleInitial, a.LastName,
	                                    B.DriverID, C.FirstName,
                                        C.MiddleInitial, C.LastName
                                    FROM CONTRACTOR A
                                    LEFT OUTER JOIN DriverContractor B
                                    ON A.ContractorID = B.ContractorID
                                    LEFT OUTER JOIN DRIVER C
                                    ON B.DriverID = C.DriverID
                                    ORDER BY A.ContractorID" />
                </td>
        </tr>
    </table>
</asp:Content>