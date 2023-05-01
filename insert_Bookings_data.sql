use littlelemondb;

INSERT INTO Bookings (BookingID, TableNo, GuestFirstName, GuestLastName, BookingSlot, EmployeeID, CustomerID)
VALUES
(1,12,'Anna','Iversen','2023-05-01 19:00:00',01,1),
(2,12,'Joakim', 'Iversen', '2023-05-01 19:00:00',01,2),
(3,19,'Vanessa', 'McCarthy', '2023-05-01 15:00:00', 03,3),
(4,15,'Marcos', 'Romero', '2023-05-01 17:30:00', 04,4),
(5,5,'Hiroki', 'Yamane', '2023-05-01 18:30:00', 02,5),
(6,8,'Diana', 'Pinto', '2023-05-01 20:00:00', 05,6);