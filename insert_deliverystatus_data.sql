USE littlelemondb;

INSERT INTO orderdeliverystatus (DeliveryStatus, DeliveryDate, OrderID) VALUES
("Pending", curdate(), 1),
("Delivered", curdate(), 2),
("Delivered", curdate(), 3),
("Pending", curdate(), 4),
("Delivered", curdate(), 5);