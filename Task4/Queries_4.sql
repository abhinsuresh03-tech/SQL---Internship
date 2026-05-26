CREATE TABLE cloud_usage(
    user_id VARCHAR(20),
    resource_type VARCHAR(20),
    usage_hours FLOAT,
    cost FLOAT,
    usage_date DATE
);

INSERT INTO cloud_usage VALUES
('U001', 'compute', 120.5, 2400, '2025-07-01'),
('U002', 'storage', 300.0, 1500, '2025-07-02'),
('U003', 'network', 50.0, 800, '2025-07-03'),
('U001', 'storage', 200.0, 1000, '2025-07-04'),
('U004', 'compute', 400.0, 5000, '2025-07-05'),
('U002', 'network', 100.0, 1200, '2025-07-06'),
('U005', 'compute', 50.0, 600, '2025-07-07'),
('U003', 'storage', 150.0, 750, '2025-07-08'),
('U004', 'network', 80.0, 900, '2025-07-09'),
('U001', 'compute', 100.0, 2000, '2025-07-10');

select * from cloud_usage


--Top 3 Users by Total Cost
SELECT top 3 user_id, SUM(cost) AS total_spent
FROM cloud_usage
GROUP BY user_id
ORDER BY total_spent DESC

--Total Cost and average usage of each Resource Type
SELECT resource_type, SUM(cost) AS total_spent, AVG(usage_hours) AS avg_usage
FROM cloud_usage
GROUP BY resource_type
ORDER BY total_spent DESC

--Users Spending Over ?3,000
SELECT user_id, SUM(cost) AS total_spent
FROM cloud_usage
GROUP BY user_id
HAVING SUM(cost) > 3000;

--Top 3 Users by Total Cost
SELECT top 3 user_id, SUM(cost) AS total_spent
FROM cloud_usage
GROUP BY user_id
ORDER BY total_spent DESC

--Total Cost and average usage of each Resource Type
SELECT resource_type, SUM(cost) AS total_spent, AVG(usage_hours) AS avg_usage
FROM cloud_usage
GROUP BY resource_type
ORDER BY total_spent DESC

--Users Spending Over ?3,000
SELECT user_id, SUM(cost) AS total_spent
FROM cloud_usage
GROUP BY user_id
HAVING SUM(cost) > 3000;

--Users with High Variability in Cost
SELECT 
    user_id, MAX(cost) as Max_cost, MIN(cost) as Min_cost,
    MAX(cost) - MIN(cost) AS cost_range
FROM cloud_usage
GROUP BY user_id
HAVING MAX(cost) - MIN(cost) > 2000;


--Users with More Than One Resource Type Used
SELECT 
    user_id,
    COUNT(DISTINCT resource_type) AS resource_variety
FROM cloud_usage
GROUP BY user_id
HAVING COUNT(DISTINCT resource_type) > 1;

--Detecting Idle Users 
SELECT 
    user_id,
    COUNT(*) AS record_count,
    SUM(usage_hours) AS total_usage
FROM cloud_usage
GROUP BY user_id
HAVING SUM(usage_hours) < 100;

--count of the resource used by each user
SELECT 
    user_id,
    COUNT(*) AS total_entries,
    COUNT(cost) AS cost_entries
FROM cloud_usage
GROUP BY user_id;

