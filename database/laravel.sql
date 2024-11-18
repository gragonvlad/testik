/*
 Navicat Premium Data Transfer

 Source Server         : fef
 Source Server Type    : MySQL
 Source Server Version : 110403 (11.4.3-MariaDB)
 Source Host           : 127.0.0.1:3306
 Source Schema         : laravel

 Target Server Type    : MySQL
 Target Server Version : 110403 (11.4.3-MariaDB)
 File Encoding         : 65001

 Date: 13/11/2024 16:01:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles`  (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_roles_model_id_model_type_index`(`model_id` ASC, `model_type` ASC) USING BTREE,
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 1);
INSERT INTO `model_has_roles` VALUES (1, 'App\\Models\\User', 5);
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\User', 6);
INSERT INTO `model_has_roles` VALUES (1, 'App\\Models\\User', 7);

-- ----------------------------
-- Table structure for offers
-- ----------------------------
DROP TABLE IF EXISTS `offers`;
CREATE TABLE `offers`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `employer_id` bigint UNSIGNED NOT NULL,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `transition_cost` int NOT NULL,
  `site_theme` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `target_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `number_of_subscribers` int NULL DEFAULT 0,
  `number_of_transitions` int NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `employer_id`) USING BTREE,
  INDEX `employer_id`(`employer_id` ASC) USING BTREE,
  CONSTRAINT `employer_id` FOREIGN KEY (`employer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of offers
-- ----------------------------
INSERT INTO `offers` VALUES (2, 5, '2', 1, 's', 'tr', 1, 1, 1, '2024-11-13 09:40:37', '2024-11-13 09:40:37');

-- ----------------------------
-- Table structure for offers_of_user
-- ----------------------------
DROP TABLE IF EXISTS `offers_of_user`;
CREATE TABLE `offers_of_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `offer_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `offer_id`(`offer_id` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `offer_id` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of offers_of_user
-- ----------------------------
INSERT INTO `offers_of_user` VALUES (5, 2, 6);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `roles_name_guard_name_unique`(`name` ASC, `guard_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'Работодатель', 'api', '2024-11-13 11:35:03', '2024-11-13 11:35:03');
INSERT INTO `roles` VALUES (2, 'Веб-мастер', 'api', '2024-11-13 11:35:49', '2024-11-13 11:35:49');
INSERT INTO `roles` VALUES (3, 'Админ', 'api', '2024-11-13 17:35:36', '2024-11-13 17:35:36');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `balance` int NOT NULL DEFAULT 0,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Admin', 'admin@gmail.com', 0, '$2y$10$YaEAFdQZAN1fP61N7ZdGVOL1LsNy.hhrYvIq.4.0h/1Z/JSTtJohG', 1, '2023-09-27 12:39:37', '2023-09-27 12:39:37');
INSERT INTO `users` VALUES (5, 'gragonvlad', 'gragonvlad@gmail.com', 2000, '$2y$10$YaEAFdQZAN1fP61N7ZdGVOL1LsNy.hhrYvIq.4.0h/1Z/JSTtJohG', 1, '2024-11-13 09:40:13', '2024-11-13 09:41:22');
INSERT INTO `users` VALUES (6, 'qew', 'gr@gmail.com', 1, '$2y$10$YaEAFdQZAN1fP61N7ZdGVOL1LsNy.hhrYvIq.4.0h/1Z/JSTtJohG', 1, '2024-11-13 12:50:01', '2024-11-13 12:50:01');
INSERT INTO `users` VALUES (7, 'fw', 'fr@mail.ru', 0, '$2y$10$YaEAFdQZAN1fP61N7ZdGVOL1LsNy.hhrYvIq.4.0h/1Z/JSTtJohG', 1, '2024-11-13 12:59:25', '2024-11-13 12:59:25');

SET FOREIGN_KEY_CHECKS = 1;
