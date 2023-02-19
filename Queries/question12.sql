SELECT AVG(Power_production) as Avg_November_00_01
 FROM power_production_unit_instance 
 WHERE DATE(Date_time) >= '2022-11-01' AND DATE(Date_time) <= '2022-11-30' AND TIME(Date_time) >= '00:00:00' AND TIME(Date_time) <= '01:00:00';



