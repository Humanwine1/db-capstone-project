DELIMITER //
DROP PROCEDURE IF EXISTS AddBooking;
CREATE PROCEDURE AddBooking (
    IN p_TableNo INT,
	IN p_CustomerID INT,
    IN p_BookingDate DATE
)
BEGIN
    INSERT INTO Bookings (TableNo, CustomerID, BookingDate)
    VALUES (p_TableNo, p_CustomerID, p_BookingDate);
    SELECT CONCAT("New Booking Added") AS Confirmation;
END //
DELIMITER ;

CALL AddBooking(9,9, "2023-05-03");

 -- My Bookings table auto increments the BookingID so i didn't need to add the BookingID to the values in this task