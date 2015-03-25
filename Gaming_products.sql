CREATE TABLE gaming.products (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(100) NOT NULL,
  `productSystem` varchar(50) NOT NULL,
  `productInventory` int(11) DEFAULT NULL,
  `productPrice` float DEFAULT NULL,
  `productDesc` varchar(500) DEFAULT NULL,
  `productPic` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;