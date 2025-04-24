

-- Create and clean Q1 table
CREATE TABLE Q1 (
    trip_id INT,
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    bikeid INT,
    tripduration INT,
    from_station_id INT,
    from_station_name VARCHAR(350),
    to_station_id INT,
    to_station_name VARCHAR(350),
    usertype VARCHAR(50),
    gender VARCHAR(30),
    birthyear VARCHAR(4)
);

UPDATE Q1
SET birthyear = '0'
WHERE birthyear = '';

ALTER TABLE Q1
ALTER COLUMN birthyear TYPE INTEGER USING birthyear::INTEGER;

-- Create and clean Q2 table
CREATE TABLE Q2 (
    trip_id INT,
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    bikeid INT,
    tripduration INT,
    from_station_id INT,
    from_station_name VARCHAR(350),
    to_station_id INT,
    to_station_name VARCHAR(350),
    usertype VARCHAR(50),
    gender VARCHAR(30),
    birthyear VARCHAR(4)
);

UPDATE Q2
SET birthyear = '0'
WHERE birthyear = '';

ALTER TABLE Q2
ALTER COLUMN birthyear TYPE INTEGER USING birthyear::INTEGER;

-- Create and clean Q3 table
CREATE TABLE Q3 (
    trip_id INT,
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    bikeid INT,
    tripduration INT,
    from_station_id INT,
    from_station_name VARCHAR(350),
    to_station_id INT,
    to_station_name VARCHAR(350),
    usertype VARCHAR(50),
    gender VARCHAR(30),
    birthyear VARCHAR(4)
);

UPDATE Q3
SET birthyear = '0'
WHERE birthyear = '';

ALTER TABLE Q3
ALTER COLUMN birthyear TYPE INTEGER USING birthyear::INTEGER;

-- Create and clean Q4 table
CREATE TABLE Q4 (
    trip_id INT,
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    bikeid INT,
    tripduration INT,
    from_station_id INT,
    from_station_name VARCHAR(350),
    to_station_id INT,
    to_station_name VARCHAR(350),
    usertype VARCHAR(50),
    gender VARCHAR(30),
    birthyear VARCHAR(4)
);

UPDATE Q4
SET birthyear = '0'
WHERE birthyear = '';

ALTER TABLE Q4
ALTER COLUMN birthyear TYPE INTEGER USING birthyear::INTEGER;
--Joining tables q1-q4
Create Table q1_q4_2017 AS
Select * From q1
Union All
Select * From q2
Union All
Select * From q3
Union All
Select * From q4
-- Check for null values 
SELECT *
FROM q1_q4_2017
WHERE trip_id IS NULL
   OR start_time IS NULL
   OR end_time IS NULL
   OR bikeid IS NULL
   OR tripduration IS NULL
   OR from_station_id IS NULL
   OR from_station_name IS NULL
   OR to_station_id IS NULL
   OR to_station_name IS NULL
   OR usertype IS NULL
   OR gender IS NULL
   OR birthyear IS NULL;
-- Checking morning, afternoon, evening

SELECT 
    usertype,
    CASE 
        WHEN EXTRACT(HOUR FROM start_time) BETWEEN 5 AND 11 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM start_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        WHEN EXTRACT(HOUR FROM start_time) BETWEEN 18 AND 23 THEN 'Evening'
        ELSE 'Night'
    END AS time_of_day,
    COUNT(*) AS total_rides
FROM q1_q4_2017
GROUP BY usertype, time_of_day
ORDER BY time_of_day, total_rides DESC;

-- Checking month to month total rides
SELECT 
    DATE_TRUNC('month', start_time) AS month,
    COUNT(*) AS total_rides
FROM q1_q4_2017
GROUP BY month
ORDER BY month;

-- Trip duration per usertype
Select sum(tripduration), usertype
from q1_q4_2017 
Group by usertype

--Avg ride duration
SELECT 
  AVG(EXTRACT(EPOCH FROM (end_time - start_time))) / 60 AS avg_ride_duration_minutes
FROM 
  q1_q4_2017

