DROP TABLE G;
DROP TABLE H;
DROP TABLE I;
DROP TABLE J;

CREATE TEMPORARY TABLE G AS
SELECT PL_ID FROM power_line WHERE Nominal_Voltage = '150kV';

CREATE TEMPORARY TABLE H AS
SELECT PL_ID FROM power_line WHERE Nominal_Voltage = '400kV';

CREATE TEMPORARY TABLE J AS
SELECT monitoring.Meter_ID, G.PL_ID, Date_time, Voltage, Coordinates
FROM G JOIN monitoring ON G.PL_ID = monitoring.PL_ID 
JOIN monitoring_instance ON monitoring.Meter_ID = monitoring_instance.Meter_ID
WHERE Voltage > 150;

CREATE TEMPORARY TABLE I AS
SELECT monitoring.Meter_ID, H.PL_ID, monitoring_instance.Date_time, Voltage, Coordinates
FROM H JOIN monitoring ON H.PL_ID = monitoring.PL_ID 
JOIN monitoring_instance ON  monitoring.Meter_ID = monitoring_instance.Meter_ID 
WHERE Voltage > 400.0; 

SELECT PL_ID, Coordinates, Voltage 
FROM I
UNION
SELECT PL_ID, Coordinates, Voltage 
FROM J
