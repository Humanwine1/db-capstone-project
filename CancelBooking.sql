DELIMITER //
DROP PROCEDURE IF EXISTS CancelBooking;
CREATE PROCEDURE CancelBooking (
	IN p_BookingID INT
)
BEGIN
	DELETE FROM Bookings
    WHERE BookingID = p_BookingID;
END //
DELIMITER ;

CALL CancelBooking(27);

SELECT * FROM Bookings; -- success!