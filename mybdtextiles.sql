-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema textilesgs
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema textilesgs
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `textilesgs` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `textilesgs` ;

-- -----------------------------------------------------
-- Table `textilesgs`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `textilesgs`.`proveedor` (
  `idproveedor` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idproveedor`))
ENGINE = InnoDB
AUTO_INCREMENT = 44
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `textilesgs`.`cuentaxproveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `textilesgs`.`cuentaxproveedor` (
  `idcuenta` INT(11) NOT NULL AUTO_INCREMENT,
  `idproveedor` INT(11) NULL DEFAULT NULL,
  `total` FLOAT NULL DEFAULT NULL,
  `totalabono` FLOAT NULL DEFAULT NULL,
  `saldo` FLOAT NULL DEFAULT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `estado` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`idcuenta`),
  INDEX `fk_proveedor` (`idproveedor` ASC) VISIBLE,
  CONSTRAINT `fk_proveedor`
    FOREIGN KEY (`idproveedor`)
    REFERENCES `textilesgs`.`proveedor` (`idproveedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `textilesgs`.`abono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `textilesgs`.`abono` (
  `idabono` INT(11) NOT NULL AUTO_INCREMENT,
  `idcuenta` INT(11) NULL DEFAULT NULL,
  `cantidad` FLOAT NULL DEFAULT NULL,
  `tipopago` VARCHAR(25) NULL DEFAULT NULL,
  `comprobante` VARCHAR(40) NULL DEFAULT NULL,
  `fecha_abono` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`idabono`),
  INDEX `fk_abono` (`idcuenta` ASC) VISIBLE,
  CONSTRAINT `fk_abono`
    FOREIGN KEY (`idcuenta`)
    REFERENCES `textilesgs`.`cuentaxproveedor` (`idcuenta`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `textilesgs`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `textilesgs`.`cliente` (
  `idcliente` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(60) NULL DEFAULT NULL,
  `apellido` VARCHAR(75) NULL DEFAULT NULL,
  `direccion` VARCHAR(100) NULL DEFAULT NULL,
  `telefono` INT(11) NULL DEFAULT NULL,
  `correo` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idcliente`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `textilesgs`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `textilesgs`.`empleado` (
  `idempleado` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(60) NULL DEFAULT NULL,
  `apellido` VARCHAR(75) NULL DEFAULT NULL,
  `dpi` VARCHAR(15) NULL DEFAULT NULL,
  `telefono` INT(11) NULL DEFAULT NULL,
  `correo` VARCHAR(100) NULL DEFAULT NULL,
  `estado` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`idempleado`))
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `textilesgs`.`factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `textilesgs`.`factura` (
  `idfactura` INT(11) NOT NULL AUTO_INCREMENT,
  `idcliente` INT(11) NULL DEFAULT NULL,
  `idempleado` INT(11) NULL DEFAULT NULL,
  `fecha` DATETIME NULL DEFAULT NULL,
  `total` FLOAT NULL DEFAULT NULL,
  `estado` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`idfactura`),
  INDEX `fk_idcliente` (`idcliente` ASC) VISIBLE,
  INDEX `fk_idempleado` (`idempleado` ASC) VISIBLE,
  CONSTRAINT `fk_idcliente`
    FOREIGN KEY (`idcliente`)
    REFERENCES `textilesgs`.`cliente` (`idcliente`),
  CONSTRAINT `fk_idempleado`
    FOREIGN KEY (`idempleado`)
    REFERENCES `textilesgs`.`empleado` (`idempleado`))
ENGINE = InnoDB
AUTO_INCREMENT = 27
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `textilesgs`.`despachobodega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `textilesgs`.`despachobodega` (
  `iddespacho` INT(11) NOT NULL AUTO_INCREMENT,
  `idfactura` INT(11) NULL DEFAULT NULL,
  `idproducto` INT(11) NULL DEFAULT NULL,
  `descripcion` VARCHAR(20) NULL DEFAULT NULL,
  `cantidad` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`iddespacho`),
  INDEX `fk_facturades` (`idfactura` ASC) VISIBLE,
  CONSTRAINT `fk_facturades`
    FOREIGN KEY (`idfactura`)
    REFERENCES `textilesgs`.`factura` (`idfactura`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `textilesgs`.`detallefactura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `textilesgs`.`detallefactura` (
  `iddetalle` INT(11) NOT NULL AUTO_INCREMENT,
  `idfactura` INT(11) NULL DEFAULT NULL,
  `idproducto` INT(11) NULL DEFAULT NULL,
  `rollo` INT(11) NULL DEFAULT NULL,
  `yarda` FLOAT NULL DEFAULT NULL,
  `precio` FLOAT NULL DEFAULT NULL,
  `total` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`iddetalle`),
  INDEX `fk_factura` (`idfactura` ASC) VISIBLE,
  CONSTRAINT `fk_factura`
    FOREIGN KEY (`idfactura`)
    REFERENCES `textilesgs`.`factura` (`idfactura`))
ENGINE = InnoDB
AUTO_INCREMENT = 43
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `textilesgs`.`modulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `textilesgs`.`modulo` (
  `idmodulo` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`idmodulo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `textilesgs`.`permiso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `textilesgs`.`permiso` (
  `idpermiso` INT(11) NOT NULL AUTO_INCREMENT,
  `idempleado` INT(11) NULL DEFAULT NULL,
  `idmodulo` INT(11) NULL DEFAULT NULL,
  `lectura` INT(11) NULL DEFAULT NULL,
  `escritura` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idpermiso`),
  INDEX `fk_empleado` (`idempleado` ASC) VISIBLE,
  INDEX `fk_modulo` (`idmodulo` ASC) VISIBLE,
  CONSTRAINT `fk_empleado`
    FOREIGN KEY (`idempleado`)
    REFERENCES `textilesgs`.`empleado` (`idempleado`),
  CONSTRAINT `fk_modulo`
    FOREIGN KEY (`idmodulo`)
    REFERENCES `textilesgs`.`modulo` (`idmodulo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `textilesgs`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `textilesgs`.`producto` (
  `idproducto` INT(11) NOT NULL AUTO_INCREMENT,
  `idproveedor` INT(11) NULL DEFAULT NULL,
  `fecha_ingreso` DATETIME NULL DEFAULT NULL,
  `nombre` VARCHAR(60) NULL DEFAULT NULL,
  `estilo` VARCHAR(60) NULL DEFAULT NULL,
  `color` VARCHAR(30) NULL DEFAULT NULL,
  `cant_rollo` INT(11) NULL DEFAULT NULL,
  `yardaporrollo` INT(11) NULL DEFAULT NULL,
  `cant_yarda` FLOAT NULL DEFAULT NULL,
  `precio_compra` FLOAT NULL DEFAULT NULL,
  `ubicacion` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`idproducto`),
  INDEX `fk_provee` (`idproveedor` ASC) VISIBLE,
  CONSTRAINT `fk_provee`
    FOREIGN KEY (`idproveedor`)
    REFERENCES `textilesgs`.`proveedor` (`idproveedor`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `textilesgs`.`precio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `textilesgs`.`precio` (
  `idprecio` INT(11) NOT NULL AUTO_INCREMENT,
  `idproducto` INT(11) NULL DEFAULT NULL,
  `preciorollo` FLOAT NULL DEFAULT NULL,
  `precioyarda` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`idprecio`),
  INDEX `fk_precio` (`idproducto` ASC) VISIBLE,
  CONSTRAINT `fk_precio`
    FOREIGN KEY (`idproducto`)
    REFERENCES `textilesgs`.`producto` (`idproducto`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `textilesgs`.`precioxcliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `textilesgs`.`precioxcliente` (
  `idprecio` INT(11) NOT NULL AUTO_INCREMENT,
  `idproducto` INT(11) NULL DEFAULT NULL,
  `idcliente` INT(11) NULL DEFAULT NULL,
  `preciorollo` FLOAT NULL DEFAULT NULL,
  `precioyarda` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`idprecio`),
  INDEX `fk_pro` (`idproducto` ASC) VISIBLE,
  INDEX `fk_clie` (`idcliente` ASC) VISIBLE,
  CONSTRAINT `fk_clie`
    FOREIGN KEY (`idcliente`)
    REFERENCES `textilesgs`.`cliente` (`idcliente`),
  CONSTRAINT `fk_pro`
    FOREIGN KEY (`idproducto`)
    REFERENCES `textilesgs`.`producto` (`idproducto`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `textilesgs`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `textilesgs`.`usuario` (
  `idusuario` INT(11) NOT NULL AUTO_INCREMENT,
  `idempleado` INT(11) NULL DEFAULT NULL,
  `usuario` VARCHAR(100) NULL DEFAULT NULL,
  `pass` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idusuario`),
  INDEX `fk_usuario` (`idempleado` ASC) VISIBLE,
  CONSTRAINT `fk_usuario`
    FOREIGN KEY (`idempleado`)
    REFERENCES `textilesgs`.`empleado` (`idempleado`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `textilesgs` ;

-- -----------------------------------------------------
-- Placeholder table for view `textilesgs`.`numero_orden`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `textilesgs`.`numero_orden` (`numero_orden` INT);

-- -----------------------------------------------------
-- Placeholder table for view `textilesgs`.`producto_venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `textilesgs`.`producto_venta` (`idproducto` INT, `nombre` INT, `estilo` INT, `color` INT, `cant_rollo` INT, `yardaporrollo` INT, `cant_yarda` INT, `precio_rollo` INT, `precio_yarda` INT, `ubicacion` INT);

-- -----------------------------------------------------
-- procedure ingreso_abono
-- -----------------------------------------------------

DELIMITER $$
USE `textilesgs`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ingreso_abono`(
in _idabano int,
in _idcuenta int,
in _cantidad int,
in _tipopago varchar(25),
in _comprobante varchar(60),
in accion varchar(15)
)
begin
declare exit handler for sqlexception
begin
show errors limit 1;
resignal;
rollback;
end;
declare exit handler for sqlwarning
begin
show warnings limit 1;
resignal;
rollback;
end;
start transaction;
case accion
when "new" then
insert into abono(idabono, idcuenta,cantidad,tipopago,comprobante,fecha_abono)
values(_idabono, _idcuenta,_cantidad,_tipopago,_comprobante,_fecha_abono);

when "update" then
update abono
set idabono=_idabono, idcuenta=_idcuenta,cantidad=_cantidad,tipopago=_tipopago,comprobante=_comprobante,fecha_pago=curdate()
where idabono=_idabono;
when "view"then
select *from abono;
when "viewone" then 
select *from abono where idabono=_idabono;
when 'viewxcuenta' then
select *from abono where idcuenta=_idcuenta;
when "delete" then
delete  from abono where idabono=_idabono;
end case;
commit;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ingreso_cliente
-- -----------------------------------------------------

DELIMITER $$
USE `textilesgs`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ingreso_cliente`(
in _idcliente int,
in _nombre varchar(60),
in _apellido varchar(75),
in _direccion varchar(100),
in _telefono int,
in _correo varchar(100),
in  accion varchar(25)
)
begin
declare exit handler for sqlexception
begin
show errors limit 1;
resignal;
rollback;
end;
declare exit handler for sqlwarning
begin
show warnings limit 1;
resignal;
rollback;
end;
start transaction;
case accion
when "new" then
insert into cliente(idcliente, nombre,apellido,direccion,telefono,correo)
values(_idcliente, _nombre,_apellido,_direccion,_telefono,_correo);

when "update" then
update cliente
set nombre=_nombre,apellido=_apellido,direccion=_direccion,telefono=_telefono,correo=_correo
where idcliente=_idcliente;

when "view"then
select *from cliente;
when "viewone" then 

select *from cliente where idcliente=_idcliente;
end case;
commit;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ingreso_cuentaxproveedor
-- -----------------------------------------------------

DELIMITER $$
USE `textilesgs`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ingreso_cuentaxproveedor`(
in _idcuenta int,
in _idproveedor int,
in _total float,
in _totalabono float,
in _saldo float,
in _estado varchar(100),
in  accion varchar(25)
)
begin
declare exit handler for sqlexception
begin
show errors limit 1;
resignal;
rollback;
end;
declare exit handler for sqlwarning
begin
show warnings limit 1;
resignal;
rollback;
end;
start transaction;
case accion
when "new" then
insert into cuentaxproveedor(idcuenta, idproveedor,total,totalabono,saldo,fecha,estado)
values(_idcuenta, _idproveedor,_total,_totalabono,_saldo,curdate(),_estado);

when "update" then
update cuentaxproveedor
set idproveedor= _idproveedor,total=_total,totalabono=_totalabono,saldo=_saldo,fecha=curdate(),estado=_estado
where idcuenta=_idcuenta;

when "view"then
select *from cuentaxproveedor;
when "viewxpro"then
select *from cuentaxproveedor where  idproveedor=_idproveedor and estado='Pendiente';
select *from cuentaxproveedor;

when "viewone" then 
select *from cuentaxproveedor where idcuenta=_idcuenta;

when "delete" then 
delete from cuentaxproveedor where idcuenta=_idcuenta;
end case;
commit;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ingreso_despachobodega
-- -----------------------------------------------------

DELIMITER $$
USE `textilesgs`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ingreso_despachobodega`(
in _iddespacho int, 
in _idfactura int,
in _idproducto int,
in _descripcion varchar(60),
in _cantidad float,
in  accion varchar(25)
)
begin
declare exit handler for sqlexception
begin
show errors limit 1;
resignal;
rollback;
end;
declare exit handler for sqlwarning
begin
show warnings limit 1;
resignal;
rollback;
end;
start transaction;
case accion
when "new" then
insert into despachobodega(iddespacho, idfactura,idproducto,descripcion,cantidad)
values(_iddespacho, _idfactura,_idproducto,_descripcion,_cantidad);

when "update" then
update despachobodega
set idfactura= _idfactura,idprodcuto=_idproducto,descripcion=_descripcion,cantidad=_cantidad
where iddespacho=_iddespacho;

when "view"then
select *from despachobodega;

when "delete" then 
delete from despachobodega where iddespacho=_iddespacho;
end case;
commit;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ingreso_detalle
-- -----------------------------------------------------

DELIMITER $$
USE `textilesgs`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ingreso_detalle`(
in _iddetalle int, 
in _idfactura int,
in _idproducto int,
in _rollo varchar(60),
in _yarda float,
in _precio float,
in _total float,
in  accion varchar(25)
)
begin
declare exit handler for sqlexception
begin
show errors limit 1;
resignal;
rollback;
end;
declare exit handler for sqlwarning
begin
show warnings limit 1;
resignal;
rollback;
end;
start transaction;
case accion
when "new" then
insert into detallefactura(iddetalle, idfactura,idproducto,rollo,yarda,precio, total)
values(_iddetalle, _idfactura,_idproducto,_rollo,_yarda,_precio, _total);

when "update" then
update detallefactura
set idfactura=_idefactura,idproducto=_idproducto, rollo=_rollo,yarda=_yarda,precio=_precio, total=_total
where iddetalle=_iddetalle;

when "view"then
select *from detallefactura;

when "viewone" then
select *from detallefactura where iddetalle=_iddetalle;



when "delete" then 
delete from detallefactura where iddetalle=_iddetalle;
end case;
commit;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ingreso_empleado
-- -----------------------------------------------------

DELIMITER $$
USE `textilesgs`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ingreso_empleado`(
in _idempleado int,
in _nombre varchar(60),
in _apellido varchar(75),
in _dpi varchar(15),
in _telefono int,
in _correo varchar(100),
in _estado varchar(100),
in accion varchar(15)
)
begin
declare exit handler for sqlexception
begin
show errors limit 1;
resignal;
rollback;
end;
declare exit handler for sqlwarning
begin
show warnings limit 1;
resignal;
rollback;
end;
start transaction;
case accion
when "new" then
insert into empleado(idempleado, nombre,apellido,dpi,telefono,correo,estado)
values(_idempleado,_nombre,_apellido,_dpi,_telefono,_correo,_estado);

when "update" then
update empleado
set nombre=_nombre,apellido=_apellido,dpi=_dpi,telefono=_telefono,correo=_correo,estado=_estado
where idempleado=_idempleado;
when "view"then
select *from empleado;
when "viewone" then 
select *from empleado where idempleado=_idempleado;
when "delete" then
update empleado set
estado="No Activo" where idempleado=_idempleado;
end case;
commit;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ingreso_factura
-- -----------------------------------------------------

DELIMITER $$
USE `textilesgs`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ingreso_factura`(
in _idfactura int, 
in _idcliente int,
in _idempleado int,
in _fecha datetime,
in _total float,
in _estado varchar(25),
in  accion varchar(25)
)
begin
declare exit handler for sqlexception
begin
show errors limit 1;
resignal;
rollback;
end;
declare exit handler for sqlwarning
begin
show warnings limit 1;
resignal;
rollback;
end;
start transaction;
case accion
when "new" then
insert into factura(idfactura, idcliente,idempleado,fecha,total, estado)
values(_idfactura, _idcliente,_idempleado,_fecha,_total, _estado);

when "update" then
update factura
set idcliente=_idcliente,idempleado=_idempleado,fecha=_fecha,total=_total, estado=_estado
where idfactura=_idfactura;

when "view"then
select *from factura;

when "viewone" then
select *from factura where idfatura=_idfactura;

when "viewxclie" then
select * from factura where idcliente=_idcliente;

when "delete" then 
delete from factura where idfactura=_idfactura;
end case;
commit;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ingreso_modulo
-- -----------------------------------------------------

DELIMITER $$
USE `textilesgs`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ingreso_modulo`(
in _idmodulo int, 
in _nombre  varchar(30),
in  accion varchar(25)
)
begin
declare exit handler for sqlexception
begin
show errors limit 1;
resignal;
rollback;
end;
declare exit handler for sqlwarning
begin
show warnings limit 1;
resignal;
rollback;
end;
start transaction;
case accion
when "new" then
insert into modulo(idmodulo, nombre)
values(_idmodulo, _nombre);

when "update" then
update modulo
set nombre=_nombre
where idmodulo=_idmodulo;

when "view"then
select *from modulo;

when "viewone" then
select *from modulo where idmodulo=_idmodulo;



when "delete" then 
delete from modulo where idmodulo=_idmodulo;
end case;
commit;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ingreso_permiso
-- -----------------------------------------------------

DELIMITER $$
USE `textilesgs`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ingreso_permiso`(
in _idpermiso int, 
in _idempleado int,
in _idmodulo int,
in _lectura int,
in _escritura int,
in  accion varchar(25)
)
begin
declare exit handler for sqlexception
begin
show errors limit 1;
resignal;
rollback;
end;
declare exit handler for sqlwarning
begin
show warnings limit 1;
resignal;
rollback;
end;
start transaction;
case accion
when "new" then
insert into permiso(idpermiso, idempleado,idmodulo,lectura,escritura)
values(_idpermiso,_idempleado,_idmodulo,_lectura,_escritura);

when "update" then
update permiso
set  idempleado=_idempleado,idmodulo=_idmodulo,lectura=_lectura,escritura=_escritura
where idpermiso=_idpermiso;

when "view"then
select *from permiso;

when "viewone" then
select *from permiso where idpermiso=_idpermiso;
when "viewxemp" then
select p.idpermiso, p.idempleado, p.idmodulo, m.nombre, p.lectura, p.escritura 
from permiso  p inner join modulo m on m.idmodulo=p.idmodulo
where p.idempleado=_idempleado;

when "delete" then 
delete from permiso where idpermiso=_idpermiso;
end case;
commit;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ingreso_precio
-- -----------------------------------------------------

DELIMITER $$
USE `textilesgs`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ingreso_precio`(
in _idprecio int, 
in _idproducto int,
in _preciorollo float,
in _precioyarda float,
in  accion varchar(25)
)
begin
declare exit handler for sqlexception
begin
show errors limit 1;
resignal;
rollback;
end;
declare exit handler for sqlwarning
begin
show warnings limit 1;
resignal;
rollback;
end;
start transaction;
case accion
when "new" then
insert into precio(idprecio, idproducto,preciorollo,precioyarda)
values(_idprecio, _idproducto,_preciorollo,_precioyarda);

when "update" then
update precio
set idproducto=_idproducto,preciorollo=_preciorollo,precioyarda=_precioyarda
where idprecio=_idprecio;

when "view"then
select *from precio;

when "viewall"then
select p.idprecio,p.idproducto,concat(o.nombre, ' ', o.estilo, ' ', o.color) as producto, p.preciorollo,p.precioyarda
 from precio p inner join producto o on o.idproducto=p.idproducto
 where o.idproducto=_idproducto;


when "viewone" then
select *from precio where idprecio=_idprecio;
when "viewxpro" then
select *from precio where idproducto=_idproducto;

when "delete" then 
delete from precio where idprecio=idprecio;
end case;
commit;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ingreso_precioxcliente
-- -----------------------------------------------------

DELIMITER $$
USE `textilesgs`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ingreso_precioxcliente`(
in _idprecio int, 
in _idproducto int,
in _idcliente int,
in _preciorollo float,
in _precioyarda float,
in  accion varchar(25)
)
begin
declare exit handler for sqlexception
begin
show errors limit 1;
resignal;
rollback;
end;
declare exit handler for sqlwarning
begin
show warnings limit 1;
resignal;
rollback;
end;
start transaction;
case accion
when "new" then
insert into precioxcliente(idprecio, idproducto,idclientepreciorollo,precioyarda)
values(_idprecio, _idproducto,_idcliente_preciorollo,_precioyarda);

when "update" then
update precioxcliente
set idproducto=_idproducto,idcliente=_idcliente,preciorollo=_preciorollo,precioyarda=_precioyarda

where idprecio=_idprecio;

when "view"then
select *from precioxcliente;

when "viewall"then
select p.idprecio,p.idproducto,concat(o.nombre, ' ', o.estilo, ' ', o.color) as producto, p.preciorollo,p.precioyarda
 from precioxcliente p inner join producto o on o.idproducto=p.idproducto
 where p.idcliente=_idcliente;


when "viewone" then
select p.idprecio,p.idproducto,concat(o.nombre, ' ', o.estilo, ' ', o.color) as producto, p.preciorollo,p.precioyarda
 from precioxcliente p inner join producto o on o.idproducto=p.idproducto
 where p.idprecio=_idprecio;

when "viewxpro" then
select p.idprecio,p.idproducto, p.idcliente, p.preciorollo,p.precioyarda
 from precioxcliente p inner join producto o on o.idproducto=p.idproducto
 where p.idproducto=_idproducto and  p.idcliente=_idcliente;


when "delete" then 
delete from precioxcliente where idprecio=idprecio;
end case;
commit;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ingreso_producto
-- -----------------------------------------------------

DELIMITER $$
USE `textilesgs`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ingreso_producto`(
in _idproducto int, 
in _idproveedor int,
in _nombre varchar(60),
in _estilo varchar(60),
in _color varchar(30),
in _cant_rollo int,
in _yardaporrollo int,
in _cant_yarda float,
in _precio_compra float,
in _ubicacion varchar(30),
in  accion varchar(25)
)
begin
declare exit handler for sqlexception
begin
show errors limit 1;
resignal;
rollback;
end;
declare exit handler for sqlwarning
begin
show warnings limit 1;
resignal;
rollback;
end;
start transaction;
case accion
when "new" then
insert into producto(idproducto, idproveedor,fecha_ingreso,nombre,estilo,color,cant_rollo,yardaporrollo,cant_yarda,precio_compra,ubicacion)
values(_idproducto, _idproveedor,current_timestamp() ,_nombre,_estilo,_color,_cant_rollo,_yardaporrollo,_cant_yarda,_precio_compra,_ubicacion);

when "update" then
update producto
set  idproveedor=_idproveedor,fecha_ingreso=current_timestamp(),nombre=_nombre,estilo=_estilo,color=_color,
cant_rollo=_cant_rollo,yardaporrollo=_yardaporrollo, cant_yarda=_cant_yarda,precio_compra=_precio_compra,ubicacion=_ubicacion
where idproducto=_idproducto;

when "view"then
select 
p.idproducto, p.idproveedor,p.fecha_ingreso,p.nombre,p.estilo,p.color,p.cant_rollo,p.yardaporrollo,p.cant_yarda,p.precio_compra,p.ubicacion,
pr.nombre as proveedor
from producto p inner join proveedor pr on pr.idproveedor=p.idproveedor;



when "viewone" then
select 
p.idproducto, p.idproveedor,p.fecha_ingreso,p.nombre,p.estilo,p.colorp.cant_rollo,p.yardaporrollo,p.cant_yarda,p.precio_compra,p.ubicacion,
pr.nombre as porveedor
from producto p inner join proveedor pr on pr.idproveedor=p.idproveedor
where
p.idproducto= _idproducto;

when "delete" then 
delete from producto where idproducto=_idproducto;
end case;
commit;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ingreso_proveedor
-- -----------------------------------------------------

DELIMITER $$
USE `textilesgs`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ingreso_proveedor`(
in _idproveedor int, 
in _nombre varchar(100),
in  accion varchar(25)
)
begin
declare exit handler for sqlexception
begin
show errors limit 1;
resignal;
rollback;
end;
declare exit handler for sqlwarning
begin
show warnings limit 1;
resignal;
rollback;
end;
start transaction;
case accion
when "new" then
insert into proveedor(idproveedor, nombre)
values(_idproveedor, _nombre);

when "update" then
update proveedor
set nombre=_nombre
where idproveedor=_idproveedor;

when "view"then
select *from proveedor;


when "viewone" then
select *from proveedor 
where
idproveedor=_idproveedor;

when "delete" then 
delete from proveedor where idproveedor=_idproveedor;
end case;
commit;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ingreso_usuario
-- -----------------------------------------------------

DELIMITER $$
USE `textilesgs`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ingreso_usuario`(
in _idusuario int, 
in _idempleado int,
in _usuario varchar(100),
in _pass varchar(100),
in  accion varchar(25)
)
begin
declare exit handler for sqlexception
begin
show errors limit 1;
resignal;
rollback;
end;
declare exit handler for sqlwarning
begin
show warnings limit 1;
resignal;
rollback;
end;
start transaction;
case accion
when "new" then
insert into usuario(idusuario,idempleado,usuario, pass)
values(_idusuario,_idempleado,_usuario, _pass);

when "update" then
update usuario
set idempleado=_idempleado,usuario=_usuario, pass=_pass
where idusuario=_idusuario;

when "view"then
select *from usuario;


when "viewone" then
select *from usuario 
where
idusuario=_idusuario;

when "login" then
select e.idempleado,e.nombre,e.apellido, e.dpi, e.telefono, e.correo, e.estado,
u.idusuario, u.usuario, u.pass
 from empleado e inner join usuario u on e.idempleado=u.idempleado 
where
u.usuario=_usuario and u.pass=_pass;

when "delete" then 
delete from usuario where idusuario=_idusuario;
end case;
commit;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- View `textilesgs`.`numero_orden`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `textilesgs`.`numero_orden`;
USE `textilesgs`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `textilesgs`.`numero_orden` AS select (coalesce(max(`textilesgs`.`factura`.`idfactura`),0) + 1) AS `numero_orden` from `textilesgs`.`factura`;

-- -----------------------------------------------------
-- View `textilesgs`.`producto_venta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `textilesgs`.`producto_venta`;
USE `textilesgs`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `textilesgs`.`producto_venta` AS select `p`.`idproducto` AS `idproducto`,`p`.`nombre` AS `nombre`,`p`.`estilo` AS `estilo`,`p`.`color` AS `color`,`p`.`cant_rollo` AS `cant_rollo`,`p`.`yardaporrollo` AS `yardaporrollo`,`p`.`cant_yarda` AS `cant_yarda`,`pr`.`preciorollo` AS `precio_rollo`,`pr`.`precioyarda` AS `precio_yarda`,`p`.`ubicacion` AS `ubicacion` from (`textilesgs`.`producto` `p` left join `textilesgs`.`precio` `pr` on(((`pr`.`idproducto` = `p`.`idproducto`) and (`pr`.`preciorollo` = (select max(`textilesgs`.`precio`.`preciorollo`) from `textilesgs`.`precio` where (`textilesgs`.`precio`.`idproducto` = `p`.`idproducto`)))))) where ((`p`.`cant_rollo` > 0) or (`p`.`cant_yarda` > 0));
USE `textilesgs`;

DELIMITER $$
USE `textilesgs`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `textilesgs`.`add_stock_ba`
BEFORE UPDATE ON `textilesgs`.`detallefactura`
FOR EACH ROW
begin
update producto set cant_yarda=(old.rollo * yardaporrollo) + old.yarda, cant_rollo= (cant_yarda / yardaporrollo)   where idproducto=old.idproducto;
end$$

USE `textilesgs`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `textilesgs`.`add_stock_bd`
BEFORE DELETE ON `textilesgs`.`detallefactura`
FOR EACH ROW
begin
update producto set cant_yarda=(old.rollo * yardaporrollo) + old.yarda, cant_rollo= (cant_yarda / yardaporrollo)   where idproducto=old.idproducto;
end$$

USE `textilesgs`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `textilesgs`.`remove_stock_ai`
AFTER INSERT ON `textilesgs`.`detallefactura`
FOR EACH ROW
BEGIN
declare anterior decimal(10,2);
select cant_yarda into anterior from producto where idproducto =new.idproducto;
update producto set  cant_rollo= cant_rollo-new.rollo , cant_yarda= anterior - ((new.rollo*yardaporrollo)+ new.yarda) where idproducto=new.idproducto;
END$$

USE `textilesgs`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `textilesgs`.`remove_stock_au`
AFTER UPDATE ON `textilesgs`.`detallefactura`
FOR EACH ROW
begin
declare anterior decimal(10,2);
select cant_yarda into anterior from producto where idproducto =new.idproducto;
update producto set  rollo=new.rollo , cant_yarda= anterior - ((new.rollo*yardaporrollo)+ new.yarda) where idproducto=new.idproducto;
end$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
