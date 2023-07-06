SELECT * FROM LittleLemonDB.Orders;
CREATE PROCEDURE GetMaxQuantity()
SELECT MAX(Quantity) AS 'Max Quantity in Order ' FROM Orders;
CALL GetMaxQuantity();
PREPARE GetOrderDetail FROM
"SELECT OrderID, Quantity, TotalCost FROM Orders
INNER JOIN Bookings USING (BookingID)
INNER JOIN Customers USING (CustomerID)
WHERE CustomerID = ?";
SET @id = 1;
EXECUTE GetOrderDetail USING @id;
DELIMITER //
CREATE PROCEDURE CancelOrder(IN inputOrder INT)
BEGIN
	DELETE FROM Orders WHERE OrderId = inputOrder;
    SELECT CONCAT('Order ', inputOrder, ' is cancelled') AS Confirmation;
END//
DELIMITER ;
call CancelOrder(5);