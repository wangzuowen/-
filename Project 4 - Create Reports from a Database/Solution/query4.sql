SELECT product_name AS product_name, SUM(order_2016-order_2015) AS sale_increase_2016, (order_2016)*100/(order_2015) AS percent_increase_2016 
FROM
(SELECT t1.product_name AS product_name, t1.order_amount AS order_2016, t2.order_amount AS order_2015
FROM
 (SELECT STRFTIME('%Y', o.orderdate) AS date_2016, p.productname AS product_name, p.productid, SUM(od.quantity*od.unitprice*od.discount)
 AS order_amount
 FROM orders o
 JOIN orderdetails od
 ON o.orderid=od.orderid
 JOIN products p
 ON od.productid=p.productid
 WHERE STRFTIME('%Y', o.orderdate)='2016'
 GROUP BY 2
 ORDER BY 3 DESC) t1
JOIN 
 (SELECT STRFTIME('%Y', o.orderdate) AS date_2015, p.productname, p.productid, SUM(od.quantity*od.unitprice*od.discount) AS order_amount
 FROM orders o
 JOIN orderdetails od
 ON o.orderid=od.orderid
 JOIN products p
 ON od.productid=p.productid
 WHERE STRFTIME('%Y', o.orderdate)='2015'
 GROUP BY 2
 ORDER BY 3 DESC) t2
ON t1.productid=t2.productid) t3
GROUP BY 1
ORDER BY 3 DESC
LIMIT 10