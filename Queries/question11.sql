SELECT Date_time 
FROM monitoring JOIN monitoring_instance ON monitoring.Meter_ID = monitoring_instance.Meter_ID
JOIN power_line ON power_line.PL_ID = monitoring.PL_ID
WHERE Region = 'Thessaloniki' AND Temperature >= 60