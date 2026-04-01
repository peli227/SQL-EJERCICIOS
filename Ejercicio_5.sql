-- Mostrar los productos cuyo precio es mayor al promedio de su categoría
Select P.ProductName,
		P.CategoryID,
		P.Price
from Products P
JOIN Categories C ON P.CategoryID = C.CategoryID
group by P.ProductName, P.CategoryID, P.Price
Having P.Price > (
	Select  avg(P2.Price)
	from Products P2
)
