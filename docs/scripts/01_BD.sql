
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `libros` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `libros` ;

-- -----------------------------------------------------
-- Table `libros`.`bitacora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libros`.`bitacora` (
  `bitacoracod` INT NOT NULL AUTO_INCREMENT,
  `bitacorafch` DATETIME NULL DEFAULT NULL,
  `bitprograma` VARCHAR(255) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `bitdescripcion` VARCHAR(255) NULL DEFAULT NULL,
  `bitobservacion` MEDIUMTEXT NULL DEFAULT NULL,
  `bitTipo` CHAR(3) NULL DEFAULT NULL,
  `bitusuario` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`bitacoracod`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `libros`.`librosinventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libros`.`librosinventario` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Titulo` VARCHAR(45) NULL DEFAULT NULL,
  `Contenido` VARCHAR(4000) NULL DEFAULT NULL,
  `Fecha` DATE NULL DEFAULT NULL,
  `Autor` VARCHAR(45) NULL DEFAULT NULL,
  `Imagen` LONGBLOB NULL DEFAULT NULL,
  `Genero` VARCHAR(45) NULL DEFAULT NULL,
  `Idioma` VARCHAR(45) NULL DEFAULT NULL,
  `Precio` DOUBLE NULL DEFAULT NULL,
  `Popularidad` INT NULL DEFAULT '0',
  `PublicidadEspecial` ENUM('ACT', 'NOACT') NULL DEFAULT 'NOACT',
  `Imagen2` LONGBLOB NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 41
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `libros`.`carrito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libros`.`carrito` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Libro` INT NOT NULL,
  `Usuario` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `FK_Libros_idx` (`Libro` ASC) VISIBLE,
  CONSTRAINT `FK_Libros`
    FOREIGN KEY (`Libro`)
    REFERENCES `libros`.`librosinventario` (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `libros`.`funciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libros`.`funciones` (
  `fncod` VARCHAR(255) NOT NULL,
  `fndsc` VARCHAR(45) NULL DEFAULT NULL,
  `fnest` CHAR(3) NULL DEFAULT NULL,
  `fntyp` CHAR(3) NULL DEFAULT NULL,
  PRIMARY KEY (`fncod`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `libros`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libros`.`roles` (
  `rolescod` VARCHAR(15) NOT NULL,
  `rolesdsc` VARCHAR(45) NULL DEFAULT NULL,
  `rolesest` CHAR(3) NULL DEFAULT NULL,
  PRIMARY KEY (`rolescod`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `libros`.`funciones_roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libros`.`funciones_roles` (
  `rolescod` VARCHAR(15) NOT NULL,
  `fncod` VARCHAR(255) NOT NULL,
  `fnrolest` CHAR(3) NULL DEFAULT NULL,
  `fnexp` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`rolescod`, `fncod`),
  INDEX `rol_funcion_key_idx` (`fncod` ASC) VISIBLE,
  CONSTRAINT `funcion_rol_key`
    FOREIGN KEY (`rolescod`)
    REFERENCES `libros`.`roles` (`rolescod`),
  CONSTRAINT `rol_funcion_key`
    FOREIGN KEY (`fncod`)
    REFERENCES `libros`.`funciones` (`fncod`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `libros`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libros`.`usuario` (
  `usercod` BIGINT NOT NULL AUTO_INCREMENT,
  `useremail` VARCHAR(80) NULL DEFAULT NULL,
  `username` VARCHAR(80) NULL DEFAULT NULL,
  `userpswd` VARCHAR(128) NULL DEFAULT NULL,
  `userfching` DATETIME NULL DEFAULT NULL,
  `userpswdest` CHAR(3) NULL DEFAULT NULL,
  `userpswdexp` DATETIME NULL DEFAULT NULL,
  `userest` CHAR(3) NULL DEFAULT NULL,
  `useractcod` VARCHAR(128) NULL DEFAULT NULL,
  `userpswdchg` VARCHAR(128) NULL DEFAULT NULL,
  `usertipo` CHAR(3) NULL DEFAULT NULL COMMENT 'Tipo de Usuario, Normal, Consultor o Cliente',
  PRIMARY KEY (`usercod`),
  UNIQUE INDEX `useremail_UNIQUE` (`useremail` ASC) VISIBLE,
  INDEX `usertipo` (`usertipo` ASC, `useremail` ASC, `usercod` ASC, `userest` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `libros`.`mislibros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libros`.`mislibros` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `IdLibro` INT NULL DEFAULT NULL,
  `IdUsuario` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  INDEX `FK_Libro_idx` (`IdLibro` ASC) VISIBLE,
  INDEX `FK_Usuario_idx` (`IdUsuario` ASC) VISIBLE,
  CONSTRAINT `FK_Libro`
    FOREIGN KEY (`IdLibro`)
    REFERENCES `libros`.`librosinventario` (`ID`),
  CONSTRAINT `FK_Usuario`
    FOREIGN KEY (`IdUsuario`)
    REFERENCES `libros`.`usuario` (`usercod`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `libros`.`roles_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libros`.`roles_usuarios` (
  `usercod` BIGINT NOT NULL,
  `rolescod` VARCHAR(15) NOT NULL,
  `roleuserest` CHAR(3) NULL DEFAULT NULL,
  `roleuserfch` DATETIME NULL DEFAULT NULL,
  `roleuserexp` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`usercod`, `rolescod`),
  INDEX `rol_usuario_key_idx` (`rolescod` ASC) VISIBLE,
  CONSTRAINT `rol_usuario_key`
    FOREIGN KEY (`rolescod`)
    REFERENCES `libros`.`roles` (`rolescod`),
  CONSTRAINT `usuario_rol_key`
    FOREIGN KEY (`usercod`)
    REFERENCES `libros`.`usuario` (`usercod`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
