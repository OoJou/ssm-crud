/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 10.1.19-MariaDB : Database - ssm_crud
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssm_crud` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ssm_crud`;

/*Table structure for table `tbl_dept` */

DROP TABLE IF EXISTS `tbl_dept`;

CREATE TABLE `tbl_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_dept` */

insert  into `tbl_dept`(`dept_id`,`dept_name`) values (21,'2'),(22,'w'),(23,'s'),(24,'d'),(25,'a'),(26,'a');

/*Table structure for table `tbl_emp` */

DROP TABLE IF EXISTS `tbl_emp`;

CREATE TABLE `tbl_emp` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(255) NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `d_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `fk_emp_dept` (`d_id`),
  CONSTRAINT `fk_emp_dept` FOREIGN KEY (`d_id`) REFERENCES `tbl_dept` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4450 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_emp` */

insert  into `tbl_emp`(`emp_id`,`emp_name`,`gender`,`email`,`d_id`) values (1111,'a','m','aaa',21),(4444,'d','m',NULL,24),(4445,'s','m',NULL,22),(4446,'ssswwrerewr','M','sadasdad@qq.com',21),(4447,'sadrwrqr','M','eami@oehoq.com',21),(4448,'(NULL)23123','f','eami@oehoq.com',21),(4449,'efwerfwe','M','ee@qq.com',24);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
