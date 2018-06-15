drop database if exists test ;
create database test ;
create table test.bulk_load (
c01 integer auto_increment,
c02 varchar(500),
c03 varchar(500),
c04 varchar(500),
c05 varchar(500),
c06 varchar(500),
c07 varchar(500),
c08 varchar(500),
c09 varchar(500),
c10 varchar(500),
c11 varchar(500),
c12 varchar(500),
c13 varchar(500),
c14 varchar(500),
c15 varchar(500),
c16 varchar(500),
c17 varchar(500),
c18 varchar(500),
c19 varchar(500),
c20 varchar(500),
primary key (c01) 
) engine = InnoDB ROW_FORMAT=COMPRESSED ;
