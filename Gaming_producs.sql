use gaming;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(100) NOT NULL,
  `productSystem` varchar(50) NOT NULL,
  `productInventory` int(11) DEFAULT NULL,
  `productPrice` float DEFAULT NULL,
  PRIMARY KEY (`id`)
);
