create database iTransfer;
use iTransfer;

CREATE TABLE filelog
(
  fid int PRIMARY KEY auto_increment,
  filename VARCHAR (300) NOT NULL ,
  storeName VARCHAR (100) NOT NULL ,
  md5 VARCHAR (100) NOT NULL,
  time datetime,
  extension VARCHAR (10),
  filecode int DEFAULT 0,
  password VARCHAR (40) NOT NULL
)ENGINE=InnoDB auto_increment=1 DEFAULT CHARSET=utf8;

CREATE TABLE check_t
(
  id int PRIMARY KEY auto_increment,
  filename VARCHAR (300) NOT NULL ,
  filecode int DEFAULT 0,
  password VARCHAR (40) NOT NULL,
  flag int
)ENGINE=InnoDB auto_increment=1 DEFAULT CHARSET=utf8;
