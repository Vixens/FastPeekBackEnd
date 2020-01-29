DROP DATABASE If EXISTS crudapp;
CREATE DATABASE crudapp;

use crudapp;

CREATE TABLE `users`(
  `userid`		int(10) AUTO_INCREMENT,
  `userpass`	varchar(10) DEFAULT NULL,
  `username`	varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
	PRIMARY KEY(`userid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `foods`(
  `foodid`     	int(10)	AUTO_INCREMENT NOT NULL,
  `shopid`     	int(10)	NOT NULL,
  `menuid`     	int(10)	NOT NULL,
  `foodname`   	varchar(255) DEFAULT NULL,
  `foodsize`    varchar(255) DEFAULT NULL,
  `foodsummary`	varchar(255) DEFAULT NULL,
  `foodgenre`	  varchar(255) DEFAULT NULL,
  `foodimage`	  varchar(255) DEFAULT NULL,
  `foodprice`	  int(10) DEFAULT NULL,
  `created_at`  timestamp NULL DEFAULT NULL,
  `updated_at`  timestamp NULL DEFAULT NULL,
  `deleted_at`  timestamp NULL DEFAULT NULL,
  PRIMARY KEY(foodid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
insert into foods (foodid,shopid,menuid,foodname,foodsize,foodsummary,foodgenre,foodimage,foodprice,created_at,updated_at) values ('1','1','1','らうめん','大盛り','んまい','ラーメン','https://ichiran.com/img/page/menu-menu_main01.png',780,'2020-01-20 03:10:26','2020-01-20 03:10:26');
insert into foods (foodid,shopid,menuid,foodname,foodsize,foodsummary,foodgenre,foodimage,foodprice,created_at,updated_at) values ('2','1','1','醤油らうめん','普通','激んまい','ラーメン','https://ichiran.com/img/page/menu-menu_main01.png',780,'2020-01-20 03:10:26','2020-01-20 03:10:26');
insert into foods (foodid,shopid,menuid,foodname,foodsize,foodsummary,foodgenre,foodimage,foodprice,created_at,updated_at) values ('3','2','3','ケーキ','1ホール','うまー','ケーキ','https://www.pion1989.com/images/material/hall_img001.jpg',3200,'2020-01-20 03:10:26','2020-01-20 03:10:26');
insert into foods (foodid,shopid,menuid,foodname,foodsize,foodsummary,foodgenre,foodimage,foodprice,created_at,updated_at) values ('4','1','2','醤油らめん','普通','激んまい','ラーメン','https://ichiran.com/img/page/menu-menu_main01.png',780,'2020-01-20 03:10:26','2020-01-20 03:10:26');
insert into foods (foodid,shopid,menuid,foodname,foodsize,foodsummary,foodgenre,foodimage,foodprice,created_at,updated_at) values ('5','1','1','めん','普通','激んまい','ラーメン','https://ichiran.com/img/page/menu-menu_main01.png',780,'2020-01-20 03:10:26','2020-01-20 03:10:26');
CREATE TABLE `shops`(
`shopid`     int(10) AUTO_INCREMENT NOT NULL,
`shopname`   varchar(255) DEFAULT NULL,
`shopsummary`     varchar(255) DEFAULT NULL,
`shoptel`     varchar(255) DEFAULT NULL,
`shoptable`     varchar(255) DEFAULT NULL,
`shopaddress`     varchar(255) DEFAULT NULL,
`shopgenre`     varchar(255) DEFAULT NULL,  
`created_at` timestamp NULL DEFAULT NULL,
`updated_at` timestamp NULL DEFAULT NULL,
`deleted_at` timestamp NULL DEFAULT NULL,
PRIMARY KEY(shopid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
insert into shops (shopid,shopname,shopsummary,shoptel,shoptable,shopaddress,shopgenre,created_at,updated_at) values('1','んまいラーメン','らうめんがんまい','0120-919-919','8','兵庫県神戸市中央区北野坂1-1','ラーメン','2020-01-20 03:10:26','2020-01-20 03:10:26');
insert into shops (shopid,shopname,shopsummary,shoptel,shoptable,shopaddress,shopgenre,created_at,updated_at) values('2','ケーキMichi','うまうまケーキ','0120-333-333','32','兵庫県神戸市北区','ケーキ','2020-01-20 03:10:26','2020-01-20 03:10:26');
CREATE TABLE `cashiers`(
  `cashid`  int(10) AUTO_INCREMENT NOT NULL,
  `shopid`   int(10)	NOT NULL,
  `tableid`     int(10) NOT NULL,
  `foodid`     int(10)	NOT NULL,
  `totalprice` int(10)	NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY(cashid,shopid,tableid,foodid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `tables`(
  `tableid`     int(10) AUTO_INCREMENT NOT NULL,
  `shopid`   int(10) NOT NULL,
  `cashid`     int(10) NOT NULL,
  `qrid`     int(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY(tableid,shopid,cashid,qrid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `orders`(
  `orderid`     int(10) AUTO_INCREMENT NOT NULL,
  `tableid`   int(10) NOT NULL,
  `shopid`     int(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY(orderid,shopid,tableid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `menus`(
  `menuid`     int(10) AUTO_INCREMENT NOT NULL,
  `shopid`   int(10) NOT NULL,
  `foodid`     int(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY(menuid,shopid,foodid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
insert into menus (menuid,shopid,foodid,created_at,updated_at) values ('1','1','1','2020-01-20 03:10:26','2020-01-20 03:10:26');
insert into menus (menuid,shopid,foodid,created_at,updated_at) values ('1','1','2','2020-01-20 03:10:26','2020-01-20 03:10:26');
insert into menus (menuid,shopid,foodid,created_at,updated_at) values ('1','1','4','2020-01-20 03:10:26','2020-01-20 03:10:26');
insert into menus (menuid,shopid,foodid,created_at,updated_at) values ('2','1','1','2020-01-20 03:10:26','2020-01-20 03:10:26');
insert into menus (menuid,shopid,foodid,created_at,updated_at) values ('2','1','5','2020-01-20 03:10:26','2020-01-20 03:10:26');