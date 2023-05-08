DELIMITER //
DROP PROCEDURE IF EXISTS AddCusterom;
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

CALL AddCustomer("John", "Smith", "johnsmith@gmail.com", 865444521);

SELECT * FROM CustomerDetails;