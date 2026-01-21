-- # Write your MySQL query statement below
WITH big_t as (
    SELECT id, client_id, driver_id, CASE 
WHEN status = 'cancelled_by_driver' THEN 1
WHEN status = 'cancelled_by_client' THEN 1 
ELSE 0 END AS Cancelled, CASE WHEN client_id > 0 THEN 1 ELSE 0 END AS trip, request_at as day_n
FROM Trips t
JOIN Users u
ON t.client_id = u.users_id
WHERE u.role = 'client' AND u.banned = 'No' AND request_at BETWEEN '2013-10-01' AND '2013-10-03' AND driver_id IN (SELECT t.driver_id
    FROM Trips t
    JOIN Users u
    ON t.driver_id = u.users_id
    WHERE u.role = 'driver' and u.banned = 'No')
)
SELECT day_n as 'Day', ROUND (SUM(Cancelled) / SUM(trip),2) as 'Cancellation Rate'
FROM big_t
GROUP BY day_n
HAVING SUM(trip) >= 1
ORDER BY day_n

