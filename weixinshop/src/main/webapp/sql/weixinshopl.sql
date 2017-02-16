/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.6.11 : Database - weixinshop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`weixinshop` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `weixinshop`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(32) NOT NULL,
  `realname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `isdelete` tinyint(1) NOT NULL DEFAULT '0',
  `last_modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `admin_pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`admin_id`,`username`,`password`,`realname`,`email`,`phone`,`isdelete`,`last_modified_time`,`create_time`,`admin_pid`) values (49,'admin','21232F297A57A5A743894A0E4A801FC3','chenzhangsheng12','zzugyk@163.com','18758825854',0,'2017-01-11 11:37:40','2017-01-02 22:10:13',NULL);

/*Table structure for table `map_admin_role` */

DROP TABLE IF EXISTS `map_admin_role`;

CREATE TABLE `map_admin_role` (
  `map_admin_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `isdelete` tinyint(4) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`map_admin_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `map_admin_role` */

/*Table structure for table `map_role_privilege` */

DROP TABLE IF EXISTS `map_role_privilege`;

CREATE TABLE `map_role_privilege` (
  `map_role_privilege_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `privilege_id` int(11) NOT NULL,
  `isdelete` tinyint(4) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`map_role_privilege_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `map_role_privilege` */

/*Table structure for table `privilege` */

DROP TABLE IF EXISTS `privilege`;

CREATE TABLE `privilege` (
  `privilege_id` int(11) NOT NULL AUTO_INCREMENT,
  `display_name` varchar(50) NOT NULL,
  `privilege_name` varchar(50) DEFAULT NULL,
  `privilege_code` varchar(50) DEFAULT NULL,
  `url` varchar(500) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `isdelete` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`privilege_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `privilege` */

insert  into `privilege`(`privilege_id`,`display_name`,`privilege_name`,`privilege_code`,`url`,`parent_id`,`isdelete`,`create_time`,`last_modified_time`) values (1,'11',NULL,NULL,'11',11,0,'2017-02-15 17:55:01','2017-02-15 17:55:01'),(2,'567567567',NULL,'','11',11,1,'2017-02-15 17:56:39','2017-02-15 19:19:14');

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `display_name` varchar(50) NOT NULL COMMENT '角色名称（中文）',
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色名称（英文）',
  `role_code` varchar(50) DEFAULT NULL COMMENT '角色代码',
  `isdelete` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`role_id`,`display_name`,`role_name`,`role_code`,`isdelete`,`create_time`,`last_modified_time`) values (3,'系统管理员',NULL,'001',0,'2017-02-16 17:04:06','2017-02-16 17:04:06');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
