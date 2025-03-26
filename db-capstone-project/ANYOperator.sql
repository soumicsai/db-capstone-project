SELECT Name as MenuName From Menu
WHERE MenuID =  ANY(SELECT MenuID From orders where Quantity >2)