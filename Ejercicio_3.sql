-- Mostrar los clientes que han realizado pedidos en más de 2 años diferentes.
Select t.CustomerID,
		t.CustomerName,
		COUNT(distinct año) AS Año_diferente
From (
	SELECT O.CustomerID, C.CustomerName, 
			year(O.OrderDate) as año
	FROM northwind.Orders O
    JOIN northwind.Customers C ON C.CustomerID = O.CustomerID
) as t
GROUP BY t.CustomerID, t.CustomerName
having COUNT(distinct año) > 1
ORDER BY CUSTOMERID
