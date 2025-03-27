CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelBooking`(IN booking_id INT)
BEGIN

DELETE FROM Bookings WHERE BookingID = booking_id;

SELECT CONCAT('Booking ', booking_id, ' Cancelled') AS Confirmation;

END