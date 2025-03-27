CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckBooking`(IN booking_date DATE, 
IN table_number INT)
BEGIN
	DECLARE table_status VARCHAR(50);
    IF EXISTS (
        SELECT 1 FROM Bookings
        WHERE BookingDate = booking_date AND TableNumber = table_number
    ) THEN
        SET table_status = 'already Booked';
    ELSE
        SET table_status = 'available';
    END IF;

SELECT 
    CONCAT('Table ',
            table_number,
            ' is ',
            table_status) AS BookingStatus;
END