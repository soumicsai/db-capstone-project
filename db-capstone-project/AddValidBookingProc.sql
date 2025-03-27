CREATE DEFINER=`root`@`localhost` PROCEDURE `AddValidBooking`(IN input_date DATE,
    IN input_table INT)
BEGIN
DECLARE existing_count INT;
    START TRANSACTION;

    SELECT COUNT(*) INTO existing_count
    FROM Bookings
    WHERE BookingDate = input_date AND TableNumber = input_table;

    IF existing_count > 0 THEN
        ROLLBACK;
        SELECT concat('Table ', input_table, ' is already booked - booking cancelled') AS Message;
    ELSE

        INSERT INTO Bookings (CustomerID, StaffID, BookingDate, TableNumber)
        VALUES (1, 1, input_date, input_table); -- Replace with dynamic values if needed

        COMMIT;
        SELECT 'Booking Successful!' AS Message;
    END IF;
END