SELECT Name, TableNo
FROM Employees INNER JOIN Bookings
ON Employees.EmployeeID = Bookings.EmployeeID;