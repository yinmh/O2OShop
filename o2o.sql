DROP TABLE IF EXISTS `tb_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_area` (
  `area_id` int(2) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(200) NOT NULL,
  `priority` int(2) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`area_id`),
  UNIQUE KEY `UK_AREA` (`area_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_area`
--

LOCK TABLES `tb_area` WRITE;
/*!40000 ALTER TABLE `tb_area` DISABLE KEYS */;
INSERT INTO `tb_area` VALUES (2,'东苑',1,NULL,NULL),(3,'西苑',2,NULL,NULL);
/*!40000 ALTER TABLE `tb_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_head_line`
--

DROP TABLE IF EXISTS `tb_head_line`;
CREATE TABLE `tb_head_line` (
  `line_id` int(100) NOT NULL AUTO_INCREMENT,
  `line_name` varchar(1000) DEFAULT NULL,
  `line_link` varchar(2000) NOT NULL,
  `line_img` varchar(2000) NOT NULL,
  `priority` int(2) DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`line_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_head_line`
--

LOCK TABLES `tb_head_line` WRITE;
/*!40000 ALTER TABLE `tb_head_line` DISABLE KEYS */;
INSERT INTO `tb_head_line` VALUES (11,'1','http://115.28.159.6/myo2o/frontend/shopdetail?shopId=20','/upload/images/item/headtitle/2017061320315746624.jpg',1,1,'2017-06-13 20:31:57','2017-06-13 20:31:57'),(12,'2','http://115.28.159.6/myo2o/frontend/shopdetail?shopId=20','/upload/images/item/headtitle/2017061320371786788.jpg',2,1,'2017-06-13 20:37:17','2017-06-13 20:37:17'),(14,'3','http://115.28.159.6/myo2o/frontend/shopdetail?shopId=20','/upload/images/item/headtitle/2017061320393452772.jpg',3,1,'2017-06-13 20:39:34','2017-06-13 20:39:34'),(15,'4','http://115.28.159.6/myo2o/frontend/shopdetail?shopId=20','/upload/images/item/headtitle/2017061320400198256.jpg',4,1,'2017-06-13 20:40:01','2017-06-13 20:40:01');
/*!40000 ALTER TABLE `tb_head_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_local_auth`
--

DROP TABLE IF EXISTS `tb_local_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_local_auth` (
  `local_auth_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`local_auth_id`),
  UNIQUE KEY `uk_local_profile` (`username`),
  KEY `fk_localauth_profile` (`user_id`),
  CONSTRAINT `fk_localauth_profile` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_local_auth`
--

LOCK TABLES `tb_local_auth` WRITE;
/*!40000 ALTER TABLE `tb_local_auth` DISABLE KEYS */;
INSERT INTO `tb_local_auth` VALUES (13,1,'testbind','59s99bs556bb255by262e26s206e52bs','2017-10-16 03:52:54','2017-10-16 04:22:06');
/*!40000 ALTER TABLE `tb_local_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_person_info`
--

DROP TABLE IF EXISTS `tb_person_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_person_info` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `profile_img` varchar(1024) DEFAULT NULL,
  `email` varchar(1024) DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT '0' COMMENT '0:禁止使用本商城，1:允许使用本商城',
  `user_type` int(2) NOT NULL DEFAULT '1' COMMENT '1:顾客，2:店家，3:超级管理员',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_person_info`
--

LOCK TABLES `tb_person_info` WRITE;
/*!40000 ALTER TABLE `tb_person_info` DISABLE KEYS */;
INSERT INTO `tb_person_info` VALUES (1,'测试','test','test','1',1,2,NULL,NULL),(8,'李翔','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmNzyG67YKicCIOXYUKHEC32ZJANTfoaRGVB1MvkW8KagcYfDOic9IicZO5Gibp5QBsLC3p2tLq22quQ/0',NULL,'1',1,1,'2017-10-11 04:28:41',NULL);
/*!40000 ALTER TABLE `tb_person_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product`
--

DROP TABLE IF EXISTS `tb_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product` (
  `product_id` int(100) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `product_desc` varchar(2000) DEFAULT NULL,
  `img_addr` varchar(2000) DEFAULT '',
  `normal_price` varchar(100) DEFAULT NULL,
  `promotion_price` varchar(100) DEFAULT NULL,
  `priority` int(2) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT '0',
  `product_category_id` int(11) DEFAULT NULL,
  `shop_id` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`),
  KEY `fk_product_procate` (`product_category_id`),
  KEY `fk_product_shop` (`shop_id`),
  CONSTRAINT `fk_product_procate` FOREIGN KEY (`product_category_id`) REFERENCES `tb_product_category` (`product_category_id`),
  CONSTRAINT `fk_product_shop` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product`
--

LOCK TABLES `tb_product` WRITE;
/*!40000 ALTER TABLE `tb_product` DISABLE KEYS */;
INSERT INTO `tb_product` VALUES (1,'大黄人','我是大黄人','upload/images/item/shop/29/2017092601204036435.jpg','2','1',100,'2017-09-26 01:20:40','2017-09-26 01:20:40',1,3,29),(2,'小黄人','我是小黄人','upload/images/item/shop/29/2017092601212211185.jpg','3','2',90,'2017-09-26 01:21:22','2017-09-26 01:21:22',1,2,29),(3,'暴漫人','开心了','upload/images/item/shop/29/2017092601220059819.jpg','3','2',80,'2017-09-26 01:22:00','2017-09-26 01:22:00',1,3,29),(4,'宇宙第一','宇宙无敌','upload/images/item/shop/29/2017092601224389939.jpg','5','2',70,'2017-09-26 01:22:43','2017-09-26 01:22:43',1,3,29),(5,'眼凸凸','宇宙无敌','upload/images/item/shop/29/2017092601231570458.jpg','3','2',60,'2017-09-26 01:23:15','2017-09-26 01:23:15',1,3,29),(6,'笑眯眯','笑眯眯 甜蜜蜜','upload/images/item/shop/29/2017092601234922140.jpg','2','2',50,'2017-09-26 01:23:49','2017-09-26 01:23:49',1,3,29),(7,'优质小黄人奶茶','非常好喝哦','/upload/images/item/shop/28/2017100216554368403.jpg','6','3',100,'2017-10-02 16:55:43','2017-10-02 16:55:43',1,4,28),(8,'优质暴漫奶茶','非常好喝哦','/upload/images/item/shop/28/2017100216561443475.jpg','6','3',100,'2017-10-02 16:56:14','2017-10-02 16:56:14',1,4,28),(9,'优质大白奶茶','非常好喝哦','/upload/images/item/shop/28/2017100216564398563.jpg','6','3',90,'2017-10-02 16:56:43','2017-10-02 16:56:43',1,4,28),(10,'优质二维码奶茶','非常好喝哦','/upload/images/item/shop/28/2017100216570762900.jpg','5','3',80,'2017-10-02 16:57:07','2017-10-02 16:57:07',1,4,28),(11,'优质二维码咖啡','非常好喝哦','/upload/images/item/shop/28/2017100216573090557.jpg','8','3',60,'2017-10-02 16:57:30','2017-10-02 16:57:30',1,6,28),(12,'优质大白咖啡','非常好喝哦','/upload/images/item/shop/28/2017100216575922088.jpg','8','3',50,'2017-10-02 16:57:59','2017-10-02 16:57:59',1,6,28);
/*!40000 ALTER TABLE `tb_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product_category`
--

DROP TABLE IF EXISTS `tb_product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product_category` (
  `product_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_category_name` varchar(100) NOT NULL,
  `priority` int(2) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `shop_id` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_category_id`),
  KEY `fk_procate_shop` (`shop_id`),
  CONSTRAINT `fk_procate_shop` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_category`
--

LOCK TABLES `tb_product_category` WRITE;
/*!40000 ALTER TABLE `tb_product_category` DISABLE KEYS */;
INSERT INTO `tb_product_category` VALUES (1,'眼镜类',1,NULL,29),(2,'无镜类',2,NULL,29),(3,'开心类',3,NULL,29),(4,'优质奶茶',6,NULL,28),(5,'劣质奶茶',3,NULL,28),(6,'优质咖啡',5,NULL,28),(7,'劣质咖啡',2,NULL,28),(8,'甜品小吃',4,NULL,28),(9,'苦品凉茶',4,NULL,28);
/*!40000 ALTER TABLE `tb_product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product_img`
--

DROP TABLE IF EXISTS `tb_product_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product_img` (
  `product_img_id` int(20) NOT NULL AUTO_INCREMENT,
  `img_addr` varchar(2000) NOT NULL,
  `img_desc` varchar(2000) DEFAULT NULL,
  `priority` int(2) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `product_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`product_img_id`),
  KEY `fk_proimg_product` (`product_id`),
  CONSTRAINT `fk_proimg_product` FOREIGN KEY (`product_id`) REFERENCES `tb_product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_img`
--

LOCK TABLES `tb_product_img` WRITE;
/*!40000 ALTER TABLE `tb_product_img` DISABLE KEYS */;
INSERT INTO `tb_product_img` VALUES (1,'upload/images/item/shop/29/2017092601204025128.jpg',NULL,NULL,'2017-09-26 01:20:40',1),(2,'upload/images/item/shop/29/2017092601204051262.jpg',NULL,NULL,'2017-09-26 01:20:40',1),(3,'upload/images/item/shop/29/2017092601212217105.jpg',NULL,NULL,'2017-09-26 01:21:22',2),(4,'upload/images/item/shop/29/2017092601212268219.jpg',NULL,NULL,'2017-09-26 01:21:22',2),(5,'upload/images/item/shop/29/2017092601220074062.jpg',NULL,NULL,'2017-09-26 01:22:00',3),(6,'upload/images/item/shop/29/2017092601220019993.jpg',NULL,NULL,'2017-09-26 01:22:00',3),(7,'upload/images/item/shop/29/2017092601224322685.jpg',NULL,NULL,'2017-09-26 01:22:43',4),(8,'upload/images/item/shop/29/2017092601224353777.jpg',NULL,NULL,'2017-09-26 01:22:43',4),(9,'upload/images/item/shop/29/2017092601231572675.jpg',NULL,NULL,'2017-09-26 01:23:15',5),(10,'upload/images/item/shop/29/2017092601231516853.jpg',NULL,NULL,'2017-09-26 01:23:15',5),(11,'upload/images/item/shop/29/2017092601234987131.jpg',NULL,NULL,'2017-09-26 01:23:49',6),(12,'upload/images/item/shop/29/2017092601234984991.jpg',NULL,NULL,'2017-09-26 01:23:49',6),(13,'/upload/images/item/shop/28/2017100216554379623.jpg',NULL,NULL,'2017-10-02 16:55:43',7),(14,'/upload/images/item/shop/28/2017100216554382464.jpg',NULL,NULL,'2017-10-02 16:55:43',7),(15,'/upload/images/item/shop/28/2017100216554324232.jpg',NULL,NULL,'2017-10-02 16:55:43',7),(16,'/upload/images/item/shop/28/2017100216561440352.jpg',NULL,NULL,'2017-10-02 16:56:14',8),(17,'/upload/images/item/shop/28/2017100216561435083.jpg',NULL,NULL,'2017-10-02 16:56:14',8),(18,'/upload/images/item/shop/28/2017100216561472866.jpg',NULL,NULL,'2017-10-02 16:56:14',8),(19,'/upload/images/item/shop/28/2017100216564440981.jpg',NULL,NULL,'2017-10-02 16:56:44',9),(20,'/upload/images/item/shop/28/2017100216564491563.jpg',NULL,NULL,'2017-10-02 16:56:44',9),(21,'/upload/images/item/shop/28/2017100216564437552.jpg',NULL,NULL,'2017-10-02 16:56:44',9),(22,'/upload/images/item/shop/28/2017100216570748189.jpg',NULL,NULL,'2017-10-02 16:57:07',10),(23,'/upload/images/item/shop/28/2017100216570710458.jpg',NULL,NULL,'2017-10-02 16:57:07',10),(24,'/upload/images/item/shop/28/2017100216570779065.jpg',NULL,NULL,'2017-10-02 16:57:07',10),(25,'/upload/images/item/shop/28/2017100216573094393.jpg',NULL,NULL,'2017-10-02 16:57:30',11),(26,'/upload/images/item/shop/28/2017100216573050300.jpg',NULL,NULL,'2017-10-02 16:57:30',11),(27,'/upload/images/item/shop/28/2017100216573037951.jpg',NULL,NULL,'2017-10-02 16:57:30',11),(28,'/upload/images/item/shop/28/2017100216580055004.jpg',NULL,NULL,'2017-10-02 16:58:00',12),(29,'/upload/images/item/shop/28/2017100216580081030.jpg',NULL,NULL,'2017-10-02 16:58:00',12),(30,'/upload/images/item/shop/28/2017100216580022626.jpg',NULL,NULL,'2017-10-02 16:58:00',12);
/*!40000 ALTER TABLE `tb_product_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_shop`
--

DROP TABLE IF EXISTS `tb_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_shop` (
  `shop_id` int(10) NOT NULL AUTO_INCREMENT,
  `owner_id` int(10) NOT NULL COMMENT '店铺创建人',
  `area_id` int(5) DEFAULT NULL,
  `shop_category_id` int(11) DEFAULT NULL,
  `shop_name` varchar(256) NOT NULL,
  `shop_desc` varchar(1024) DEFAULT NULL,
  `shop_addr` varchar(200) DEFAULT NULL,
  `phone` varchar(128) DEFAULT NULL,
  `shop_img` varchar(1024) DEFAULT NULL,
  `priority` int(3) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT '0',
  `advice` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`shop_id`),
  KEY `fk_shop_area` (`area_id`),
  KEY `fk_shop_profile` (`owner_id`),
  KEY `fk_shop_shopcate` (`shop_category_id`),
  CONSTRAINT `fk_shop_area` FOREIGN KEY (`area_id`) REFERENCES `tb_area` (`area_id`),
  CONSTRAINT `fk_shop_profile` FOREIGN KEY (`owner_id`) REFERENCES `tb_person_info` (`user_id`),
  CONSTRAINT `fk_shop_shopcate` FOREIGN KEY (`shop_category_id`) REFERENCES `tb_shop_category` (`shop_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_shop`
--

LOCK TABLES `tb_shop` WRITE;
/*!40000 ALTER TABLE `tb_shop` DISABLE KEYS */;
INSERT INTO `tb_shop` VALUES (1,1,3,14,'正式店铺名称','测试描述','正式地址','13810524086','/upload/item/shop/1/2017091621545314507.jpg',10,'2017-08-03 00:08:32','2017-09-16 21:54:53',0,'审核中'),(28,1,2,22,'小黄人主题奶茶店','不接受预订，请直接来店里进行消费','位于东苑2号','13810524086','/upload/images/item/shop/28/2017092601041469991.png',50,'2017-09-26 01:04:13','2017-09-26 01:04:13',1,NULL),(29,1,3,22,'暴漫奶茶店','过来喝喝就知道啦，你是我的奶茶','西苑1号','1211334565','/upload/images/item/shop/29/2017092601054939287.jpg',40,'2017-09-26 01:05:49','2017-09-26 01:05:49',1,NULL),(30,1,2,20,'彪哥大排档','敢说不好吃吗','东苑1号','13628763625','/upload/images/item/shop/30/2017092601063878278.jpg',30,'2017-09-26 01:06:37','2017-09-26 01:06:37',1,NULL),(31,1,2,20,'威哥大排档','干掉彪哥大排档','东苑南路','126554437261','/upload/images/item/shop/31/2017092601072177572.jpg',20,'2017-09-26 01:07:21','2017-09-26 01:07:21',1,NULL),(32,1,2,22,'你是我的奶茶','奶茶店再次来袭','东苑六路','13652384615','/upload/images/item/shop/32/2017092601081463136.jpg',10,'2017-09-26 01:08:13','2017-09-26 01:08:13',1,NULL),(35,8,2,22,'奶茶来了','奶茶来了','西苑7路',NULL,NULL,0,NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `tb_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_shop_category`
--

DROP TABLE IF EXISTS `tb_shop_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_shop_category` (
  `shop_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_category_name` varchar(100) NOT NULL DEFAULT '',
  `shop_category_desc` varchar(1000) DEFAULT '',
  `shop_category_img` varchar(2000) DEFAULT NULL,
  `priority` int(2) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`shop_category_id`),
  KEY `fk_shop_category_self` (`parent_id`),
  CONSTRAINT `fk_shop_category_self` FOREIGN KEY (`parent_id`) REFERENCES `tb_shop_category` (`shop_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_shop_category`
--

LOCK TABLES `tb_shop_category` WRITE;
/*!40000 ALTER TABLE `tb_shop_category` DISABLE KEYS */;
INSERT INTO `tb_shop_category` VALUES (10,'二手市场','二手商品交易','/upload/images/item/shopcategory/2017061223272255687.png',100,'2017-06-04 20:10:58','2017-06-12 23:27:22',NULL),(11,'美容美发','美容美发','/upload/images/item/shopcategory/2017061223273314635.png',99,'2017-06-04 20:12:57','2017-06-12 23:27:33',NULL),(12,'美食饮品','美食饮品','/upload/images/item/shopcategory/2017061223274213433.png',98,'2017-06-04 20:15:21','2017-06-12 23:27:42',NULL),(13,'休闲娱乐','休闲娱乐','/upload/images/item/shopcategory/2017061223275121460.png',97,'2017-06-04 20:19:29','2017-06-12 23:27:51',NULL),(14,'旧车','旧车','/upload/images/item/shopcategory/2017060420315183203.png',80,'2017-06-04 20:31:51','2017-06-04 20:31:51',10),(15,'二手书籍','二手书籍','/upload/images/item/shopcategory/2017060420322333745.png',79,'2017-06-04 20:32:23','2017-06-04 20:32:23',10),(17,'护理','护理','/upload/images/item/shopcategory/2017060420372391702.png',76,'2017-06-04 20:37:23','2017-06-04 20:37:23',11),(18,'理发','理发','/upload/images/item/shopcategory/2017060420374775350.png',74,'2017-06-04 20:37:47','2017-06-04 20:37:47',11),(20,'大排档','大排档','/upload/images/item/shopcategory/2017060420460491494.png',59,'2017-06-04 20:46:04','2017-06-04 20:46:04',12),(22,'奶茶店','奶茶店','/upload/images/item/shopcategory/2017060420464594520.png',58,'2017-06-04 20:46:45','2017-06-04 20:46:45',12),(24,'密室逃生','密室逃生','/upload/images/item/shopcategory/2017060420500783376.png',56,'2017-06-04 20:50:07','2017-06-04 21:45:53',13),(25,'KTV','KTV','/upload/images/item/shopcategory/2017060420505834244.png',57,'2017-06-04 20:50:58','2017-06-04 20:51:14',13),(27,'培训教育','培训教育','/upload/images/item/shopcategory/2017061223280082147.png',96,'2017-06-04 21:51:36','2017-06-12 23:28:00',NULL),(28,'租赁市场','租赁市场','/upload/images/item/shopcategory/2017061223281361578.png',95,'2017-06-04 21:53:52','2017-06-12 23:28:13',NULL),(29,'程序设计','程序设计','/upload/images/item/shopcategory/2017060421593496807.png',50,'2017-06-04 21:59:34','2017-06-04 21:59:34',27),(30,'声乐舞蹈','声乐舞蹈','/upload/images/item/shopcategory/2017060421595843693.png',49,'2017-06-04 21:59:58','2017-06-04 21:59:58',27),(31,'演出道具','演出道具','/upload/images/item/shopcategory/2017060422114076152.png',45,'2017-06-04 22:11:40','2017-06-04 22:11:40',28),(32,'交通工具','交通工具','/upload/images/item/shopcategory/2017060422121144586.png',44,'2017-06-04 22:12:11','2017-06-04 22:12:11',28),(33,'test1','',NULL,0,NULL,NULL,12),(34,'test2','',NULL,0,NULL,NULL,12),(35,'test3','',NULL,0,NULL,NULL,12);
/*!40000 ALTER TABLE `tb_shop_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_wechat_auth`
--

DROP TABLE IF EXISTS `tb_wechat_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_wechat_auth` (
  `wechat_auth_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `open_id` varchar(80) NOT NULL DEFAULT '',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`wechat_auth_id`),
  UNIQUE KEY `open_id` (`open_id`),
  KEY `fk_wechatauth_profile` (`user_id`),
  CONSTRAINT `fk_wechatauth_profile` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_wechat_auth`
--

LOCK TABLES `tb_wechat_auth` WRITE;
/*!40000 ALTER TABLE `tb_wechat_auth` DISABLE KEYS */;
INSERT INTO `tb_wechat_auth` VALUES (6,8,'ovLbns-gxJHqC-UTPQKvgEuENl-E','2017-10-11 04:28:41');
/*!40000 ALTER TABLE `tb_wechat_auth` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-16 22:22:01
