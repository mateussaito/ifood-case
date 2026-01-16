SELECT
  date_format(pickup_datetime, 'yyyy-MM-dd HH:00') AS hour
  ,CAST(AVG(passenger_count) AS DECIMAL(10,4)) AS avg_amount
FROM workspace.default.dbo_run_tripdata
WHERE date_format(pickup_datetime, 'yyyy-MM') = "2023-05"
  AND taxi_type_id IN (1,2) -- Considering only green and yellow as taxi
GROUP BY date_format(pickup_datetime, 'yyyy-MM-dd HH:00')
ORDER BY hour
