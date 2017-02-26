/*
SQLyog Ultimate v11.11 (32 bit)
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`admin_id`,`username`,`password`,`realname`,`email`,`phone`,`isdelete`,`last_modified_time`,`create_time`,`admin_pid`) values (49,'admin','21232F297A57A5A743894A0E4A801FC3','chenzhangsheng12','zzugyk@163.com','18758825854',0,'2017-01-11 11:37:40','2017-01-02 22:10:13',NULL),(50,'gaoyakun','439C51A4D8456CE409CF31F195DD9C82','gaoyakun','zzugyk@163.com','13052569020',0,'2017-02-26 11:26:14','2017-02-26 11:26:14',NULL);

/*Table structure for table `map_admin_permission` */

DROP TABLE IF EXISTS `map_admin_permission`;

CREATE TABLE `map_admin_permission` (
  `map_admin_perm_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `isdelete` tinyint(4) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`map_admin_perm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `map_admin_permission` */

insert  into `map_admin_permission`(`map_admin_perm_id`,`admin_id`,`permission_id`,`isdelete`,`create_time`,`last_modified_time`) values (1,49,1,0,'2017-02-24 22:07:27','2017-02-24 22:07:27'),(5,49,8,0,'2017-02-26 11:12:30','2017-02-26 11:12:30'),(6,49,9,0,'2017-02-26 11:12:42','2017-02-26 11:12:42'),(7,49,10,0,'2017-02-26 11:12:48','2017-02-26 11:12:48'),(8,49,11,0,'2017-02-26 11:12:53','2017-02-26 11:12:53'),(9,49,12,0,'2017-02-26 11:12:58','2017-02-26 11:12:58'),(10,49,13,0,'2017-02-26 11:13:04','2017-02-26 11:13:04'),(11,49,14,0,'2017-02-26 11:13:09','2017-02-26 11:13:09'),(12,49,15,0,'2017-02-26 11:13:17','2017-02-26 11:13:17'),(13,49,16,0,'2017-02-26 11:13:23','2017-02-26 11:13:23'),(14,49,17,0,'2017-02-26 11:13:32','2017-02-26 11:13:32'),(15,49,18,0,'2017-02-26 11:13:38','2017-02-26 11:13:38'),(16,49,19,0,'2017-02-26 11:13:46','2017-02-26 11:13:46'),(17,49,20,0,'2017-02-26 11:13:53','2017-02-26 11:13:53'),(18,49,20,0,'2017-02-26 11:14:18','2017-02-26 11:14:18');

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

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `perm_name` varchar(50) NOT NULL,
  `perm_des` varchar(100) DEFAULT NULL,
  `url` varchar(45) DEFAULT NULL,
  `isdelete` tinyint(4) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `permission` */

insert  into `permission`(`permission_id`,`perm_name`,`perm_des`,`url`,`isdelete`,`create_time`,`last_modified_time`) values (1,'系统管理','系统管理权限','systemadmin.do',0,'2017-02-22 21:24:48','2017-02-22 21:24:48'),(8,'用户管理','系统管理-->用户管理','admin/adminPage.do',0,'2017-02-26 10:57:29','2017-02-26 10:57:29'),(9,'权限管理','系统管理-->权限管理','permission/permissionPage.do',0,'2017-02-26 11:00:36','2017-02-26 11:09:01'),(10,'用户管理','系统管理-->用户管理','mapAdminPermission/mapAdminPermissionPage.do',0,'2017-02-26 11:01:22','2017-02-26 11:01:22'),(11,'商品管理','商品管理','productManage.do',0,'2017-02-26 11:01:52','2017-02-26 11:02:42'),(12,'上传商品','商品管理-->上传商品','classify/productPage.do',0,'2017-02-26 11:03:34','2017-02-26 11:03:34'),(13,'商品查询','商品管理-->商品查询','product/productPage.do',0,'2017-02-26 11:04:27','2017-02-26 11:04:27'),(14,'商品修改 ','商品管理-->商品修改','product/productEditorPage.do',0,'2017-02-26 11:04:59','2017-02-26 11:09:08'),(15,'订单管理','订单管理','orderManage.do',0,'2017-02-26 11:05:23','2017-02-26 11:05:32'),(16,'收发货订单','订单管理-->收发货订单','orderInfo/reAndDeOrderPage.do',0,'2017-02-26 11:06:10','2017-02-26 11:09:17'),(17,'检测中订单','订单管理-->检测中订单','orderInfo/detectionOrderPage.do',0,'2017-02-26 11:06:40','2017-02-26 11:06:40'),(18,'订单管理','订单管理-->已完成订单','orderInfo/completeOrderPage.do',0,'2017-02-26 11:07:19','2017-02-26 11:07:19'),(19,'分类管理','分类管理','classifyManage.do',0,'2017-02-26 11:07:41','2017-02-26 11:07:41'),(20,'分类操作','分类管理-->分类操作','classify2/classifyListPage.do',0,'2017-02-26 11:08:11','2017-02-26 11:08:11');

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
