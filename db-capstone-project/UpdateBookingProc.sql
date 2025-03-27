CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateBooking`(IN booking_id INT,
IN booking_date DATE)
BEGIN
	UPDATE Bookings SET BookingDate = booking_date
    WHERE BookingID = booking_id;
    
    SELECT CONCAT('Booking ', booking_id, ' Updated') as Confirmation;
END