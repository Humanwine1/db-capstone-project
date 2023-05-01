-- use littlelemondb;
-- DROP TABLE Menus;
-- -- DELETE FROM Menus;
-- -- SET FOREIGN_KEY_CHECKS = 0;
-- CREATE TABLE Menus (
-- MenuID INT PRIMARY KEY NOT NULL, 
-- ItemID INT NOT NULL, 
-- Cuisine VARCHAR(45) NOT NULL,
-- FOREIGN KEY (ItemID) REFERENCES MenuItems(ItemID));

INSERT INTO Menus (MenuID,ItemID,Cuisine)
VALUES
(1, 1, 'Greek'),
(2, 7, 'Greek'),
(3, 10, 'Greek'),
(4, 13, 'Greek'),
(5, 3, 'Italian'),
(6, 9, 'Italian'),
(7, 12, 'Italian'),
(8, 15, 'Italian'),
(9, 5, 'Turkish'),
(10, 17, 'Turkish'),
(11, 11, 'Turkish'),
(12, 16, 'Turkish');