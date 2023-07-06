CREATE VIEW OrdersView AS
SELECT OrderID, Quantity, TotalCost
FROM Orders
WHERE Quantity > 2;
SELECT * FROM OrdersView;
CREATE VIEW OrdersGT150 AS
SELECT Customers.CustomerID, Customers.Name, Orders.OrderID, Orders.TotalCost, Menus.MenuName, MenuItems.CourseName
FROM Orders
INNER JOIN Bookings USING (BookingID)
INNER JOIN Customers USING (CustomerID)
INNER JOIN Menus ON Orders.Menus_MenuID = Menus.MenuID
INNER JOIN MenuItems USING (MenuItemsID)
WHERE Orders.TotalCost > 150;
SELECT * FROM OrdersGT150;
CREATE VIEW OrdersMenuQtyGT2 AS
SELECT Menus.MenuName
FROM Menus
WHERE Menus.MenuID = ANY (SELECT Menus.MenuID FROM Orders INNER JOIN Menus ON Orders.Menus_MenuID = Menus.MenuID 
								WHERE Orders.Quantity > 2);
SELECT Menus.MenuID FROM Orders INNER JOIN Menus ON Orders.Menus_MenuID = Menus.MenuID 
								WHERE Orders.Quantity > 2;  
SELECT * FROM OrdersMenuQtyGT2;
