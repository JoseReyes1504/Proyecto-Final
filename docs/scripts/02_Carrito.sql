CREATE TABLE `libros`.`carrito` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Libro` INT NOT NULL,
  `Total` DOUBLE NULL,
  `Usuario` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `FK_Libros_idx` (`Libro` ASC) VISIBLE,
  CONSTRAINT `FK_Libros`
    FOREIGN KEY (`Libro`)
    REFERENCES `libros`.`librosinventario` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
