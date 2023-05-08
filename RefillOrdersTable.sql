INSERT INTO Orders (OrderID, TableNo, MenuID, BookingID, Quantity, TotalCost, CustomerID)
VALUES 
(1, 12, 2, 1, 2, 75, 1),
(2, 2, 3, 2, 5, 225, 2),
(3, 4, 15, 3, 3, 175, 3),
(4, 9, 11, 4, 1, 55, 4),
(5, 4, 8, 5, 4, 150, 5)
;
-- just comment out the rows you don't need to refill
SELECT * FROM Orders;