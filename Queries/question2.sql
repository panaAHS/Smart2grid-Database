SELECT Full_Name, Address, Payment_ID 
FROM lv_consumer JOIN consumer ON lv_consumer.TIN = consumer.TIN
JOIN bill ON consumer.TIN = bill.TIN