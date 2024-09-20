SELECT
  TRI.usertype,
  TRI.start_station_longitude,
  TRI.start_station_latitude,
  TRI.end_station_longitude,
  TRI.end_station_latitude,
  ZIPSTART.zip_code AS zip_code_start,
  ZIPSTARTNAME.borough AS borough_start,
  ZIPSTARTNAME.neighborhood AS neighborhood_start,
  ZIPEND.zip_code AS zip_code_end,
  ZIPENDNAME.borough AS borough_end,
  ZIPENDNAME.neighborhood AS neighborhood_end,
  DATE(TRI.starttime) AS start_day,  -- Fecha de inicio sin modificar
  DATE(TRI.stoptime) AS stop_day,    -- Fecha de fin sin modificar
  WEA.temp AS day_mean_temperature,  -- Temperatura media diaria
  WEA.wdsp AS day_mean_wind_speed,   -- Velocidad media del viento diaria
  WEA.prcp AS day_total_precipitation, -- Precipitación total diaria
  ROUND(CAST(TRI.tripduration / 60 AS INT64), -1) AS trip_minutes, -- Duración del viaje en minutos redondeada a 10 minutos
  TRI.bikeid
FROM 
  `bigquery-public-data.new_york_citibike.citibike_trips` AS TRI
INNER JOIN
  `bigquery-public-data.geo_us_boundaries.zip_codes` ZIPSTART
ON ST_WITHIN(
  ST_GEOGPOINT(TRI.start_station_longitude, TRI.start_station_latitude),
  ZIPSTART.zip_code_geom)
INNER JOIN
  `bigquery-public-data.geo_us_boundaries.zip_codes` ZIPEND
ON ST_WITHIN(
  ST_GEOGPOINT(TRI.end_station_longitude, TRI.end_station_latitude),
  ZIPEND.zip_code_geom)
INNER JOIN
  `bigquery-public-data.noaa_gsod.gsod20*` AS WEA
ON PARSE_DATE("%Y%m%d", CONCAT(WEA.year, WEA.mo, WEA.da)) = DATE(TRI.starttime)
INNER JOIN
  `bi-course-429916.cyclistic_dataset.NYC-ZIP-CODES` AS ZIPSTARTNAME
ON ZIPSTART.zip_code = CAST(ZIPSTARTNAME.zip AS STRING)
INNER JOIN
  `bi-course-429916.cyclistic_dataset.NYC-ZIP-CODES` AS ZIPENDNAME
ON ZIPEND.zip_code = CAST(ZIPENDNAME.zip AS STRING)
WHERE
  WEA.wban = '94728'  -- Filtrado por la estación meteorológica de Central Park
  AND DATE(TRI.starttime) BETWEEN DATE('2015-07-01') AND DATE('2015-09-30')  -- Filtrar por el verano de 2015
