CREATE VIEW OrdersView AS
SELECT OrderID , Quantity, TotalCost as Cost 
FROM Orders
WHERE Quantity > 2; 