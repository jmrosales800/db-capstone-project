CREATE DEFINER=`dbUser1`@`localhost` PROCEDURE `CheckBooking`(IN BookingDate DATE, IN BookingTable INT)
BEGIN
	DECLARE outTable INT;
	SELECT Bookings.Table INTO outTable FROM Bookings WHERE Bookings.Date = BookingDate 
		AND Bookings.Table = BookingTable;
	IF outTable IS NULL THEN
		SELECT CONCAT('Table ', BookingTable, ' is available.') AS 'Booking Status';
	else
		SELECT CONCAT('Table ', BookingTable, ' is already booked') AS 'Booking Status';
	END IF;
END