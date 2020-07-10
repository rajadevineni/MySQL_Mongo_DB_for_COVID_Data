SELECT count(*) FROM state_lockdown_details;
-- 51 verified

SELECT count(*) FROM county_details; 

-- 3443 verified

SELECT count(*) FROM Station_details;
-- 1667 verified

SELECT count(*) FROM fips_daily_cases;
-- 186740 verified

SELECT count(*) FROM daily_weather_details;
-- 186740 verified

SELECT count(*) FROM county_socio_health; 
-- 2960 

SELECT fips FROM county_socio_health where station_id is Null; 

SELECT * FROM county_details where fips in (SELECT fips FROM county_socio_health where station_id is Null); 



