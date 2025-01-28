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
    zpu."Zone" AS pickup_zone,
    SUM(g."total_amount") AS total_revenue
FROM 
    green_taxi_trips g
JOIN 
    zones zpu ON g."PULocationID" = zpu."LocationID"
WHERE 
    DATE(g."lpep_pickup_datetime") = '2019-10-18'
GROUP BY 
    zpu."Zone"
HAVING 
    SUM(g."total_amount") > 13000
ORDER BY 
    total_revenue DESC
LIMIT 3;
--------------------------------------------------------------------------------
SELECT 
    zdo."Zone" AS dropoff_zone,
    MAX(g."tip_amount") AS largest_tip
FROM 
    green_taxi_trips g
JOIN 
    zones zpu ON g."PULocationID" = zpu."LocationID"
JOIN 
    zones zdo ON g."DOLocationID" = zdo."LocationID"
WHERE 
    zpu."Zone" = 'East Harlem North'
    AND DATE_TRUNC('month', g."lpep_pickup_datetime") = '2019-10-01'
GROUP BY 
    zdo."Zone"
ORDER BY 
    largest_tip DESC
LIMIT 1;

