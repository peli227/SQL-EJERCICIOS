-- Mostrar los clientes que han realizado más pedidos que el promedio de pedidos por cliente.
select O.CustomerId,
		C.ContactName,
		count(O.OrderID) as total_pedidos
from northwind.Orders O
JOIN northwind.Customers C ON O.CustomerID = C.CustomerID
Group by CustomerId, C.ContactName
HAVING count(O.OrderID) > (
	select avg(total_pedidos)
	from(
		select CustomerId, count(OrderID) as total_pedidos
		from northwind.orders
		Group by CustomerId
		order by CustomerID
	) as t
)
