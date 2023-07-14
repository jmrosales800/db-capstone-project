-- Task1
USE LittleLemonDB;
SELECT * FROM Bookings;
INSERT INTO Bookings(Bookings.Date, Bookings.Table, Bookings.CustomerID)
VALUES
('2022-10-10', 5, 1),
('2022-11-12', 3, 3),
('2022-10-11', 2, 2),
('2022-10-13', 2, 1);
SELECT * FROM Bookings;

-- Task 2
DELIMITER $$
CREATE PROCEDURE CheckBooking(IN BookingDate DATE, IN BookingTable INT)
BEGIN
	DECLARE outTable INT;
	SELECT Bookings.Table INTO outTable FROM Bookings WHERE Bookings.Date = BookingDate 
		AND Bookings.Table = BookingTable;
	IF outTable IS NULL THEN
		SELECT CONCAT('Table ', BookingTable, ' is available.') AS 'Booking Status';
	else
		SELECT CONCAT('Table ', BookingTable, ' is already booked') AS 'Booking Status';
	END IF;
END$$
DELIMITER ;
CALL CheckBooking('2022-11-12', 3);
-- Task 3
DELIMITER $$
CREATE PROCEDURE AddValidBooking(IN bookingDate DATE, IN intTable INT, IN intCustomerID INT)
BEGIN
	DECLARE recordCount INT;
	START TRANSACTION;
    INSERT INTO Bookings (Bookings.Date, Bookings.Table, Bookings.CustomerID)
    VALUES (bookingDate, intTable, intCustomerID);
    SELECT COUNT(*) INTO recordCount FROM Bookings WHERE Bookings.Date = bookingDate AND
		Bookings.Table = intTable;
	IF recordCount > 1 THEN
		-- More than 1 record? Already booked. Rollback and return cancelation
        ROLLBACK;
        SELECT CONCAT('Table ', intTable, ' is already booked - book cancelled.') as Msg;
	ELSE -- Commit and return confirmation
		COMMIT;
        SELECT CONCAT('Table ', intTable, ' has been booked on ', bookingDate) as Msg;
	END IF;
    
END$$
DELIMITER ;
CALL AddValidBooking('2022-10-13', 2, 1);
-- Adding procedure ManageBooking which is equivalent to AddValidBooking procedure
DELIMITER $$
CREATE PROCEDURE ManageBooking(IN bookingDate DATE, IN intTable INT, IN intCustomerID INT)
BEGIN
	DECLARE recordCount INT;
	START TRANSACTION;
    INSERT INTO Bookings (Bookings.Date, Bookings.Table, Bookings.CustomerID)
    VALUES (bookingDate, intTable, intCustomerID);
    SELECT COUNT(*) INTO recordCount FROM Bookings WHERE Bookings.Date = bookingDate AND
		Bookings.Table = intTable;
	IF recordCount > 1 THEN
		-- More than 1 record? Already booked. Rollback and return cancelation
        ROLLBACK;
        SELECT CONCAT('Table ', intTable, ' is already booked - book cancelled.') as Msg;
	ELSE -- Commit and return confirmation
		COMMIT;
        SELECT CONCAT('Table ', intTable, ' has been booked on ', bookingDate) as Msg;
	END IF;
    
END$$
DELIMITER ;
CALL ManageBooking('2022-10-13', 3, 1)