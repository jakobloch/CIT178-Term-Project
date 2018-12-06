/* Final Project Views 


-- Read Only View
USE Hotel;
GO
CREATE VIEW RoomsReserved_Read_Only
WITH ENCRYPTION
AS
SELECT [ReservationID], RoomID, GuestID, StartDate, EndDate
FROM Reservation; 
GO
SELECT * FROM RoomsReserved_Read_Only;
GO
-- Update View

USE Hotel;
GO
CREATE VIEW RoomsReserved_Update
AS
SELECT [ReservationID], RoomID, GuestID, StartDate, EndDate
FROM Reservation;
GO
SELECT * FROM RoomsReserved_Update;
GO


UPDATE RoomsReserved_Update
SET StartDate=GETDate()
WHERE RoomID=1;


USE Hotel;
SELECT * FROM RoomsReserved_Update;


USE Hotel;
GO
CREATE VIEW GuestPayment_Update
AS
SELECT Guest.GuestID, GuestName, Guest.RoomID, Room.Cost, Payment.PaymentMethod
FROM Guest
JOIN Room ON Guest.RoomID = Room.RoomID
JOIN Payment ON Guest.GuestID = Payment.GuestID;
GO
SELECT * FROM GuestPayment_Update;
GO

SELECT * FROM sys.all_views*/