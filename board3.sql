use mytest;

create table board3(
	`num` int NOT NULL AUTO_INCREMENT,
	`username` varchar(50) DEFAULT NULL,
	`password` varchar(50) DEFAULT NULL,
	`title` varchar(50) DEFAULT NULL,
	`memo` varchar(50) DEFAULT NULL,
	`time` datetime DEFAULT NULL,
	`hit` int DEFAULT '0',
	`ref` int DEFAULT NULL,
	`indent` int DEFAULT NULL,
	`step` int DEFAULT NULL,
	PRIMARY KEY (`num`)
)