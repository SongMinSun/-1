create database mytest;
use mytest;

create table student(
	uid varchar(10) primary  key,
    uname varchar(20),
    dept varchar(20),
    email varchar(30)
    );
insert into student values(
	'hong','홍길동','컴퓨터공학과','hong@some.com'
    );
    