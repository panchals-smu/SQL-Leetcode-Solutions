# Write your MySQL query statement below
SELECT customer_number
FROM (SELECT customer_number, COUNT(order_number) as cnt
FROM Orders
GROUP BY customer_number
ORDER BY cnt DESC
LIMIT 1) x
