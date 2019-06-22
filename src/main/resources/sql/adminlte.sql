/*
 Navicat Premium Data Transfer

 Source Server         : adminlte
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : 192.168.245.100:3306
 Source Schema         : adminlte

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 08/06/2019 14:57:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for component_info
-- ----------------------------
DROP TABLE IF EXISTS `component_info`;
CREATE TABLE `component_info` (
  `id` char(32) NOT NULL DEFAULT '' COMMENT '元器件id',
  `compType` varchar(5) NOT NULL COMMENT '元器件类型     描述元器件大类信息，如电容，电阻，电感',
  `purBatchNum` char(12) NOT NULL COMMENT '购买批次号  YYYYMMDDXXXX',
  `typeDesc` varchar(15) DEFAULT NULL COMMENT '型号',
  `standValue` decimal(12,3) DEFAULT NULL COMMENT '标称数值',
  `errorValue` decimal(4,2) DEFAULT NULL COMMENT '允许误差（±%）',
  `capsulation` varchar(15) DEFAULT NULL COMMENT '封装',
  `ratedOperaVol` decimal(10,2) DEFAULT NULL COMMENT '额定工作电压（V）',
  `ratedOperaCur` decimal(10,3) DEFAULT NULL COMMENT '额定工作电流(m A)',
  `maxOperaVol` decimal(10,2) DEFAULT NULL COMMENT '最高工作电压（V）',
  `maxOperaCur` decimal(10,3) DEFAULT NULL COMMENT '最高工作电流（mA）',
  `qualityFactor` decimal(4,3) DEFAULT NULL COMMENT '品质因数',
  `powerFactor` decimal(4,3) DEFAULT NULL COMMENT '功率因数',
  `opeImpedance` decimal(12,3) DEFAULT NULL COMMENT '工作阻抗',
  `qualityInStock` int(11) DEFAULT NULL COMMENT '库存数量',
  `cabinetNum` varchar(4) DEFAULT NULL COMMENT '存放柜子编号',
  `boxNum` varchar(5) DEFAULT NULL COMMENT '存放盒子编号',
  `purChanel` varchar(10) DEFAULT NULL COMMENT '采购渠道',
  `purName` varchar(50) DEFAULT NULL COMMENT '采购人',
  `purTelphone` varchar(15) DEFAULT NULL COMMENT '采购人联系方式',
  `unitPrice` decimal(12,2) DEFAULT NULL COMMENT '采购单价',
  `purDate` int(8) DEFAULT NULL COMMENT '采购日期',
  `supplyName` varchar(30) DEFAULT NULL COMMENT '供货商名称',
  `supplyTelphone` varchar(15) DEFAULT NULL COMMENT '供货商联系方式',
  `supplyAddress` varchar(50) DEFAULT NULL COMMENT '供货商地址',
  `regDateTime` char(14) DEFAULT NULL COMMENT '登记日期时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_batchNum_idx` (`compType`,`purBatchNum`) USING BTREE COMMENT '元器件类型+批次号唯一索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='元器件库存信息表';

-- ----------------------------
-- Records of component_info
-- ----------------------------
BEGIN;
INSERT INTO `component_info` VALUES ('000000000000000000000000000001', '电容', '201905250001', '贴片电容', 10.000, 2.00, '0603', 3.30, 10.000, 5.00, 20.000, 0.800, 1.000, 100.000, 10000, 'A6', '19', '供货商供应', '李黎', '13880499277', NULL, NULL, '北京新润电子', '028-89802206', '北京市海淀区科技中一路', NULL);
INSERT INTO `component_info` VALUES ('933c3cd6bc1c4e788ff5ee870aa7ed34', '电阻', '201906030001', '钽电容', 100.000, 2.00, '0603', 10.00, 20.000, 15.00, 30.000, 1.000, 1.000, 2.000, 1000, 'A9', '19', '供货商', '李黎', '13089098769', 5.90, NULL, '北京新伟电子', '15578908746', NULL, NULL);
INSERT INTO `component_info` VALUES ('b3dff34bb3ef409eb1224ad9f553cc20', '电感', '201906030002', '贴片电感', 1020.000, 2.50, '0603', 20.00, 30.000, 30.00, 20.000, 1.000, 0.900, 100.000, 3000, 'A20', '89', '淘宝', '朱家鑫', '13899786523', 3.40, NULL, '北京新伟电子', '15578908746', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for out_stock_form
-- ----------------------------
DROP TABLE IF EXISTS `out_stock_form`;
CREATE TABLE `out_stock_form` (
  `outStockFormId` int(20) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '出库清单编号',
  `userName` varchar(50) DEFAULT NULL COMMENT '所属用户名',
  `outStockState` tinyint(4) DEFAULT NULL COMMENT '出库状态 ',
  `totleValue` decimal(15,2) DEFAULT NULL COMMENT '出库单总价值',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`outStockFormId`),
  KEY `user_id_index` (`userName`(20)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of out_stock_form
-- ----------------------------
BEGIN;
INSERT INTO `out_stock_form` VALUES (00000000000000000001, 'zhanglianzhong', 1, 99.52, '2019-06-05 21:31:59');
COMMIT;

-- ----------------------------
-- Table structure for out_stock_item
-- ----------------------------
DROP TABLE IF EXISTS `out_stock_item`;
CREATE TABLE `out_stock_item` (
  `itemId` char(32) NOT NULL COMMENT '物品id',
  `itemName` varchar(20) NOT NULL COMMENT '物品名称',
  `purBatchNum` char(12) NOT NULL COMMENT '购买批次号',
  `capsulation` char(12) DEFAULT NULL COMMENT '封装',
  `standValue` decimal(12,3) DEFAULT NULL COMMENT '标称数值 元器件类',
  `modelNum` varchar(15) DEFAULT NULL COMMENT '型号 芯片类',
  `number` int(4) DEFAULT NULL COMMENT '数量',
  `outStockFormId` int(20) DEFAULT NULL COMMENT '出库清单编号',
  PRIMARY KEY (`itemId`),
  KEY `id_foreign_key` (`outStockFormId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of out_stock_item
-- ----------------------------
BEGIN;
INSERT INTO `out_stock_item` VALUES ('933c3cd6bc1c4e788ff5ee870aa7ed34', '电容', '201906030001', '0603', 100.000, NULL, 10, 1);
INSERT INTO `out_stock_item` VALUES ('933c3cd6bc1c4e788ff5ee870aa7ed35', '电阻', '201906030002', '0603', 10.000, NULL, 10, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `deptName` varchar(100) NOT NULL COMMENT '部门名称',
  `deptDesc` varchar(300) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES ('9a329b597d754c4180c6b40cdfb0f565', 'XFG1206', '无线激光侦听小组');
INSERT INTO `sys_dept` VALUES ('a54cc109fcbb44839827d4024d6d01a8', 'XFG78005', '光电一体化通信');
COMMIT;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `userName` varchar(50) NOT NULL COMMENT '用户',
  `title` varchar(300) DEFAULT NULL COMMENT '日志',
  `url` varchar(300) DEFAULT NULL COMMENT '地址',
  `params` text COMMENT '参数',
  `createTime` datetime DEFAULT NULL COMMENT '日志时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_log` VALUES ('0002d2d6906e4de3a46928cde8b9d95f', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-06 22:44:39');
INSERT INTO `sys_log` VALUES ('015a89eb4fd54f4a97d0c1bd5918092c', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-05 23:29:38');
INSERT INTO `sys_log` VALUES ('0252668015854e7ab545523ab2429971', 'admin', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"476dbef5152040668acffbdb5683d49d\"],\"code\":[\"05\"],\"menuName\":[\"人力资源管理\"],\"sort\":[\"5\"],\"icon\":[\"fa-folder\"]}', '2019-05-24 19:45:56');
INSERT INTO `sys_log` VALUES ('03092ca5757a494fa398525f2bedbd10', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-31 08:04:00');
INSERT INTO `sys_log` VALUES ('04baba521c724d44a839d05e8a91521c', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 22:42:43');
INSERT INTO `sys_log` VALUES ('04c418167d484cb390501be66a855543', 'zhanglianzhong', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"476dbef5152040668acffbdb5683d49d\"],\"code\":[\"02\"],\"menuName\":[\"人力资源管理\"],\"sort\":[\"2\"],\"icon\":[\"fa-folder\"]}', '2019-05-25 08:50:35');
INSERT INTO `sys_log` VALUES ('0550bc63a452462ca1bb8b94f28c5497', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-25 10:52:46');
INSERT INTO `sys_log` VALUES ('0657f94cda1a46b99e268f511d8f0baa', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-31 23:10:01');
INSERT INTO `sys_log` VALUES ('0671019ea0544e7f939dd3349057ad0d', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 20:43:46');
INSERT INTO `sys_log` VALUES ('0986bad2a0474bdca499cf3b4a7542e9', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-05 21:27:46');
INSERT INTO `sys_log` VALUES ('09c993185f1a493ea55c760691c394a2', 'zhanglianzhong', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"6bdc1683d3ad44128f1f80bdbf0580e7\"],\"code\":[\"06\"],\"menuName\":[\"资产管理\"],\"sort\":[\"6\"],\"icon\":[\"fa-folder\"]}', '2019-05-25 08:36:04');
INSERT INTO `sys_log` VALUES ('0a381311850043468b2da71ed0028fb4', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-05 19:38:11');
INSERT INTO `sys_log` VALUES ('0a6b88a83e104c5594360aa815b682ab', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-25 17:29:31');
INSERT INTO `sys_log` VALUES ('0af634cde26847599ba77e4d5b6e42d3', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 11:04:50');
INSERT INTO `sys_log` VALUES ('0be09f93431f428ebc0d843a12ddd034', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-02 23:57:59');
INSERT INTO `sys_log` VALUES ('0ce2f21412784b60b98286d874426fc9', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-31 23:09:33');
INSERT INTO `sys_log` VALUES ('0e1becb367db45769228f58fbd326d32', 'zhanglianzhong', '创建菜单', '/system/menu/doAddMenu', '{\"pid\":[\"476dbef5152040668acffbdb5683d49d\"],\"code\":[\"0204\"],\"menuName\":[\"通讯录\"],\"url\":[\"hr/addressBook\"],\"sort\":[\"4\"],\"icon\":[\"fa-file\"]}', '2019-05-25 09:07:55');
INSERT INTO `sys_log` VALUES ('0e7e2b48ae88404fb5a605d40975e8eb', 'zhanglianzhong', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"c6bfb8c2d70b4b57a7da69b8b20538a4\"],\"pid\":[\"476dbef5152040668acffbdb5683d49d\"],\"code\":[\"0201\"],\"menuName\":[\"每次打卡\"],\"url\":[\"hr/punchClock\"],\"sort\":[\"1\"],\"icon\":[\"fa-file\"]}', '2019-05-25 08:50:47');
INSERT INTO `sys_log` VALUES ('0ec0df17d07b4f9087a7c9b818289529', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 09:16:41');
INSERT INTO `sys_log` VALUES ('0f1ef43c5b02438d8aa6eab697f594f7', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 11:34:01');
INSERT INTO `sys_log` VALUES ('10017f90d9b94832a0910ad979a0ab38', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-31 18:27:25');
INSERT INTO `sys_log` VALUES ('1018be4edd374ce381d02a391029803d', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-03 07:27:41');
INSERT INTO `sys_log` VALUES ('10bf79cc575d4c6194730e1ce9ee713a', 'admin', '创建用户', '/system/user/doAdd', '{\"userName\":[\"zhanglianzhong\"],\"deptId\":[\"9a329b597d754c4180c6b40cdfb0f565\"],\"password\":[\"921230\"],\"password2\":[\"921230\"],\"userDesc\":[\"big boss\"],\"userState\":[\"1\"],\"roleId[]\":[\"b1f9ce5543a049be9f169a3f5e6b72a8\"]}', '2019-05-24 19:54:51');
INSERT INTO `sys_log` VALUES ('10d10133310542b3b67b9ea8279d9745', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-31 23:32:48');
INSERT INTO `sys_log` VALUES ('11be2ff2bd87463cb501130af276e50c', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-25 08:30:12');
INSERT INTO `sys_log` VALUES ('146fc27ee81540a7a186de51fa968346', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-31 23:30:23');
INSERT INTO `sys_log` VALUES ('181157a8a753452dab9a40cd3a8ec534', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 12:07:38');
INSERT INTO `sys_log` VALUES ('188188406c9244debd5e5c1d8d246b5f', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-03 07:39:40');
INSERT INTO `sys_log` VALUES ('19fd009308ba4f5a812c87e8befd58cf', 'zhanglianzhong', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"c6bfb8c2d70b4b57a7da69b8b20538a4\"],\"pid\":[\"476dbef5152040668acffbdb5683d49d\"],\"code\":[\"0201\"],\"menuName\":[\"每次打卡\"],\"url\":[\"hr/punchClock\"],\"sort\":[\"1\"],\"icon\":[\"fas fa-pencil-alt\"]}', '2019-05-25 09:23:43');
INSERT INTO `sys_log` VALUES ('1c102a2c338b4b54a8f702a42f362b16', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 10:58:59');
INSERT INTO `sys_log` VALUES ('1c1309458d1f46de89e89567f3d9b6be', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-03 12:50:03');
INSERT INTO `sys_log` VALUES ('1c47663cd91d4d838c1b0eccb646acef', 'zhanglianzhong', '编辑用户', '/system/user/doEdit', '{\"id\":[\"4761f036e604451eb408d793ad8821c5\"],\"userName\":[\"廖茂可\"],\"deptId\":[\"9a329b597d754c4180c6b40cdfb0f565\"],\"password\":[\"liaomaoke\"],\"confpwd\":[\"liaomaoke\"],\"userDesc\":[\"教研室2015博士\"],\"userState\":[\"1\"],\"roleId[]\":[\"99a54025db684cfd8d0f7049f105a262\"]}', '2019-05-25 11:33:19');
INSERT INTO `sys_log` VALUES ('1f9f954730d1411b8ffd2d9d3642fe31', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-05 19:05:06');
INSERT INTO `sys_log` VALUES ('21fb47681890487596b0ec91b33c3556', 'zhanglianzhong', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"56596b28d126495db2c49fa5cf127a07\"],\"pid\":[\"476dbef5152040668acffbdb5683d49d\"],\"code\":[\"0202\"],\"menuName\":[\"薪资管理\"],\"url\":[\"hr/salaryManager\"],\"sort\":[\"2\"],\"icon\":[\"fa-file\"]}', '2019-05-25 08:51:14');
INSERT INTO `sys_log` VALUES ('234e5d7d4ddb486ea0ad5b1d58306206', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-03 00:03:13');
INSERT INTO `sys_log` VALUES ('246e1d30e4054f56a201092e478e0154', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-05 22:17:29');
INSERT INTO `sys_log` VALUES ('2669473ef8d84f2492b571c766cd6a71', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-03 07:55:06');
INSERT INTO `sys_log` VALUES ('2744d5ab321d4566a5b421494bec95b7', 'huneng', '用户登录成功', '/login/doLogin', '', '2019-05-25 07:23:02');
INSERT INTO `sys_log` VALUES ('2b84c48decf244d1b4a1c194b6b66d83', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-31 08:06:13');
INSERT INTO `sys_log` VALUES ('2caad936829f4a0abaf13efb57f37caa', 'zhanglianzhong', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"c6bfb8c2d70b4b57a7da69b8b20538a4\"],\"pid\":[\"476dbef5152040668acffbdb5683d49d\"],\"code\":[\"0501\"],\"menuName\":[\"每次打卡\"],\"url\":[\"hr/punchClock\"],\"sort\":[\"1\"],\"icon\":[\"fa-file\"]}', '2019-05-24 22:59:00');
INSERT INTO `sys_log` VALUES ('2de20bdacdd042d788ddc11797c658f3', 'zhanglianzhong', '新增功能菜单', '/system/menu/doAddAction', '{\"pid\":[\"08bc9ae261454d43a3d7c59c7e38507c\"],\"code\":[\"030102\"],\"menuName\":[\"元器件库存信息修改\"],\"resource\":[\"editComponentStock\"],\"sort\":[\"2\"]}', '2019-05-25 16:19:42');
INSERT INTO `sys_log` VALUES ('2e0fce399b6e4f569ac13d1803a67b1c', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 11:49:51');
INSERT INTO `sys_log` VALUES ('2f07def3425c46ef8c92c13f7c76bc01', 'zhanglianzhong', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"f3e3b049dd9d4433a5a8dcaf78f38253\"],\"pid\":[\"6bdc1683d3ad44128f1f80bdbf0580e7\"],\"code\":[\"0602\"],\"menuName\":[\"元器件入库出库\"],\"url\":[\"property/inOutStorage\"],\"sort\":[\"2\"],\"icon\":[\"fa-file\"]}', '2019-05-25 08:48:01');
INSERT INTO `sys_log` VALUES ('300106e37b784e5fbbfc4f8f9e2224e4', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-25 08:56:09');
INSERT INTO `sys_log` VALUES ('310a8132ff7f4e30a0356a56e6efcd07', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-30 23:47:58');
INSERT INTO `sys_log` VALUES ('33b5e61708754858963cbb5fc8fb4906', 'zhanglianzhong', '创建菜单', '/system/menu/doAddMenu', '{\"pid\":[\"6bdc1683d3ad44128f1f80bdbf0580e7\"],\"code\":[\"0304\"],\"menuName\":[\"芯片入库出库\"],\"url\":[\"property/chipInOut\"],\"sort\":[\"4\"],\"icon\":[\"fa-file\"]}', '2019-05-25 10:50:08');
INSERT INTO `sys_log` VALUES ('35b578678d644792bf274be091bd6c22', 'zhanglianzhong', '新增功能菜单', '/system/menu/doAddAction', '{\"pid\":[\"c6bfb8c2d70b4b57a7da69b8b20538a4\"],\"code\":[\"050100\"],\"menuName\":[\"查看当日打卡情况\"],\"resource\":[\"punch\"],\"sort\":[\"0\"]}', '2019-05-24 23:05:31');
INSERT INTO `sys_log` VALUES ('360b4d8e7a904044a15b8a85f18030d4', 'zhanglianzhong', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"ee54fe93fd0b4255a22fefeb2b6de084\"],\"pid\":[\"6bdc1683d3ad44128f1f80bdbf0580e7\"],\"code\":[\"0303\"],\"menuName\":[\"活动banner管理\"],\"url\":[\"property/equipmentManage\"],\"sort\":[\"3\"],\"icon\":[\"fa-file\"]}', '2019-05-25 08:52:00');
INSERT INTO `sys_log` VALUES ('367c8915c710441bb5a86dcf30f00531', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-31 19:36:25');
INSERT INTO `sys_log` VALUES ('383b9a3a6ba5479baa530261dfc3d40e', 'zhanglianzhong', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"f3e3b049dd9d4433a5a8dcaf78f38253\"],\"pid\":[\"6bdc1683d3ad44128f1f80bdbf0580e7\"],\"code\":[\"0302\"],\"menuName\":[\"元器件入库出库\"],\"url\":[\"property/componentInOut\"],\"sort\":[\"2\"],\"icon\":[\"fa-file\"]}', '2019-05-25 10:50:46');
INSERT INTO `sys_log` VALUES ('38667a1143d3435593aeb84ac1f0cd79', 'zhanglianzhong', '创建菜单', '/system/menu/doAddMenu', '{\"pid\":[\"6bdc1683d3ad44128f1f80bdbf0580e7\"],\"code\":[\"0305\"],\"menuName\":[\"出入库日志信息查询\"],\"url\":[\"property/inOutLogQuery\"],\"sort\":[\"5\"],\"icon\":[\"fa-file\"]}', '2019-05-25 10:52:07');
INSERT INTO `sys_log` VALUES ('38ce89bfad954ec48c0a6d6f441f37c8', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 21:25:10');
INSERT INTO `sys_log` VALUES ('3a9d45da00a449cbb7450a185a38f893', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-06 22:24:25');
INSERT INTO `sys_log` VALUES ('3b39f2449194485ab3a5a3de22f5ddc6', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-06 08:31:07');
INSERT INTO `sys_log` VALUES ('3b59c1d1ef6a490d864767240f8371c0', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-06 18:46:58');
INSERT INTO `sys_log` VALUES ('3c14807c8d7a44f3be4c378e8b189d5f', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 23:10:02');
INSERT INTO `sys_log` VALUES ('3c5b7aafddae4245bbf31df03f68021a', 'zhanglianzhong', '新增功能菜单', '/system/menu/doAddAction', '{\"pid\":[\"08bc9ae261454d43a3d7c59c7e38507c\"],\"code\":[\"030103\"],\"menuName\":[\"删除元器件库存信息\"],\"resource\":[\"delComponentStock\"],\"sort\":[\"3\"]}', '2019-05-25 16:21:18');
INSERT INTO `sys_log` VALUES ('3fc8efd2c7c34eba8e23e654a0d3e48e', 'zhanglianzhong', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"c6bfb8c2d70b4b57a7da69b8b20538a4\"],\"pid\":[\"476dbef5152040668acffbdb5683d49d\"],\"code\":[\"0201\"],\"menuName\":[\"每次打卡\"],\"url\":[\"hr/punchClock\"],\"sort\":[\"1\"],\"icon\":[\"fal fa-person-carry\"]}', '2019-05-25 09:21:03');
INSERT INTO `sys_log` VALUES ('4044e64e32e947659dfcfe1603113285', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-02 19:39:34');
INSERT INTO `sys_log` VALUES ('41271759572046e3b655693d69b61107', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-30 23:41:33');
INSERT INTO `sys_log` VALUES ('42d9848e1e4b4bfda56d24875caa6b4e', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 08:48:09');
INSERT INTO `sys_log` VALUES ('43dbcc92924944b593fc547e96f8cda2', 'zhanglianzhong', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"f3e3b049dd9d4433a5a8dcaf78f38253\"],\"pid\":[\"6bdc1683d3ad44128f1f80bdbf0580e7\"],\"code\":[\"0302\"],\"menuName\":[\"元器件入库出库\"],\"url\":[\"property/inOutStorage\"],\"sort\":[\"2\"],\"icon\":[\"fa-file\"]}', '2019-05-25 08:51:53');
INSERT INTO `sys_log` VALUES ('44d1ad6015764c06bfc3fe772a7714e0', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 21:07:45');
INSERT INTO `sys_log` VALUES ('45bd55516aa5465281960b3c6c8b1710', 'zhanglianzhong', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"08bc9ae261454d43a3d7c59c7e38507c\"],\"pid\":[\"6bdc1683d3ad44128f1f80bdbf0580e7\"],\"code\":[\"0301\"],\"menuName\":[\"元器件库存信息管理\"],\"url\":[\"property/componentsInfo/list/1\"],\"sort\":[\"1\"],\"icon\":[\"fa-file\"]}', '2019-05-25 16:13:03');
INSERT INTO `sys_log` VALUES ('4b3c4cb1434e4077b8468ae913a4ba8a', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-02 19:50:03');
INSERT INTO `sys_log` VALUES ('4ba10763515645bf851ab31c1fda7eae', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 23:05:15');
INSERT INTO `sys_log` VALUES ('4be3cb56792e477d801931c2c4a3bb9d', 'zhanglianzhong', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"08bc9ae261454d43a3d7c59c7e38507c\"],\"pid\":[\"6bdc1683d3ad44128f1f80bdbf0580e7\"],\"code\":[\"0601\"],\"menuName\":[\"元器件库存信息查询\"],\"url\":[\"property/componentsInfo\"],\"sort\":[\"1\"],\"icon\":[\"fa-file\"]}', '2019-05-25 08:44:34');
INSERT INTO `sys_log` VALUES ('4eb7f77c216840a8a2651a20197cc5d6', 'zhanglianzhong', '角色分配权限', '/system/role/doAuth', '{\"roleId\":[\"b1f9ce5543a049be9f169a3f5e6b72a8\"],\"mid[]\":[\"1\",\"2\",\"d2bc30feb5474a1bb7e02d48d39a3f8a\",\"a73802e513cc4465883530ec8074abbb\",\"4253190001c1480fb0d631d64d150535\",\"649b484b58414d91aefa5a26143e6557\",\"3\",\"1db9105008404a3485b6fac30dba3c0e\",\"60dda993d87647f5989c15f14f866df9\",\"686630c7cb624cc786dcdc9958971a6b\",\"b4e7232189b14cf3ba160cf7b0d3bf37\",\"a5ebf29168234406939856bc6890c86b\",\"f899f3d3baec4571b1c786717f9906fd\",\"4\",\"488ef1eff57b4827acade7c0744278ce\",\"3f26102ef0e04c3c9328cb97067cc5fa\",\"dc5f478d98ed4297a8ae638fe90df050\",\"0c9b5fc8b44b41d1871a8fc8300247ec\",\"22e38e885f9b40b9aae6a36deb78e89c\",\"4e816a9854714d24b0413d929d637a2b\",\"3fb6a7a5935b4efabf3de82e7e1baeb6\",\"363a778e78a346a68210b2590163a943\",\"79d78b8357174cac8f44abd275dec597\",\"5\",\"5d3dd56c16ff4e32aecae1b3228159c7\",\"10\",\"0818e1c76bbd44eba3a698547ec4e637\",\"915c309ebe5047b68645b3eb777dd8c9\",\"476dbef5152040668acffbdb5683d49d\",\"c6bfb8c2d70b4b57a7da69b8b20538a4\",\"56596b28d126495db2c49fa5cf127a07\",\"3da0154b4b4a4303bfc508f3d7e452db\",\"d859974ed35542f5be660c52cf292cc1\",\"6bdc1683d3ad44128f1f80bdbf0580e7\",\"08bc9ae261454d43a3d7c59c7e38507c\",\"d4495ac5e64549d1bf61eebe02a073ba\",\"f3e3b049dd9d4433a5a8dcaf78f38253\",\"914d6b18bc3f4e8a9085e1bf1763d773\"]}', '2019-05-25 16:51:32');
INSERT INTO `sys_log` VALUES ('4eda82ee70874a0bbbe4cd6c70111870', 'admin', '删除用户', '/system/user/delete', '{\"id\":[\"45300712cbc343d3998a065164b72067\"]}', '2019-05-24 19:54:26');
INSERT INTO `sys_log` VALUES ('4fbe30010d734144bfb62125b282dc30', 'zhanglianzhong', '创建用户', '/system/user/doAdd', '{\"userName\":[\"huneng\"],\"deptId\":[\"9a329b597d754c4180c6b40cdfb0f565\"],\"password\":[\"huneng\"],\"password2\":[\"huneng\"],\"userDesc\":[\"收单授权组开发人员\"],\"userState\":[\"1\"],\"roleId[]\":[\"99a54025db684cfd8d0f7049f105a262\"]}', '2019-05-24 23:14:23');
INSERT INTO `sys_log` VALUES ('50aecff6ecce4b1d9363ae823aca7d9b', 'zhanglianzhong', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"ee54fe93fd0b4255a22fefeb2b6de084\"],\"pid\":[\"6bdc1683d3ad44128f1f80bdbf0580e7\"],\"code\":[\"0603\"],\"menuName\":[\"活动banner管理\"],\"url\":[\"property/equipmentManage\"],\"sort\":[\"3\"],\"icon\":[\"fa-file\"]}', '2019-05-25 08:49:14');
INSERT INTO `sys_log` VALUES ('511abe64f2ba47bb93ccb8d6bf6e491b', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-31 07:40:00');
INSERT INTO `sys_log` VALUES ('529d7f768abb4019b1ba07e70ce7a986', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-31 07:46:07');
INSERT INTO `sys_log` VALUES ('56647790238942f1be48930c72ef7060', 'zhanglianzhong', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"c6bfb8c2d70b4b57a7da69b8b20538a4\"],\"pid\":[\"476dbef5152040668acffbdb5683d49d\"],\"code\":[\"0201\"],\"menuName\":[\"每次打卡\"],\"url\":[\"hr/punchClock\"],\"sort\":[\"1\"],\"icon\":[\"fas fa-pencil-alt\"]}', '2019-05-25 09:24:12');
INSERT INTO `sys_log` VALUES ('5746e188be7845d7a162b13e036b0a34', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-25 12:18:06');
INSERT INTO `sys_log` VALUES ('58dae60c01ba4303b56a7d67c46a036a', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-05 20:24:29');
INSERT INTO `sys_log` VALUES ('5a3014a9f21149dbbfd7e1e1bf70a20f', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-25 11:30:25');
INSERT INTO `sys_log` VALUES ('5ad834da90cd43019ffc6cdc2b2aede0', 'zhanglianzhong', '角色分配权限', '/system/role/doAuth', '{\"roleId\":[\"b1f9ce5543a049be9f169a3f5e6b72a8\"],\"mid[]\":[\"1\",\"2\",\"d2bc30feb5474a1bb7e02d48d39a3f8a\",\"a73802e513cc4465883530ec8074abbb\",\"4253190001c1480fb0d631d64d150535\",\"649b484b58414d91aefa5a26143e6557\",\"3\",\"1db9105008404a3485b6fac30dba3c0e\",\"60dda993d87647f5989c15f14f866df9\",\"686630c7cb624cc786dcdc9958971a6b\",\"b4e7232189b14cf3ba160cf7b0d3bf37\",\"a5ebf29168234406939856bc6890c86b\",\"f899f3d3baec4571b1c786717f9906fd\",\"4\",\"488ef1eff57b4827acade7c0744278ce\",\"3f26102ef0e04c3c9328cb97067cc5fa\",\"dc5f478d98ed4297a8ae638fe90df050\",\"0c9b5fc8b44b41d1871a8fc8300247ec\",\"22e38e885f9b40b9aae6a36deb78e89c\",\"4e816a9854714d24b0413d929d637a2b\",\"3fb6a7a5935b4efabf3de82e7e1baeb6\",\"363a778e78a346a68210b2590163a943\",\"79d78b8357174cac8f44abd275dec597\",\"5\",\"5d3dd56c16ff4e32aecae1b3228159c7\",\"10\",\"0818e1c76bbd44eba3a698547ec4e637\",\"915c309ebe5047b68645b3eb777dd8c9\",\"f5a20c82110b4a3ea9e30ca01a038680\",\"42dd5ae31e3a43b3a197440e8ec19a94\",\"476dbef5152040668acffbdb5683d49d\",\"c6bfb8c2d70b4b57a7da69b8b20538a4\",\"56596b28d126495db2c49fa5cf127a07\",\"3da0154b4b4a4303bfc508f3d7e452db\",\"cd00a5dc137445ccbbe963dcbd1e0015\",\"6bdc1683d3ad44128f1f80bdbf0580e7\",\"08bc9ae261454d43a3d7c59c7e38507c\",\"f3e3b049dd9d4433a5a8dcaf78f38253\",\"ee54fe93fd0b4255a22fefeb2b6de084\"]}', '2019-05-24 23:09:26');
INSERT INTO `sys_log` VALUES ('5ae3ee1ae9d947a4b5cdeed47fde37ec', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-03 12:48:55');
INSERT INTO `sys_log` VALUES ('5b138bd780af4eca81a5251829469318', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-02 18:05:38');
INSERT INTO `sys_log` VALUES ('5b676936ddc4447093885ef93968fa4e', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 23:08:59');
INSERT INTO `sys_log` VALUES ('5dc14689737344e0a4c27f96a1b19906', 'zhanglianzhong', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"c6bfb8c2d70b4b57a7da69b8b20538a4\"],\"pid\":[\"476dbef5152040668acffbdb5683d49d\"],\"code\":[\"0201\"],\"menuName\":[\"每次打卡\"],\"url\":[\"hr/punchClock\"],\"sort\":[\"1\"],\"icon\":[\"far fa-address-book\"]}', '2019-05-25 09:20:17');
INSERT INTO `sys_log` VALUES ('5dfcff5b9fb348dcb4c3a79a23dba333', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-06 22:56:14');
INSERT INTO `sys_log` VALUES ('5e210ba8a80f4ce2b0f699802c88e603', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-25 07:58:13');
INSERT INTO `sys_log` VALUES ('5e84bb870da6454b9a3ac9957e26e5b7', 'zhanglianzhong', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"08bc9ae261454d43a3d7c59c7e38507c\"],\"pid\":[\"6bdc1683d3ad44128f1f80bdbf0580e7\"],\"code\":[\"0301\"],\"menuName\":[\"元器件库存信息查询\"],\"url\":[\"property/componentsInfo\"],\"sort\":[\"1\"],\"icon\":[\"fa-file\"]}', '2019-05-25 08:51:47');
INSERT INTO `sys_log` VALUES ('62625f2b67fb48adb2652caadd4c5278', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-25 13:02:52');
INSERT INTO `sys_log` VALUES ('6370863cca0c482db6f3b6d206903055', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-06 08:17:05');
INSERT INTO `sys_log` VALUES ('63b1b6ec17bc4c09971c7af0af196ad9', 'admin', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"c6bfb8c2d70b4b57a7da69b8b20538a4\"],\"pid\":[\"476dbef5152040668acffbdb5683d49d\"],\"code\":[\"0501\"],\"menuName\":[\"每次打卡\"],\"url\":[\"hr/punchClock\"],\"sort\":[\"1\"],\"icon\":[\"fa-file\"]}', '2019-05-24 19:49:20');
INSERT INTO `sys_log` VALUES ('63f419163ebe48ceaa0c7f4fb2bd5f20', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-03 07:45:06');
INSERT INTO `sys_log` VALUES ('6528c1141f7c4c178250d0bac7412d4f', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-03 12:45:54');
INSERT INTO `sys_log` VALUES ('661a849199444d8d9266fcf3d1f1bcf2', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-05 23:26:20');
INSERT INTO `sys_log` VALUES ('66315b72f7204c5e8b9c74306d23f180', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-05 21:05:42');
INSERT INTO `sys_log` VALUES ('66422f4e83b54dedb57315322d8b9f99', 'zhanglianzhong', '角色分配权限', '/system/role/doAuth', '{\"roleId\":[\"b1f9ce5543a049be9f169a3f5e6b72a8\"],\"mid[]\":[\"1\",\"2\",\"d2bc30feb5474a1bb7e02d48d39a3f8a\",\"a73802e513cc4465883530ec8074abbb\",\"4253190001c1480fb0d631d64d150535\",\"649b484b58414d91aefa5a26143e6557\",\"3\",\"1db9105008404a3485b6fac30dba3c0e\",\"60dda993d87647f5989c15f14f866df9\",\"686630c7cb624cc786dcdc9958971a6b\",\"b4e7232189b14cf3ba160cf7b0d3bf37\",\"a5ebf29168234406939856bc6890c86b\",\"f899f3d3baec4571b1c786717f9906fd\",\"4\",\"488ef1eff57b4827acade7c0744278ce\",\"3f26102ef0e04c3c9328cb97067cc5fa\",\"dc5f478d98ed4297a8ae638fe90df050\",\"0c9b5fc8b44b41d1871a8fc8300247ec\",\"22e38e885f9b40b9aae6a36deb78e89c\",\"4e816a9854714d24b0413d929d637a2b\",\"3fb6a7a5935b4efabf3de82e7e1baeb6\",\"363a778e78a346a68210b2590163a943\",\"79d78b8357174cac8f44abd275dec597\",\"5\",\"5d3dd56c16ff4e32aecae1b3228159c7\",\"10\",\"0818e1c76bbd44eba3a698547ec4e637\",\"915c309ebe5047b68645b3eb777dd8c9\",\"476dbef5152040668acffbdb5683d49d\",\"c6bfb8c2d70b4b57a7da69b8b20538a4\",\"56596b28d126495db2c49fa5cf127a07\",\"3da0154b4b4a4303bfc508f3d7e452db\",\"d859974ed35542f5be660c52cf292cc1\",\"6bdc1683d3ad44128f1f80bdbf0580e7\",\"08bc9ae261454d43a3d7c59c7e38507c\",\"d4495ac5e64549d1bf61eebe02a073ba\",\"57baab71de9a4cad9067d77059d4fd24\",\"a5e4b7260a17450e95a8c7fb0bb58b21\",\"ba115e3b67034045b19d2fd7df0ecbf0\",\"914d6b18bc3f4e8a9085e1bf1763d773\"]}', '2019-05-31 23:50:08');
INSERT INTO `sys_log` VALUES ('67b0a317cc884be0900750f4a8d313e6', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-05 19:15:56');
INSERT INTO `sys_log` VALUES ('69ee57d91ef5467eaf85db40b61d7ea9', 'admin', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"476dbef5152040668acffbdb5683d49d\"],\"code\":[\"05\"],\"menuName\":[\"人力资源管理\"],\"sort\":[\"2\"],\"icon\":[\"fa-folder\"]}', '2019-05-24 19:47:47');
INSERT INTO `sys_log` VALUES ('6ba1c67dbd324bb5ae861a54fc351811', 'zhanglianzhong', '角色分配权限', '/system/role/doAuth', '{\"roleId\":[\"b1f9ce5543a049be9f169a3f5e6b72a8\"],\"mid[]\":[\"1\",\"2\",\"d2bc30feb5474a1bb7e02d48d39a3f8a\",\"a73802e513cc4465883530ec8074abbb\",\"4253190001c1480fb0d631d64d150535\",\"649b484b58414d91aefa5a26143e6557\",\"3\",\"1db9105008404a3485b6fac30dba3c0e\",\"60dda993d87647f5989c15f14f866df9\",\"686630c7cb624cc786dcdc9958971a6b\",\"b4e7232189b14cf3ba160cf7b0d3bf37\",\"a5ebf29168234406939856bc6890c86b\",\"f899f3d3baec4571b1c786717f9906fd\",\"4\",\"488ef1eff57b4827acade7c0744278ce\",\"3f26102ef0e04c3c9328cb97067cc5fa\",\"dc5f478d98ed4297a8ae638fe90df050\",\"0c9b5fc8b44b41d1871a8fc8300247ec\",\"22e38e885f9b40b9aae6a36deb78e89c\",\"4e816a9854714d24b0413d929d637a2b\",\"3fb6a7a5935b4efabf3de82e7e1baeb6\",\"363a778e78a346a68210b2590163a943\",\"79d78b8357174cac8f44abd275dec597\",\"5\",\"5d3dd56c16ff4e32aecae1b3228159c7\",\"10\",\"0818e1c76bbd44eba3a698547ec4e637\",\"915c309ebe5047b68645b3eb777dd8c9\",\"476dbef5152040668acffbdb5683d49d\",\"c6bfb8c2d70b4b57a7da69b8b20538a4\",\"56596b28d126495db2c49fa5cf127a07\",\"3da0154b4b4a4303bfc508f3d7e452db\",\"d859974ed35542f5be660c52cf292cc1\",\"6bdc1683d3ad44128f1f80bdbf0580e7\",\"08bc9ae261454d43a3d7c59c7e38507c\",\"d4495ac5e64549d1bf61eebe02a073ba\",\"f3e3b049dd9d4433a5a8dcaf78f38253\",\"914d6b18bc3f4e8a9085e1bf1763d773\",\"db8cce30609b48e6a4ef376d3a8d5de8\",\"a6bdb68e8afd405ab6574127e662f482\"]}', '2019-05-25 16:49:30');
INSERT INTO `sys_log` VALUES ('6c71d0e3596e46f2af84c2f2a4034918', 'zhanglianzhong', '编辑用户', '/system/user/doEdit', '{\"id\":[\"4761f036e604451eb408d793ad8821c5\"],\"userName\":[\"廖茂可\"],\"deptId\":[\"a54cc109fcbb44839827d4024d6d01a8\"],\"password\":[\"\"],\"confpwd\":[\"\"],\"userDesc\":[\"教研室2015博士\"],\"userState\":[\"1\"],\"roleId[]\":[\"99a54025db684cfd8d0f7049f105a262\"]}', '2019-05-25 11:35:59');
INSERT INTO `sys_log` VALUES ('6c9b9a9ab24a400da6c6cc7d3005562a', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-05 22:55:48');
INSERT INTO `sys_log` VALUES ('6e9a3ed13a4341e6af8fcf6fcbf33b6a', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-06 18:43:26');
INSERT INTO `sys_log` VALUES ('70ece20da7ef408aa2ab3ac0ad1f3e2f', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-05 23:15:24');
INSERT INTO `sys_log` VALUES ('7159467a2d3046289f27c622e15d5570', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-24 19:55:09');
INSERT INTO `sys_log` VALUES ('721e95c4cfcc49ac96943b211e441813', 'admin', '更新系统设置', '/system/setting/doSetting', '{\"id\":[\"1\",\"2\",\"3\"],\"sysValue\":[\"qinghaihu-admin\",\"后台管理系统V1.0\",\"Copyright © 2019 纵横金融管理有限公司. All rights reserved.\"]}', '2019-05-24 19:45:18');
INSERT INTO `sys_log` VALUES ('742df2d9204741a6b0ee225c2bf5cff9', 'zhanglianzhong', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"6bdc1683d3ad44128f1f80bdbf0580e7\"],\"code\":[\"03\"],\"menuName\":[\"资产管理\"],\"sort\":[\"6\"],\"icon\":[\"fa-folder\"]}', '2019-05-25 08:51:39');
INSERT INTO `sys_log` VALUES ('7544cfe2851e41ed881e4a3e7c09a6f2', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-25 16:30:07');
INSERT INTO `sys_log` VALUES ('77350409749b4600bfae1f57564db256', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 10:46:53');
INSERT INTO `sys_log` VALUES ('7981ee0cf0f74fee804d748fbbc312c4', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-30 23:46:00');
INSERT INTO `sys_log` VALUES ('7be49d20b293488ebb6675974397d30e', 'zhanglianzhong', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"08bc9ae261454d43a3d7c59c7e38507c\"],\"pid\":[\"6bdc1683d3ad44128f1f80bdbf0580e7\"],\"code\":[\"0301\"],\"menuName\":[\"元器件库存信息管理\"],\"url\":[\"property/componentsInfo/list/1\"],\"sort\":[\"1\"],\"icon\":[\"fa-file\"]}', '2019-05-25 16:08:03');
INSERT INTO `sys_log` VALUES ('7e1d9177a2bb4106b41f77031eae4908', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-31 23:28:18');
INSERT INTO `sys_log` VALUES ('7fd1b10c5d124b63b1b0dd5435bfa4de', 'admin', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"56596b28d126495db2c49fa5cf127a07\"],\"pid\":[\"1\"],\"code\":[\"0502\"],\"menuName\":[\"员工薪资管理\"],\"url\":[\"hr/salaryManager\"],\"sort\":[\"2\"],\"icon\":[\"fa-file\"]}', '2019-05-24 19:51:05');
INSERT INTO `sys_log` VALUES ('81f34191e22d49669b24babb58cbef1d', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 11:22:22');
INSERT INTO `sys_log` VALUES ('84affb51129947ea9f25f8425586a130', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-06 22:59:54');
INSERT INTO `sys_log` VALUES ('84dd4eb9f444445cb225e91c2a290230', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-25 16:53:01');
INSERT INTO `sys_log` VALUES ('84ebc75038d846c789c9b3d193fefbdf', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-06 22:57:51');
INSERT INTO `sys_log` VALUES ('84f7c02c0f04418e803484f97febb40c', 'zhanglianzhong', '更新系统设置', '/system/setting/doSetting', '{\"id\":[\"1\",\"2\",\"3\"],\"sysValue\":[\"XFGGroup-Admin\",\"XFG教研室后台管理系统V1.0\",\"Copyright © 2019 连重科技有限公司. All rights reserved.\"]}', '2019-05-25 08:55:16');
INSERT INTO `sys_log` VALUES ('851976ca8ebd41e9866e26952ec4975f', 'zhanglianzhong', '创建菜单', '/system/menu/doAddMenu', '{\"pid\":[\"6bdc1683d3ad44128f1f80bdbf0580e7\"],\"code\":[\"0303\"],\"menuName\":[\"芯片库存信息查询\"],\"url\":[\"property/chipInfo\"],\"sort\":[\"3\"],\"icon\":[\"fa-file\"]}', '2019-05-25 10:48:45');
INSERT INTO `sys_log` VALUES ('852c5b6c239841ffa2af5689b6409a89', 'zhanglianzhong', '创建菜单', '/system/menu/doAddMenu', '{\"pid\":[\"476dbef5152040668acffbdb5683d49d\"],\"code\":[\"0504\"],\"menuName\":[\"会议室预定\"],\"url\":[\"hr/assemRoom\"],\"sort\":[\"4\"],\"icon\":[\"fa-file\"]}', '2019-05-24 20:36:23');
INSERT INTO `sys_log` VALUES ('85bc9dc8cce74eda9534f9c0685cd091', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-31 07:43:32');
INSERT INTO `sys_log` VALUES ('87436f919e3b4aaa9bc89487a6faa0ca', 'zhanglianzhong', '新增功能菜单', '/system/menu/doAddAction', '{\"pid\":[\"08bc9ae261454d43a3d7c59c7e38507c\"],\"code\":[\"030101\"],\"menuName\":[\"查询元器件库存\"],\"resource\":[\"queryComponentStock\"],\"sort\":[\"1\"]}', '2019-05-25 16:15:10');
INSERT INTO `sys_log` VALUES ('89aba4f4ba144d439de67635f7090403', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-05 19:17:53');
INSERT INTO `sys_log` VALUES ('8a6734e897074051909a7eed4b2e2de5', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-06 22:01:14');
INSERT INTO `sys_log` VALUES ('8b504844cf814de0b00fcf3e8076b795', 'zhanglianzhong', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"ee54fe93fd0b4255a22fefeb2b6de084\"],\"pid\":[\"6bdc1683d3ad44128f1f80bdbf0580e7\"],\"code\":[\"0303\"],\"menuName\":[\"器材库存管理\"],\"url\":[\"property/equipmentManage\"],\"sort\":[\"3\"],\"icon\":[\"fa-file\"]}', '2019-05-25 08:52:32');
INSERT INTO `sys_log` VALUES ('8b88bb95238a4665976f3ebc1c7688ab', 'admin', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"3da0154b4b4a4303bfc508f3d7e452db\"],\"pid\":[\"476dbef5152040668acffbdb5683d49d\"],\"code\":[\"0503\"],\"menuName\":[\"薪资查询\"],\"url\":[\"hr/salaryQuery\"],\"sort\":[\"3\"],\"icon\":[\"fa-file\"]}', '2019-05-24 19:51:56');
INSERT INTO `sys_log` VALUES ('8eb6d8582a9642159e87dbeb1d9f3a69', 'zhanglianzhong', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"c6bfb8c2d70b4b57a7da69b8b20538a4\"],\"pid\":[\"476dbef5152040668acffbdb5683d49d\"],\"code\":[\"0201\"],\"menuName\":[\"每次打卡\"],\"url\":[\"hr/punchClock\"],\"sort\":[\"1\"],\"icon\":[\"fas fa-person-carry\"]}', '2019-05-25 09:18:17');
INSERT INTO `sys_log` VALUES ('8ed69fb2f42f468ea2e6bd8e13f6e5b1', 'zhanglianzhong', '角色分配权限', '/system/role/doAuth', '{\"roleId\":[\"b1f9ce5543a049be9f169a3f5e6b72a8\"],\"mid[]\":[\"1\",\"2\",\"d2bc30feb5474a1bb7e02d48d39a3f8a\",\"a73802e513cc4465883530ec8074abbb\",\"4253190001c1480fb0d631d64d150535\",\"649b484b58414d91aefa5a26143e6557\",\"3\",\"1db9105008404a3485b6fac30dba3c0e\",\"60dda993d87647f5989c15f14f866df9\",\"686630c7cb624cc786dcdc9958971a6b\",\"b4e7232189b14cf3ba160cf7b0d3bf37\",\"a5ebf29168234406939856bc6890c86b\",\"f899f3d3baec4571b1c786717f9906fd\",\"4\",\"488ef1eff57b4827acade7c0744278ce\",\"3f26102ef0e04c3c9328cb97067cc5fa\",\"dc5f478d98ed4297a8ae638fe90df050\",\"0c9b5fc8b44b41d1871a8fc8300247ec\",\"22e38e885f9b40b9aae6a36deb78e89c\",\"4e816a9854714d24b0413d929d637a2b\",\"3fb6a7a5935b4efabf3de82e7e1baeb6\",\"363a778e78a346a68210b2590163a943\",\"79d78b8357174cac8f44abd275dec597\",\"5\",\"5d3dd56c16ff4e32aecae1b3228159c7\",\"10\",\"0818e1c76bbd44eba3a698547ec4e637\",\"915c309ebe5047b68645b3eb777dd8c9\",\"476dbef5152040668acffbdb5683d49d\",\"c6bfb8c2d70b4b57a7da69b8b20538a4\",\"56596b28d126495db2c49fa5cf127a07\",\"3da0154b4b4a4303bfc508f3d7e452db\",\"d859974ed35542f5be660c52cf292cc1\",\"6bdc1683d3ad44128f1f80bdbf0580e7\",\"08bc9ae261454d43a3d7c59c7e38507c\",\"d4495ac5e64549d1bf61eebe02a073ba\",\"57baab71de9a4cad9067d77059d4fd24\",\"a5e4b7260a17450e95a8c7fb0bb58b21\",\"ba115e3b67034045b19d2fd7df0ecbf0\",\"914d6b18bc3f4e8a9085e1bf1763d773\"]}', '2019-05-31 23:47:40');
INSERT INTO `sys_log` VALUES ('90b29d6a3ddb41a3bed6bd580fda6ecd', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 12:06:51');
INSERT INTO `sys_log` VALUES ('9230cabaaf69430faba32cc6fe52fb4d', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 23:28:35');
INSERT INTO `sys_log` VALUES ('92310cdf8e6b416fa3a65480ba08c765', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 20:38:27');
INSERT INTO `sys_log` VALUES ('930f9e8ff802492f8f3732ccef50ab4b', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-25 10:45:39');
INSERT INTO `sys_log` VALUES ('934ef77bf05843199776731cafce2b76', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-24 20:17:16');
INSERT INTO `sys_log` VALUES ('947a6f5d3c044d199471ff6759639533', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-05 20:25:57');
INSERT INTO `sys_log` VALUES ('951423635e804766aa964f6793004d0c', 'zhanglianzhong', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"d859974ed35542f5be660c52cf292cc1\"],\"pid\":[\"476dbef5152040668acffbdb5683d49d\"],\"code\":[\"0204\"],\"menuName\":[\"通讯录\"],\"url\":[\"hr/addressBook\"],\"sort\":[\"4\"],\"icon\":[\"fas fa-address-book\"]}', '2019-05-25 09:13:04');
INSERT INTO `sys_log` VALUES ('95542996b605427b87ff6db7e1866333', 'zhanglianzhong', '删除菜单', '/system/menu/delete', '{\"id\":[\"f3e3b049dd9d4433a5a8dcaf78f38253\"]}', '2019-05-31 23:37:57');
INSERT INTO `sys_log` VALUES ('95d65952f00241adac7cf1c8905611e8', 'zhanglianzhong', '删除菜单', '/system/menu/delete', '{\"id\":[\"cd00a5dc137445ccbbe963dcbd1e0015\"]}', '2019-05-25 08:34:04');
INSERT INTO `sys_log` VALUES ('96539263bf0c4ac396a48c0995ab3b52', 'zhanglianzhong', '编辑用户', '/system/user/doEdit', '{\"id\":[\"da1c6c7e985e465cb022963dc0063991\"],\"userName\":[\"zhanglianzhong\"],\"deptId\":[\"9a329b597d754c4180c6b40cdfb0f565\"],\"password\":[\"921230\"],\"confpwd\":[\"921230\"],\"userDesc\":[\"xfg1206组长\"],\"userState\":[\"1\"],\"roleId[]\":[\"b1f9ce5543a049be9f169a3f5e6b72a8\"]}', '2019-05-25 11:36:51');
INSERT INTO `sys_log` VALUES ('98c4745c1fb4496780a68b97e9b5625e', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-30 23:51:10');
INSERT INTO `sys_log` VALUES ('9939751b70824126bb3b6d396fe8c7a7', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-06 22:50:03');
INSERT INTO `sys_log` VALUES ('9a590c3302f24ea8bb08f8627a748cf8', 'zhanglianzhong', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"ee54fe93fd0b4255a22fefeb2b6de084\"],\"pid\":[\"6bdc1683d3ad44128f1f80bdbf0580e7\"],\"code\":[\"0306\"],\"menuName\":[\"器材库存管理\"],\"url\":[\"property/equipmentManage\"],\"sort\":[\"3\"],\"icon\":[\"fa-file\"]}', '2019-05-25 10:46:53');
INSERT INTO `sys_log` VALUES ('9a5aa0c865154593a1f3fb0d9fe4b5db', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-05 22:24:56');
INSERT INTO `sys_log` VALUES ('9b3ed6614400493ab0b261302de142f8', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 11:55:52');
INSERT INTO `sys_log` VALUES ('9bc25fd3f2a043aa82f1472a1cf0241a', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 22:59:52');
INSERT INTO `sys_log` VALUES ('9f46e80cb3cc4f53bb49dce6f033dea3', 'zhanglianzhong', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"b1cdd0d5d5664045a7f4b859b5d4c319\"],\"pid\":[\"c6bfb8c2d70b4b57a7da69b8b20538a4\"],\"code\":[\"020100\"],\"menuName\":[\"查看当日打卡情况\"],\"resource\":[\"listPunch\"],\"sort\":[\"0\"]}', '2019-05-25 08:51:04');
INSERT INTO `sys_log` VALUES ('9f4c8158833f49ccb7998b6066ac90b3', 'zhanglianzhong', '新增功能菜单', '/system/menu/doAddAction', '{\"pid\":[\"08bc9ae261454d43a3d7c59c7e38507c\"],\"code\":[\"030104\"],\"menuName\":[\"元器件入库\"],\"resource\":[\"addComponentStock\"],\"sort\":[\"4\"]}', '2019-05-25 17:39:09');
INSERT INTO `sys_log` VALUES ('a0a567ef45ab4bfc903a46e71661538f', 'zhanglianzhong', '角色分配权限', '/system/role/doAuth', '{\"roleId\":[\"99a54025db684cfd8d0f7049f105a262\"],\"mid[]\":[\"476dbef5152040668acffbdb5683d49d\",\"c6bfb8c2d70b4b57a7da69b8b20538a4\",\"b1cdd0d5d5664045a7f4b859b5d4c319\",\"3da0154b4b4a4303bfc508f3d7e452db\",\"cd00a5dc137445ccbbe963dcbd1e0015\"]}', '2019-05-25 07:24:07');
INSERT INTO `sys_log` VALUES ('a0c0e46150ef4c9ab7108c159d0bda55', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-31 18:38:52');
INSERT INTO `sys_log` VALUES ('a1fbf618d28f4c96922285805fc6ecd2', 'zhanglianzhong', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"c6bfb8c2d70b4b57a7da69b8b20538a4\"],\"pid\":[\"476dbef5152040668acffbdb5683d49d\"],\"code\":[\"0201\"],\"menuName\":[\"每次打卡\"],\"url\":[\"hr/punchClock\"],\"sort\":[\"1\"],\"icon\":[\"fa-person-carry\"]}', '2019-05-25 09:18:40');
INSERT INTO `sys_log` VALUES ('a38777e822024fa1ac2cd8bb13118c0b', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-25 15:56:07');
INSERT INTO `sys_log` VALUES ('a67168a0479b4ad68224fb7769346f19', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-03 12:52:42');
INSERT INTO `sys_log` VALUES ('a69f28e1a8ec45859eafeca0bbf80b4e', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-31 23:12:42');
INSERT INTO `sys_log` VALUES ('a6ec3b7ec3d64ad781673c2f772aeb72', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-05 21:29:56');
INSERT INTO `sys_log` VALUES ('a7248053282b4ae5a6ee4adbd56ac436', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-02 19:47:23');
INSERT INTO `sys_log` VALUES ('a76dcb6267b54512b4dadb4c9779cac4', 'huneng', '用户登录成功', '/login/doLogin', '', '2019-05-25 07:24:20');
INSERT INTO `sys_log` VALUES ('a99de15c67474ab28389c33b818a56b8', 'zhanglianzhong', '删除菜单', '/system/menu/delete', '{\"id\":[\"42dd5ae31e3a43b3a197440e8ec19a94\"]}', '2019-05-25 08:31:55');
INSERT INTO `sys_log` VALUES ('a9d5b0dba6bb45c7924fa7df51dfc83d', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 08:55:58');
INSERT INTO `sys_log` VALUES ('aa91ff42ca554a4d91e3070bd7dea07c', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-31 19:09:02');
INSERT INTO `sys_log` VALUES ('adc24b158e2b4af4b9a5b6f2e8e906f4', 'zhanglianzhong', '删除菜单', '/system/menu/delete', '{\"id\":[\"f5a20c82110b4a3ea9e30ca01a038680\"]}', '2019-05-25 08:31:50');
INSERT INTO `sys_log` VALUES ('b06b7bcd120c4e68a110c7888fca882a', 'admin', '用户登录成功', '/login/doLogin', '', '2019-05-24 19:44:09');
INSERT INTO `sys_log` VALUES ('b17f29135b6a4a29a4a943338f7ceb3a', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 20:36:27');
INSERT INTO `sys_log` VALUES ('b23f8410074a4e7ea08b4a990091e5c8', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-05 23:19:07');
INSERT INTO `sys_log` VALUES ('b2afad51b60748629083fae94b674fb9', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 20:55:36');
INSERT INTO `sys_log` VALUES ('b5642dc5e7b743b1886e2813766897a9', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-31 07:47:46');
INSERT INTO `sys_log` VALUES ('b7824cfc5ffd4af386a2a8dc0449e1c3', 'admin', '删除菜单', '/system/menu/delete', '{\"id\":[\"60610d001b0f471da0b1ce1ed14eeec5\"]}', '2019-05-24 19:53:16');
INSERT INTO `sys_log` VALUES ('b8f872b8a46044acaf326dd6a1403229', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-05 19:57:45');
INSERT INTO `sys_log` VALUES ('b93a78ae42c84569b9219e11e514b485', 'zhanglianzhong', '创建部门', '/system/dept/doAdd', '{\"deptName\":[\"XFG78005\"],\"deptDesc\":[\"光电一体化通信\"]}', '2019-05-25 11:35:33');
INSERT INTO `sys_log` VALUES ('bb806957fc784a8696bdc3e304638b61', 'zhanglianzhong', '角色分配权限', '/system/role/doAuth', '{\"roleId\":[\"99a54025db684cfd8d0f7049f105a262\"],\"mid[]\":[\"c6bfb8c2d70b4b57a7da69b8b20538a4\",\"b1cdd0d5d5664045a7f4b859b5d4c319\",\"3da0154b4b4a4303bfc508f3d7e452db\"]}', '2019-05-24 23:13:12');
INSERT INTO `sys_log` VALUES ('bd2089356cee41769a72bbfaeabd9033', 'zhanglianzhong', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"476dbef5152040668acffbdb5683d49d\"],\"code\":[\"02\"],\"menuName\":[\"人力资源管理\"],\"sort\":[\"2\"],\"icon\":[\"fas fa-user-circle\"]}', '2019-05-25 09:17:02');
INSERT INTO `sys_log` VALUES ('beffb34509c743b38ed76498dc2f013d', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-25 17:47:13');
INSERT INTO `sys_log` VALUES ('c209176283b6406da0b0e58645523d5b', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 21:14:04');
INSERT INTO `sys_log` VALUES ('c245403375e4422faeeb861aeb77c855', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 21:18:59');
INSERT INTO `sys_log` VALUES ('c39fc0ec1ecd4b639bee0eef1cab0f14', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 08:49:24');
INSERT INTO `sys_log` VALUES ('c3e197940c4a42719bfe69763aaab082', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 10:52:31');
INSERT INTO `sys_log` VALUES ('c55cd1146fbf4d268466f29464427cf1', 'admin', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"56596b28d126495db2c49fa5cf127a07\"],\"pid\":[\"476dbef5152040668acffbdb5683d49d\"],\"code\":[\"0502\"],\"menuName\":[\"员工薪资管理\"],\"url\":[\"hr/salaryManager\"],\"sort\":[\"2\"],\"icon\":[\"fa-file\"]}', '2019-05-24 19:52:25');
INSERT INTO `sys_log` VALUES ('c67d1f31ef0b4f7a9af8d50b16e63d38', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-06 23:04:28');
INSERT INTO `sys_log` VALUES ('c68c42c3013e49808c10d225a2792861', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 23:17:25');
INSERT INTO `sys_log` VALUES ('c747ecdae13743c3aa39cf936893b6be', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-31 07:58:32');
INSERT INTO `sys_log` VALUES ('c85a7b201aab4f90862f5abf111fc993', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-30 23:34:10');
INSERT INTO `sys_log` VALUES ('c8b3423b7f294e1eb6fc425a6c1f4894', 'admin', '删除菜单', '/system/menu/delete', '{\"id\":[\"d9c96546f5c74f87a86c3febed252f4b\"]}', '2019-05-24 19:50:12');
INSERT INTO `sys_log` VALUES ('c8c06b3b11ba4122ae911ad319fdb26b', 'admin', '删除菜单', '/system/menu/delete', '{\"id\":[\"2cf4fc34f42b40ed9325489629689f9a\"]}', '2019-05-24 19:53:12');
INSERT INTO `sys_log` VALUES ('c958e099199b4102ad5f20db32247bcd', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-06 18:47:20');
INSERT INTO `sys_log` VALUES ('ca3467bbd89d4d858dc086943a0c49c1', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-31 18:44:05');
INSERT INTO `sys_log` VALUES ('cc193b8a915d47559eab31f425bc068f', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 11:38:16');
INSERT INTO `sys_log` VALUES ('cc6b41cc9c524ba79ee8201c064d9a37', 'huneng', '用户登录成功', '/login/doLogin', '', '2019-05-24 23:14:37');
INSERT INTO `sys_log` VALUES ('ce99c4655c114d6b94ac1e1ea360a120', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-05 19:01:51');
INSERT INTO `sys_log` VALUES ('cf0c8cbbfaf44cab9a3bd6191b6e3f9e', 'zhanglianzhong', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"ee54fe93fd0b4255a22fefeb2b6de084\"],\"pid\":[\"6bdc1683d3ad44128f1f80bdbf0580e7\"],\"code\":[\"0306\"],\"menuName\":[\"器材库存管理\"],\"url\":[\"property/equipmentManage\"],\"sort\":[\"5\"],\"icon\":[\"fa-file\"]}', '2019-05-25 10:48:57');
INSERT INTO `sys_log` VALUES ('cf1f2dbbe0cb4bd7985a096fdd379133', 'zhanglianzhong', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"ee54fe93fd0b4255a22fefeb2b6de084\"],\"pid\":[\"6bdc1683d3ad44128f1f80bdbf0580e7\"],\"code\":[\"0303\"],\"menuName\":[\"器材管理\"],\"url\":[\"property/equipmentManage\"],\"sort\":[\"3\"],\"icon\":[\"fa-file\"]}', '2019-05-25 08:52:13');
INSERT INTO `sys_log` VALUES ('cfad753c7cd24464af3b06cdbd607caa', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-03 00:01:06');
INSERT INTO `sys_log` VALUES ('d15f0f391c024a64952c95537693ab36', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 21:24:38');
INSERT INTO `sys_log` VALUES ('d1c7bcc1ef5646b6967ee0bb8d1197c5', 'zhanglianzhong', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"3da0154b4b4a4303bfc508f3d7e452db\"],\"pid\":[\"476dbef5152040668acffbdb5683d49d\"],\"code\":[\"0203\"],\"menuName\":[\"薪资查询\"],\"url\":[\"hr/salaryQuery\"],\"sort\":[\"3\"],\"icon\":[\"fa-file\"]}', '2019-05-25 08:51:22');
INSERT INTO `sys_log` VALUES ('d4b7ec6e8d264f18851b8c28154c4710', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-02 19:34:09');
INSERT INTO `sys_log` VALUES ('d5deacb0ae7846058b98ee4aa04ad67d', 'zhanglianzhong', '角色分配权限', '/system/role/doAuth', '{\"roleId\":[\"b1f9ce5543a049be9f169a3f5e6b72a8\"],\"mid[]\":[\"1\",\"2\",\"d2bc30feb5474a1bb7e02d48d39a3f8a\",\"a73802e513cc4465883530ec8074abbb\",\"4253190001c1480fb0d631d64d150535\",\"649b484b58414d91aefa5a26143e6557\",\"3\",\"1db9105008404a3485b6fac30dba3c0e\",\"60dda993d87647f5989c15f14f866df9\",\"686630c7cb624cc786dcdc9958971a6b\",\"b4e7232189b14cf3ba160cf7b0d3bf37\",\"a5ebf29168234406939856bc6890c86b\",\"f899f3d3baec4571b1c786717f9906fd\",\"4\",\"488ef1eff57b4827acade7c0744278ce\",\"3f26102ef0e04c3c9328cb97067cc5fa\",\"dc5f478d98ed4297a8ae638fe90df050\",\"0c9b5fc8b44b41d1871a8fc8300247ec\",\"22e38e885f9b40b9aae6a36deb78e89c\",\"4e816a9854714d24b0413d929d637a2b\",\"3fb6a7a5935b4efabf3de82e7e1baeb6\",\"363a778e78a346a68210b2590163a943\",\"79d78b8357174cac8f44abd275dec597\",\"5\",\"5d3dd56c16ff4e32aecae1b3228159c7\",\"10\",\"0818e1c76bbd44eba3a698547ec4e637\",\"915c309ebe5047b68645b3eb777dd8c9\",\"476dbef5152040668acffbdb5683d49d\",\"c6bfb8c2d70b4b57a7da69b8b20538a4\",\"56596b28d126495db2c49fa5cf127a07\",\"3da0154b4b4a4303bfc508f3d7e452db\",\"d859974ed35542f5be660c52cf292cc1\",\"6bdc1683d3ad44128f1f80bdbf0580e7\",\"08bc9ae261454d43a3d7c59c7e38507c\",\"f3e3b049dd9d4433a5a8dcaf78f38253\",\"ee54fe93fd0b4255a22fefeb2b6de084\"]}', '2019-05-25 09:08:12');
INSERT INTO `sys_log` VALUES ('d6e182d84ebc4e379fa2997b8ce945e0', 'zhanglianzhong', '创建角色', '/system/role/doAdd', '{\"roleName\":[\"普通员工\"],\"roleDesc\":[\"普通在职员工\"],\"roleState\":[\"1\"]}', '2019-05-24 23:12:32');
INSERT INTO `sys_log` VALUES ('d83616a5f9374320b2e6ccb410870a75', 'zhanglianzhong', '角色分配权限', '/system/role/doAuth', '{\"roleId\":[\"b1f9ce5543a049be9f169a3f5e6b72a8\"],\"mid[]\":[\"1\",\"2\",\"d2bc30feb5474a1bb7e02d48d39a3f8a\",\"a73802e513cc4465883530ec8074abbb\",\"4253190001c1480fb0d631d64d150535\",\"649b484b58414d91aefa5a26143e6557\",\"3\",\"1db9105008404a3485b6fac30dba3c0e\",\"60dda993d87647f5989c15f14f866df9\",\"686630c7cb624cc786dcdc9958971a6b\",\"b4e7232189b14cf3ba160cf7b0d3bf37\",\"a5ebf29168234406939856bc6890c86b\",\"f899f3d3baec4571b1c786717f9906fd\",\"4\",\"488ef1eff57b4827acade7c0744278ce\",\"3f26102ef0e04c3c9328cb97067cc5fa\",\"dc5f478d98ed4297a8ae638fe90df050\",\"0c9b5fc8b44b41d1871a8fc8300247ec\",\"22e38e885f9b40b9aae6a36deb78e89c\",\"4e816a9854714d24b0413d929d637a2b\",\"3fb6a7a5935b4efabf3de82e7e1baeb6\",\"363a778e78a346a68210b2590163a943\",\"79d78b8357174cac8f44abd275dec597\",\"5\",\"5d3dd56c16ff4e32aecae1b3228159c7\",\"10\",\"0818e1c76bbd44eba3a698547ec4e637\",\"915c309ebe5047b68645b3eb777dd8c9\",\"476dbef5152040668acffbdb5683d49d\",\"c6bfb8c2d70b4b57a7da69b8b20538a4\",\"56596b28d126495db2c49fa5cf127a07\",\"3da0154b4b4a4303bfc508f3d7e452db\",\"d859974ed35542f5be660c52cf292cc1\",\"6bdc1683d3ad44128f1f80bdbf0580e7\",\"08bc9ae261454d43a3d7c59c7e38507c\",\"f3e3b049dd9d4433a5a8dcaf78f38253\",\"914d6b18bc3f4e8a9085e1bf1763d773\",\"db8cce30609b48e6a4ef376d3a8d5de8\",\"a6bdb68e8afd405ab6574127e662f482\",\"ee54fe93fd0b4255a22fefeb2b6de084\"]}', '2019-05-25 10:52:30');
INSERT INTO `sys_log` VALUES ('d8839858cd004d3792ae3a6990e071a2', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-25 07:23:23');
INSERT INTO `sys_log` VALUES ('db7519e658ed43cba0a8f1374ed5331d', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-30 23:25:09');
INSERT INTO `sys_log` VALUES ('de0d2be8923c48a5963a79b33fec1001', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 11:29:03');
INSERT INTO `sys_log` VALUES ('e005319b25374328b4446860805dc652', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-25 17:32:14');
INSERT INTO `sys_log` VALUES ('e0d359ef21864338af561132a4003988', 'zhanglianzhong', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"ee54fe93fd0b4255a22fefeb2b6de084\"],\"pid\":[\"6bdc1683d3ad44128f1f80bdbf0580e7\"],\"code\":[\"0306\"],\"menuName\":[\"器材库存管理\"],\"url\":[\"property/equipmentManage\"],\"sort\":[\"6\"],\"icon\":[\"fa-file\"]}', '2019-05-25 10:49:03');
INSERT INTO `sys_log` VALUES ('e277e2e50e6c4ac185cce29d6351d7d3', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-02 19:30:08');
INSERT INTO `sys_log` VALUES ('e3df1ba8f3dd43f09839be9e27aa31aa', 'zhanglianzhong', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"c6bfb8c2d70b4b57a7da69b8b20538a4\"],\"pid\":[\"476dbef5152040668acffbdb5683d49d\"],\"code\":[\"0201\"],\"menuName\":[\"每次打卡\"],\"url\":[\"hr/punchClock\"],\"sort\":[\"1\"],\"icon\":[\"fa-file\"]}', '2019-05-25 09:26:47');
INSERT INTO `sys_log` VALUES ('e3f0968596364dee91d5038faf7bb325', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 11:36:40');
INSERT INTO `sys_log` VALUES ('e6d53e455c624270b3c43177f0237e5e', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-25 16:48:11');
INSERT INTO `sys_log` VALUES ('e7a528021e844576bf9309cf891133f1', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 11:32:51');
INSERT INTO `sys_log` VALUES ('e7dd5cea1a734479a53c5be38447ce98', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-31 23:35:04');
INSERT INTO `sys_log` VALUES ('e90bf85f8d894e1b9661949d3b5dcdcd', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-24 22:45:20');
INSERT INTO `sys_log` VALUES ('ea838c0e73fd4f7288be63cd422c8ca3', 'zhanglianzhong', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"56596b28d126495db2c49fa5cf127a07\"],\"pid\":[\"476dbef5152040668acffbdb5683d49d\"],\"code\":[\"0502\"],\"menuName\":[\"薪资管理\"],\"url\":[\"hr/salaryManager\"],\"sort\":[\"2\"],\"icon\":[\"fa-file\"]}', '2019-05-25 08:33:13');
INSERT INTO `sys_log` VALUES ('eb4b8003b0ab4f43970ce091cad804ae', 'admin', '删除菜单', '/system/menu/delete', '{\"id\":[\"b9cd0a3916fb4c969ecb0157e46be1c0\"]}', '2019-05-24 19:53:09');
INSERT INTO `sys_log` VALUES ('ed6383e3e1c6482f86c353a97d90ead9', 'zhanglianzhong', '编辑菜单', '/system/menu/doEdit', '{\"id\":[\"c6bfb8c2d70b4b57a7da69b8b20538a4\"],\"pid\":[\"476dbef5152040668acffbdb5683d49d\"],\"code\":[\"0201\"],\"menuName\":[\"每次打卡\"],\"url\":[\"hr/punchClock\"],\"sort\":[\"1\"],\"icon\":[\"fas fa-pencil-alt\"]}', '2019-05-25 09:25:38');
INSERT INTO `sys_log` VALUES ('f1832f0874834754bb48e31c5f55ce60', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-02 23:51:45');
INSERT INTO `sys_log` VALUES ('f405af621f934498a5bfb6aa39045122', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-25 10:53:57');
INSERT INTO `sys_log` VALUES ('f4d977c2aa784ea69787f444cdc77adc', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 11:05:26');
INSERT INTO `sys_log` VALUES ('f5a4312baf3444fcb9f7429f6a1321b8', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-03 18:34:27');
INSERT INTO `sys_log` VALUES ('f603b2809a84404784693e8f48d6587a', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-06 22:29:00');
INSERT INTO `sys_log` VALUES ('f73e953db5c6438ba1635ae06ce3264c', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-06-07 08:52:20');
INSERT INTO `sys_log` VALUES ('f9e7222a516549c6830e9f044b67e88d', 'zhanglianzhong', '编辑部门', '/system/dept/doEdit', '{\"id\":[\"9a329b597d754c4180c6b40cdfb0f565\"],\"deptName\":[\"XFG1206\"],\"deptDesc\":[\"无线激光侦听小组\"]}', '2019-05-25 11:34:20');
INSERT INTO `sys_log` VALUES ('f9ed0f7258354630bc6736389dfa6e13', 'zhanglianzhong', '用户登录成功', '/login/doLogin', '', '2019-05-30 23:56:27');
INSERT INTO `sys_log` VALUES ('ffbe58fb038d4e99b1bc8abac5ff4f44', 'admin', '用户登录成功', '/login/doLogin', '', '2018-04-15 11:38:37');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `menuName` varchar(50) NOT NULL COMMENT '菜单名称',
  `pid` varchar(50) NOT NULL COMMENT '父级菜单ID',
  `url` varchar(255) DEFAULT NULL COMMENT '连接地址',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `deep` int(11) DEFAULT NULL COMMENT '深度',
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `resource` varchar(50) DEFAULT NULL COMMENT '资源名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES ('0818e1c76bbd44eba3a698547ec4e637', '查询系统设置', '10', NULL, NULL, 0, 3, '010600', 'listSetting');
INSERT INTO `sys_menu` VALUES ('08bc9ae261454d43a3d7c59c7e38507c', '元器件库存信息管理', '6bdc1683d3ad44128f1f80bdbf0580e7', 'property/componentsInfo/list/1', 'fa-file', 1, 2, '0301', 'componentStock');
INSERT INTO `sys_menu` VALUES ('0c9b5fc8b44b41d1871a8fc8300247ec', '删除菜单', '4', NULL, NULL, 4, 3, '010303', 'deleteMenu');
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', NULL, 'fa fa-cogs', 1, 1, '01', NULL);
INSERT INTO `sys_menu` VALUES ('10', '系统配置', '1', '/system/setting/page', ' fa-cog', 6, 2, '0106', 'setting');
INSERT INTO `sys_menu` VALUES ('1db9105008404a3485b6fac30dba3c0e', '查看角色列表', '3', NULL, NULL, 0, 3, '010200', 'listRole');
INSERT INTO `sys_menu` VALUES ('2', '用户管理', '1', '/system/user/list/1', 'fa-user-circle-o', 1, 2, '0101', 'user');
INSERT INTO `sys_menu` VALUES ('22e38e885f9b40b9aae6a36deb78e89c', '部门管理', '1', '/system/dept/list/1', 'fa-graduation-cap', 4, 2, '0104', 'dept');
INSERT INTO `sys_menu` VALUES ('3', '角色管理', '1', '/system/role/list/1', 'fa-users', 2, 2, '0102', 'role');
INSERT INTO `sys_menu` VALUES ('363a778e78a346a68210b2590163a943', '编辑部门', '22e38e885f9b40b9aae6a36deb78e89c', NULL, NULL, 2, 3, '010402', 'editDept');
INSERT INTO `sys_menu` VALUES ('3da0154b4b4a4303bfc508f3d7e452db', '薪资查询', '476dbef5152040668acffbdb5683d49d', 'hr/salaryQuery', 'fa-file', 3, 2, '0203', NULL);
INSERT INTO `sys_menu` VALUES ('3f26102ef0e04c3c9328cb97067cc5fa', '创建菜单', '4', NULL, NULL, 1, 3, '010301', 'addMenu');
INSERT INTO `sys_menu` VALUES ('3fb6a7a5935b4efabf3de82e7e1baeb6', '新增部门', '22e38e885f9b40b9aae6a36deb78e89c', NULL, NULL, 1, 3, '010401', 'addDept');
INSERT INTO `sys_menu` VALUES ('4', '菜单管理', '1', '/system/menu/list/1', 'fa-list', 3, 2, '0103', 'menu');
INSERT INTO `sys_menu` VALUES ('4253190001c1480fb0d631d64d150535', '编辑用户', '2', NULL, NULL, 2, 3, '010102', 'editUser');
INSERT INTO `sys_menu` VALUES ('476dbef5152040668acffbdb5683d49d', '人力资源管理', '0', NULL, 'fas fa-user-circle', 2, 1, '02', NULL);
INSERT INTO `sys_menu` VALUES ('488ef1eff57b4827acade7c0744278ce', '查看菜单列表', '4', NULL, NULL, 0, 3, '010300', 'listMenu');
INSERT INTO `sys_menu` VALUES ('4e816a9854714d24b0413d929d637a2b', '查看部门列表', '22e38e885f9b40b9aae6a36deb78e89c', NULL, NULL, 0, 3, '010400', 'listDept');
INSERT INTO `sys_menu` VALUES ('5', '业务日志', '1', '/system/log/list/1', 'fa-info-circle', 5, 2, '0105', 'log');
INSERT INTO `sys_menu` VALUES ('56596b28d126495db2c49fa5cf127a07', '薪资管理', '476dbef5152040668acffbdb5683d49d', 'hr/salaryManager', 'fa-file', 2, 2, '0202', NULL);
INSERT INTO `sys_menu` VALUES ('57baab71de9a4cad9067d77059d4fd24', '元器件库存信息修改', '08bc9ae261454d43a3d7c59c7e38507c', '/property/componentsInfo/edit', NULL, 2, 3, '030102', 'editComponentStock');
INSERT INTO `sys_menu` VALUES ('5d3dd56c16ff4e32aecae1b3228159c7', '查看日志列表', '5', NULL, NULL, 0, 3, '010500', 'listLog');
INSERT INTO `sys_menu` VALUES ('60dda993d87647f5989c15f14f866df9', '新增角色', '3', NULL, NULL, 1, 3, '010201', 'addRole');
INSERT INTO `sys_menu` VALUES ('649b484b58414d91aefa5a26143e6557', '删除用户', '2', NULL, NULL, 3, 3, '010103', 'deleteUser');
INSERT INTO `sys_menu` VALUES ('686630c7cb624cc786dcdc9958971a6b', '编辑角色', '3', NULL, NULL, 2, 3, '010202', 'editRole');
INSERT INTO `sys_menu` VALUES ('6bdc1683d3ad44128f1f80bdbf0580e7', '资产管理', '0', NULL, 'fa-folder', 6, 1, '03', NULL);
INSERT INTO `sys_menu` VALUES ('79d78b8357174cac8f44abd275dec597', '删除部门', '22e38e885f9b40b9aae6a36deb78e89c', NULL, NULL, 3, 3, '010403', 'deleteDept');
INSERT INTO `sys_menu` VALUES ('914d6b18bc3f4e8a9085e1bf1763d773', '芯片库存信息查询', '6bdc1683d3ad44128f1f80bdbf0580e7', 'property/chipInfo', 'fa-file', 3, 2, '0303', NULL);
INSERT INTO `sys_menu` VALUES ('915c309ebe5047b68645b3eb777dd8c9', '操作系统设置', '10', NULL, NULL, 1, 3, '010601', 'doSetting');
INSERT INTO `sys_menu` VALUES ('a5e4b7260a17450e95a8c7fb0bb58b21', '删除元器件库存信息', '08bc9ae261454d43a3d7c59c7e38507c', '/property/componentsInfo/delete', NULL, 3, 3, '030103', 'delComponentStock');
INSERT INTO `sys_menu` VALUES ('a5ebf29168234406939856bc6890c86b', '角色授权', '3', NULL, NULL, 4, 3, '010204', 'authRole');
INSERT INTO `sys_menu` VALUES ('a6bdb68e8afd405ab6574127e662f482', '出入库日志信息查询', '6bdc1683d3ad44128f1f80bdbf0580e7', 'property/inOutLogQuery', 'fa-file', 5, 2, '0305', NULL);
INSERT INTO `sys_menu` VALUES ('a73802e513cc4465883530ec8074abbb', '新增用户', '2', NULL, NULL, 1, 3, '010101', 'addUser');
INSERT INTO `sys_menu` VALUES ('b1cdd0d5d5664045a7f4b859b5d4c319', '查看当日打卡情况', 'c6bfb8c2d70b4b57a7da69b8b20538a4', NULL, NULL, 0, 3, '020100', 'listPunch');
INSERT INTO `sys_menu` VALUES ('b4e7232189b14cf3ba160cf7b0d3bf37', '删除角色', '3', NULL, NULL, 3, 3, '010203', 'deleteRole');
INSERT INTO `sys_menu` VALUES ('ba115e3b67034045b19d2fd7df0ecbf0', '元器件入库', '08bc9ae261454d43a3d7c59c7e38507c', '/property/componentsInfo/add', NULL, 4, 3, '030104', 'addComponentStock');
INSERT INTO `sys_menu` VALUES ('c6bfb8c2d70b4b57a7da69b8b20538a4', '每次打卡', '476dbef5152040668acffbdb5683d49d', 'hr/punchClock', 'fa-file', 1, 2, '0201', 'punch');
INSERT INTO `sys_menu` VALUES ('d2bc30feb5474a1bb7e02d48d39a3f8a', '查看用户列表', '2', NULL, NULL, 0, 3, '010100', 'listUser');
INSERT INTO `sys_menu` VALUES ('d4495ac5e64549d1bf61eebe02a073ba', '查询元器件库存', '08bc9ae261454d43a3d7c59c7e38507c', '/property/componentsInfo/list', NULL, 1, 3, '030101', 'queryComponentStock');
INSERT INTO `sys_menu` VALUES ('d859974ed35542f5be660c52cf292cc1', '通讯录', '476dbef5152040668acffbdb5683d49d', 'hr/addressBook', 'fas fa-address-book', 4, 2, '0204', NULL);
INSERT INTO `sys_menu` VALUES ('db8cce30609b48e6a4ef376d3a8d5de8', '芯片入库出库', '6bdc1683d3ad44128f1f80bdbf0580e7', 'property/chipInOut', 'fa-file', 4, 2, '0304', NULL);
INSERT INTO `sys_menu` VALUES ('dc5f478d98ed4297a8ae638fe90df050', '编辑菜单', '4', NULL, NULL, 3, 3, '010302', 'editMenu');
INSERT INTO `sys_menu` VALUES ('ee54fe93fd0b4255a22fefeb2b6de084', '器材库存管理', '6bdc1683d3ad44128f1f80bdbf0580e7', 'property/equipmentManage', 'fa-file', 6, 2, '0306', NULL);
INSERT INTO `sys_menu` VALUES ('f899f3d3baec4571b1c786717f9906fd', '批量删除角色', '3', NULL, NULL, 5, 3, '010205', 'deleteBatchRole');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `roleName` varchar(50) NOT NULL COMMENT '角色名称',
  `roleDesc` varchar(300) DEFAULT NULL COMMENT '角色描述',
  `roleState` int(2) DEFAULT '1' COMMENT '状态,1-启用,-1禁用',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES ('6a2994e4788a44f0973b5ca6ac4b6d73', '运营人员', '', 1, '2018-04-12 18:41:40');
INSERT INTO `sys_role` VALUES ('99a54025db684cfd8d0f7049f105a262', '普通员工', '普通在职员工', 1, '2019-05-24 23:12:32');
INSERT INTO `sys_role` VALUES ('b1f9ce5543a049be9f169a3f5e6b72a8', '超级管理员', '超级管理员', 1, '2017-09-14 15:02:16');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `roleId` varchar(50) NOT NULL COMMENT '角色主键',
  `menuId` varchar(50) NOT NULL COMMENT '菜单主键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES ('0313e49e3f934de28afeaef33fa2a06d', 'b1f9ce5543a049be9f169a3f5e6b72a8', '0818e1c76bbd44eba3a698547ec4e637');
INSERT INTO `sys_role_menu` VALUES ('05cb469da0ba41e5b1ca4e7c622511ee', 'b1f9ce5543a049be9f169a3f5e6b72a8', 'b4e7232189b14cf3ba160cf7b0d3bf37');
INSERT INTO `sys_role_menu` VALUES ('0926764809864a978ed8911b4f230892', 'b1f9ce5543a049be9f169a3f5e6b72a8', '3da0154b4b4a4303bfc508f3d7e452db');
INSERT INTO `sys_role_menu` VALUES ('0eda43317d864584af1a5eecba2615f8', '99a54025db684cfd8d0f7049f105a262', '3da0154b4b4a4303bfc508f3d7e452db');
INSERT INTO `sys_role_menu` VALUES ('100fcfda24904160b93f61b1107750c1', '99a54025db684cfd8d0f7049f105a262', 'b1cdd0d5d5664045a7f4b859b5d4c319');
INSERT INTO `sys_role_menu` VALUES ('2367123fe5d84a1f9d3b720594b9798e', 'b1f9ce5543a049be9f169a3f5e6b72a8', '476dbef5152040668acffbdb5683d49d');
INSERT INTO `sys_role_menu` VALUES ('33222002906f49479f16c3f61149a177', 'b1f9ce5543a049be9f169a3f5e6b72a8', '4253190001c1480fb0d631d64d150535');
INSERT INTO `sys_role_menu` VALUES ('35909e71fda343a5a0b0a9bb23575cf6', 'b1f9ce5543a049be9f169a3f5e6b72a8', '22e38e885f9b40b9aae6a36deb78e89c');
INSERT INTO `sys_role_menu` VALUES ('3cdff8360b5a43b99013e91025bb0500', 'b1f9ce5543a049be9f169a3f5e6b72a8', '914d6b18bc3f4e8a9085e1bf1763d773');
INSERT INTO `sys_role_menu` VALUES ('40efa98afcc0456cb45bf2fb13a2d4ce', 'b1f9ce5543a049be9f169a3f5e6b72a8', '488ef1eff57b4827acade7c0744278ce');
INSERT INTO `sys_role_menu` VALUES ('4571a12dba2d4874a77ac6b4646de459', 'b1f9ce5543a049be9f169a3f5e6b72a8', 'a5e4b7260a17450e95a8c7fb0bb58b21');
INSERT INTO `sys_role_menu` VALUES ('47a397040cfc46f1908a871b0bcfa586', 'b1f9ce5543a049be9f169a3f5e6b72a8', '3f26102ef0e04c3c9328cb97067cc5fa');
INSERT INTO `sys_role_menu` VALUES ('4b865465d4aa4834b9e3eb225a5df6f6', 'b1f9ce5543a049be9f169a3f5e6b72a8', 'd4495ac5e64549d1bf61eebe02a073ba');
INSERT INTO `sys_role_menu` VALUES ('4e6565147f4f47f7a7ccf3deb54336b6', 'b1f9ce5543a049be9f169a3f5e6b72a8', 'ba115e3b67034045b19d2fd7df0ecbf0');
INSERT INTO `sys_role_menu` VALUES ('50fc4b5cee0c49fc8525152496c11147', 'b1f9ce5543a049be9f169a3f5e6b72a8', '4');
INSERT INTO `sys_role_menu` VALUES ('52c4dddc26d54138bd909014864a9d58', '99a54025db684cfd8d0f7049f105a262', 'cd00a5dc137445ccbbe963dcbd1e0015');
INSERT INTO `sys_role_menu` VALUES ('57779a5b40bd40b995c447f0a6e0a06b', '6a2994e4788a44f0973b5ca6ac4b6d73', '08bc9ae261454d43a3d7c59c7e38507c');
INSERT INTO `sys_role_menu` VALUES ('5dc5112fb7534884a72ba5ed3b7765c5', '6a2994e4788a44f0973b5ca6ac4b6d73', '3da0154b4b4a4303bfc508f3d7e452db');
INSERT INTO `sys_role_menu` VALUES ('699efbd93e6b41648110b701c9b7164d', 'b1f9ce5543a049be9f169a3f5e6b72a8', '5');
INSERT INTO `sys_role_menu` VALUES ('702575f7c98349b9bf0d558d12a37fb1', 'b1f9ce5543a049be9f169a3f5e6b72a8', '08bc9ae261454d43a3d7c59c7e38507c');
INSERT INTO `sys_role_menu` VALUES ('74914c7a11ca4ef29847586f27b6c3ac', '6a2994e4788a44f0973b5ca6ac4b6d73', 'c6bfb8c2d70b4b57a7da69b8b20538a4');
INSERT INTO `sys_role_menu` VALUES ('79b2539f000946d0bd1c4c6b832da0f0', 'b1f9ce5543a049be9f169a3f5e6b72a8', '10');
INSERT INTO `sys_role_menu` VALUES ('8022322cda1248c69ad44c2b008b29d9', 'b1f9ce5543a049be9f169a3f5e6b72a8', '649b484b58414d91aefa5a26143e6557');
INSERT INTO `sys_role_menu` VALUES ('83ccba60f29d44c79739dbdaa6d4177b', 'b1f9ce5543a049be9f169a3f5e6b72a8', 'a5ebf29168234406939856bc6890c86b');
INSERT INTO `sys_role_menu` VALUES ('83df20ed7c8e453ab8a29fc522311ab4', 'b1f9ce5543a049be9f169a3f5e6b72a8', '2');
INSERT INTO `sys_role_menu` VALUES ('8c6e917c832d4ec986bf04bcc9597ddc', '6a2994e4788a44f0973b5ca6ac4b6d73', 'ee54fe93fd0b4255a22fefeb2b6de084');
INSERT INTO `sys_role_menu` VALUES ('8fe8ee0d96124636b549e8909bf961d9', 'b1f9ce5543a049be9f169a3f5e6b72a8', '57baab71de9a4cad9067d77059d4fd24');
INSERT INTO `sys_role_menu` VALUES ('9136c604461143a0bc740c1cc5f6471d', 'b1f9ce5543a049be9f169a3f5e6b72a8', 'c6bfb8c2d70b4b57a7da69b8b20538a4');
INSERT INTO `sys_role_menu` VALUES ('9488ac8b152346af93e2c2ea997865f1', '99a54025db684cfd8d0f7049f105a262', 'c6bfb8c2d70b4b57a7da69b8b20538a4');
INSERT INTO `sys_role_menu` VALUES ('97405dd411ea4bd8a0c51f28d82b6832', 'b1f9ce5543a049be9f169a3f5e6b72a8', '4e816a9854714d24b0413d929d637a2b');
INSERT INTO `sys_role_menu` VALUES ('98f5f53ef29a4f3ea4d618146f1bd2ba', 'b1f9ce5543a049be9f169a3f5e6b72a8', '0c9b5fc8b44b41d1871a8fc8300247ec');
INSERT INTO `sys_role_menu` VALUES ('a2902ebf93864380afa099dc285e114e', '6a2994e4788a44f0973b5ca6ac4b6d73', '476dbef5152040668acffbdb5683d49d');
INSERT INTO `sys_role_menu` VALUES ('ab3ee3d3ae3948c791c7204c91f6d53a', 'b1f9ce5543a049be9f169a3f5e6b72a8', '60dda993d87647f5989c15f14f866df9');
INSERT INTO `sys_role_menu` VALUES ('abf3662162ca4899892b7e1976a1be5e', 'b1f9ce5543a049be9f169a3f5e6b72a8', '915c309ebe5047b68645b3eb777dd8c9');
INSERT INTO `sys_role_menu` VALUES ('acbc534eb26a46808bd2466a5050ff5f', 'b1f9ce5543a049be9f169a3f5e6b72a8', 'd2bc30feb5474a1bb7e02d48d39a3f8a');
INSERT INTO `sys_role_menu` VALUES ('adfa885d19064e2d958c785694114f29', 'b1f9ce5543a049be9f169a3f5e6b72a8', 'd859974ed35542f5be660c52cf292cc1');
INSERT INTO `sys_role_menu` VALUES ('af1ac01b32c745c78bd76be55320885c', '6a2994e4788a44f0973b5ca6ac4b6d73', '6bdc1683d3ad44128f1f80bdbf0580e7');
INSERT INTO `sys_role_menu` VALUES ('b0b011308eec4ac8b4439b592c96af86', 'b1f9ce5543a049be9f169a3f5e6b72a8', '6bdc1683d3ad44128f1f80bdbf0580e7');
INSERT INTO `sys_role_menu` VALUES ('b428c376eb874f498d10d0fe5206594a', '6a2994e4788a44f0973b5ca6ac4b6d73', 'f3e3b049dd9d4433a5a8dcaf78f38253');
INSERT INTO `sys_role_menu` VALUES ('b9f3bfd7bb7646f0a7569f9ffc6ca8c8', 'b1f9ce5543a049be9f169a3f5e6b72a8', '5d3dd56c16ff4e32aecae1b3228159c7');
INSERT INTO `sys_role_menu` VALUES ('bd1d207dd3e7477d9a1e24d232816f5a', 'b1f9ce5543a049be9f169a3f5e6b72a8', '3');
INSERT INTO `sys_role_menu` VALUES ('bfaa54fe577641afb5dd44951a7be165', 'b1f9ce5543a049be9f169a3f5e6b72a8', '1');
INSERT INTO `sys_role_menu` VALUES ('c29dee391aae415b90b5f709ef86f6f3', 'b1f9ce5543a049be9f169a3f5e6b72a8', '56596b28d126495db2c49fa5cf127a07');
INSERT INTO `sys_role_menu` VALUES ('c3f22c187b0646ac974caf677fc3e51a', 'b1f9ce5543a049be9f169a3f5e6b72a8', '363a778e78a346a68210b2590163a943');
INSERT INTO `sys_role_menu` VALUES ('c9c2321cdf194c258a9b210a182d9e3b', 'b1f9ce5543a049be9f169a3f5e6b72a8', '686630c7cb624cc786dcdc9958971a6b');
INSERT INTO `sys_role_menu` VALUES ('ca524eb2072d4971ba39edb0aa5cea60', 'b1f9ce5543a049be9f169a3f5e6b72a8', '3fb6a7a5935b4efabf3de82e7e1baeb6');
INSERT INTO `sys_role_menu` VALUES ('d01fd2bf68fb4d38a5d5b4160267c10f', 'b1f9ce5543a049be9f169a3f5e6b72a8', 'f899f3d3baec4571b1c786717f9906fd');
INSERT INTO `sys_role_menu` VALUES ('d46e82e549674dd8ace014447cde2c4c', '6a2994e4788a44f0973b5ca6ac4b6d73', 'd9c96546f5c74f87a86c3febed252f4b');
INSERT INTO `sys_role_menu` VALUES ('dc85fcc20bd642239e01e0396452d451', 'b1f9ce5543a049be9f169a3f5e6b72a8', 'a73802e513cc4465883530ec8074abbb');
INSERT INTO `sys_role_menu` VALUES ('dd8b2fb1bcfa4d0680a04c51fdae2fdf', 'b1f9ce5543a049be9f169a3f5e6b72a8', '1db9105008404a3485b6fac30dba3c0e');
INSERT INTO `sys_role_menu` VALUES ('dfa59dc79d6b42f19a3765bc1387696b', 'b1f9ce5543a049be9f169a3f5e6b72a8', 'dc5f478d98ed4297a8ae638fe90df050');
INSERT INTO `sys_role_menu` VALUES ('e755e72d34504724a54e1af9ff5f782b', '99a54025db684cfd8d0f7049f105a262', '476dbef5152040668acffbdb5683d49d');
INSERT INTO `sys_role_menu` VALUES ('e86a05b156904d75ae794d3b4638fa92', 'b1f9ce5543a049be9f169a3f5e6b72a8', '79d78b8357174cac8f44abd275dec597');
COMMIT;

-- ----------------------------
-- Table structure for sys_setting
-- ----------------------------
DROP TABLE IF EXISTS `sys_setting`;
CREATE TABLE `sys_setting` (
  `Id` varchar(50) NOT NULL COMMENT '主键',
  `sysKey` varchar(50) NOT NULL COMMENT 'KEY',
  `sysName` varchar(50) NOT NULL COMMENT '名称',
  `sysValue` varchar(300) DEFAULT NULL COMMENT '值',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `sysDesc` varchar(300) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统设置表';

-- ----------------------------
-- Records of sys_setting
-- ----------------------------
BEGIN;
INSERT INTO `sys_setting` VALUES ('1', 'systemName', '系统名称', 'XFGGroup-Admin', 0, NULL);
INSERT INTO `sys_setting` VALUES ('2', 'systemSubName', '系统简称', 'XFG教研室后台管理系统V1.0', 1, NULL);
INSERT INTO `sys_setting` VALUES ('3', 'bottomCopyright', '许可说明', 'Copyright © 2019 连重科技有限公司. All rights reserved.', 2, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `userName` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `userState` int(2) NOT NULL DEFAULT '1' COMMENT '用户状态,1-启用,-1禁用',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `userDesc` varchar(300) DEFAULT NULL COMMENT '描述',
  `userImg` varchar(300) DEFAULT 'http://news.mydrivers.com/Img/20110518/04481549.png' COMMENT '头像',
  `deptId` varchar(50) DEFAULT NULL COMMENT '部门主键',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_unique_index` (`userName`(5)) USING BTREE COMMENT '用户名唯一索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES ('4761f036e604451eb408d793ad8821c5', '廖茂可', '18bf76373d3f0abe20b2e947f14df4f8', 1, '2019-05-24 23:14:23', '教研室2015博士', 'http://news.mydrivers.com/Img/20110518/04481549.png', 'a54cc109fcbb44839827d4024d6d01a8');
INSERT INTO `sys_user` VALUES ('c79ba431f9f74dfbae585b87b0cde933', 'admin', '038bdaf98f2037b31f1e75b5b4c9b26e', 1, '2017-09-14 15:02:17', '', '/upload/2018-04-15/lldmpzm6djga9rdu5nuljj856tow5wjv.png', '9a329b597d754c4180c6b40cdfb0f565');
INSERT INTO `sys_user` VALUES ('da1c6c7e985e465cb022963dc0063991', 'zhanglianzhong', '637915a403b43d101a9343a395434937', 1, '2019-05-24 19:54:51', 'xfg1206组长', 'http://news.mydrivers.com/Img/20110518/04481549.png', '9a329b597d754c4180c6b40cdfb0f565');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `Id` varchar(50) NOT NULL COMMENT '主键',
  `userId` varchar(50) NOT NULL COMMENT '用户主键',
  `roleId` varchar(50) NOT NULL COMMENT '角色主键',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES ('04a2728059994dd880f03cfd3604ebf3', '4761f036e604451eb408d793ad8821c5', '99a54025db684cfd8d0f7049f105a262');
INSERT INTO `sys_user_role` VALUES ('a397e220d80b45bdaa6cc4f5f621d804', 'da1c6c7e985e465cb022963dc0063991', 'b1f9ce5543a049be9f169a3f5e6b72a8');
INSERT INTO `sys_user_role` VALUES ('b63941907fd046fab09ce0930489bbe2', 'c79ba431f9f74dfbae585b87b0cde933', 'b1f9ce5543a049be9f169a3f5e6b72a8');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
