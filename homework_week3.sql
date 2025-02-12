CREATE OR REPLACE EXTERNAL TABLE `kestra-de-zc.zoomcamp.yellow_tripdata_2024_ext`
OPTIONS (
  format = 'parquet',
  uris = ['gs://kestra-teju/yellow_tripdata_2024*.parquet']
);

CREATE OR REPLACE TABLE `kestra-de-zc.zoomcamp.yellow_tripdata_2024`
AS SELECT * FROM `kestra-de-zc.zoomcamp.yellow_tripdata_2024_ext`;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select count(1) from kestra-de-zc.zoomcamp.yellow_tripdata_2024;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select distinct PULocationID from kestra-de-zc.zoomcamp.yellow_tripdata_2024_ext;

select distinct PULocationID from kestra-de-zc.zoomcamp.yellow_tripdata_2024;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select PULocationID from kestra-de-zc.zoomcamp.yellow_tripdata_2024;

select PULocationID, DOLocationID from kestra-de-zc.zoomcamp.yellow_tripdata_2024;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select count(1) from `zoomcamp.yellow_tripdata_2024` where fare_amount = 0;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- select distinct VendorID from `zoomcamp.yellow_tripdata_2024` where DATE(tpep_dropoff_datetime) > DATE('2024-03-01') and DATE(tpep_dropoff_datetime) < DATE('2024-03-15');
select distinct VendorID from `zoomcamp.yellow_tripdata_2024` where DATE(tpep_dropoff_datetime) BETWEEN '2024-03-01' and '2024-03-15';

-- CREATE OR REPLACE TABLE `zoomcamp.yellow_tripdata_2024_part`
-- PARTITION BY DATE(tpep_dropoff_datetime) AS (
--   SELECT * FROM `zoomcamp.yellow_tripdata_2024`
-- );

select distinct VendorID from `zoomcamp.yellow_tripdata_2024_part` where DATE(tpep_dropoff_datetime) >= DATE('2024-03-01') and DATE(tpep_dropoff_datetime) <= DATE('2024-03-15');
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
