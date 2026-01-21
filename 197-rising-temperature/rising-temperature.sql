# Write your MySQL query statement below
SELECT id
FROM
(SELECT id, recordDate, temperature, LAG(temperature,1) OVER (ORDER BY recordDate) as yesterday, LAG(recordDate) OVER (ORDER BY recordDate) as yesterday_date
FROM Weather) x
WHERE temperature > yesterday and DATEDIFF(recordDate,yesterday_date) = 1









































-- SELECT w1.id
-- FROM Weather w1
-- JOIN Weather w2
-- ON DATEDIFF(w1.recordDate,w2.recordDate) = 1
-- WHERE w1.temperature > w2.temperature


