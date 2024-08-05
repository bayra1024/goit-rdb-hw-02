-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Clients` (
  `idClients` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idClients`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Orders` (
  `idOrders` INT NOT NULL AUTO_INCREMENT,
  `Orders_Dates` DATE NOT NULL,
  `Clients_id` INT NOT NULL,
  PRIMARY KEY (`idOrders`),
  INDEX `pk_clients_id_idx` (`Clients_id` ASC) VISIBLE,
  CONSTRAINT `pk_clients_id`
    FOREIGN KEY (`Clients_id`)
    REFERENCES `mydb`.`Clients` (`idClients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Products` (
  `idProducts` INT NOT NULL AUTO_INCREMENT,
  `Products_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProducts`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orders_Details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Orders_Details` (
  `idOrders_Details` INT NOT NULL AUTO_INCREMENT,
  `Orders_id` INT NOT NULL,
  `Products_id` INT NOT NULL,
  `Quantity` INT NOT NULL,
  PRIMARY KEY (`idOrders_Details`),
  INDEX `pk_orders_id_idx` (`Orders_id` ASC) VISIBLE,
  INDEX `pk_product_id_idx` (`Products_id` ASC) VISIBLE,
  CONSTRAINT `pk_orders_id`
    FOREIGN KEY (`Orders_id`)
    REFERENCES `mydb`.`Orders` (`idOrders`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `pk_product_id`
    FOREIGN KEY (`Products_id`)
    REFERENCES `mydb`.`Products` (`idProducts`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
