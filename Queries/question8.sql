SELECT power_production_unit.License_ID 
FROM power_production_unit JOIN power_production_unit_instance ON power_production_unit.License_ID = power_production_unit_instance.License_ID
 WHERE DATE(Date_time) = '2022-11-04' AND Power_Production <> 0 AND Electricity_Producer = 'PPC' AND Unit_Type = 'TPC';