CREATE TABLE `libros`.`usuario` (
  `usercod` bigint(10) NOT NULL AUTO_INCREMENT,
  `useremail` varchar(80) DEFAULT NULL,
  `username` varchar(80) DEFAULT NULL,
  `userpswd` varchar(128) DEFAULT NULL,
  `userfching` datetime DEFAULT NULL,
  `userpswdest` char(3) DEFAULT NULL,
  `userpswdexp` datetime DEFAULT NULL,
  `userest` char(3) DEFAULT NULL,
  `useractcod` varchar(128) DEFAULT NULL,
  `userpswdchg` varchar(128) DEFAULT NULL,
  `usertipo` char(3) DEFAULT NULL COMMENT 'Tipo de Usuario, Normal, Consultor o Cliente',
  PRIMARY KEY (`usercod`),
  UNIQUE KEY `useremail_UNIQUE` (`useremail`),
  KEY `usertipo` (`usertipo`,`useremail`,`usercod`,`userest`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `libros`.`roles` (
  `rolescod` VARCHAR(15) NOT NULL,
  `rolesdsc` VARCHAR(45) NULL DEFAULT NULL,
  `rolesest` CHAR(3) NULL DEFAULT NULL,
  PRIMARY KEY (`rolescod`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `libros`.`roles_usuarios` (
  `usercod` BIGINT NOT NULL,
  `rolescod` VARCHAR(15) NOT NULL,
  `roleuserest` CHAR(3) NULL DEFAULT 'ACT',
  `roleuserfch` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `roleuserexp` DATETIME NULL DEFAULT '2025-05-15 00:00:00',
  PRIMARY KEY (`usercod`, `rolescod`),
  INDEX `rol_usuario_key_idx` (`rolescod` ASC) VISIBLE,
  CONSTRAINT `rol_usuario_key`
    FOREIGN KEY (`rolescod`)
    REFERENCES `libros`.`roles` (`rolescod`),
  CONSTRAINT `usuario_rol_key`
    FOREIGN KEY (`usercod`)
    REFERENCES `libros`.`usuario` (`usercod`))
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `libros`.`funciones` (
  `fncod` VARCHAR(255) NOT NULL,
  `fndsc` VARCHAR(45) NULL DEFAULT NULL,
  `fnest` CHAR(3) NULL DEFAULT NULL,
  `fntyp` CHAR(3) NULL DEFAULT NULL,
  PRIMARY KEY (`fncod`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


CREATE TABLE IF NOT EXISTS `libros`.`funciones_roles` (
  `rolescod` VARCHAR(15) NOT NULL,
  `fncod` VARCHAR(255) NOT NULL,
  `fnrolest` CHAR(3) NULL DEFAULT 'ACT',
  `fnexp` DATETIME NULL DEFAULT '2030-10-10 00:00:00',
  PRIMARY KEY (`rolescod`, `fncod`),
  INDEX `rol_funcion_key_idx` (`fncod` ASC) VISIBLE,
  CONSTRAINT `funcion_rol_key`
    FOREIGN KEY (`rolescod`)
    REFERENCES `libros`.`roles` (`rolescod`),
  CONSTRAINT `rol_funcion_key`
    FOREIGN KEY (`fncod`)
    REFERENCES `libros`.`funciones` (`fncod`))
ENGINE = InnoDB