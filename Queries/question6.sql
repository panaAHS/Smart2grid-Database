SELECT power_production_unit.License_ID, Unit_availability
FROM power_production_unit_instance JOIN power_production_unit ON power_production_unit_instance.License_ID = power_production_unit.License_ID
WHERE Date_time = '2022-11-04 00:12:00'  AND Unit_Type = 'HPS' #AND Unit_availability > 100
