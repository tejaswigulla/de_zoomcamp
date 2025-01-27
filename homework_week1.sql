SELECT 
    CASE 
        WHEN trip_distance <= 1 THEN 'Up to 1 mile'
        WHEN trip_distance > 1 AND trip_distance <= 3 THEN '1-3 miles'
        WHEN trip_distance > 3 AND trip_distance <= 7 THEN '3-7 miles'
        WHEN trip_distance > 7 AND trip_distance <= 10 THEN '7-10 miles'
        WHEN trip_distance > 10 THEN 'Over 10 miles'
        ELSE 'Unknown'
    END AS trip_distance_segment,
    COUNT(*) AS trip_count
FROM green_taxi_trips
GROUP BY trip_distance_segment
ORDER BY trip_distance_segment;
--------------------------------------------------------------------------------
SELECT 
    DATE(lpep_pickup_datetime) AS trip_date,
    trip_distance
FROM green_taxi_trips
ORDER BY trip_distance DESC
LIMIT 1;
--------------------------------------------------------------------------------
SELECT 
    CONCAT(z."Borough", ' / ', z."Zone") AS pickup_location,
    COUNT(*) AS trip_count
FROM 
    green_taxi_trips g
JOIN 
    zones z ON g."PULocationID" = z."LocationID"
GROUP BY 
    pickup_location
ORDER BY 
    trip_count DESC
LIMIT 5;  -- You can adjust the number of results you want
--------------------------------------------------------------------------------
SELECT 
    CONCAT(z."Borough", ' / ', z."Zone") AS pickup_location,
    MAX(g."tip_amount") AS largest_tip
FROM 
    green_taxi_trips g
JOIN 
    zones z ON g."PULocationID" = z."LocationID"
GROUP BY 
    pickup_location
ORDER BY 
    largest_tip DESC
LIMIT 5;
