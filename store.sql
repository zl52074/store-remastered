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
INSERT INTO `product` VALUES ('0', '商品1', 1998, 'products/p0001.jpg', '2019-11-11', '真正的清仓，真正的甩货 你不用问价，也不用讲价 也不用怕被宰全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 你买不了吃亏， 十块钱 你买 不了上当 真正的物有所值拿啥啥便宜 买啥啥不贵 全场卖十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱 不算多，去不了香港去不了新加坡 十块钱 不算贵，不用回去开个家庭会 虽然不是传家宝，家家户户离不了 三年五年都用不坏，还可以传给下一代 全场卖十块 买啥都十块 随便挑 随便选 全场卖十块 买啥都十块 十块钱,又不多,买不了房子买不了车', 0, '1');
INSERT INTO `product` VALUES ('1', '提拉米苏', 99, 'products/p001.jpg', '2022-10-06', '提拉米苏，英文是Tiramisu，是一种带咖啡酒味儿的意大利甜点。以马斯卡彭芝士作为主要材料，再以手指饼干取代传统甜点的海绵蛋糕，加入咖啡、可可粉等其他材料。吃到嘴里香、滑、甜、腻、柔和中带有质感的变化，味道并不是一味的甜。', 1, '1');
INSERT INTO `product` VALUES ('10', '苏打饼干', 25, 'products/p010.jpg', '2022-10-06', '苏打饼干是由小麦粉、苏打粉、黄油等材料制作而成的食品。食用过量容易造成血压升高、水肿、变胖等状况。制作方法是先在一部分小麦粉中加入酵母，然后调成面团，经较长时间发酵后加入其余小麦粉，再经短时间发酵后整型。这种饼干，一般为甜饼干。含有碳酸氢钠。', 1, '3');
INSERT INTO `product` VALUES ('11', '牛扎饼干', 20, 'products/p011.jpg', '2022-10-06', '牛轧饼顾名思义，由香甜的牛轧糖为夹心，由酥脆的葱香苏打饼完美组合。牛轧饼是中国台湾的传统小吃，近年引入内地，广受欢迎。', 1, '3');
INSERT INTO `product` VALUES ('12', '奥利奥', 22, 'products/p012.jpg', '2022-10-06', '奥利奥 (Oreo) 诞生于1912年，是外面为巧克力饼干夹杂着各种口味的奶油，是卡夫食品的超级明星和饼干之王，是全球巧克力味夹心饼干的代名词。\r\n关于“奥利奥OREO”名字的由来，众说纷纭，现在已经无从考证。一些人认为，奥利奥的名字来自英语，是“白心黑仁”的意思。\r\n奥利奥有香草味、原味、轻甜味', 1, '3');
INSERT INTO `product` VALUES ('13', '圣代', 18, 'products/p013.jpg', '2022-10-06', '圣代，是一种冰激凌甜点，传统的圣代会用一到两勺冰激凌，上面点缀一些果酱或糖浆，有的也在上面用一层糖霜、打发奶油、樱桃或其他水果（香蕉、菠萝）。在牛津字典上，关于圣代的起源有些模糊，不过，大家都认为，圣代Sundae的名称是来自Sunday。', 1, '4');
INSERT INTO `product` VALUES ('14', '蜂蜜厚多士', 25, 'products/p014.jpg', '2022-10-06', '蜂蜜厚多士是由蜂蜜为主要食材做成的一道美食，属于甜点。', 1, '4');
INSERT INTO `product` VALUES ('15', '木瓜奶昔', 18, 'products/p015.jpg', '2022-10-06', '木瓜奶昔，是指把 木瓜去皮、切块后放入果汁机中加入适量200c.c.鲜奶，糖、冰淇淋搅拌几分钟而成的饮品。', 1, '4');
INSERT INTO `product` VALUES ('16', '芒果白雪黑糯米', 24, 'products/p016.jpg', '2022-10-06', '芒果白雪黑糯米是用芒果、黑米制作的一道经典的港式甜品。软糯的糯米球，丝丝糯米香甜，配上浓郁的椰浆和冰激凌，再搭上果香浓郁的芒果，冰爽香甜，经典美味。', 1, '4');
INSERT INTO `product` VALUES ('17', '草莓冰淇淋', 28, 'products/p017.jpg', '2022-10-06', '草莓冰淇淋，风靡全球的冰点公主。因其高贵诱人的外形、难以描述的美味、无法抵挡的魅力，而闻名天下。 [1]  它给人带来的是娇艳欲滴、楚楚动人般的奇妙感受，其甜美爽滑的口感、迷幻怡人的外观、低糖低脂的口味、营养健康的理念，受到食客的好评。源自风靡欧美的冰淇淋经典之作，传承了美式冰淇淋崇尚天然、注重新鲜、健康的制作传统，以极其丰富的产品品种（共有5大类上百个品种，其中又以“爆炒百变冰淇淋”、“倒杯不洒冰淇淋”极具特色。）和独具匠心、别具一格的产品制作工艺，以及营养健康、低脂低糖、天然新鲜的原料而闻名于世。', 1, '4');
INSERT INTO `product` VALUES ('18', '鸳鸯奶茶', 18, 'products/p018.jpg', '2022-10-06', '鸳鸯奶茶是香港特产饮品，常见于香港的茶餐厅。制法是混合了一半的咖啡和一半的丝袜奶茶，同时集合有咖啡的香味，和奶茶的浓滑。饮用者可以自行加糖，也可以叫店里事先加入炼乳。鸳鸯起源自香港的大排档。', 1, '5');
INSERT INTO `product` VALUES ('19', '红豆奶茶', 20, 'products/p019.jpg', '2022-10-06', '红豆奶茶是一道美食，主要食材是鲜牛奶、红豆。 捧在手里的那杯温暖的奶茶，虽然没有红酒的高贵典雅，没有咖啡的精致摩登，却自有一种朴实的味道。\r\n红茶与牛奶调和出柔美的色泽，二者的滋味也融合得恰到好处，散发着温润香浓的芬芳。', 1, '5');
INSERT INTO `product` VALUES ('2', '草莓慕斯', 88, 'products/p002.jpg', '2022-10-06', '草莓慕斯是来源于西方的一种甜品。其性质较布丁更柔软，入口即化。慕斯的英文是mousse，是一种奶冻式的甜点，可以直接吃或做蛋糕夹层。其味道可口，制作方法简单，材料需求少，适合在party上制作。', 1, '1');
INSERT INTO `product` VALUES ('20', '珍珠奶茶', 21, 'products/p020.jpg', '2022-10-06', '珍珠奶茶（Bubble tea），又称波霸奶茶，简称珍奶，是一项流传于台湾的茶类饮料，将粉圆加入奶茶之后，就成为珍珠奶茶。', 1, '5');
INSERT INTO `product` VALUES ('21', '卡布奇诺', 20, 'products/p021.jpg', '2022-10-06', '卡布奇诺的旧名称Kapuziner是19世纪来自维也纳的一种饮品，是由小份的咖啡与牛奶或鲜奶油混合后，变成类似古代僧袍的褐色色调，一开始这个名称只代表这个饮品的浓郁度。', 1, '6');
INSERT INTO `product` VALUES ('22', '拿铁', 22, 'products/p022.jpg', '2022-10-06', '是由意式浓缩咖啡加牛奶制成的一种经典咖啡。意式拿铁为纯牛奶加咖啡，美式拿铁则将部分牛奶替换成奶泡。', 1, '6');
INSERT INTO `product` VALUES ('23', '可乐', 15, 'products/p023.jpg', '2022-10-06', '可乐(Cola)，是指有甜味、含咖啡因但不含乙醇的碳酸饮料。', 1, '7');
INSERT INTO `product` VALUES ('24', '雪碧', 15, 'products/p024.jpg', '2022-10-06', '雪碧是可口可乐公司1961年上市的产品，目前是全球最大的柠檬味汽水饮料品牌，雪碧目前在全球超过190多个国家销售，目前是全球第三大软饮料品牌。', 1, '7');
INSERT INTO `product` VALUES ('25', '芬达', 15, 'products/p025.jpg', '2022-10-06', '芬达（Fanta）是1955年可口可乐公司在意大利推出的一款橙味汽水。芬达拥有橙、苹果、葡萄、青柠、芒果、水蜜桃、菠萝、西瓜、草莓，茉莉蜜桃等口味。', 1, '7');
INSERT INTO `product` VALUES ('3', '草莓奶油蛋糕', 65, 'products/p003.jpg', '2022-10-06', '草莓奶油蛋糕 [1]  是一款西式甜品，热量较高。适合大部分人食用，不过孕妇、新妈妈和儿童等特殊人群尽量少食用奶油蛋糕。', 1, '1');
INSERT INTO `product` VALUES ('4', '百香果慕斯', 86, 'products/p004.jpg', '2022-10-06', '百香果慕斯是由鸡蛋等原材料制成的甜点。', 1, '1');
INSERT INTO `product` VALUES ('5', '抹茶小蛋糕', 48, 'products/p005.jpg', '2022-10-06', '抹茶小蛋糕是以鸡蛋和抹茶粉为主要材料制作而成的一道甜点。', 1, '1');
INSERT INTO `product` VALUES ('6', '法式吐司', 20, 'products/p006.jpg', '2022-10-06', '吐司，是英文toast的音译，粤语叫多士，实际上就是用长方形带盖或不带盖的烤听制作的听型面包。用带盖烤听烤出的面包经切片后呈正方形，夹入火腿或蔬菜后即为三明治。', 1, '2');
INSERT INTO `product` VALUES ('7', '法式长棍面包', 15, 'products/p007.jpg', '2022-10-06', '法式长棍面包（baguette）是一种最传统的法式面包，营养丰富。法国面包的代表就是“棍子面包”，baguette原意是长条形的宝石。', 1, '2');
INSERT INTO `product` VALUES ('8', '大列巴', 18, 'products/p008.jpg', '2022-10-06', '大面包，又叫大列巴（列巴是俄语面包的音译），由俄罗斯传来，现为哈尔滨一绝。这种大面包为圆形，有五斤重，味道具有传统的欧洲风味。', 1, '2');
INSERT INTO `product` VALUES ('9', '曲奇饼干', 20, 'products/p009.jpg', '2022-10-06', '曲奇饼干原来是一种高糖、高油脂的食品。随着人们生活水平的提高。高脂肪高油食品摄入过多，而膳食纤维的摄入量日渐减少，食用曲奇饼干会使得“文明病”的发病率日渐提高。因此开发具有膳食纤维的饼干，具有十分积极的意义。', 1, '3');

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
INSERT INTO `user` VALUES ('fa5c4764611f417388373fcbce2bc5f7', 'zhangsan', 'Zhangsan123', 'zhangsan@qq.com', '张三', '1', '1999-01-01', NULL, NULL, 0, NULL);

SET FOREIGN_KEY_CHECKS = 1;
