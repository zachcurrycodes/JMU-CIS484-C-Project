<%@ Page Title="Equipment" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EquipmentPage.aspx.cs" Inherits="EquipmentPage" %>
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
    .textBoxWidth {
            width: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    Runat="Server">
    <table background-color: #FFFFFF>
        <tr>
            <td>
                <h2>Equipment</h2>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td>
                <asp:Button
                    ID="btnECommit"
                    Text="Commit"
                    style="height: 26px"
                    OnClick="btnECommit_Click"
                    TabIndex="8"
                    runat="server" />
            </td>
        </tr>
        <tr>
            <td
                class="align-right">
                Equipment ID:
            </td>
            <td>
                <asp:TextBox
                    ID="tbEEquipmentID"
                    runat="server"
                    BackColor="#D5D5D5"
                    ReadOnly="True" />
            </td>
            <td
                class="align-right">
                <strong>Driver</strong>:
            </td>
            <td>
                <asp:DropDownList
                    ID="ddEDriver"
                    runat="server"
                    TabIndex="4" />
                <asp:RequiredFieldValidator
                    ID="requiredDriver"
                    ControlToValidate="ddEDriver"
                    ErrorMessage="Contractor - REQUIRED"
                    SetFocusOnError="True"
                    InitialValue="Please select"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td></td>
        </tr>
        <tr>
            <td
                class="align-right">
                <strong>Vin</strong>:
            </td>
            <td>
                <asp:TextBox
                    ID="tbEVin"
                    Placeholder="40 characters max"
                    runat="server"
                    TabIndex="1" />
                <asp:RequiredFieldValidator
                    ID="requiredVin"
                    ControlToValidate="tbEVin"
                    ErrorMessage="Vin - REQUIRED"
                    SetFocusOnError="True"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="constraintVin"
                    ControlToValidate="tbEVin"
                    ErrorMessage="First Name - ONLY ALPHABETIC AND NUMERIC CHARACTERS // ONLY SPECIAL CHARACTERS ALLOWED: ' -"
                    SetFocusOnError="True"
                    ValidationExpression="^[\da-zA-Z'-]{1,99}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="lengthVin"
                    ControlToValidate="tbEVin"
                    ErrorMessage="First Name - TOO LONG"
                    SetFocusOnError="True"
                    ValidationExpression="^[\s\S]{0,40}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="noSpacesVin"
                    ControlToValidate="tbEVin"
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
                Year:
            </td>
            <td>
                <asp:TextBox
                    ID="tbEYear"
                    Placeholder="YYYY"
                    runat="server"
                    TabIndex="5" />
                <asp:RegularExpressionValidator
                    ID="constraintYear"
                    ControlToValidate="tbEYear"
                    ErrorMessage="Year - ENTER A YEAR IN YYYY FORMAT"
                    SetFocusOnError="True"
                    ValidationExpression="[\d]{4}$"
                    Display="Dynamic" 
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RangeValidator
                    ID="maxValueYear"
                    ControlToValidate="tbEYear"
                    ErrorMessage="Year - ENTER A YEAR BEFORE 2019"
                    SetFocusOnError="True"
                    MinimumValue="0"
                    MaximumValue="2019"
                    Type="Integer"
                    Display="Dynamic"
                    Text="*"
                    Forecolor="Red"
                    runat="server" />
            </td>
            <td></td>
        </tr>
        <tr>
            <td
                class="align-right">
                Make:
            </td>
            <td>
                <asp:TextBox
                    ID="tbEMake"
                    Placeholder="35 characters max"
                    runat="server"
                    TabIndex="2" />
                 <asp:RegularExpressionValidator
                    ID="constraintMake"
                    ControlToValidate="tbEMake"
                    ErrorMessage="Make - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - / &"
                    SetFocusOnError="True"
                    ValidationExpression="[\d\sa-zA-Z'-/&]{1,99}$"
                    Display="Dynamic" 
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="validateCertainSpecialCharactersMake"
                    ControlToValidate="tbEMake"
                    ErrorMessage="Make - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - / &"
                    SetFocusOnError="True"
                    ValidationExpression="[^\*\(\)]{1,99}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="lengthMake"
                    ControlToValidate="tbEMake"
                    ErrorMessage="Make - TOO LONG"
                    SetFocusOnError="True"
                    ValidationExpression="^[\s\S]{0,35}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td
                class="align-right">
                Price Acquired:
            </td>
            <td>
                <asp:TextBox
                    ID="tbEPriceAcquired"
                    Placeholder="999999.99 max"
                    runat="server"
                    TabIndex="6" />
                <asp:RegularExpressionValidator
                    ID="constraintPriceAcquired"
                    ControlToValidate="tbEPriceAcquired"
                    ErrorMessage="Price Acquired - MUST BE NUMERIC (2 DECIMALS IF SHOWING CENTS) // NO COMMAS 
                            // INCORRECT FORMAT // MAX VALUE ALLOWED = 999999.99 // POSITIVE VALUES ONLY"
                    SetFocusOnError="True"
                    ValidationExpression="(?!\.?$)\d{0,6}(\.\d{0,2})?$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="noSpacesPriceAcquired"
                    ControlToValidate="tbEPriceAcquired"
                    ErrorMessage="Price Acquired - NO SPACES ALLOWED" 
                    SetFocusOnError="True"
                    ValidationExpression="[^\s]+"
                    Display="Dynamic"
                    Text="*" 
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td></td>
        </tr>
        <tr>
            <td
                class="align-right">
                Model:
            </td>
            <td>
                <asp:TextBox
                    ID="tbEModel"
                    Placeholder="30 characters max"
                    runat="server"
                    TabIndex="3" />
                <asp:RegularExpressionValidator
                    ID="constraintModel"
                    ControlToValidate="tbEModel"
                    ErrorMessage="Model - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - / &"
                    SetFocusOnError="True"
                    ValidationExpression="[\d\sa-zA-Z'-/&]{1,99}$"
                    Display="Dynamic" 
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="validateCertainSpecialCharactersModel"
                    ControlToValidate="tbEModel"
                    ErrorMessage="Model - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - / &"
                    SetFocusOnError="True"
                    ValidationExpression="[^\*\(\)]{1,99}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="lengthModel"
                    ControlToValidate="tbEModel"
                    ErrorMessage="Model - TOO LONG"
                    SetFocusOnError="True"
                    ValidationExpression="^[\s\S]{0,30}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td
                class="align-right">
                License Plate:
            </td>
            <td>
                <asp:TextBox
                    ID="tbELicensePlate"
                    Placeholder="10 characters max"
                    runat="server"
                    TabIndex="7" />
                <asp:RegularExpressionValidator
                    ID="constraintLicensePlate"
                    ControlToValidate="tbELicensePlate"
                    ErrorMessage="License Plate - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - / &"
                    SetFocusOnError="True"
                    ValidationExpression="[\d\sa-zA-Z'-/&]{1,99}$"
                    Display="Dynamic" 
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="validateCertainSpecialCharactersLicensePlate"
                    ControlToValidate="tbELicensePlate"
                    ErrorMessage="License Plate - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - / &"
                    SetFocusOnError="True"
                    ValidationExpression="[^\*\(\)]{1,99}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="lengthLicensePlate"
                    ControlToValidate="tbELicensePlate"
                    ErrorMessage="License Plate - TOO LONG"
                    SetFocusOnError="True"
                    ValidationExpression="^[\s\S]{0,10}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td></td>
        </tr>
        <tr>
            <td colspan="5">
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
            <td colspan="5">
                <asp:GridView
                    ID="tableEquipment"
                    DataSourceID="SqlDataSourceEquipment"
                    SortExpression="ID"
                    EmptyDataText="No records in Equipment Table"
                    AutoGenerateColumns="False"
                    AutoGenerateEditButton="True"
                    AutoGenerateDeleteButton="True"
                    runat="server"
                    DataKeyNames="ID">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" />
                        <asp:TemplateField HeaderText="VinNumber" SortExpression="VinNumber">
                            <EditItemTemplate>
                                <asp:TextBox
                                    ID="tbEditVin"
                                    Class="textBoxWidth"
                                    runat="server"
                                    Text='<%# Bind("VinNumber") %>' />
                                <asp:RequiredFieldValidator
                                    ID="requiredVin"
                                    ControlToValidate="tbEditVin"
                                    ErrorMessage="Vin - REQUIRED"
                                    SetFocusOnError="True"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red"
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="constraintVin"
                                    ControlToValidate="tbEditVin"
                                    ErrorMessage="First Name - ONLY ALPHABETIC AND NUMERIC CHARACTERS // ONLY SPECIAL CHARACTERS ALLOWED: ' -"
                                    SetFocusOnError="True"
                                    ValidationExpression="^[\da-zA-Z'-]{1,99}$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red"
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="lengthVin"
                                    ControlToValidate="tbEditVin"
                                    ErrorMessage="First Name - TOO LONG"
                                    SetFocusOnError="True"
                                    ValidationExpression="^[\s\S]{0,40}$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red"
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="noSpacesVin"
                                    ControlToValidate="tbEditVin"
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
                                    Text='<%# Bind("VinNumber") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Make" SortExpression="Make">
                            <EditItemTemplate>
                                <asp:TextBox
                                    ID="tbEditMake"
                                    Class="textBoxWidth"
                                    runat="server"
                                    Text='<%# Bind("Make") %>' />
                                <asp:RegularExpressionValidator
                                    ID="constraintMake"
                                    ControlToValidate="tbEditMake"
                                    ErrorMessage="Make - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - / &"
                                    SetFocusOnError="True"
                                    ValidationExpression="[\d\sa-zA-Z'-/&]{1,99}$"
                                    Display="Dynamic" 
                                    Text="*"
                                    ForeColor="Red" 
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="validateCertainSpecialCharactersMake"
                                    ControlToValidate="tbEditMake"
                                    ErrorMessage="Make - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - / &"
                                    SetFocusOnError="True"
                                    ValidationExpression="[^\*\(\)]{1,99}$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red" 
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="lengthMake"
                                    ControlToValidate="tbEditMake"
                                    ErrorMessage="Make - TOO LONG"
                                    SetFocusOnError="True"
                                    ValidationExpression="^[\s\S]{0,35}$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red"
                                    runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label
                                    ID="Label2"
                                    runat="server"
                                    Text='<%# Bind("Make") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Model" SortExpression="Model">
                            <EditItemTemplate>
                                <asp:TextBox
                                    ID="tbEditModel"
                                    Class="textBoxWidth"
                                    runat="server"
                                    Text='<%# Bind("Model") %>' />
                                <asp:RegularExpressionValidator
                                    ID="constraintModel"
                                    ControlToValidate="tbEditModel"
                                    ErrorMessage="Model - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - / &"
                                    SetFocusOnError="True"
                                    ValidationExpression="[\d\sa-zA-Z'-/&]{1,99}$"
                                    Display="Dynamic" 
                                    Text="*"
                                    ForeColor="Red" 
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="validateCertainSpecialCharactersModel"
                                    ControlToValidate="tbEditModel"
                                    ErrorMessage="Model - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - / &"
                                    SetFocusOnError="True"
                                    ValidationExpression="[^\*\(\)]{1,99}$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red" 
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="lengthModel"
                                    ControlToValidate="tbEditModel"
                                    ErrorMessage="Model - TOO LONG"
                                    SetFocusOnError="True"
                                    ValidationExpression="^[\s\S]{0,30}$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red"
                                    runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label
                                    ID="Label3"
                                    runat="server"
                                    Text='<%# Bind("Model") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="EquipmentYear" SortExpression="EquipmentYear">
                            <EditItemTemplate>
                                <asp:TextBox
                                    ID="tbEditYear"
                                    Class="textBoxWidth"
                                    runat="server"
                                    Text='<%# Bind("EquipmentYear") %>' />
                                 <asp:RegularExpressionValidator
                                    ID="constraintYear"
                                    ControlToValidate="tbEditYear"
                                    ErrorMessage="Year - ENTER A YEAR IN YYYY FORMAT"
                                    SetFocusOnError="True"
                                    ValidationExpression="[\d]{4}$"
                                    Display="Dynamic" 
                                    Text="*"
                                    ForeColor="Red" 
                                    runat="server" />
                                <asp:RangeValidator
                                    ID="maxValueYear"
                                    ControlToValidate="tbEditYear"
                                    ErrorMessage="Year - ENTER A YEAR BEFORE 2019"
                                    SetFocusOnError="True"
                                    MinimumValue="0"
                                    MaximumValue="2019"
                                    Type="Integer"
                                    Display="Dynamic"
                                    Text="*"
                                    Forecolor="Red"
                                    runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label
                                    ID="Label4"
                                    runat="server"
                                    Text='<%# Bind("EquipmentYear") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PriceAcquired" SortExpression="PriceAcquired">
                            <EditItemTemplate>
                                <asp:TextBox
                                    ID="tbEditPrice"
                                    Class="textBoxWidth"
                                    runat="server"
                                    Text='<%# Bind("PriceAcquired") %>' />
                                <asp:RegularExpressionValidator
                                    ID="constraintPriceAcquired"
                                    ControlToValidate="tbEditPrice"
                                    ErrorMessage="Price Acquired - MUST BE NUMERIC (2 DECIMALS IF SHOWING CENTS) // NO COMMAS 
                                            // INCORRECT FORMAT // MAX VALUE ALLOWED = 999999.99 // POSITIVE VALUES ONLY"
                                    SetFocusOnError="True"
                                    ValidationExpression="(?!\.?$)\d{0,6}(\.\d{0,2})?$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red" 
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="noSpacesPriceAcquired"
                                    ControlToValidate="tbEditPrice"
                                    ErrorMessage="Price Acquired - NO SPACES ALLOWED" 
                                    SetFocusOnError="True"
                                    ValidationExpression="[^\s]+"
                                    Display="Dynamic"
                                    Text="*" 
                                    ForeColor="Red"
                                    runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label
                                    ID="Label5"
                                    runat="server"
                                    Text='<%# Bind("PriceAcquired") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="LicenseNumber" SortExpression="LicenseNumber">
                            <EditItemTemplate>
                                <asp:TextBox
                                    ID="tbEditLicense"
                                    Class="textBoxWidth"
                                    runat="server"
                                    Text='<%# Bind("LicenseNumber") %>' />
                                <asp:RegularExpressionValidator
                                    ID="constraintLicensePlate"
                                    ControlToValidate="tbEditLicense"
                                    ErrorMessage="License Plate - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - / &"
                                    SetFocusOnError="True"
                                    ValidationExpression="[\d\sa-zA-Z'-/&]{1,99}$"
                                    Display="Dynamic" 
                                    Text="*"
                                    ForeColor="Red" 
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="validateCertainSpecialCharactersLicensePlate"
                                    ControlToValidate="tbEditLicense"
                                    ErrorMessage="License Plate - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - / &"
                                    SetFocusOnError="True"
                                    ValidationExpression="[^\*\(\)]{1,99}$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red" 
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="lengthLicensePlate"
                                    ControlToValidate="tbEditLicense"
                                    ErrorMessage="License Plate - TOO LONG"
                                    SetFocusOnError="True"
                                    ValidationExpression="^[\s\S]{0,10}$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red"
                                    runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label
                                    ID="Label6"
                                    runat="server"
                                    Text='<%# Bind("LicenseNumber") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="DriverID" SortExpression="DriverID">
                            <EditItemTemplate>
                                <asp:DropDownList
                                    ID="ddEditDriver"
                                    runat="server"
                                    DataSourceID="ddDriverDS"
                                    DataTextField="DriverID"
                                    DataValueField="DriverID"
                                    SelectedValue='<%# Bind("DriverID") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource
                                    ID="ddDriverDS"
                                    runat="server"
                                    ConnectionString="<%$ ConnectionStrings:Lab2ConnectionString %>"
                                    SelectCommand="SELECT [DriverID], [FirstName], [LastName], [MiddleInitial] FROM [Driver]">
                                </asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label
                                    ID="Label7"
                                    runat="server"
                                    Text='<%# Bind("DriverID") %>' />
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
                    ID="SqlDataSourceEquipment"
                    runat="server"
                    ConnectionString="Server=LOCALHOST;Database=Lab2;Trusted_Connection=Yes;"
                    SelectCommand="SELECT * FROM [Equipment]"
                    UpdateCommand="UPDATE Equipment SET
                                    VinNumber = @vinNumber,
                                    Make = @make,
                                    Model = @model,
                                    EquipmentYear = @equipmentYear,
                                    PriceAcquired = @priceAcquired,
                                    LicenseNumber = @licenseNumber,
                                    DriverID = @driverID,
                                    LastUpdatedBy = @lastUpdatedBy,
                                    LastUpdated = @lastUpdated
                                    WHERE ID = @ID"
                    DeleteCommand="DELETE FROM Equipment WHERE (ID = @ID)">
                    <UpdateParameters>
                        <asp:Parameter Name="ID" Type="Int32" />
                        <asp:Parameter Name="vinNumber" Type="String" />
                        <asp:Parameter Name="make" Type="String" />
                        <asp:Parameter Name="model" Type="String" />
                        <asp:Parameter Name="equipmentYear" Type="Int32" />
                        <asp:Parameter Name="priceAcquired" Type="Double" />
                        <asp:Parameter Name="licenseNumber" Type="String" />
                        <asp:Parameter Name="driverID" Type="Int32"/>
                        <asp:Parameter Name="lastUpdatedBy" Type="String" />
                        <asp:Parameter Name="lastUpdated" Type="String" />
                    </UpdateParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="ID" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>