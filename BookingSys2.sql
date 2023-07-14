-- Task 1
USE LittleLemonDB;
DELIMITER $$
CREATE PROCEDURE AddBooking(IN intBookingID INT, IN intCustomerID INT, IN intTable INT,
							IN dateBooking DATE)
	BEGIN
		INSERT INTO Bookings (Bookings.BookingID, Bookings.CustomerID, Bookings.Table, Bookings.Date)
        VALUES (intBookingID, intCustomerID, intTable, dateBooking);
        SELECT CONCAT('New booking added') as 'Confirmation';
    END$$
DELIMITER ;
SELECT * FROM Bookings;
CALL AddBooking(14, 3, 4, "2022-12-30");
-- Task 2
DELIMITER $$
CREATE PROCEDURE UpdateBooking (IN intTable INT, IN dateBooking DATE)
BEGIN
	UPDATE Bookings SET Bookings.Date = dateBooking WHERE Bookings.Table = intTable;
    SELECT CONCAT("Booking table ", intTable, " updated on ", dateBooking);
END$$
DELIMITER ;
CALL UpdateBooking(9, "2022-12-17");
SELECT * FROM Bookings;
-- Task 3
DELIMITER $$
CREATE PROCEDURE CancelBooking(IN intBookingID INT)
BEGIN
	DELETE FROM Bookings WHERE Bookings.BookingID = intBookingID;
    SELECT CONCAT('Booking ', intBookingID, ' cancelled.');
END$$
DELIMITER ;
CALL CancelBooking(9);
SELECT * FROM Bookings;
CALL AddBooking(99, 99, 99, '2022-12-10');
SELECT * FROM Customers;