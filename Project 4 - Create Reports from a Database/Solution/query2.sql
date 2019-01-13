SELECT STRFTIME('%Y', o.orderdate) AS year, SUM(od.quantity*od.unitprice*od.discount) AS order_amount, SUM(od.quantity) AS order_quantity
FROM orders o
JOIN orderdetails od
ON o.orderid=od.orderid
GROUP BY 1
ORDER BY 1; 