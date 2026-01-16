SELECT
  date_format(rt.pickup_datetime, 'yyyy-MM') AS month
  ,CAST(AVG(rt.total_amount) AS DECIMAL(10,4)) AS avg_amount
FROM workspace.default.dbo_taxi_type AS tt
LEFT JOIN workspace.default.dbo_run_tripdata AS rt
  ON tt.taxi_type_id = rt.taxi_type_id
WHERE tt.taxi_type = "yellow"
GROUP BY date_format(pickup_datetime, 'yyyy-MM')
ORDER BY month
