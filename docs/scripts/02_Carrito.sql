CREATE TABLE IF NOT EXISTS `libros`.`carrito` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Libro` INT NOT NULL,
  `Usuario` INT NOT NULL,
  `Sesion` VARCHAR(128) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  INDEX `FK_Libros_idx` (`Libro` ASC) VISIBLE,
  CONSTRAINT `FK_Libros`
    FOREIGN KEY (`Libro`)
    REFERENCES `libros`.`librosinventario` (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8mb4