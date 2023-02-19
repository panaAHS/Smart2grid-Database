SELECT License_ID 
FROM power_production_unit_instance WHERE DATE(Date_time) = '2022-11-04' AND Power_Production <> 0 AND DATE(Date_time) NOT IN (SELECT License_ID  FROM power_production_unit_instance WHERE DATE(Date_time) = '2022-11-05' AND Power_Production <> 0);





