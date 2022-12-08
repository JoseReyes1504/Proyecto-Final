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

CREATE TABLE IF NOT EXISTS `libros`.`mislibros` (
  `ID` INT NOT NULL,
  `IdLibro` INT NULL DEFAULT NULL,
  `IdUsuario` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `FK_Libro_idx` (`IdLibro` ASC) VISIBLE,
  INDEX `FK_Usuario_idx` (`IdUsuario` ASC) VISIBLE,
  CONSTRAINT `FK_Libro`
    FOREIGN KEY (`IdLibro`)
    REFERENCES `libros`.`librosinventario` (`ID`),
  CONSTRAINT `FK_Usuario`
    FOREIGN KEY (`IdUsuario`)
    REFERENCES `libros`.`usuario` (`usercod`))
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `libros`.`transacciones` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Libro` INT NULL DEFAULT NULL,
  `Usuario` BIGINT NULL DEFAULT NULL,
  `Fecha` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  INDEX `FK_Usuario_idx` (`Usuario` ASC) VISIBLE,
  INDEX `FK_Libro_idx` (`Libro` ASC) VISIBLE,
  CONSTRAINT `LF_Libros`
    FOREIGN KEY (`Libro`)
    REFERENCES `libros`.`librosinventario` (`ID`),
  CONSTRAINT `LF_Usuarios`
    FOREIGN KEY (`Usuario`)
    REFERENCES `libros`.`usuario` (`usercod`))
ENGINE = InnoDB


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