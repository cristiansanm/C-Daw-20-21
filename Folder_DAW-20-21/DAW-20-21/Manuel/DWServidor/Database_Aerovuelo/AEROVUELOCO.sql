-- MySQL Script generated by MySQL Workbench
-- lun 30 nov 2020 03:44:59 CET
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema AEROVUELO
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema AEROVUELO
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `AEROVUELO` ;
USE `AEROVUELO` ;

-- -----------------------------------------------------
-- Table `AEROVUELO`.`AVIONES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AEROVUELO`.`AVIONES` (
  `idAVIONES` VARCHAR(40) NOT NULL,
  `A_TIPO` VARCHAR(45) NOT NULL,
  `A_DISPONIBLE` TINYINT(1) NOT NULL,
  `A_idBASES` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`idAVIONES`),
  INDEX `fk_AVIONES_BASES_idx` (`A_idBASES` ASC) VISIBLE,
  CONSTRAINT `fk_AVIONES_BASES`
    FOREIGN KEY (`A_idBASES`)
    REFERENCES `AEROVUELO`.`BASES` (`idBASES`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AEROVUELO`.`BASES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AEROVUELO`.`BASES` (
  `idBASES` VARCHAR(40) NOT NULL,
  `B_NOMBRE` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idBASES`),
  UNIQUE INDEX `idBASES_UNIQUE` (`idBASES` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AEROVUELO`.`MIEMBROS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AEROVUELO`.`MIEMBROS` (
  `idMIEMBRO` VARCHAR(45) NOT NULL,
  `idPERSONAL_fk` INT NOT NULL,
  `idPILOTO` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idMIEMBRO`, `idPERSONAL_fk`),
  UNIQUE INDEX `idMIEMBROS_UNIQUE` (`idPERSONAL_fk` ASC) VISIBLE,
  CONSTRAINT `fk_MIEMBROS_PERSONAL1`
    FOREIGN KEY (`idPERSONAL_fk`)
    REFERENCES `AEROVUELO`.`PERSONAL` (`idPERSONAL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AEROVUELO`.`PERSONAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AEROVUELO`.`PERSONAL` (
  `idPERSONAL` INT NOT NULL AUTO_INCREMENT,
  `P_NOMBRE` VARCHAR(45) NOT NULL,
  `P_APELLIDO` VARCHAR(45) NOT NULL,
  `P_idBASES` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`idPERSONAL`),
  UNIQUE INDEX `idPERSONAL_UNIQUE` (`idPERSONAL` ASC) VISIBLE,
  INDEX `fk_PERSONAL_BASES1_idx` (`P_idBASES` ASC) VISIBLE,
  CONSTRAINT `fk_PERSONAL_BASES1`
    FOREIGN KEY (`P_idBASES`)
    REFERENCES `AEROVUELO`.`BASES` (`idBASES`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AEROVUELO`.`PERSONAL_EN_AVION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AEROVUELO`.`PERSONAL_EN_AVION` (
  `VUELOS_idVUELOS` VARCHAR(40) NOT NULL,
  `PERSONAL_idPERSONAL` INT NOT NULL,
  `FECHA_VUELO` DATE NOT NULL,
  PRIMARY KEY (`VUELOS_idVUELOS`, `PERSONAL_idPERSONAL`),
  INDEX `fk_PERSONAL_EN_AVION_PERSONAL1_idx` (`PERSONAL_idPERSONAL` ASC) VISIBLE,
  CONSTRAINT `fk_PERSONAL_EN_AVION_VUELOS1`
    FOREIGN KEY (`VUELOS_idVUELOS`)
    REFERENCES `AEROVUELO`.`VUELOS` (`idVUELOS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PERSONAL_EN_AVION_PERSONAL1`
    FOREIGN KEY (`PERSONAL_idPERSONAL`)
    REFERENCES `AEROVUELO`.`PERSONAL` (`idPERSONAL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AEROVUELO`.`PILOTOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AEROVUELO`.`PILOTOS` (
  `idPILOTO` VARCHAR(45) NOT NULL,
  `idPERSONAL_fk` INT NOT NULL,
  `HORAS_VOLADAS` INT NOT NULL,
  PRIMARY KEY (`idPILOTO`, `idPERSONAL_fk`),
  CONSTRAINT `fk_PILOTOS_PERSONAL1`
    FOREIGN KEY (`idPERSONAL_fk`)
    REFERENCES `AEROVUELO`.`PERSONAL` (`idPERSONAL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AEROVUELO`.`VUELOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AEROVUELO`.`VUELOS` (
  `idVUELOS` VARCHAR(40) NOT NULL,
  `V_ORIGEN` VARCHAR(45) NOT NULL,
  `V_DESTINO` VARCHAR(45) NOT NULL,
  `V_HORA_PARTIDA` TIME NOT NULL,
  `V_idAVIONES` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`idVUELOS`),
  UNIQUE INDEX `idVUELOS_UNIQUE` (`idVUELOS` ASC) VISIBLE,
  INDEX `fk_VUELOS_AVIONES1_idx` (`V_idAVIONES` ASC) VISIBLE,
  CONSTRAINT `fk_VUELOS_AVIONES1`
    FOREIGN KEY (`V_idAVIONES`)
    REFERENCES `AEROVUELO`.`AVIONES` (`idAVIONES`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
