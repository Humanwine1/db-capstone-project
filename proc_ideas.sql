DELIMITER //
CREATE PROCEDURE AddCustomer (
    IN p_GuestFirstName VARCHAR(255),
    IN p_GuestLastName VARCHAR(255),
    IN p_Email VARCHAR(255),
    IN p_PhoneNumber INT
)
BEGIN
    INSERT INTO CustomerDetails (GuestFirstName, GuestLastName, Email, PhoneNumber)
    VALUES (p_GuestFirstName, p_GuestLastName, p_Email, p_PhoneNumber);
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE AddBooking (
    IN p_TableNo INT,
    IN p_BookingDate DATE,
    IN p_CustomerID INT
)
BEGIN
    INSERT INTO Bookings (TableNo, BookingDate, CustomerID)
    VALUES (p_TableNo, p_BookingDate, p_CustomerID);
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE AddOrder (
    IN p_TableNo INT,
    IN p_MenuID INT,
    IN p_BookingID INT,
    IN p_Quantity INT,
    IN p_TotalCost DECIMAL(10, 0),
    IN p_CustomerID INT,
    IN p_EmployeeID INT
)
BEGIN
    INSERT INTO Orders (TableNo, MenuID, BookingID, Quantity, TotalCost, CustomerID, EmployeeID)
    VALUES (p_TableNo, p_MenuID, p_BookingID, p_Quantity, p_TotalCost, p_CustomerID, p_EmployeeID);
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE UpdateOrderDeliveryStatus (
    IN p_DeliveryStatus VARCHAR(45),
    IN p_DeliveryDate DATE,
    IN p_OrderID INT
)
BEGIN
    UPDATE OrderDeliveryStatus
    SET DeliveryStatus = p_DeliveryStatus, DeliveryDate = p_DeliveryDate
    WHERE OrderID = p_OrderID;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE GetCustomerBookings (
    IN p_CustomerID INT
)
BEGIN
    SELECT *
    FROM Bookings
    WHERE CustomerID = p_CustomerID;
END //
DELIMITER ;
