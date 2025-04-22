-- Create tables for Q1Q2 and Q3Q4
CREATE TABLE Q1Q2 (
    ID INT,
    name VARCHAR(350),
    city VARCHAR(100),
    latitude FLOAT,
    longitude FLOAT,
    dpcapacity INTEGER,
    online_date TIMESTAMP
);

CREATE TABLE Q3Q4 (
    ID INT,
    name VARCHAR(350),
    city VARCHAR(100),
    latitude FLOAT,
    longitude FLOAT,
    dpcapacity INTEGER,
    online_date TIMESTAMP,
    extra_column TEXT 
);

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

-- Check for null values in Q4
SELECT *
FROM Q4
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


