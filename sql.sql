/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.15 : Database - shopmanagement
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shopmanagement` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `shopmanagement`;

/*Table structure for table `goods_detail` */

DROP TABLE IF EXISTS `goods_detail`;

CREATE TABLE `goods_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `sortId` bigint(20) NOT NULL COMMENT '分类编号',
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remaining` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sortId` (`sortId`),
  CONSTRAINT `goods_detail_ibfk_1` FOREIGN KEY (`sortId`) REFERENCES `goods_sort` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `goods_detail` */

insert  into `goods_detail`(`id`,`sortId`,`name`,`address`,`price`,`createDate`,`remaining`) values (1,1,'毛笔','河北市','12','2019-03-19 09:34:26',65),(2,1,'铅笔盒','湖南','29','2019-03-19 09:35:07',21),(3,2,'台灯','河北','34','2019-03-19 09:35:40',12),(4,3,'锅巴','北京','15','2019-03-19 09:36:03',40),(5,3,'臭豆腐','湖南啊','4','2019-03-19 09:36:26',35),(6,4,'拖把','山西','19','2019-03-19 09:36:58',44);

/*Table structure for table `goods_sort` */

DROP TABLE IF EXISTS `goods_sort`;

CREATE TABLE `goods_sort` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类编号',
  `name` varchar(100) NOT NULL COMMENT '分类名字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `goods_sort` */

insert  into `goods_sort`(`id`,`name`) values (1,'文具'),(2,'小电器'),(3,'零时'),(4,'日用百货');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
