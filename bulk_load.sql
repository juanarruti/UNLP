LOAD DATA INFILE '/tmp/bulk_load.csv' INTO TABLE test.bulk_load
FIELDS TERMINATED BY ','  OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n' ;
