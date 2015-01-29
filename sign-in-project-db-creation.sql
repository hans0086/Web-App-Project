CREATE database gaming;
USE gaming;
CREATE TABLE gaming.users (username VARCHAR(50) PRIMARY KEY, userpass VARCHAR(50) NOT NULL, userFirstName VARCHAR(100) NOT NULL, userLastName VARCHAR(100) NOT NULL, userAddress VARCHAR(500) NOT NULL, userCountry VARCHAR(100) NOT NULL, userCity VARCHAR(100) NOT NULL, userPostalCode VARCHAR(20) NOT NULL, userEmail VARCHAR(100) NOT NULL, userPhone VARCHAR(50) NOT NULL, userIsAdmin VARCHAR(3) DEFAULT 'no' NOT NULL);
