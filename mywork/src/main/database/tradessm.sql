/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : tradeSSM

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 10/01/2024 11:54:51
*/

DROP DATABASE IF EXISTS `tradeSSM` ;
CREATE DATABASE `tradessm` ;
USE `tradessm`;


SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(10) NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '123456', '17790792756', '管理员');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cid` int(10) NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '小说 / 文学 / 语言文学', 1);   -- 0 表示下架，1 表示正常
INSERT INTO `category` VALUES (2, '历史 / 地理 / 艺术', 1);
INSERT INTO `category` VALUES (3, '政治 / 法律 / 军事', 1);
INSERT INTO `category` VALUES (4, '哲学 / 心理 / 宗教', 1);
INSERT INTO `category` VALUES (5, '经济 / 社科 / 综合', 1);
INSERT INTO `category` VALUES (6, '童书 / 生活 / 体育', 1);
INSERT INTO `category` VALUES (7, '工程技术 / 互联网', 1);
INSERT INTO `category` VALUES (8, '教材 / 教辅 / 考试', 1);
INSERT INTO `category` VALUES (9, '自然科学 / 医药卫生', 1);

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论主键',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户，外键',
  `pid` int(11) NULL DEFAULT NULL COMMENT '商品，外键',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `create_at` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `comments_product_fk`(`pid`) USING BTREE,
  INDEX `comments_user_fk`(`user_id`) USING BTREE,
  CONSTRAINT `comments_product_fk` FOREIGN KEY (`pid`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 145 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (138, '13C5F5E668FE4974A1C6F9159E70C19A', 8, '79978465654', '2024-01-06 13:38:22');
INSERT INTO `comments` VALUES (139, '13C5F5E668FE4974A1C6F9159E70C19A', 8, '7997846565dsaasd4', '2024-01-06 13:40:18');
INSERT INTO `comments` VALUES (142, '13C5F5E668FE4974A1C6F9159E70C19A', 120, 'asddassaddas', '2024-01-10 20:55:37');
INSERT INTO `comments` VALUES (144, '13C5F5E668FE4974A1C6F9159E70C19A', 105, '好好好', '2024-01-15 23:22:12');

-- ----------------------------
-- Table structure for concern
-- ----------------------------
DROP TABLE IF EXISTS `concern`;
CREATE TABLE `concern`  (
  `mid` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`mid`) USING BTREE,
  INDEX `concern_product_fk`(`pid`) USING BTREE,
  INDEX `concern_users_fk`(`user_id`) USING BTREE,
  CONSTRAINT `concern_product_fk` FOREIGN KEY (`pid`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `concern_users_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of concern
-- ----------------------------
INSERT INTO `concern` VALUES (60, '605EE4F481D046B187EDB9B7BDE66F1F', 16);
INSERT INTO `concern` VALUES (61, '605EE4F481D046B187EDB9B7BDE66F1F', 13);

-- ----------------------------
-- Table structure for deleteproduct
-- ----------------------------
DROP TABLE IF EXISTS `deleteproduct`;
CREATE TABLE `deleteproduct`  (
  `dpid` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NULL DEFAULT NULL,
  `cid` int(10) NULL DEFAULT NULL,
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` float(11, 2) NULL DEFAULT NULL,
  `start_time` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `describle` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`dpid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for needs
-- ----------------------------
DROP TABLE IF EXISTS `needs`;
CREATE TABLE `needs`  (
  `nid` int(20) NOT NULL AUTO_INCREMENT,
  `nmessage` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pubdate` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `needs_user_fk`(`uid`) USING BTREE,
  CONSTRAINT `needs_user_fk` FOREIGN KEY (`uid`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of needs
-- ----------------------------
INSERT INTO `needs` VALUES (1, '急求航概习题册第五版(T_T)', '13C5F5E668FE4974A1C6F9159E70C19A', '2024-01-07 10:07:50');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `oid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pprice` float(11, 2) NULL DEFAULT NULL,
  `pimage` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_price` float(20, 0) NULL DEFAULT NULL,
  `buy_uid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sell_uid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dealdate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dealAddress` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_state` int(10) NOT NULL,
  PRIMARY KEY (`oid`) USING BTREE,
  INDEX `_product_user`(`pname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('8C43B5A7B7D046A8849267F07ADAAECF', 'Spring实战', 30.60, 'Spring实战.jpg', 30.6, '605EE4F481D046B187EDB9B7BDE66F1F', '13C5F5E668FE4974A1C6F9159E70C19A', '2024年01月10号下午三点', '2024-01-17 18:21:32', '新主楼', 0);
INSERT INTO `orders` VALUES ('9AC93F4756BC4049B7E37A2C0E0D5FD8', 'JavaScript高级程序设计', 31.00, 'JavaScript高级程序设计.jpg', 31, '13C5F5E668FE4974A1C6F9159E70C19A', '1723C981AD1548C992C0F8FDFE365087', '2024年01月10号下午三点', '2024-01-16 08:49:14', '主楼', 0);
INSERT INTO `orders` VALUES ('AC2D86A66F1F453B8D3E53CBAD6A3685', '史记', 30.00, '史记.jpg', 30, '13C5F5E668FE4974A1C6F9159E70C19A', 'E59512878FA0452C9B58D97277F8B8AF', '2024年01月10号下午三点', '2024-01-16 00:52:24', '五号楼', 2);
INSERT INTO `orders` VALUES ('DECA60A590F84D30A3425727E153E919', '芒果街上的小屋', 10.80, '芒果街上的小屋.jpg', 10.8, '605EE4F481D046B187EDB9B7BDE66F1F', '13C5F5E668FE4974A1C6F9159E70C19A', '2024年01月10号下午三点', '2024-01-16 09:20:16', '图书馆', 2);

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品主键',
  `caid` int(11) NULL DEFAULT NULL COMMENT '商品分类，外键',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户外键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `image` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `price` float(11, 2) NULL DEFAULT NULL COMMENT '出售价格',
  `start_time` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布时间',
  `describle` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细信息',
  `status` int(11) NULL DEFAULT 1 COMMENT '状态 上架1 下架0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `catelog_id`(`caid`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `id`(`id`, `user_id`) USING BTREE,
  CONSTRAINT `fk_ca_product` FOREIGN KEY (`caid`) REFERENCES `category` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_user_product` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 122 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 8, '0F84E3048F5546A58C8EFE52263D2A83', '航空航天概论（第五版）', '航空航天概论（第五版）.jpg', 10.00, '2024-01-12', '9成新，低价出售，有意者联系。', 1);
INSERT INTO `products` VALUES (2, 8, '0F84E3048F5546A58C8EFE52263D2A83', '离散数学及其应用（原书第8版）', '离散数学及其应用（原书第8版）.jpg', 30.00, '2024-01-12', '八成新，无损坏，喜欢Call我。', 1);
INSERT INTO `products` VALUES (3, 8, '0F84E3048F5546A58C8EFE52263D2A83', '数学分析 第三版（下册）', '数学分析 第三版（下册）.jpg', 20.00, '2024-01-12', '9成新', 1);
INSERT INTO `products` VALUES (5, 7, '13C5F5E668FE4974A1C6F9159E70C19A', 'Java编程思想', 'Java编程思想.jpg', 30.00, '2024-01-14', '可议价。', 1);
INSERT INTO `products` VALUES (7, 2, '0F84E3048F5546A58C8EFE52263D2A83', '明朝那些事儿（全9册）', '明朝那些事儿（全9册）.jpg', 50.00, '2024-01-14', '毕业了，低价出售。', 1);
INSERT INTO `products` VALUES (8, 1, 'E59512878FA0452C9B58D97277F8B8AF', '恶意', '恶意.jpg', 9.90, '2024-01-14', '低价出，有意联系。', 1);
INSERT INTO `products` VALUES (9, 1, '0F84E3048F5546A58C8EFE52263D2A83', '白夜行', '白夜行.jpg', 12.00, '2024-01-14', '几乎全新', 1);
INSERT INTO `products` VALUES (13, 1, '0F84E3048F5546A58C8EFE52263D2A83', '简爱', '简爱.jpg', 8.00, '2024-01-14', '8成新，便宜出。', 1);
INSERT INTO `products` VALUES (16, 1, '13C5F5E668FE4974A1C6F9159E70C19A', '芒果街上的小屋', '芒果街上的小屋.jpg', 10.80, '2024-01-14', '去年年底购买，8成新，无损坏，有意者联系。', 0);
INSERT INTO `products` VALUES (17, 1, '13C5F5E668FE4974A1C6F9159E70C19A', '活着', '活着.jpg', 12.10, '2024-01-14', '毕业季，便宜出售。', 1);
INSERT INTO `products` VALUES (18, 1, '13C5F5E668FE4974A1C6F9159E70C19A', '羊脂球', '羊脂球.jpg', 11.20, '2024-01-14', '复习资料。淘宝购买，低价出售。', 1);
INSERT INTO `products` VALUES (20, 7, '13C5F5E668FE4974A1C6F9159E70C19A', 'Spring实战', 'Spring实战.jpg', 30.60, '2024-01-14', '京东购买，九成新。', 0);
INSERT INTO `products` VALUES (78, 7, '1723C981AD1548C992C0F8FDFE365087', 'JavaScript高级程序设计', 'JavaScript高级程序设计.jpg', 31.00, '2024-01-15', '没怎么用过。基本全新的', 0);
INSERT INTO `products` VALUES (79, 7, '88B5C8B63D6D4C8EAC6417E44119FDBB', '算法', '算法.jpg', 28.00, '2024-01-15', '自用，九成新，除了边角磕碰，其他都好', 1);
INSERT INTO `products` VALUES (80, 7, '88B5C8B63D6D4C8EAC6417E44119FDBB', 'Python基础教程', 'Python基础教程.jpg', 24.00, '2024-01-15', '成色9新。有意私聊', 1);
INSERT INTO `products` VALUES (81, 2, 'E59512878FA0452C9B58D97277F8B8AF', '史记', '史记.jpg', 30.00, '2024-01-15', '要毕业了，低价出手吧 要得给我打电话', 1);
INSERT INTO `products` VALUES (82, 3, 'E59512878FA0452C9B58D97277F8B8AF', '朱镕基答记者问', '朱镕基答记者问.jpg', 9.00, '2024-01-15', '购于2023年9月，低价出', 1);
INSERT INTO `products` VALUES (83, 3, '88B5C8B63D6D4C8EAC6417E44119FDBB', '邓小平时代', '邓小平时代.jpg', 22.00, '2024-01-15', '大甩卖，要的来', 1);
INSERT INTO `products` VALUES (84, 4, '61396C30AC1A4A62A778654F4089F993', '天才在左 疯子在右', '天才在左 疯子在右.jpg', 17.80, '2024-01-15', '好书，9成新', 1);
INSERT INTO `products` VALUES (85, 4, '88B5C8B63D6D4C8EAC6417E44119FDBB', '蔡康永的说话之道', '蔡康永的说话之道.jpg', 8.80, '2024-01-15', '现在不需要了，低价出售', 1);
INSERT INTO `products` VALUES (86, 5, '6C44D389DB3B47CE851218D74532EDF6', '货币战争', '货币战争.jpg', 12.00, '2024-01-15', '毕业季出了。', 1);
INSERT INTO `products` VALUES (87, 5, '61396C30AC1A4A62A778654F4089F993', '菊与刀', '菊与刀.jpg', 5.00, '2024-01-15', '鲁思·本尼迪克特 著，商务印书馆，平装', 1);
INSERT INTO `products` VALUES (88, 6, '6C44D389DB3B47CE851218D74532EDF6', '科比：黄金年代', '科比：黄金年代.jpg', 22.00, '2024-01-15', '带不走便宜卖了', 1);
INSERT INTO `products` VALUES (89, 6, '61396C30AC1A4A62A778654F4089F993', '梅者如西', '梅者如西.jpg', 12.00, '2024-01-15', '讲梅西的，喜欢足球的来', 1);
INSERT INTO `products` VALUES (90, 7, '6C44D389DB3B47CE851218D74532EDF6', '精通Spring4.x', '精通Spring4.x.jpg', 28.00, '2024-01-12', '保证正版', 1);
INSERT INTO `products` VALUES (91, 2, '6C44D389DB3B47CE851218D74532EDF6', '我们仨', '我们仨.jpg', 10.00, '2024-01-12', '杨绛的书', 1);
INSERT INTO `products` VALUES (92, 2, '6C44D389DB3B47CE851218D74532EDF6', '史蒂夫·乔布斯传', '史蒂夫·乔布斯传.jpg', 20.00, '2024-01-12', '刚买的，全新', 1);
INSERT INTO `products` VALUES (93, 2, '6C44D389DB3B47CE851218D74532EDF6', '万历十五年', '万历十五年.jpg', 6.00, '2024-01-12', '好书', 1);
INSERT INTO `products` VALUES (94, 3, '1723C981AD1548C992C0F8FDFE365087', '毛泽东选集 第一卷', '毛泽东选集 第一卷.jpg', 12.00, '2024-01-12', '经典', 0);
INSERT INTO `products` VALUES (95, 3, '1723C981AD1548C992C0F8FDFE365087', '孙子兵法', '孙子兵法.jpg', 10.00, '2024-01-12', '军事爱好者可入', 1);
INSERT INTO `products` VALUES (96, 3, 'E59512878FA0452C9B58D97277F8B8AF', '三十六计', '三十六计.jpg', 5.00, '2024-01-12', '用来压泡面了', 0);
INSERT INTO `products` VALUES (103, 4, 'E59512878FA0452C9B58D97277F8B8AF', '人性的弱点全集', '人性的弱点全集.jpg', 10.00, '2024-01-11', '9成新', 1);
INSERT INTO `products` VALUES (105, 5, 'E59512878FA0452C9B58D97277F8B8AF', '人类简史：从动物到上帝', '人类简史：从动物到上帝.jpg', 15.00, '2024-01-11', '毕业便宜甩', 1);
INSERT INTO `products` VALUES (106, 5, '61396C30AC1A4A62A778654F4089F993', '丑陋的中国人', '丑陋的中国人.jpg', 8.00, '2024-01-16', '老书了', 1);
INSERT INTO `products` VALUES (107, 6, '61396C30AC1A4A62A778654F4089F993', '孩子你慢慢来', '孩子你慢慢来.jpg', 10.00, '2024-01-16', '作者龙应台，好书推荐', 1);
INSERT INTO `products` VALUES (108, 6, '61396C30AC1A4A62A778654F4089F993', '男人这东西', '男人这东西.jpg', 8.00, '2024-01-16', '渡边大神的书', 1);
INSERT INTO `products` VALUES (109, 6, 'E59512878FA0452C9B58D97277F8B8AF', '荒野生存', '荒野生存.jpg', 16.00, '2024-01-16', '已改编成同名电影', 1);
INSERT INTO `products` VALUES (110, 8, 'E59512878FA0452C9B58D97277F8B8AF', '管理学', '管理学.jpg', 10.00, '2024-01-16', '考研必备', 1);
INSERT INTO `products` VALUES (112, 9, 'E59512878FA0452C9B58D97277F8B8AF', '时间简史', '时间简史.jpg', 15.00, '2024-01-16', '霍金的科普好书', 0);
INSERT INTO `products` VALUES (116, 9, 'E59512878FA0452C9B58D97277F8B8AF', '万物简史', '万物简史.jpg', 12.00, '2024-01-15', '几乎全新，低价甩', 0);
INSERT INTO `products` VALUES (120, 9, '61396C30AC1A4A62A778654F4089F993', '昆虫记', '昆虫记.jpg', 9.00, '2024-01-15 21:16:27', '一本老书', 1);
INSERT INTO `products` VALUES (121, 9, '13C5F5E668FE4974A1C6F9159E70C19A', '本草纲目', '本草纲目.jpg', 5.00, '2024-01-16 07:57:17', '看看没坏处', 1);

-- ----------------------------
-- Table structure for purse
-- ----------------------------
DROP TABLE IF EXISTS `purse`;
CREATE TABLE `purse`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '钱包id',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `balance` float(11, 0) UNSIGNED ZEROFILL NULL DEFAULT 00000000000 COMMENT '总钱数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_user_purse`(`user_id`) USING BTREE,
  CONSTRAINT `fk_user_purse` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of purse
-- ----------------------------
INSERT INTO `purse` VALUES (1, '0F84E3048F5546A58C8EFE52263D2A83', 00000000190);
INSERT INTO `purse` VALUES (2, '13C5F5E668FE4974A1C6F9159E70C19A', 00000000187);
INSERT INTO `purse` VALUES (3, '1723C981AD1548C992C0F8FDFE365087', 00000000132);
INSERT INTO `purse` VALUES (4, '61396C30AC1A4A62A778654F4089F993', 00000000000);
INSERT INTO `purse` VALUES (5, '6C44D389DB3B47CE851218D74532EDF6', 00000000050);
INSERT INTO `purse` VALUES (6, '88B5C8B63D6D4C8EAC6417E44119FDBB', 00000000000);
INSERT INTO `purse` VALUES (7, 'E59512878FA0452C9B58D97277F8B8AF', 00000000192);
INSERT INTO `purse` VALUES (8, 'FB56B14828CF408C835B3409792B7169', 00000000000);
INSERT INTO `purse` VALUES (10, '36E597F5E38E4435994B1CF1BFB6E30F', 00000000000);
INSERT INTO `purse` VALUES (11, '9F0ED82D37C74293820DC1CEB0CE3754', 00000000000);
INSERT INTO `purse` VALUES (12, '605EE4F481D046B187EDB9B7BDE66F1F', 00000000080);
INSERT INTO `purse` VALUES (13, 'C9BB18B422284E09AC0750A718B52528', 00000000000);
INSERT INTO `purse` VALUES (14, '6D06270841044293BECBF19E51832396', 00000000000);
INSERT INTO `purse` VALUES (15, 'DD0691990A6C4FF6872801FA1B2D3170', 00000000000);
INSERT INTO `purse` VALUES (16, 'CCEDDD18D4434C9A98A48D3B91F8EC2E', 00000000000);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `studentid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `yid` int(10) NOT NULL,
  `createdate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(5) NOT NULL DEFAULT 0,
  `conditions` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('0F84E3048F5546A58C8EFE52263D2A83', '王薪哲', '15245874587', '111111', '1049388229@qq.com', '456456', 2, '2024-01-10 14:07:51', 1, '禁用');
INSERT INTO `user` VALUES ('13C5F5E668FE4974A1C6F9159E70C19A', '小李', '17790792856', '123456', '1049388229@qq.com', '201702153587', 2, '2024-01-09 11:22:35', 1, '正常');
INSERT INTO `user` VALUES ('1723C981AD1548C992C0F8FDFE365087', '王东', '13404840431', '111111', 'jwr1049388229@126.com', '201803458910', 3, '2024-01-10 13:38:52', 1, '正常');
INSERT INTO `user` VALUES ('36E597F5E38E4435994B1CF1BFB6E30F', '李冰', '15024512451', '111111', '1049388229@qq.com', '201810253578', 5, '2024-01-10 19:10:37', 1, '正常');
INSERT INTO `user` VALUES ('605EE4F481D046B187EDB9B7BDE66F1F', '王薪哲', '17790792756', '111111', 'jwr1049388229@126.com', '201578596231', 8, '2024-01-16 09:17:44', 1, '正常');
INSERT INTO `user` VALUES ('61396C30AC1A4A62A778654F4089F993', '李鹏飞', '13404840432', '111111', 'jwr1049388229@126.com', '201608103009', 4, '2024-01-10 19:42:46', 1, '正常');
INSERT INTO `user` VALUES ('6C44D389DB3B47CE851218D74532EDF6', '王薪哲', '17898765432', '111111', 'jwr1049388229@126.com', '201508103007', 5, '2024-01-10 14:19:33', 1, '正常');
INSERT INTO `user` VALUES ('6D06270841044293BECBF19E51832396', '王薪哲', '17790792758', '111111', '1049388229@qq.com', '20158564855', 5, '2024-01-17 18:20:16', 1, '正常');
INSERT INTO `user` VALUES ('88B5C8B63D6D4C8EAC6417E44119FDBB', '小胖子', '15248132105', '111111', 'jwr1049388229@126.com', '201608103075', 6, '2024-01-11 14:34:46', 1, '正常');
INSERT INTO `user` VALUES ('9F0ED82D37C74293820DC1CEB0CE3754', '王薪哲', '15242315698', '111111', 'jwr1049388229@126.com', '201585648569', 8, '2024-01-16 08:32:39', 1, '正常');
INSERT INTO `user` VALUES ('C9BB18B422284E09AC0750A718B52528', 'qweqw', '15248131048', '111111', '1049388229@qq.com', '45645645645', 2, '2024-01-18 21:47:52', 0, '正常');
INSERT INTO `user` VALUES ('CCEDDD18D4434C9A98A48D3B91F8EC2E', 'aaa', '17095621256', '111111', '1049388229@qq.com', '201608103007', 9, '2024-01-09 10:57:09', 0, '正常');
INSERT INTO `user` VALUES ('DD0691990A6C4FF6872801FA1B2D3170', 'jkjjjkk', '17790725645', '111111', '1049388229@qq.com', '201608103006', 3, '2024-01-09 10:53:32', 0, '正常');
INSERT INTO `user` VALUES ('E59512878FA0452C9B58D97277F8B8AF', '计文瑞', '17790792609', '111111', 'jwr1049388229@126.com', '201408452103', 8, '2024-01-11 14:07:04', 1, '正常');
INSERT INTO `user` VALUES ('FB56B14828CF408C835B3409792B7169', '叹世界', '15678547854', '111111', 'jwr1049388229@126.com', '201810483972', 4, '2024-01-05 17:27:39', 1, '正常');

-- ----------------------------
-- Table structure for yuanxi
-- ----------------------------
DROP TABLE IF EXISTS `yuanxi`;
CREATE TABLE `yuanxi`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `yname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yuanxi
-- ----------------------------
INSERT INTO `yuanxi` VALUES (1, '材料科学与工程学院');
INSERT INTO `yuanxi` VALUES (2, '电子信息工程学院');
INSERT INTO `yuanxi` VALUES (3, '自动化科学与电气工程学院');
INSERT INTO `yuanxi` VALUES (4, '能源与动力工程学院');
INSERT INTO `yuanxi` VALUES (5, '航空科学与工程学院');
INSERT INTO `yuanxi` VALUES (6, '计算机学院');
INSERT INTO `yuanxi` VALUES (7, '机械工程与自动化学院');
INSERT INTO `yuanxi` VALUES (8, '经济管理学院');
INSERT INTO `yuanxi` VALUES (9, '数学科学学院');
INSERT INTO `yuanxi` VALUES (10, '生物医学与工程学院');
INSERT INTO `yuanxi` VALUES (11, '人文社会科学学院');
INSERT INTO `yuanxi` VALUES (12, '外国语学院');

SET FOREIGN_KEY_CHECKS = 1;
