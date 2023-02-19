#-- Administrator
CREATE USER 'administrator'@'localhost' IDENTIFIED BY 'imgod';
GRANT ALL PRIVILEGES ON smart2grid.* TO 'administrator'@'localhost';
#==================================================================== 

#-- PPU 
CREATE USER 'PPU_instance_user'@'%' IDENTIFIED BY 'PPU_password';
GRANT INSERT, UPDATE ON smart2grid.power_production_unit_instance TO 'PPU_instance_user'@'%';
#==================================================================================================

#-- Smart Meter
CREATE USER 'smartmeter'@'%' IDENTIFIED BY 'smartmeterpassword';
GRANT INSERT, UPDATE ON smart2grid.smartmeter TO 'smartmeter'@'%';
#=================================================================

#-- Consumer
CREATE USER 'consumer_user'@'%' IDENTIFIED BY 'consumer_password';
GRANT SELECT ON smart2grid.power_production_unit_instance TO 'consumer_user'@'%';

GRANT SELECT ON smart2grid.monitoring_instance TO 'consumer_user'@'%';

GRANT SELECT ON smart2grid.smartmeter TO 'consumer_user'@'%';

GRANT SELECT ON smart2grid.bill TO 'consumer_user'@'%';

GRANT SELECT, INSERT, UPDATE ON smart2grid.con_email TO 'consumer_user'@'%';

GRANT SELECT, INSERT, UPDATE ON smart2grid.con_phone TO 'consumer_user'@'%';

GRANT SELECT ON smart2grid.`lv_consumer-smart_meter` TO 'consumer'@'%';
#========================================================================


#-- Monitoring Instance
CREATE USER 'monitoring_instance_user'@'%' IDENTIFIED BY 'M_password';
GRANT INSERT, UPDATE ON smart2grid.monitoring_instance TO 'monioring_instance_user'@'%';
#========================================================================================


#-- Grid employee
CREATE USER 'employee'@'%' IDENTIFIED BY 'employeepassword';

GRANT SELECT ON smart2grid.monitoring_instance TO 'employee'@'%';

GRANT SELECT ON smart2grid.power_production_unit_instance TO 'employee'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE ON smart2grid.smartmeter TO 'employee'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE ON smart2grid.power_line TO 'employee'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE ON smart2grid.power_production_unit TO 'employee'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE ON smart2grid.monitoring TO 'employee'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE ON smart2grid.bill TO 'employee'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE ON smart2grid.consumer TO 'employee'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE ON smart2grid.hv_consumer TO 'employee'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE ON smart2grid.lv_consumer TO 'employee'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE ON smart2grid.mv_consumer TO 'employee'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE ON smart2grid.con_email TO 'employee'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE ON smart2grid.con_phone TO 'employee'@'%';











