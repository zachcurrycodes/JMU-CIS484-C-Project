<%@ Page Title="Contractor" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContractorPage.aspx.cs" Inherits="ContractorPage" %>
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
    </style>
</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    Runat="Server">
    <table background-color: #FFFFFF>
        <tr>
            <td>
                <h2>Contractor</h2>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td>
                <asp:Button
                    ID="btnCCommit"
                    Text="Commit"
                    Style="height: 26px"
                    OnClick="btnCCommit_Click"
                    TabIndex="13"
                    runat="server" />
            </td>
        </tr>
        <tr>
            <td class="align-right">
                <strong>Contractor ID:
            </strong>
            </td>
            <td>
                <asp:TextBox
                    ID="tbCContractorID"
                    BackColor="#D5D5D5"
                    ReadOnly="True"
                    runat="server" />
            </td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td class="align-right">
                <strong>First Name:
            </strong>
            </td>
            <td>
                <asp:TextBox
                    ID="tbCFirstName"
                    Placeholder="20 characters max"
                    runat="server"
                    TabIndex="1" />
                <asp:RequiredFieldValidator
                    ID="requiredFN"
                    ControlToValidate="tbCFirstName"
                    ErrorMessage="First Name - REQUIRED"
                    SetFocusOnError="True"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="constraintFN"
                    ControlToValidate="tbCFirstName"
                    ErrorMessage="First Name - ONLY ALPHABETIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' -"
                    SetFocusOnError="True"
                    ValidationExpression="^[a-zA-Z'-]{1,99}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="lengthFN"
                    ControlToValidate="tbCFirstName"
                    ErrorMessage="First Name - TOO LONG"
                    SetFocusOnError="True"
                    ValidationExpression="^[\s\S]{0,20}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="noSpacesFN"
                    ControlToValidate="tbCFirstName"
                    ErrorMessage="First Name - NO SPACES ALLOWED"
                    SetFocusOnError="True"
                    ValidationExpression="[^\s]+"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td class="align-right">
                House Number:
            </td>
            <td>
                <asp:TextBox
                    ID="tbCHouseNumber"
                    Placeholder="Positive Integer"
                    runat="server"
                    TabIndex="5" />
                <asp:RegularExpressionValidator
                    ID="positiveHN"
                    ControlToValidate="tbCHouseNumber"
                    ErrorMessage="House Number - MUST BE POSITIVE INTEGER"
                    SetFocusOnError="True"
                    ValidationExpression="^\d+$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RangeValidator
                    ID="maxValueHN"
                    ControlToValidate="tbCHouseNumber"
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
                    ID="noSpacesHouseNumber"
                    ControlToValidate="tbCHouseNumber"
                    ErrorMessage="House Number - NO SPACES ALLOWED" 
                    ValidationExpression="[^\s]+"
                    SetFocusOnError="True"
                    Display="Dynamic"
                    Text="*" 
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td></td>
        </tr>
        <tr>
            <td class="align-right">
                MI:
            </td>
            <td>
                <asp:TextBox
                    ID="tbCMI"
                    runat="server"
                    CssClass="middleInitial"
                    TabIndex="2" />
                <asp:RegularExpressionValidator
                    ID="constraintMI"
                    ControlToValidate="tbCMI"
                    ErrorMessage="Middle Initial - ALPHABETIC CHARACTER ONLY"
                    SetFocusOnError="True"
                    ValidationExpression="^[a-zA-Z]{1,25}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="lengthMI"
                    ControlToValidate="tbCMI"
                    ErrorMessage="Middle Initial - TOO LONG"
                    SetFocusOnError="True"
                    ValidationExpression="^[\s\S]{1}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td class="align-right">
                Street:
            </td>
            <td>
                <asp:TextBox
                    ID="tbCStreet"
                    Placeholder="50 characters max"
                    runat="server"
                    TabIndex="6" />
                <asp:RegularExpressionValidator
                    ID="constraintStreet"
                    ControlToValidate="tbCStreet"
                    ErrorMessage="Street - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - / &"
                    SetFocusOnError="True"
                    ValidationExpression="[\d\sa-zA-Z'-/&]{1,99}$"
                    Display="Dynamic" 
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="validateCertainSpecialCharactersStreet"
                    ControlToValidate="tbCStreet"
                    ErrorMessage="Street - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - / &"
                    SetFocusOnError="True"
                    ValidationExpression="[^\*\(\)]{1,99}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="lengthStreet"
                    ControlToValidate="tbCStreet"
                    ErrorMessage="Street - TOO LONG"
                    SetFocusOnError="True"
                    ValidationExpression="^[\s\S]{0,50}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td></td>
        </tr>
        <tr>
            <td class="align-right">
                <strong>Last Name:</strong>
            </td>
            <td>
                <asp:TextBox
                    ID="tbCLastName"
                    Placeholder="20 characters Max"
                    runat="server"
                    TabIndex="3" />
                <asp:RequiredFieldValidator
                    ID="requiredLN"
                    ControlToValidate="tbCLastName"
                    ErrorMessage="Last Name - REQUIRED"
                    SetFocusOnError="True"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="constraintLN"
                    ControlToValidate="tbCLastName"
                    ErrorMessage="Last Name - ONLY ALPHABETIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' -"
                    SetFocusOnError="True"
                    ValidationExpression="^[a-zA-Z'-]{1,999}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="lengthLN"
                    ControlToValidate="tbCLastName"
                    ErrorMessage="Last Name - TOO LONG"
                    ValidationExpression="^[\s\S]{0,20}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="noSpacesLN"
                    ControlToValidate="tbCLastName"
                    ErrorMessage="Last Name - NO SPACES ALLOWED" 
                    SetFocusOnError="True"
                    ValidationExpression="[^\s]+"
                    Display="Dynamic"
                    Text="*" 
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td class="align-right">
                City or County:
            </td>
            <td>
                <asp:TextBox
                    ID="tbCCityCounty"
                    Placeholder="40 characters max"
                    runat="server"
                    TabIndex="7" />
                <asp:RegularExpressionValidator
                    ID="lengthCityCountry"
                    ControlToValidate="tbCCityCounty"
                    ErrorMessage="City/County - TOO LONG"
                    SetFocusOnError="True"
                    ValidationExpression="^[\s\S]{1,40}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                 <asp:RegularExpressionValidator
                    ID="constraintCityCounty"
                    ControlToValidate="tbCCityCounty"
                    ErrorMessage="City/County - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - /&"
                    SetFocusOnError="True"
                    ValidationExpression="^[\d\sa-zA-Z'-/&]{1,99}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="validateCertainSpecialCharactersCityCounty"
                    ControlToValidate="tbCCityCounty"
                    ErrorMessage="City/County - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - / &"
                    SetFocusOnError="True"
                    ValidationExpression="[^\*\(\)]{1,99}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
            </td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td class="align-right">
                State:
            </td>
            <td>
                <asp:DropDownList
                    ID="ddCState"
                    runat="server" TabIndex="8" />
            </td>
            <td></td>
        </tr>
        <tr>
            <td class="align-right">
                Fee:
            </td>
            <td>
                <asp:TextBox
                    ID="tbCFee"
                    Placeholder="999999.99 max"
                    runat="server"
                    TabIndex="4"/>
                <asp:RegularExpressionValidator
                    ID="constraintFee"
                    ControlToValidate="tbCFee"
                    ErrorMessage="Fee - MUST BE NUMERIC (2 DECIMALS IF SHOWING CENTS) // NO COMMAS 
                            // INCORRECT FORMAT // MAX VALUE ALLOWED = 999999.99 // POSITIVE VALUES ONLY"
                    SetFocusOnError="True"
                    ValidationExpression="(?!\.?$)\d{0,6}(\.\d{0,2})?$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="noSpacesFee"
                    ControlToValidate="tbCFee"
                    ErrorMessage="Fee - NO SPACES ALLOWED" 
                    SetFocusOnError="True"
                    ValidationExpression="[^\s]+"
                    Display="Dynamic"
                    Text="*" 
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td class="align-right">
                Zip Code:
            </td>
            <td>
                <asp:TextBox
                    ID="tbCZipCode"
                    Placeholder="5 Digits"
                    runat="server"
                    TabIndex="9" /> 
                <asp:RegularExpressionValidator
                    ID="constraintZipCode"
                    ControlToValidate="tbCZipCode"
                    ErrorMessage="ZipCode - MUST BE 5 DIGIT INTEGER"
                    SetFocusOnError="True"
                    ValidationExpression="^\d{5}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="noSpacesZipCode"
                    ControlToValidate="tbCZipCode"
                    ErrorMessage="ZipCode - NO SPACES ALLOWED"
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
            <td></td>
            <td></td>
            <td class="align-right">
                Country:
            </td>
            <td>
                <asp:DropDownList
                    ID="ddCCountry"
                    runat="server" TabIndex="10" />
            </td>
            <td></td>
        </tr>
        <tr>
            <td colspan="5">
                <asp:ValidationSummary
                    ID="valSummary"
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
                    ID="tableContractor"
                    DataSourceID="database"
                    SortExpression="ContractorID"
                    EmptyDataText="No records in Contractor Table"
                    AutoGenerateColumns="False"
                    AutoGenerateEditButton="True"
                    AutoGenerateDeleteButton="True"
                    runat="server"
                    DataKeyNames="ContractorID">
                    <Columns>
                        <asp:BoundField DataField="ContractorID" HeaderText="ContractorID" ReadOnly="True" />
                        <asp:TemplateField HeaderText="FirstName" SortExpression="FirstName">
                            <EditItemTemplate>
                                <asp:TextBox
                                    ID="tbEditFirstName"
                                    Class="textBoxWidth"
                                    runat="server"
                                    Text='<%# Bind("FirstName") %>' />
                                <asp:RequiredFieldValidator
                                    ID="requiredFN"
                                    ControlToValidate="tbEditFirstName"
                                    ErrorMessage="First Name - REQUIRED"
                                    SetFocusOnError="True"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red"
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="constraintFN"
                                    ControlToValidate="tbEditFirstName"
                                    ErrorMessage="First Name - ONLY ALPHABETIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' -"
                                    SetFocusOnError="True"
                                    ValidationExpression="^[a-zA-Z'-]{1,99}$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red"
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="lengthFN"
                                    ControlToValidate="tbEditFirstName"
                                    ErrorMessage="First Name - TOO LONG"
                                    SetFocusOnError="True"
                                    ValidationExpression="^[\s\S]{0,20}$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red"
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="noSpacesFN"
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
                                    ID="tbEditMI"
                                    Width="30px"
                                    runat="server"
                                    Text='<%# Bind("MiddleInitial") %>' />
                                <asp:RegularExpressionValidator
                                    ID="constraintMI"
                                    ControlToValidate="tbEditMI"
                                    ErrorMessage="Middle Initial - ALPHABETIC CHARACTER ONLY"
                                    SetFocusOnError="True"
                                    ValidationExpression="^[a-zA-Z]{1,25}$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red"
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="lengthMI"
                                    ControlToValidate="tbEditMI"
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
                                    ID="requiredLN"
                                    ControlToValidate="tbEditLastName"
                                    ErrorMessage="Last Name - REQUIRED"
                                    SetFocusOnError="True"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red"
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="constraintLN"
                                    ControlToValidate="tbEditLastName"
                                    ErrorMessage="Last Name - ONLY ALPHABETIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' -"
                                    SetFocusOnError="True"
                                    ValidationExpression="^[a-zA-Z'-]{1,999}$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red"
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="lengthLN"
                                    ControlToValidate="tbEditLastName"
                                    ErrorMessage="Last Name - TOO LONG"
                                    ValidationExpression="^[\s\S]{0,20}$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red"
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="noSpacesLN"
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
                                    Class="textBoxWidth"
                                    Placeholder="Positive Integer"
                                    runat="server"
                                    Text='<%# Bind("HouseNumber") %>' />
                                <asp:RegularExpressionValidator
                                    ID="positiveHN"
                                    ControlToValidate="tbEditHouseNumber"
                                    ErrorMessage="House Number - MUST BE POSITIVE INTEGER"
                                    SetFocusOnError="True"
                                    ValidationExpression="^\d+$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red" 
                                    runat="server" />
                                <asp:RangeValidator
                                    ID="maxValueHN"
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
                                    ID="noSpacesHouseNumber"
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
                                    ID="constraintStreet"
                                    ControlToValidate="tbEditStreet"
                                    ErrorMessage="Street - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - / &"
                                    SetFocusOnError="True"
                                    ValidationExpression="[\d\sa-zA-Z'-/&]{1,99}$"
                                    Display="Dynamic" 
                                    Text="*"
                                    ForeColor="Red" 
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="validateCertainSpecialCharactersStreet"
                                    ControlToValidate="tbEditStreet"
                                    ErrorMessage="Street - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - / &"
                                    SetFocusOnError="True"
                                    ValidationExpression="[^\*\(\)]{1,99}$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red" 
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="lengthStreet"
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
                                    ID="lengthCityCountry"
                                    ControlToValidate="tbEditCityCounty"
                                    ErrorMessage="City/County - TOO LONG"
                                    SetFocusOnError="True"
                                    ValidationExpression="^[\s\S]{1,40}$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red"
                                    runat="server" />
                                 <asp:RegularExpressionValidator
                                    ID="constraintCityCounty"
                                    ControlToValidate="tbEditCityCounty"
                                    ErrorMessage="City/County - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - /&"
                                    SetFocusOnError="True"
                                    ValidationExpression="^[\d\sa-zA-Z'-/&]{1,99}$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red" 
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="validateCertainSpecialCharactersCityCounty"
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
                                    DataValueField="StateAbb"
                                    AppendDataBoundItems="True"
                                    SelectedValue='<%# Bind("StateAbb") %>' DataTextField="StateName">
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
                                    Text='<%# Bind("CountryAbb") %>' />
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
                                    ID="constraintZipCode"
                                    ControlToValidate="tbEditZipCode"
                                    ErrorMessage="ZipCode - MUST BE 5 DIGIT INTEGER"
                                    SetFocusOnError="True"
                                    ValidationExpression="^\d{5}$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red"
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="noSpacesZipCode"
                                    ControlToValidate="tbEditZipCode"
                                    ErrorMessage="ZipCode - NO SPACES ALLOWED"
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
                        <asp:TemplateField HeaderText="Fee" SortExpression="Fee">
                            <EditItemTemplate>
                                <asp:TextBox
                                    ID="tbEditFee"
                                    Placeholder="999999.99 max"
                                    Class="textBoxWidth"
                                    runat="server"
                                    Text='<%# Bind("Fee") %>' />
                                <asp:RegularExpressionValidator
                                    ID="constraintFee"
                                    ControlToValidate="tbEditFee"
                                    ErrorMessage="Fee - MUST BE NUMERIC (2 DECIMALS IF SHOWING CENTS) // NO COMMAS 
                                            // INCORRECT FORMAT // MAX VALUE ALLOWED = 999999.99 // POSITIVE VALUES ONLY"
                                    SetFocusOnError="True"
                                    ValidationExpression="(?!\.?$)\d{0,6}(\.\d{0,2})?$"
                                    Display="Dynamic"
                                    Text="*"
                                    ForeColor="Red" 
                                    runat="server" />
                                <asp:RegularExpressionValidator
                                    ID="noSpacesFee"
                                    ControlToValidate="tbEditFee"
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
                                    ID="Label10"
                                    runat="server"
                                    Text='<%# Bind("Fee", "{0:C}") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="LastUpdatedBy" SortExpression="LastUpdatedBy">
                            <EditItemTemplate>
                                <asp:Label
                                    ID="Label14"
                                    runat="server"
                                    Text='<%# Bind("LastUpdatedBy") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label
                                    ID="Label11"
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
                    ID="database"
                    runat="server"
                    ConnectionString="Server=LOCALHOST;Database=Lab2;Trusted_Connection=Yes;"
                    SelectCommand="SELECT * FROM CONTRACTOR"
                    UpdateCommand="Update Contractor SET
                                FirstName = @firstName, 
                                LastName = @lastName, 
                                MiddleInitial = @middleInitial, 
                                HouseNumber = @houseNumber, 
                                Street = @street, 
                                CityCounty = @cityCounty, 
                                StateAbb = @stateAbb, 
                                CountryAbb = @countryAbb, 
                                ZipCode = @zipCode, 
                                Fee = @fee, 
                                LastUpdatedBy = @lastUpdatedBy, 
                                LastUpdated = @lastUpdated
                                WHERE ContractorID = @contractorID"
                    DeleteCommand= "DELETE FROM DRIVERCONTRACTOR WHERE (CONTRACTORID = @contractorID)
                                    DELETE FROM CONTRACTOR WHERE (CONTRACTORID = @contractorID)" >
                    <UpdateParameters>
                        <asp:Parameter Name="contractorID" Type="Int32" />
                        <asp:Parameter Name="firstName" Type="String"/>
                        <asp:Parameter Name="lastName" Type="String"/>
                        <asp:Parameter Name="middleInital" Type="String"/>
                        <asp:Parameter Name="houseNumber" Type="Int32"/>
                        <asp:Parameter Name="street" Type="String"/>
                        <asp:Parameter Name="cityCounty" Type="String"/>
                        <asp:Parameter Name="stateAbb" Type="String" />
                        <asp:Parameter Name="countryAbb" Type="String"/>
                        <asp:Parameter Name="zipCode" Type="String"/>
                        <asp:Parameter Name="fee" Type="Double"/>
                        <asp:Parameter Name="lastUpdatedBy" Type="String"/>
                        <asp:Parameter Name="lastUpdated" Type="String"/>
                    </UpdateParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="contractorID" />
                    </DeleteParameters>
                 </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>