DELIMITER //
DROP PROCEDURE IF EXISTS AddValidBooking //
CREATE PROCEDURE AddValidBooking (IN Booking_Date DATE, IN Table_No INT)
BEGIN
    DECLARE ExistingBookings INT;
    START TRANSACTION;
    SELECT COUNT(*)
    INTO ExistingBookings
    FROM Bookings
    WHERE TableNo = Table_No AND BookingDate = Booking_Date;

    IF ExistingBookings = 0 THEN
        SELECT CONCAT("Table ", Table_No, " is available - Booking Reserved") AS "Booking status";
        INSERT INTO Bookings (TableNo, BookingDate)
        VALUES (Table_No, Booking_Date);

        COMMIT;
    ELSE
        SELECT CONCAT("Table ", Table_No, " is already booked - bookings cancelled") AS "Booking status";
        ROLLBACK;
    END IF;
END //
DELIMITER ;

CALL AddValidBooking("2023-05-01", 13);