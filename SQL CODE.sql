
-- Instructions:

-- Print the company_name field.

-- Find the number of taxi trips for each taxi company for November 15th and 16th, 2017, name the resulting field trips_amount, and print it as well.

-- Sort the results by the trips_amount field in descending order.

-- SQL Code:

SELECT 
    cabs.company_name AS company_name,
    COUNT(trips.trip_id) AS trips_amount
FROM 
    cabs
    INNER JOIN trips ON trips.cab_id = cabs.cab_id
WHERE 
    CAST(trips.start_ts AS date) BETWEEN '2017-11-15'
    and '2017-11-16'
GROUP BY
    company_name
ORDER BY 
    trips_amount DESC;

-- Instructions:

-- Find the number of trips for each taxi company whose name contains the words "Yellow" or "Blue" from November 1st to 7th, 2017.
-- Name the resulting variable trips_amount.

-- Group the results by the company_name field.

-- SQL Code:
SELECT 
    cabs.company_name,
    COUNT(trips.trip_id) AS trips_amount
FROM 
    cabs
    INNER JOIN trips ON trips.cab_id = cabs.cab_id
WHERE 
    CAST(trips.start_ts AS date) BETWEEN '2017-11-01'
    AND '2017-11-07'
    AND cabs.company_name LIKE '%%Yellow%%'
GROUP BY 
    company_name
UNION ALL 
SELECT 
    cabs.company_name,
    COUNT(trips.trip_id) AS trips_amount
FROM 
    cabs
    INNER JOIN trips ON trips.cab_id = cabs.cab_id
WHERE 
    CAST(trips.start_ts AS date) BETWEEN '2017-11-01'
    AND '2017-11-07'
    AND cabs.company_name LIKE '%%Blue%%'
GROUP BY 
    company_name;


-- Instructions:

-- From November 1st to 7th, 2017, the most popular taxi companies were Flash Cab and Taxi Affiliation Services.

-- Find the number of trips for these two companies and name the resulting variable trips_amount.

-- Group the trips for all other companies into the "Other" group. Group the data by taxi company name.

-- Name the field with taxi company names "company".

-- Sort the result in descending order by trips_amount.

-- SQL Code:
SELECT 
    CASE 
        WHEN cabs.company_name = 'Flash Cab' THEN 'Flash Cab'
        WHEN cabs.company_name = 'Taxi Affiliation Services' THEN 'Taxi Affiliation Services'
    ELSE 'Other'
    END AS company,
    COUNT(trips.trip_id) AS trips_amount
FROM 
    cabs
    INNER JOIN trips ON trips.cab_id = cabs.cab_id
WHERE 
   CAST(trips.start_ts AS date) BETWEEN '2017-11-01'
    AND '2017-11-07'
GROUP BY 
    company
ORDER BY trips_amount DESC;

-- Instructions:

-- Retrieve the identifiers for the O'Hare and Loop neighborhoods from the neighborhoods table.

-- SQL Code:

SELECT 
    name,
    neighborhood_id
FROM
    neighborhoods
WHERE 
    name LIKE '%Hare'
    OR name LIKE 'Loop'

-- Instructions:

-- For each hour, retrieve the weather condition records from the weather_records table.

-- Using the CASE operator, divide all hours into two groups: Bad if the description field contains the words rain or storm, and Good for all others.

-- Name the resulting field weather_conditions. The final table should include two fields: date and time (ts) and weather_conditions.

-- SQL Code:
SELECT
    ts,
    CASE 
        WHEN description LIKE '%rain%' OR description LIKE '%storm%' THEN 'Bad'
        ELSE 'Good' END AS weather_conditions
FROM 
    weather_records

-- Instructions:

-- Retrieve from the trips table all trips that started at the Loop (pickup_location_id: 50) on Saturday and ended at O'Hare (dropoff_location_id: 63).

-- Get the weather conditions for each trip. Use the method you applied in the previous task.

-- Also retrieve the duration of each trip.

-- Ignore trips for which no weather data is available.

-- Sort by trip_id.

-- The table columns should be in the following order:
-- start_ts
-- weather_conditions
-- duration_seconds

-- SQL Code:
SELECT
    start_ts,
    T.weather_conditions,
    duration_seconds
FROM 
    trips
INNER JOIN (
    SELECT 
    ts, 
    CASE 
        WHEN description LIKE '%rain%' OR description LIKE '%storm%' THEN 'Bad'
        ELSE 'Good' END AS weather_conditions
    FROM 
        weather_records
) T ON T.ts = trips.start_ts
WHERE 
    pickup_location_id = 50
    AND trips.dropoff_location_id = 63
    AND EXTRACT(DOW FROM trips.start_ts) = 6
    
ORDER BY 
    trip_id;
