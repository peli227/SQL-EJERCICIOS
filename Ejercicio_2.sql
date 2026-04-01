-- Mostrar los productos que nunca han sido vendidos.
Select P.ProductID,
		P.ProductName
From northwind.Products P
left join northwind.OrderDetails OD on P.ProductID = OD.ProductID
WHERE OD.ProductID IS NULL 
