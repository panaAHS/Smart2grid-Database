#DROP TABLE A;
CREATE TEMPORARY TABLE A AS SELECT * FROM power_production_unit WHERE Unit_Type = 'Wind_Turbine';

SELECT A.License_ID, Power_Production, Reactive_Power, Date_Time
FROM A JOIN power_production_unit_instance ON A.License_ID = power_production_unit_instance.License_ID
