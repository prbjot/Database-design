-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Pizza_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Pizza_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Pizza_db` DEFAULT CHARACTER SET utf8 ;
USE `Pizza_db` ;

-- -----------------------------------------------------
-- Table `Pizza_db`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizza_db`.`customer` (
  `idcustomer` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idcustomer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizza_db`.`purchase_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizza_db`.`purchase_info` (
  `idpurchase` INT NOT NULL AUTO_INCREMENT,
  `price` DECIMAL(5,2) NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `date` DATE NOT NULL,
  `customer_idcustomer` INT NOT NULL,
  PRIMARY KEY (`idpurchase`, `customer_idcustomer`),
  CONSTRAINT `fk_purchase_info_customer`
    FOREIGN KEY (`customer_idcustomer`)
    REFERENCES `Pizza_db`.`customer` (`idcustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizza_db`.`pizza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizza_db`.`pizza` (
  `idpizza` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `price` DECIMAL(5,2) NOT NULL,
  `quantity` INT NOT NULL,
  `purchase_info_idpurchase` INT NOT NULL,
  `purchase_info_customer_idcustomer` INT NOT NULL,
  PRIMARY KEY (`idpizza`),
  CONSTRAINT `fk_pizza_purchase_info1`
    FOREIGN KEY (`purchase_info_idpurchase` , `purchase_info_customer_idcustomer`)
    REFERENCES `Pizza_db`.`purchase_info` (`idpurchase` , `customer_idcustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizza_db`.`sides`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizza_db`.`sides` (
  `idsides` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `price` DECIMAL(5,2) NOT NULL,
  `quantity` INT NOT NULL,
  `purchase_info_idpurchase` INT NOT NULL,
  `purchase_info_customer_idcustomer` INT NOT NULL,
  PRIMARY KEY (`idsides`),
  CONSTRAINT `fk_sides_purchase_info1`
    FOREIGN KEY (`purchase_info_idpurchase` , `purchase_info_customer_idcustomer`)
    REFERENCES `Pizza_db`.`purchase_info` (`idpurchase` , `customer_idcustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizza_db`.`toppings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizza_db`.`toppings` (
  `idtoppings` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `price` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`idtoppings`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizza_db`.`pizza_has_toppings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pizza_db`.`pizza_has_toppings` (
  `pizza_idpizza` INT NOT NULL,
  `toppings_idtoppings` INT NOT NULL,
  PRIMARY KEY (`pizza_idpizza`, `toppings_idtoppings`),
  CONSTRAINT `fk_pizza_has_toppings_pizza1`
    FOREIGN KEY (`pizza_idpizza`)
    REFERENCES `Pizza_db`.`pizza` (`idpizza`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pizza_has_toppings_toppings1`
    FOREIGN KEY (`toppings_idtoppings`)
    REFERENCES `Pizza_db`.`toppings` (`idtoppings`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
