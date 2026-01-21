# Write your MySQL query statement below
with m as (SELECT d.id ,d.name, MAX(salary) as max
FROM Department d
LEFT JOIN Employee e
ON d.id = e.departmentId
GROUP BY e.departmentId)
SELECT m.name as Department, e.name as Employee, e.salary
FROM Employee e
JOIN m
ON e.departmentId = m.id
WHERE e.salary = max