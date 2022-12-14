/*
 Navicat Premium Data Transfer

 Source Server         : docker-mysql
 Source Server Type    : MySQL
 Source Server Version : 50739
 Source Host           : localhost:3306
 Source Schema         : store

 Target Server Type    : MySQL
 Target Server Version : 50739
 File Encoding         : 65001

 Date: 09/10/2022 13:35:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `itemid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `count` int(11) NULL DEFAULT NULL,
  `subtotal` double NULL DEFAULT NULL,
  `pid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `oid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`itemid`) USING BTREE,
  INDEX `oid`(`oid`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('12146ceea2534132a055890a057510ae', 1, 22, '12', '8b47e561be494cd8927ba9da12431f08');
INSERT INTO `orderitem` VALUES ('3251341776b443098010df8653a794ac', 4, 100, '10', 'a05fded3458047fbae697366c1fab468');
INSERT INTO `orderitem` VALUES ('41513a802ea44bd08bb6e9282aef4414', 1, 20, '11', '8b47e561be494cd8927ba9da12431f08');
INSERT INTO `orderitem` VALUES ('53cd03be9a154726bbce9a89aeb93227', 4, 396, '1', 'a05fded3458047fbae697366c1fab468');
INSERT INTO `orderitem` VALUES ('5c198254660f415bacd47130d60b16fe', 1, 99, '1', '8b47e561be494cd8927ba9da12431f08');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `oid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ordertime` datetime NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('8b47e561be494cd8927ba9da12431f08', '2022-10-06 00:00:00', 141, 'fa5c4764611f417388373fcbce2bc5f7');
INSERT INTO `orders` VALUES ('a05fded3458047fbae697366c1fab468', '2022-10-06 00:00:00', 496, 'fa5c4764611f417388373fcbce2bc5f7');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `pid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `pimage` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pdate` date NULL DEFAULT NULL,
  `pdesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pstate` int(1) NULL DEFAULT 1,
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('0', '??????1', 1998, 'products/p0001.jpg', '2019-11-11', '????????????????????????????????? ????????????????????????????????? ????????????????????????????????? ??????????????? ????????? ????????? ??????????????? ??????????????? ????????? ????????????????????? ????????? ?????? ???????????? ???????????????????????????????????? ??????????????? ??????????????? ????????? ????????? ??????????????? ??????????????? ????????? ????????????????????????????????????????????? ????????? ??????????????????????????????????????? ????????????????????????????????????????????? ??????????????????????????????????????????????????? ??????????????? ??????????????? ????????? ????????? ??????????????? ??????????????? ?????????,?????????,???????????????????????????', 0, '1');
INSERT INTO `product` VALUES ('1', '????????????', 99, 'products/p001.jpg', '2022-10-06', '????????????????????????Tiramisu????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????', 1, '1');
INSERT INTO `product` VALUES ('10', '????????????', 25, 'products/p010.jpg', '2022-10-06', '???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????', 1, '3');
INSERT INTO `product` VALUES ('11', '????????????', 20, 'products/p011.jpg', '2022-10-06', '?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????', 1, '3');
INSERT INTO `product` VALUES ('12', '?????????', 22, 'products/p012.jpg', '2022-10-06', '????????? (Oreo) ?????????1912??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????\r\n??????????????????OREO???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????\r\n??????????????????????????????????????????', 1, '3');
INSERT INTO `product` VALUES ('13', '??????', 18, 'products/p013.jpg', '2022-10-06', '???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????Sundae??????????????????Sunday???', 1, '4');
INSERT INTO `product` VALUES ('14', '???????????????', 25, 'products/p014.jpg', '2022-10-06', '?????????????????????????????????????????????????????????????????????????????????', 1, '4');
INSERT INTO `product` VALUES ('15', '????????????', 18, 'products/p015.jpg', '2022-10-06', '???????????????????????? ??????????????????????????????????????????????????????200c.c.?????????????????????????????????????????????????????????', 1, '4');
INSERT INTO `product` VALUES ('16', '?????????????????????', 24, 'products/p016.jpg', '2022-10-06', '??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????', 1, '4');
INSERT INTO `product` VALUES ('17', '???????????????', 28, 'products/p017.jpg', '2022-10-06', '???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????? [1]  ??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????5????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????', 1, '4');
INSERT INTO `product` VALUES ('18', '????????????', 18, 'products/p018.jpg', '2022-10-06', '?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????', 1, '5');
INSERT INTO `product` VALUES ('19', '????????????', 20, 'products/p019.jpg', '2022-10-06', '?????????????????????????????????????????????????????????????????? ??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????\r\n?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????', 1, '5');
INSERT INTO `product` VALUES ('2', '????????????', 88, 'products/p002.jpg', '2022-10-06', '???????????????????????????????????????????????????????????????????????????????????????????????????????????????mousse???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????party????????????', 1, '1');
INSERT INTO `product` VALUES ('20', '????????????', 21, 'products/p020.jpg', '2022-10-06', '???????????????Bubble tea??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????', 1, '5');
INSERT INTO `product` VALUES ('21', '????????????', 20, 'products/p021.jpg', '2022-10-06', '????????????????????????Kapuziner???19????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????', 1, '6');
INSERT INTO `product` VALUES ('22', '??????', 22, 'products/p022.jpg', '2022-10-06', '???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????', 1, '6');
INSERT INTO `product` VALUES ('23', '??????', 15, 'products/p023.jpg', '2022-10-06', '??????(Cola)??????????????????????????????????????????????????????????????????', 1, '7');
INSERT INTO `product` VALUES ('24', '??????', 15, 'products/p024.jpg', '2022-10-06', '???????????????????????????1961??????????????????????????????????????????????????????????????????????????????????????????????????????190???????????????????????????????????????????????????????????????', 1, '7');
INSERT INTO `product` VALUES ('25', '??????', 15, 'products/p025.jpg', '2022-10-06', '?????????Fanta??????1955????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????', 1, '7');
INSERT INTO `product` VALUES ('3', '??????????????????', 65, 'products/p003.jpg', '2022-10-06', '?????????????????? [1]  ????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????', 1, '1');
INSERT INTO `product` VALUES ('4', '???????????????', 86, 'products/p004.jpg', '2022-10-06', '?????????????????????????????????????????????????????????', 1, '1');
INSERT INTO `product` VALUES ('5', '???????????????', 48, 'products/p005.jpg', '2022-10-06', '????????????????????????????????????????????????????????????????????????????????????', 1, '1');
INSERT INTO `product` VALUES ('6', '????????????', 20, 'products/p006.jpg', '2022-10-06', '??????????????????toast???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????', 1, '2');
INSERT INTO `product` VALUES ('7', '??????????????????', 15, 'products/p007.jpg', '2022-10-06', '?????????????????????baguette??????????????????????????????????????????????????????????????????????????????????????????????????????baguette??????????????????????????????', 1, '2');
INSERT INTO `product` VALUES ('8', '?????????', 18, 'products/p008.jpg', '2022-10-06', '?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????', 1, '2');
INSERT INTO `product` VALUES ('9', '????????????', 20, 'products/p009.jpg', '2022-10-06', '????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????', 1, '3');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `authority` int(11) NULL DEFAULT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('fa5c4764611f417388373fcbce2bc5f7', 'zhangsan', 'Zhangsan123', 'zhangsan@qq.com', '??????', '1', '1999-01-01', NULL, NULL, 0, NULL);

SET FOREIGN_KEY_CHECKS = 1;
