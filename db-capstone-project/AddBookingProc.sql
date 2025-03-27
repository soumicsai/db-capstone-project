CREATE DEFINER=`root`@`localhost` PROCEDURE `AddBooking`(IN booking_id INT,
IN customer_id INT,
IN booking_date DATE,
IN table_number INT)
BEGIN

    INSERT INTO Bookings (BookingID, CustomerID, StaffID, BookingDate, TableNumber)
	VALUES (booking_id, customer_id , 1, booking_date, table_number);
    
    SELECT 'New Booking Added' as Confirmation;    

END