SET session sql_log_bin=0;
SET session rocksdb_bulk_load=1;
LOAD DATA INFILE '/tmp/bulk_load.csv' INTO TABLE test.bulk_load
FIELDS TERMINATED BY ','  OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n' ;
