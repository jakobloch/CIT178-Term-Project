/*USE [master]
GO

CREATE DATABASE [Hotel]
 
GO*/
USE [Hotel]
GO

CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] NOT NULL PRIMARY KEY,
	[HotelID] [int] NOT NULL,
	[LastName] [text] NULL,
	[FirstName] [text] NULL,
);
GO

CREATE TABLE [dbo].[Guest](
	[GuestID] [int] NOT NULL PRIMARY KEY,
	[GuestName] [text] NOT NULL,
	[RoomID] [int] NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Hotel ID] [int] NOT NULL,
);
GO
CREATE TABLE [dbo].[Hotel](
	[Hotel ID] [int] NOT NULL PRIMARY KEY,
	[Name] [text] NOT NULL,
	[Phone] [varchar](20) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[City] [text] NOT NULL,
	[State] [text] NOT NULL,
	[ZipCode] [varchar](50) NOT NULL,
);
GO
CREATE TABLE [dbo].[Payment](
	[PaymentID] [int] NOT NULL PRIMARY KEY,
	[GuestID] [int] NOT NULL,
	[ReservationID] [int] NULL,
	[HotelID] [int] NOT NULL,
	[PaymentMethod] [text] NOT NULL,
);
GO
CREATE TABLE [dbo].[Reservation](
	[ReservationID] [int] NOT NULL PRIMARY KEY,
	[GuestID] [int] NOT NULL,
	[RoomID] [int] NOT NULL,
	[Hotel ID] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
 );
GO
CREATE TABLE [dbo].[Room](
	[RoomID] [int] NOT NULL PRIMARY KEY,
	[Hotel ID] [int] NOT NULL,
	[RoomNumber] [int] NOT NULL,
	[Cost] [varchar](50) NOT NULL,
 );
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_HotelID_Employees] FOREIGN KEY([HotelID])
REFERENCES [dbo].[Hotel] ([Hotel ID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_HotelID_Employees]
GO
ALTER TABLE [dbo].[Guest]  WITH CHECK ADD  CONSTRAINT [FK_HotelID] FOREIGN KEY([Hotel ID])
REFERENCES [dbo].[Hotel] ([Hotel ID])
GO
ALTER TABLE [dbo].[Guest] CHECK CONSTRAINT [FK_HotelID]
GO
ALTER TABLE [dbo].[Guest]  WITH CHECK ADD  CONSTRAINT [FK_RoomID] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([RoomID])
GO
ALTER TABLE [dbo].[Guest] CHECK CONSTRAINT [FK_RoomID]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_GuestID_Payment] FOREIGN KEY([GuestID])
REFERENCES [dbo].[Guest] ([GuestID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_GuestID_Payment]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_HotelID_Payment] FOREIGN KEY([HotelID])
REFERENCES [dbo].[Hotel] ([Hotel ID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_HotelID_Payment]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_ReservationID_Payment] FOREIGN KEY([ReservationID])
REFERENCES [dbo].[Reservation] ([ReservationID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_ReservationID_Payment]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_GuestID] FOREIGN KEY([GuestID])
REFERENCES [dbo].[Guest] ([GuestID])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_GuestID]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_HotelID_Reservation] FOREIGN KEY([Hotel ID])
REFERENCES [dbo].[Hotel] ([Hotel ID])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_HotelID_Reservation]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_RoomID_Reservation] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([RoomID])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_RoomID_Reservation]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room] FOREIGN KEY([Hotel ID])
REFERENCES [dbo].[Hotel] ([Hotel ID])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room]
GO
