SELECT c.categoryname AS category, COUNT(*) AS number_of_products, SUM(p.unitsinstock) AS stock
FROM Categories c
JOIN Products p
ON c.categoryid=P.categoryid
GROUP BY 1
ORDER BY 3 DESC;