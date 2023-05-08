DELIMITER //
DROP procedure if exists CancelOrder;
CREATE PROCEDURE CancelOrder(IN p_OrderID INT)
BEGIN 
DELETE FROM Orders WHERE OrderID = p_OrderID;
SELECT CONCAT("Order ", p_OrderID, " is cancelled") AS Confirmation;
END //

CALL CancelOrder(2) //

SELECT * FROM Orders;