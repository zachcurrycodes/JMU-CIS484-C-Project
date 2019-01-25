CREATE PROCEDURE ZacharyCurry_Lab3
    @vinNumber varchar(40),
    @make varchar(35),
    @model varchar(30),
    @year int,
    @priceAcquired decimal(8,2),
    @LicenseNumber varchar(10),
    @driverID int,
    @lastUpdatedBy varchar(20),
    @lastUpdated date

AS

Begin
    Insert Into Equipment
    Values (
		@vinNumber,
		@make,
		@model,
		@year,
		@priceAcquired,
		@LicenseNumber,
		@driverID,
		@lastUpdatedBy,
		@lastUpdated)
End