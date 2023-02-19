SELECT SUM(Power_Production) AS Total_dail_prod
FROM power_production_unit_instance
WHERE DATE(Date_time) = '2022-11-04'
