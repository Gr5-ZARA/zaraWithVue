-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema zara
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema zara
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `zara` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `zara` ;

-- -----------------------------------------------------
-- Table `zara`.`help`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zara`.`help` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `question` VARCHAR(255) NOT NULL,
  `answer` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `zara`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zara`.`users` (
  `userid` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL,
  `userlastname` VARCHAR(255) NOT NULL,
  `useremail` VARCHAR(255) NOT NULL,
  `userpw` VARCHAR(255) NOT NULL,
  `isAdmin` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`userid`),
  UNIQUE INDEX `uniq_useremail` (`useremail` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `zara`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zara`.`orders` (
  `orderid` INT NOT NULL AUTO_INCREMENT,
  `orderdate` INT NOT NULL,
  `userid` INT NOT NULL,
  PRIMARY KEY (`orderid`),
  UNIQUE INDEX `uniq_userid` (`userid` ASC) VISIBLE,
  CONSTRAINT `fk_orders_user`
    FOREIGN KEY (`userid`)
    REFERENCES `zara`.`users` (`userid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `zara`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zara`.`products` (
  `productid` INT NOT NULL AUTO_INCREMENT,
  `productname` VARCHAR(255) NOT NULL,
  `productprice` INT NOT NULL,
  `productquantity` INT NOT NULL,
  `productcolor` VARCHAR(255) NOT NULL,
  `productcategory` VARCHAR(255) NOT NULL,
  `productsub-category` VARCHAR(255) NOT NULL,
  `productsub-sub-category` VARCHAR(255) NOT NULL,
  `productimage` VARCHAR(400) NOT NULL,
  `orderid` INT NOT NULL,
  PRIMARY KEY (`productid`),
  INDEX `orderid` (`orderid` ASC) VISIBLE,
  CONSTRAINT `fk_products_user`
    FOREIGN KEY (`orderid`)
    REFERENCES `zara`.`orders` (`orderid`))
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



INSERT INTO `help` (`question`, `answer`)
VALUES
  ('What is the return policy?', 'Our return policy allows you to return items within 30 days of purchase. Please make sure the items are in their original condition.'),
  ('How can I track my order?', 'You can track your order by logging into your account on our website and navigating to the "Order History" section.'),
  ('What payment methods do you accept?', 'We accept credit cards (Visa, Mastercard, American Express) and PayPal.'),
  ('Do you offer international shipping?', 'Yes, we offer international shipping to select countries. Please check our website for the list of countries.'),
  ('How can I contact customer support?', 'You can contact our customer support team by emailing isleem.azouuz@gmail.com or calling our toll-free number.');

INSERT INTO `users` (`username`, `userlastname`, `useremail`, `userpw`,`isAdmin`) 
VALUES 
  ('tarek', 'issaoui', 'tarek@gmail.com', 'password123',1),
  ('islem', 'azouz', 'islem@gmail.com', 'password456',1);

  -- Inserting orders
INSERT INTO `orders` (`orderdate`, `userid`) 
VALUES 
  (UNIX_TIMESTAMP(), 3),
  (UNIX_TIMESTAMP(), 4);

INSERT INTO `products` (`productname`, `productprice`, `productquantity`, `productcolor`, `productcategory`, `productsub-category`, `productsub-sub-category`, `productimage`, `orderid`) 
VALUES 
  ('SHAWL LAPEL BLAZER', 299, 10, 'BLACK', 'Woman', 'BLAZER', 'OVERSIZE', 'https://static.zara.net/photos///2023/V/0/1/p/2761/240/800/15/w/730/2761240800_2_1_1.jpg?ts=1672608969680', 5),
  ('TRF WIDE-LEG MID-RISE EXTRA-LONG JEANS',149,9,'LIGHT BLUE','Woman','JEANS','Wide-leg','https://static.zara.net/photos///2023/V/0/1/p/6688/029/406/13/w/430/6688029406_1_1_1.jpg?ts=1679502261590',5),
  ('RIBBED STRAPPY VEST TOP', 36, 14, 'STRIPED', 'Woman', 'T-SHIRT', 'RIBBED', 'https://static.zara.net/photos///2023/V/0/1/p/3253/306/104/2/w/730/3253306104_1_1_1.jpg?ts=1677146757733', 6),
  ('SHIMMERY MINI CITY BAG',129, 2,'SILVER','Woman','BAGS','FANCY','https://static.zara.net/photos///2023/V/1/1/p/6281/010/909/2/w/282/6281010909_15_3_1.jpg?ts=1678116161646',5),
  ('TRANSPARENT HIGH-HEEL SANDALS',159, 4,'LIGHT BEIGE','Woman','SHOES','High-heel sandals','https://static.zara.net/photos///2022/I/1/1/p/2324/910/111/2/w/282/2324910111_2_1_1.jpg?ts=1656408025933',5),  
  ('BASIC HOODIE', 129, 6, 'BLACK', 'Men', 'BASICS', 'HOODIE', 'https://static.zara.net/photos///2023/V/0/2/p/0761/300/800/2/w/129/0761300800_15_3_1.jpg?ts=1681827749797', 6),
  ('TEXTURED CROCHET SHIRT', 179, 15, 'LIME', 'Men','SHIRTS', 'CROCHET', 'https://static.zara.net/photos///2023/V/0/1/p/1300/413/520/2/w/164/1300413520_2_1_1.jpg?ts=1684251771534', 5),
  ('SLIM FIT SUIT', 359, 3, 'BLACK', 'Men','SUITS', 'SLIM SUITING', 'https://static.zara.net/photos///2023/V/M/2/p/0000/000/802/2/w/302/0000000802_15_1_1.jpg?ts=1680610347677', 5),
  ('TIE-DYE CARGO TROUSERS', 199, 7, 'CAMEL', 'Men','CARGO', 'TIE-DYE', 'https://static.zara.net/photos///2023/V/0/2/p/2553/431/707/2/w/164/2553431707_1_1_1.jpg?ts=1675340206311', 5),
  ('TEXTURED DRESS WITH PASSEMENTERIE AND RUFFLES', 90, 4, 'WHITE', 'Kid','SUMMER CAMP','NEW' , 'https://static.zara.net/photos///2023/V/0/3/p/6462/604/250/104/w/329/6462604250_15_1_1.jpg?ts=1683532819623', 6),
  ('SMOCKED PRINTED JUMPSUIT', 119, 10, 'BROWN', 'Kid','GIRL', 'JUMPSUIT','https://static.zara.net/photos///2023/V/0/3/p/0340/600/700/2/w/213/0340600700_6_1_1.jpg?ts=1682669258355', 5),
  ('DENIM CARGO BERMUDA SHORTS', 90, 6, 'ECRU', 'Kid','BOY','SHORTS', 'https://static.zara.net/photos///2023/V/0/3/p/4110/688/712/303/w/282/4110688712_15_1_1.jpg?ts=1681898488065', 6),
  ('FLORAL EMBROIDERED TULLE DRESS', 119, 2, 'BEIGE-PINK', 'Kid','BABY-GIRL','DRESSES', 'https://static.zara.net/photos///2023/V/0/3/p/1148/359/942/202/w/282/1148359942_1_1_1.jpg?ts=1677231020820', 6),
  ('TEXTURED LEAF PRINT JUMPSUIT', 70, 9, 'ECRU', 'Kid','BABY-BOY','DUNGAREES', 'https://static.zara.net/photos///2023/V/0/3/p/6061/802/712/402/w/329/6061802712_1_1_1.jpg?ts=1683211845587', 5),
  ('CULT SATIN', 60, 12, '122 SHOWTIME', 'Beauty','LIP','VIEW ALL', 'https://static.zara.net/photos///2021/V/2/1/p/4130/306/122/2/w/209/4130306122_6_1_1.jpg?ts=1619772366760', 6),
  ('PERFECTING NAIL VARNISH', 30, 3, '4400', 'Beauty','NAIL POLISH','NIAL POLISH', 'https://static.zara.net/photos///2022/I/2/1/p/4400/451/154/2/w/323/4400451154_6_1_1.jpg?ts=1654256307396', 6);
