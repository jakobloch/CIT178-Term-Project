/* Final Project Procedures 
USE Hotel;
GO
CREATE PROC spHotel
AS
SELECT * FROM Hotel
GO 

USE Hotel;
GO
CREATE PROC sp_RoomSearch
@Cost smallmoney,
@RoomNumber int 
AS
SET NOCOUNT ON;
SELECT Cost, RoomNumber, [Hotel ID]
FROM Room
WHERE Cost=@Cost AND RoomNumber=@RoomNumber
GO

USE Hotel;
GO
CREATE PROC spGuestCount
@HotelID int, @NumberGuest int OUTPUT
AS
SELECT [Hotel ID], NumberGuest = COUNT(GuestID)
FROM Guest
WHERE [Hotel ID]=@HotelID
GROUP BY [Hotel ID]
GO

CREATE PROC spGuestCount2 @DateVar smalldatetime = NULL, @HotelVar varchar(40) = '%'
AS
IF @DateVar IS NULL 
    SELECT @DateVar = MIN(StartDate) FROM Reservation;

DECLARE @GuestCount2 int;

SELECT @GuestCount2 = COUNT(GuestID) 
FROM Reservation 
WHERE (StartDate >= @DateVar) AND ([Hotel ID] LIKE @HotelVar);

RETURN @GuestCount2;

/* Final Project User Defined Functions */

CREATE FUNCTION fnGuestID 
    (@GuestName text) 
    RETURNS int
BEGIN 
    RETURN (SELECT GuestID FROM Guest WHERE GuestName = @GuestName);
END;

CREATE FUNCTION fnTopGuestDue
    (@CutOff money = 0) 
    RETURNS table
    RETURN (SELECT GuestID, SUM(Cost) AS TotalDue 
                FROM Guest JOIN Room ON Guest.RoomID = Room.RoomID 
                WHERE Cost > 0 
                GROUP BY GuestID 
                HAVING SUM(Cost) >= @CutOff);

CREATE FUNCTION fnGuestCity
    (@CutOff int = 0) 
    RETURNS table
    RETURN (SELECT COUNT(GuestID) AS [Guests Per Zip], ZipCode AS [Hotel Zip]
                FROM Guest JOIN Hotel ON Guest.[Hotel ID] = Hotel.[Hotel ID] 
				Where GuestID > 0
                GROUP BY Hotel.ZipCode, GuestID
				HAVING SUM(GuestID) >=0);

/* Final Project Triggers */
CREATE TRIGGER Employees_INSERT_UPDATE ON Employees
AFTER DELETE, UPDATE
AS
UPDATE FiredEmployees SET FiredEmployees.EmployeeID = EmployeeID
UPDATE FiredEmployees SET FiredEmployees.HotelID = HotelID
UPDATE FiredEmployees SET FiredEmployees.LastName = LastName
UPDATE FiredEmployees SET FiredEmployees.FirstName = FirstName

CREATE TRIGGER Hotel_INSERT_UPDATE ON Hotel
AFTER INSERT,UPDATE
AS
UPDATE Hotel SET State = UPPER(State) 
WHERE [Hotel ID] IN (SELECT [Hotel ID] FROM Inserted);
*/

