-- For your second task, Little Lemon need information from four tables on all customers with orders that cost more than $150. 
-- Extract the required information from each of the following tables by using the relevant JOIN clause: 
-- Customers table: The customer id and full name.
-- Orders table: The order id and cost.
-- Menus table: The menus name.
-- MenusItems table: course name and starter name.
-- The result set should be sorted by the lowest cost amount.


SELECT c.CustomerID, CONCAT(c.GuestFirstName, ' ', c.GuestLastName) AS FullName, o.OrderID, o.TotalCost, mi.Name, mi.Type, mi.Cuisine
FROM CustomerDetails c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
INNER JOIN MenuItems mi ON o.MenuID = mi.MenuID
WHERE o.TotalCost > 150
ORDER BY o.TotalCost ASC;