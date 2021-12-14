create database mytest;
use mytest;

create table user(
	uid varchar(40) primary key,
    passwd varchar(20),
    uname varchar(20),
    phone varchar(15)
);