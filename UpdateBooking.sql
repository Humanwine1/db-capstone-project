DELIMITER //
DROP PROCEDURE IF EXISTS UpdateBooking;
CREATE PROCEDURE UpdateBooking (
    IN p_BookingID INT,
    IN p_BookingDate DATE
)
BEGIN
    UPDATE Bookings
    SET BookingDate = p_BookingDate
    WHERE BookingID = p_BookingID;
    SELECT CONCAT("Booking ", p_BookingID, " updated") AS Confirmation;
END //
DELIMITER ;

CALL UpdateBooking(27, "2023-05-07");