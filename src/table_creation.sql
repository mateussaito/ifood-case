DROP TABLE IF EXISTS workspace.default.stg_yellow_tripdata;
DROP TABLE IF EXISTS workspace.default.stg_green_tripdata;
DROP TABLE IF EXISTS workspace.default.stg_fhv_tripdata;
DROP TABLE IF EXISTS workspace.default.stg_fhvhv_tripdata;
DROP TABLE IF EXISTS workspace.default.dbo_payment_type;
DROP TABLE IF EXISTS workspace.default.dbo_rate_code;
DROP TABLE IF EXISTS workspace.default.dbo_vendor;
DROP TABLE IF EXISTS workspace.default.dbo_run_tripdata;
DROP TABLE IF EXISTS workspace.default.dbo_taxi_type;

CREATE TABLE workspace.default.stg_yellow_tripdata (
  VendorID BIGINT,
  tpep_pickup_datetime TIMESTAMP,
  tpep_dropoff_datetime TIMESTAMP,
  passenger_count DOUBLE,
  trip_distance DOUBLE,
  RatecodeID DOUBLE,
  store_and_fwd_flag STRING,
  PULocationID BIGINT,
  DOLocationID BIGINT,
  payment_type BIGINT,
  fare_amount DOUBLE,
  extra DOUBLE,
  mta_tax DOUBLE,
  tip_amount DOUBLE,
  tolls_amount DOUBLE,
  improvement_surcharge DOUBLE,
  total_amount DOUBLE,
  congestion_surcharge DOUBLE,
  airport_fee DOUBLE)
USING delta
TBLPROPERTIES (
  'delta.feature.timestampNtz' = 'supported'
);

CREATE TABLE workspace.default.stg_green_tripdata (
  VendorID BIGINT,
  lpep_pickup_datetime TIMESTAMP,
  lpep_dropoff_datetime TIMESTAMP,
  store_and_fwd_flag STRING,
  RatecodeID DOUBLE,
  PULocationID BIGINT,
  DOLocationID BIGINT,
  passenger_count DOUBLE,
  trip_distance DOUBLE,
  fare_amount DOUBLE,
  extra DOUBLE,
  mta_tax DOUBLE,
  tip_amount DOUBLE,
  tolls_amount DOUBLE,
  ehail_fee INT,
  improvement_surcharge DOUBLE,
  total_amount DOUBLE,
  payment_type DOUBLE,
  trip_type DOUBLE,
  congestion_surcharge DOUBLE)
USING delta
TBLPROPERTIES (
  'delta.feature.timestampNtz' = 'supported'
);

CREATE TABLE workspace.default.stg_fhv_tripdata (
  dispatching_base_num STRING,
  pickup_datetime TIMESTAMP,
  dropOff_datetime TIMESTAMP,
  PUlocationID DOUBLE,
  DOlocationID DOUBLE,
  SR_Flag INT,
  Affiliated_base_number STRING)
USING delta
TBLPROPERTIES (
  'delta.feature.timestampNtz' = 'supported'
);

CREATE TABLE workspace.default.stg_fhvhv_tripdata (
  hvfhs_license_num STRING,
  dispatching_base_num STRING,
  originating_base_num STRING,
  request_datetime TIMESTAMP,
  on_scene_datetime TIMESTAMP,
  pickup_datetime TIMESTAMP,
  dropoff_datetime TIMESTAMP,
  PULocationID BIGINT,
  DOLocationID BIGINT,
  trip_miles DOUBLE,
  trip_time BIGINT,
  base_passenger_fare DOUBLE,
  tolls DOUBLE,
  bcf DOUBLE,
  sales_tax DOUBLE,
  congestion_surcharge DOUBLE,
  airport_fee DOUBLE,
  tips DOUBLE,
  driver_pay DOUBLE,
  shared_request_flag STRING,
  shared_match_flag STRING,
  access_a_ride_flag STRING,
  wav_request_flag STRING,
  wav_match_flag STRING)
USING delta
TBLPROPERTIES (
  'delta.feature.timestampNtz' = 'supported'
);

CREATE TABLE workspace.default.dbo_run_tripdata (
  taxi_type_id BIGINT,
  license_id STRING, 
  VendorID BIGINT,
  pickup_datetime TIMESTAMP_NTZ,
  dropoff_datetime TIMESTAMP_NTZ,
  passenger_count BIGINT,
  RatecodeID BIGINT,
  payment_type BIGINT,
  total_amount DOUBLE)
USING delta
TBLPROPERTIES (
  'delta.feature.timestampNtz' = 'supported'
);

CREATE TABLE workspace.default.dbo_taxi_type (
  taxi_type_id BIGINT,
  taxi_type STRING)
USING delta;

CREATE TABLE workspace.default.dbo_vendor (
  vendor_id BIGINT,
  vendor STRING)
USING delta;

CREATE TABLE workspace.default.dbo_rate_code (
  rate_code_id BIGINT,
  rate_code STRING)
USING delta;

CREATE TABLE workspace.default.dbo_payment_type (
  payment_type_id BIGINT,
  payment_type STRING)
USING delta;

INSERT INTO dbo_vendor
VALUES
  (1, 'Creative Mobile Technologies, LLC'),
  (2, 'Curb Mobility, LLC'),
  (6, 'Myle Technologies Inc'),
  (7, 'Helix');

INSERT INTO dbo_rate_code
VALUES
  (1, 'Standard rate'),
  (2, 'JFK'),
  (3, 'Newark'),
  (4, 'Nassau or Westchester'),
  (5, 'Negotiated fare'),
  (6, 'Group ride'),
  (99, 'Null/unknown');

INSERT INTO dbo_payment_type
VALUES
  (0, 'Flex Fare trip'),
  (1, 'Credit card'),
  (2, 'Cash'),
  (3, 'No charge'),
  (4, 'Dispute'),
  (5, 'Unknown'),
  (6, 'Voided trip');

INSERT INTO dbo_taxi_type
VALUES
  (1, 'yellow'),
  (2, 'green'),
  (3, 'fhv'),
  (4, 'fhvhv');
