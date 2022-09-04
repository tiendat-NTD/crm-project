/*
 Navicat Premium Data Transfer

 Source Server         : java17
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3307
 Source Schema         : crm

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 30/08/2022 09:05:37
 Password mặc định cho tất cả tài khoản: 123123
*/

-- dispose db

DROP DATABASE IF EXISTS crm;

-- create db

CREATE DATABASE IF NOT EXISTS crm;

-- use db

USE crm;

-- config

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for project_detail
-- ----------------------------
DROP TABLE IF EXISTS `project_detail`;
CREATE TABLE `project_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_project` int DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_project` (`id_project`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `project_detail_ibfk_1` FOREIGN KEY (`id_project`) REFERENCES `projects` (`id`),
  CONSTRAINT `project_detail_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of project_detail
-- ----------------------------
BEGIN;
INSERT INTO `project_detail` (`id`, `id_project`, `id_user`) VALUES (2, 2, 1);
INSERT INTO `project_detail` (`id`, `id_project`, `id_user`) VALUES (5, 2, 2);
INSERT INTO `project_detail` (`id`, `id_project`, `id_user`) VALUES (6, 2, 3);
INSERT INTO `project_detail` (`id`, `id_project`, `id_user`) VALUES (7, 1, 2);
INSERT INTO `project_detail` (`id`, `id_project`, `id_user`) VALUES (8, 1, 14);
INSERT INTO `project_detail` (`id`, `id_project`, `id_user`) VALUES (9, 1, 16);
INSERT INTO `project_detail` (`id`, `id_project`, `id_user`) VALUES (10, 1, 10);
INSERT INTO `project_detail` (`id`, `id_project`, `id_user`) VALUES (11, 2, 14);
INSERT INTO `project_detail` (`id`, `id_project`, `id_user`) VALUES (12, 3, 10);
INSERT INTO `project_detail` (`id`, `id_project`, `id_user`) VALUES (13, 3, 16);
COMMIT;

-- ----------------------------
-- Table structure for projects
-- ----------------------------
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start_date` varchar(255) DEFAULT NULL,
  `end_date` varchar(255) DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  `id_status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of projects
-- ----------------------------
BEGIN;
INSERT INTO `projects` (`id`, `project_name`, `description`, `start_date`, `end_date`, `id_user`, `id_status`) VALUES (1, 'Dự án CRM', 'Dự án CRM', '2022-07-20', '2022-09-06', 8, 3);
INSERT INTO `projects` (`id`, `project_name`, `description`, `start_date`, `end_date`, `id_user`, `id_status`) VALUES (2, 'Dự án Jira', 'Dự án Jira', '2022-07-19', '2022-09-05', 8, 2);
INSERT INTO `projects` (`id`, `project_name`, `description`, `start_date`, `end_date`, `id_user`, `id_status`) VALUES (3, 'Dự án xây dựng phần mềm hàng hoá', 'Phần mềm hàng hoá viết bằng Laravel', '2022-07-10', '2022-10-31', 12, 1);
INSERT INTO `projects` (`id`, `project_name`, `description`, `start_date`, `end_date`, `id_user`, `id_status`) VALUES (4, 'Dự án xây dựng phần mềm bán hàng', 'Phần mềm bán hàng', '2022-07-22', '2022-09-30', 8, 1);
INSERT INTO `projects` (`id`, `project_name`, `description`, `start_date`, `end_date`, `id_user`, `id_status`) VALUES (5, 'Dự án xây dựng phần mềm bán vé', 'Dự án xây dựng phần mềm bán vé bằng laravel', '2022-09-01', '2022-09-30', 12, 1);
INSERT INTO `projects` (`id`, `project_name`, `description`, `start_date`, `end_date`, `id_user`, `id_status`) VALUES (6, 'Dự án phần mềm quản lý nhân sự', 'Dự án phần mềm quản lý nhân sự', '2022-09-05', '2022-10-15', 11, 1);
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` (`id`, `role_name`, `description`) VALUES (1, 'ROLE_ADMIN', 'Quản trị hệ thống');
INSERT INTO `roles` (`id`, `role_name`, `description`) VALUES (2, 'ROLE_LEADER', 'Quản lý dự án');
INSERT INTO `roles` (`id`, `role_name`, `description`) VALUES (3, 'ROLE_MEMBER', 'Thành viên');
COMMIT;

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of status
-- ----------------------------
BEGIN;
INSERT INTO `status` (`id`, `status_name`) VALUES (1, 'Chưa bắt đầu');
INSERT INTO `status` (`id`, `status_name`) VALUES (2, 'Đang thực hiện');
INSERT INTO `status` (`id`, `status_name`) VALUES (3, 'Đã hoàn thành');
COMMIT;

-- ----------------------------
-- Table structure for task_detail
-- ----------------------------
DROP TABLE IF EXISTS `task_detail`;
CREATE TABLE `task_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int DEFAULT NULL,
  `id_task` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_task` (`id_task`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `task_detail_ibfk_1` FOREIGN KEY (`id_task`) REFERENCES `tasks` (`id`),
  CONSTRAINT `task_detail_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of task_detail
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tasks
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_name` varchar(255) DEFAULT NULL,
  `description` text,
  `start_date` varchar(255) DEFAULT NULL,
  `end_date` varchar(255) DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  `id_project` int DEFAULT NULL,
  `id_status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_status` (`id_status`),
  KEY `id_project` (`id_project`),
  CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`id_project`) REFERENCES `projects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tasks
-- ----------------------------
BEGIN;
INSERT INTO `tasks` (`id`, `task_name`, `description`, `start_date`, `end_date`, `id_user`, `id_project`, `id_status`) VALUES (1, 'Dự án cá nhân CRM', 'Dự án cá nhân', '2022-06-19', '2022-09-05', 2, 1, 2);
INSERT INTO `tasks` (`id`, `task_name`, `description`, `start_date`, `end_date`, `id_user`, `id_project`, `id_status`) VALUES (5, 'Làm phân quyền', 'Làm phân quyền CRM', '2022-06-24', '2022-06-26', 2, 1, 2);
INSERT INTO `tasks` (`id`, `task_name`, `description`, `start_date`, `end_date`, `id_user`, `id_project`, `id_status`) VALUES (6, 'Làm công việc', 'Làm công việc', '2022-07-27', '2022-07-28', 2, 1, 1);
INSERT INTO `tasks` (`id`, `task_name`, `description`, `start_date`, `end_date`, `id_user`, `id_project`, `id_status`) VALUES (7, 'Làm user', 'Làm user', '2022-07-25', '2022-07-26', 16, 1, 3);
INSERT INTO `tasks` (`id`, `task_name`, `description`, `start_date`, `end_date`, `id_user`, `id_project`, `id_status`) VALUES (8, 'Làm task', 'làm task', '2022-07-29', '2022-07-30', 10, 1, 3);
INSERT INTO `tasks` (`id`, `task_name`, `description`, `start_date`, `end_date`, `id_user`, `id_project`, `id_status`) VALUES (9, 'Làm profile', 'Làm profile', '2022-07-29', '2022-07-31', 2, 1, 1);
INSERT INTO `tasks` (`id`, `task_name`, `description`, `start_date`, `end_date`, `id_user`, `id_project`, `id_status`) VALUES (10, 'Tạo entity', 'Tạo entity', '2022-08-25', '2022-08-26', 3, 2, 1);
INSERT INTO `tasks` (`id`, `task_name`, `description`, `start_date`, `end_date`, `id_user`, `id_project`, `id_status`) VALUES (11, 'Tạo controller', 'Tạo controller', '2022-08-27', '2022-08-28', 14, 2, 1);
INSERT INTO `tasks` (`id`, `task_name`, `description`, `start_date`, `end_date`, `id_user`, `id_project`, `id_status`) VALUES (12, 'Tạo repository', 'Tạo repository', '2022-08-28', '2022-08-29', 2, 2, 1);
INSERT INTO `tasks` (`id`, `task_name`, `description`, `start_date`, `end_date`, `id_user`, `id_project`, `id_status`) VALUES (13, 'Tạo service', 'Tạo service', '2022-08-30', '2022-08-31', 3, 2, 1);
INSERT INTO `tasks` (`id`, `task_name`, `description`, `start_date`, `end_date`, `id_user`, `id_project`, `id_status`) VALUES (14, 'Tạo các biến constant', 'Tạo các biến constant', '2022-08-29', '2022-08-30', 2, 2, 2);
INSERT INTO `tasks` (`id`, `task_name`, `description`, `start_date`, `end_date`, `id_user`, `id_project`, `id_status`) VALUES (15, 'Load danh sách sản phẩm ra FE', 'Load danh sách sản phẩm ra FE', '2022-08-30', '2022-09-01', 3, 2, 1);
INSERT INTO `tasks` (`id`, `task_name`, `description`, `start_date`, `end_date`, `id_user`, `id_project`, `id_status`) VALUES (16, 'Xây dựng tính năng nhận, trả hàng', 'Xây dựng tính năng nhận, trả hàng', '2022-08-30', '2022-09-02', 10, 3, 1);
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `address`, `phone_number`, `role_id`) VALUES (1, 'Nguyễn Tiến Đạt', 'tiendat.8498@gmail.com', '4297f44b13955235245b2497399d7a93', 'Hồ Chí Minh', '0386365533', 1);
INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `address`, `phone_number`, `role_id`) VALUES (2, 'Trần Bội Thư', 'boithutran@gmail.com', '4297f44b13955235245b2497399d7a93', 'Hồ Chí Minh', '0387896543', 3);
INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `address`, `phone_number`, `role_id`) VALUES (3, 'Lê Thuỵ Hoài Thương', 'hoaithuong.3108@gmail.com', '4297f44b13955235245b2497399d7a93', 'Hồ Chí Minh', '0366163333', 3);
INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `address`, `phone_number`, `role_id`) VALUES (8, 'Mèooo', 'meo01@gmail.com', '4297f44b13955235245b2497399d7a93', 'Đồng Naiii', '0386365531', 2);
INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `address`, `phone_number`, `role_id`) VALUES (9, 'Trần Quản Lý', 'ql@gmail.com', '4297f44b13955235245b2497399d7a93', 'Đồng Nai', '0387729087', 2);
INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `address`, `phone_number`, `role_id`) VALUES (10, 'Nguyễn Nhân Viên', 'nv@gmail.com', '4297f44b13955235245b2497399d7a93', 'Đà Lạt', '0377771234', 3);
INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `address`, `phone_number`, `role_id`) VALUES (11, 'Nguyễn Văn Hải', 'vanhai@gmail.com', '4297f44b13955235245b2497399d7a93', 'Thái Bình', '0371231122', 2);
INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `address`, `phone_number`, `role_id`) VALUES (12, 'Trần Văn Hải Đăng', 'haidang@gmail.com', '4297f44b13955235245b2497399d7a93', 'Đà Nẵng', '0798612618', 2);
INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `address`, `phone_number`, `role_id`) VALUES (13, 'Võ Hải Triều', 'haitrieu@gmail.com', '4297f44b13955235245b2497399d7a93', 'Cà Mau', '0364251289', 3);
INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `address`, `phone_number`, `role_id`) VALUES (14, 'Đỗ Tuấn Kiệt', 'tuankiet@gmail.com', '4297f44b13955235245b2497399d7a93', 'Nghệ An', '0371261123', 3);
INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `address`, `phone_number`, `role_id`) VALUES (15, 'Ngô Nam Bắc', 'nambac@gmail.com', '4297f44b13955235245b2497399d7a93', 'Hà Nội', '09671231234', 3);
INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `address`, `phone_number`, `role_id`) VALUES (16, 'Phạm Bá Quá', 'baqua@gmail.com', '4297f44b13955235245b2497399d7a93', 'Sóc Trăng', '09691671653', 3);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
