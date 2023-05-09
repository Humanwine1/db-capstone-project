DELIMITER //
DROP PROCEDURE IF EXISTS AddValidBooking;
CREATE PROCEDURE AddValidBooking (IN BookingDate DATE, IN TableNo INT, IN GuestFirstName VARCHAR(255), IN GuestLastName VARCHAR(255))
BEGIN
    DECLARE ExistingBookings INT;
    DECLARE CustomerID INT;

    SELECT COUNT(*) INTO ExistingBookings
    FROM Bookings
    WHERE TableNo = TableNo AND BookingDate = BookingDate;

    IF ExistingBookings = 0 THEN
        SELECT CustomerID INTO CustomerID
        FROM CustomerDetails
        WHERE GuestFirstName = GuestFirstName AND GuestLastName = GuestLastName;

        IF CustomerID IS NULL THEN
            INSERT INTO CustomerDetails (GuestFirstName, GuestLastName)
            VALUES (GuestFirstName, GuestLastName);

            SET CustomerID = LAST_INSERT_ID();
        END IF;

        INSERT INTO Bookings (TableNo, BookingDate, CustomerID)
        VALUES (TableNo, BookingDate, CustomerID);

        SELECT CONCAT("Table ", TableNo, " is available - Booking Reserved") AS "Booking status";
    ELSE
        SELECT CONCAT("Table ", TableNo, " is already booked - bookings cancelled") AS "Booking status";
    END IF;
END //
DELIMITER ;
