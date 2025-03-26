SELECT DISTINCT 
    C.CustomerID,
    C.FullName,
    O.OrderID,
    O.TotalCost AS Cost,
    M.Name AS MenuName,
    I.CourseName
FROM customers C
JOIN orders O ON C.CustomerID = O.CustomerID
JOIN menu M ON O.MenuID = M.MenuID
JOIN menuitems I ON M.MenuID = I.MenuID
WHERE O.TotalCost > 150
ORDER BY O.TotalCost;
