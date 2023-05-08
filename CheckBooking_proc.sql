DELIMITER //
DROP PROCEDURE IF EXISTS CheckBooking;
CREATE PROCEDURE CheckBooking(IN bookingDate DATE, IN tableNumber INT)
BEGIN
    DECLARE booking_id INT;
    SELECT BookingID -- tried using COUNT(BookingID) to fix the problem of multiple CustomerIDs on one table, but it skewed the results
    INTO booking_id
    FROM Bookings
    WHERE BookingDate = DATE(bookingDate) AND TableNo = tableNumber;

    IF booking_id IS NOT NULL THEN
        SELECT CONCAT('Table ', tableNumber, ' is already booked for ', bookingDate) AS "Booking status";
    ELSE
        SELECT CONCAT('Table ', tableNumber, ' is available for ', bookingDate) AS "Booking status";
    END IF;
END //
DELIMITER ;

CALL CheckBooking("2023-05-01", 12); 