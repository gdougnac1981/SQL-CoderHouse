CREATE DATABASE dougnac_ch;

USE dougnac_ch;

CREATE TABLE `usuarios` (
  `cod_usuario` char(6) NOT NULL,
  `nom_usuario` char(50) NOT NULL,
  `activo` boolean NOT NULL DEFAULT '0',
  `nro_legajo` int NOT NULL,
  `usuario` char(6) NOT NULL DEFAULT 'DOU000', 
  `fecha_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cod_usuario`),
  KEY ` ind_nom_user` (`nom_usuario`),
  KEY `ind_activo` (`activo`),
  KEY `ind_legajo` (`nro_legajo`),
  KEY `ind_fecha_mod` (`fecha_mod`));

CREATE TABLE `estados` (
  `cod_estado` char(1) NOT NULL,
  `nom_estado` char(10) NOT NULL,
  `activo` boolean NOT NULL DEFAULT '0',
  `cod_usuario` char(6) NOT NULL DEFAULT 'DOU000', 
  `fecha_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cod_estado`),
  KEY `ind_activo` (`activo`),
  KEY `ind_fecha_mod` (`fecha_mod`),
  KEY `ind_fk_cod_user` (`cod_usuario`),
  CONSTRAINT `fk_cod_user` FOREIGN KEY (`cod_usuario`) REFERENCES `usuarios` (`cod_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE);

CREATE TABLE `formas_pago` (
  `cod_fpago` char(5) NOT NULL,
  `nom_fpago` char(15) NOT NULL,
  `dias_venc` int NOT NULL,
  `activo` boolean NOT NULL DEFAULT '0',
  `cod_usuario` char(6) NOT NULL DEFAULT 'DOU000',
  `fecha_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cod_fpago`),
  KEY ` ind_nom_pago` (`nom_fpago`),
  KEY `ind_activo` (`activo`),
  KEY `ind_fecha_mod` (`fecha_mod`),
  KEY `ind_fk_cod_user2` (`cod_usuario`),
  CONSTRAINT `fk_cod_user2` FOREIGN KEY (`cod_usuario`) REFERENCES `usuarios` (`cod_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE);

CREATE TABLE `zona_venta` (
  `cod_zona_vta` int(2) NOT NULL AUTO_INCREMENT,
  `nom_zona_vta` char(15) NOT NULL,
  `activo` boolean NOT NULL DEFAULT '0',
  `cod_usuario` char(6) NOT NULL DEFAULT 'DOU000',
  `fecha_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cod_zona_vta`),
  KEY `ind_nom_zona` (`nom_zona_vta`),
  KEY `ind_activo` (`activo`),
  KEY `ind_fecha_mod` (`fecha_mod`),
  KEY `ind_fk_cod_user3` (`cod_usuario`),
  CONSTRAINT `fk_cod_user3` FOREIGN KEY (`cod_usuario`) REFERENCES `usuarios` (`cod_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE);

CREATE TABLE `tipos_documentos` (
  `tipo_doc` char(4) NOT NULL,
  `nom_documento` char(15) NOT NULL,
  `letra_doc` char(1) NOT NULL,
  `serie_doc` char(4) NOT NULL,
  `multiplicador` int NOT NULL DEFAULT '1',
  `activo` boolean NOT NULL DEFAULT '0',
  `cod_usuario` char(6) NOT NULL DEFAULT 'DOU000',
  `fecha_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tipo_doc`),
  KEY `ind_nom_doc` (`nom_documento`),
  KEY `ind_activo` (`activo`),
  KEY `ind_letra_doc` (`letra_doc`),
  KEY `ind_serie_doc` (`serie_doc`),
  KEY `ind_multiplicador` (`multiplicador`),
  KEY `ind_fecha_mod` (`fecha_mod`),
  KEY `ind_fk_cod_user4` (`cod_usuario`),
  CONSTRAINT `fk_cod_user4` FOREIGN KEY (`cod_usuario`) REFERENCES `usuarios` (`cod_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE);

CREATE TABLE `proveedores` (
  `cod_proveedor` int(5) NOT NULL AUTO_INCREMENT,
  `nom_proveedor` char(50) NOT NULL,
  `razon_social` char(50) NOT NULL,
  `cuit` char(13) NOT NULL,
  `direccion` char(50) NOT NULL DEFAULT '',
  `localidad` char(20) NOT NULL DEFAULT '',
  `cod_postal` char(4) NOT NULL DEFAULT '0',
  `provincia` char(20) NOT NULL DEFAULT '',
  `pais` char(15) NOT NULL DEFAULT '',
  `contacto` char(50) NOT NULL DEFAULT '',
  `telefono` char(30) NOT NULL DEFAULT '',
  `email` char(50) NOT NULL DEFAULT '',
  `descuento_prov` float NOT NULL DEFAULT '0',
  `dias_pago` int NOT NULL DEFAULT '0',
  `activo` boolean NOT NULL DEFAULT '0',
  `cod_usuario` char(6) NOT NULL DEFAULT 'DOU000',
  `fecha_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cod_proveedor`),
  KEY `ind_nom_prov` (`nom_proveedor`),
  KEY `ind_razon_social` (`razon_social`),
  KEY `ind_cuit` (`cuit`),
  KEY `ind_cod_postal` (`cod_postal`),
  KEY `ind_dias_pago` (`dias_pago`),
  KEY `ind_activo` (`activo`),
  KEY `ind_fk_cod_user5` (`cod_usuario`),
  KEY `ind_fecha_mod` (`fecha_mod`),
  CONSTRAINT `fk_cod_user5` FOREIGN KEY (`cod_usuario`) REFERENCES `usuarios` (`cod_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE);

CREATE TABLE `articulos` (
  `cod_articulo` int(7) NOT NULL AUTO_INCREMENT,
  `nom_articulo` char(50) NOT NULL,
  `activo` boolean NOT NULL DEFAULT '0',  
  `tipo_articulo` char(10) NOT NULL,
  `cod_unidad` char(10) NOT NULL,
  `cod_proveedor` int(5) NOT NULL,
  `cod_barras` char(15) NOT NULL DEFAULT '0',
  `precio_costo` float NOT NULL DEFAULT '0',
  `stock` int NOT NULL DEFAULT '0',
  `cod_usuario` char(6) NOT NULL DEFAULT 'DOU000',
  `fecha_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cod_articulo`),
  KEY `ind_nom_art` (`nom_articulo`),
  KEY `ind_activo` (`activo`),
  KEY `ind_tipo_art` (`tipo_articulo`),
  KEY `ind_cod_uni` (`cod_unidad`),
  KEY `ind_cod_barras` (`cod_barras`),
  KEY `ind_precio_costo` (`precio_costo`),
  KEY `ind_fecha_mod` (`fecha_mod`),
  KEY `ind_fk_cod_prov` (`cod_proveedor`),
  KEY `ind_fk_cod_user6` (`cod_usuario`),
  CONSTRAINT `fk_cod_prov` FOREIGN KEY (`cod_proveedor`) REFERENCES `proveedores` (`cod_proveedor`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_cod_user6` FOREIGN KEY (`cod_usuario`) REFERENCES `usuarios` (`cod_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE);

CREATE TABLE `lista_precios` (
  `cod_lista` int(3) NOT NULL AUTO_INCREMENT,
  `cod_articulo` int(7) NOT NULL,
  `activo` boolean NOT NULL DEFAULT '0',
  `cod_proveedor` int(5) NOT NULL,
  `precio_costo` float NOT NULL DEFAULT '0',
  `precio_unitario` float NOT NULL DEFAULT '0',
  `cod_usuario` char(6) NOT NULL DEFAULT 'DOU000',
  `fecha_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cod_lista`),
  KEY `ind_activo` (`activo`),
  KEY `ind_fecha_mod` (`fecha_mod`),
  KEY `ind_precio_unitario` (`precio_unitario`),
  KEY `ind_fk_cod_art` (`cod_usuario`),
  KEY `ind_fk_cod_prov7` (`cod_usuario`),
  KEY `ind_fk_cod_user7` (`cod_usuario`),
  CONSTRAINT `fk_cod_art` FOREIGN KEY (`cod_articulo`) REFERENCES `articulos` (`cod_articulo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_cod_prov7` FOREIGN KEY (`cod_proveedor`) REFERENCES `proveedores` (`cod_proveedor`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_precio_costo` FOREIGN KEY (`precio_costo`) REFERENCES `articulos` (`precio_costo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_cod_user7` FOREIGN KEY (`cod_usuario`) REFERENCES `usuarios` (`cod_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE);

CREATE TABLE `vendedores` (
  `cod_vendedor` int(4) NOT NULL AUTO_INCREMENT,
  `nom_vendedor` char(15) NOT NULL,
  `porcentaje_com` float NOT NULL,
  `cod_zona_vta` int(2) NOT NULL,
  `activo` boolean NOT NULL DEFAULT '0',
  `cod_usuario` char(6) NOT NULL DEFAULT 'DOU000',
  `fecha_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cod_vendedor`),
  KEY `ind_nom_vend` (`nom_vendedor`),
  KEY `ind_activo` (`activo`),
  KEY `ind_fecha_mod` (`fecha_mod`),
  KEY `ind_fk_cod_zona` (`cod_zona_vta`),
  KEY `ind_fk_cod_user8` (`cod_usuario`),
  CONSTRAINT `fk_cod_zona` FOREIGN KEY (`cod_zona_vta`) REFERENCES `zona_venta` (`cod_zona_vta`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_cod_user8` FOREIGN KEY (`cod_usuario`) REFERENCES `usuarios` (`cod_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE);

CREATE TABLE `clientes` (
  `cod_cliente` int(5) NOT NULL AUTO_INCREMENT,
  `nom_cliente` char(50) NOT NULL,
  `razon_social` char(50) NOT NULL,
  `cuit` char(13) NOT NULL,
  `direccion` char(50) NOT NULL DEFAULT '',
  `localidad` char(20) NOT NULL DEFAULT '',
  `cod_postal` int NOT NULL DEFAULT '0',
  `provincia` char(20) NOT NULL DEFAULT '',
  `pais` char(15) NOT NULL DEFAULT '',
  `contacto` char(50) NOT NULL DEFAULT '',
  `telefono` char(30) NOT NULL DEFAULT '',
  `email` char(50) NOT NULL DEFAULT '',
  `cod_vendedor` int(4) NOT NULL,
  `descuento_cliente` float NOT NULL,
  `cod_fpago` char(5) NOT NULL,
  `analista_cuenta` char(15) NOT NULL,
  `activo` boolean NOT NULL DEFAULT '0',
  `cod_usuario` char(6) NOT NULL DEFAULT 'DOU000',
  `fecha_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cod_cliente`),
  KEY `ind_nom_cli` (`nom_cliente`),
  KEY `ind_razon_social` (`razon_social`),
  KEY `ind_cuit` (`cuit`),
  KEY `ind_cod_postal` (`cod_postal`),
  KEY `ind_analista` (`analista_cuenta`),
  KEY `ind_dto_cliente` (`descuento_cliente`),
  KEY `ind_activo` (`activo`),
  KEY `ind_fecha_mod` (`fecha_mod`),
  KEY `ind_fk_cod_vend` (`cod_vendedor`),
  KEY `ind_fk_cod_fpago` (`cod_fpago`),
  KEY `ind_fk_cod_user9` (`cod_usuario`),
  CONSTRAINT `fk_cod_vend` FOREIGN KEY (`cod_vendedor`) REFERENCES `vendedores` (`cod_vendedor`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_cod_fpago` FOREIGN KEY (`cod_fpago`) REFERENCES `formas_pago` (`cod_fpago`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_cod_user9` FOREIGN KEY (`cod_usuario`) REFERENCES `usuarios` (`cod_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE);

CREATE TABLE `pedidos` (
  `nro_pedido` int(10) NOT NULL AUTO_INCREMENT,
  `fecha_pedido` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cod_cliente` int(5) NOT NULL,
  `nom_cliente` char(50) NOT NULL,
  `cod_fpago` char(5) NOT NULL,
  `cod_vendedor` int(4) NOT NULL,
  `comentario` char(100) NOT NULL DEFAULT '',
  `cod_articulo` int(7) NOT NULL,
  `tipo_articulo` char(10) NOT NULL,
  `cantidad` int NOT NULL DEFAULT '0',
  `cod_estado` char(1) NOT NULL DEFAULT 'P',
  `cod_usuario` char(6) NOT NULL DEFAULT 'DOU000',
  `fecha_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`nro_pedido`),
  KEY `ind_fecha_ped` (`fecha_pedido`),
  KEY `ind_fecha_mod` (`fecha_mod`),
  KEY `ind_coment` (`comentario`),
  KEY `ind_cant` (`cantidad`),
  KEY `ind_fk_cod_cli` (`cod_cliente`),
  KEY `ind_fk_cod_fpago1` (`cod_fpago`),
  KEY `ind_fk_cod_vend1` (`cod_vendedor`),
  KEY `ind_fk_cod_art` (`cod_articulo`),
  KEY `ind_fk_cod_est` (`cod_estado`),
  KEY `ind_fk_cod_user10` (`cod_usuario`),
  CONSTRAINT `fk_cod_cli` FOREIGN KEY (`cod_cliente`) REFERENCES `clientes` (`cod_cliente`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_nom_cli` FOREIGN KEY (`nom_cliente`) REFERENCES `clientes` (`nom_cliente`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_cod_fpago10` FOREIGN KEY (`cod_fpago`) REFERENCES `formas_pago` (`cod_fpago`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_cod_vend10` FOREIGN KEY (`cod_vendedor`) REFERENCES `vendedores` (`cod_vendedor`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_cod_articulo` FOREIGN KEY (`cod_articulo`) REFERENCES `articulos` (`cod_articulo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_ tipo_art` FOREIGN KEY (`tipo_articulo`) REFERENCES `articulos` (`tipo_articulo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_cod_est` FOREIGN KEY (`cod_estado`) REFERENCES `estados` (`cod_estado`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_cod_user10` FOREIGN KEY (`cod_usuario`) REFERENCES `usuarios` (`cod_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE);

CREATE TABLE `facturas` (
  `nro_pedido` int(10) NOT NULL,
  `tipo_doc` char(4) NOT NULL,
  `letra_doc` char(1) NOT NULL,
  `serie_doc` char(4) NOT NULL,
  `nro_doc` int(8) NOT NULL AUTO_INCREMENT,
  `fecha_doc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cod_cliente` int(5) NOT NULL,
  `cod_fpago` char(5) NOT NULL,
  `cod_vendedor` int(4) NOT NULL,
  `comentario` char(100) NOT NULL DEFAULT '',
  `cod_articulo` int(7) NOT NULL,
  `cantidad` int NOT NULL DEFAULT '0',
  `precio_unitario` float NOT NULL DEFAULT '0',
  `descuento_cliente` float NOT NULL,
  `multiplicador` int NOT NULL DEFAULT '1',
  `subtotal` float NOT NULL,
  `iva` float NOT NULL,
  `total` float NOT NULL,
  `cod_usuario` char(6) NOT NULL DEFAULT 'DOU000',
  `fecha_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`nro_doc`),
  KEY `ind_fecha_mod` (`fecha_mod`),
  KEY `ind_fecha_doc` (`fecha_doc`),
  KEY `ind_fk_nro_ped` (`nro_pedido`),
  KEY `ind_fk_tipo_doc` (`tipo_doc`),
  KEY `ind_fk_letra_doc` (`letra_doc`),
  KEY `ind_fk_cod_cli11` (`cod_cliente`),
  KEY `ind_fk_cod_fpago11` (`cod_fpago`),
  KEY `ind_fk_cod_vend11` (`cod_vendedor`),
  KEY `ind_fk_cod_art11` (`cod_articulo`),
  KEY `ind_fk_cod_user11` (`cod_usuario`),
  CONSTRAINT `fk_nro_ped` FOREIGN KEY (`nro_pedido`) REFERENCES `pedidos` (`nro_pedido`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_tipo_doc` FOREIGN KEY (`tipo_doc`) REFERENCES `tipos_documentos` (`tipo_doc`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_letra_doc` FOREIGN KEY (`letra_doc`) REFERENCES `tipos_documentos` (`letra_doc`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_serie_doc` FOREIGN KEY (`serie_doc`) REFERENCES `tipos_documentos` (`serie_doc`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_cod_cli11` FOREIGN KEY (`cod_cliente`) REFERENCES `pedidos` (`cod_cliente`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_cod_fpago11` FOREIGN KEY (`cod_fpago`) REFERENCES `pedidos` (`cod_fpago`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_cod_vend11` FOREIGN KEY (`cod_vendedor`) REFERENCES `pedidos` (`cod_vendedor`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_coment` FOREIGN KEY (`comentario`) REFERENCES `pedidos` (`comentario`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_cod_art11` FOREIGN KEY (`cod_articulo`) REFERENCES `pedidos` (`cod_articulo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_cant` FOREIGN KEY (`cantidad`) REFERENCES `pedidos` (`cantidad`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_precio_unit` FOREIGN KEY (`precio_unitario`) REFERENCES `lista_precios` (`precio_unitario`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_dto_cliente` FOREIGN KEY (`descuento_cliente`) REFERENCES `clientes` (`descuento_cliente`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_multipl` FOREIGN KEY (`multiplicador`) REFERENCES `tipos_documentos` (`multiplicador`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_cod_user11` FOREIGN KEY (`cod_usuario`) REFERENCES `usuarios` (`cod_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE);

CREATE TABLE `remitos` (
  `nro_pedido` int(10) NOT NULL,
  `letra_remito` char(1) NOT NULL DEFAULT 'R' ,
  `serie_remito` char(4) NOT NULL,
  `nro_remito` int(8) NOT NULL AUTO_INCREMENT,
  `fecha_remito` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cod_cliente` int(5) NOT NULL,
  `cod_vendedor` int(4) NOT NULL,  
  `cod_zona_vta` int(2) NOT NULL,
  `comentario` char(100) NOT NULL DEFAULT '',
  `cod_articulo` int(7) NOT NULL,
  `cantidad` int NOT NULL DEFAULT '0',
  `cod_usuario` char(6) NOT NULL DEFAULT 'DOU000',
  `fecha_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`nro_remito`),
  KEY `ind_fecha_mod` (`fecha_mod`),
  KEY `ind_fecha_rem` (`fecha_remito`),
  KEY `ind_letra_rem` (`letra_remito`),
  KEY `ind_serie_rem` (`serie_remito`),
  KEY `ind_fk_nro_ped12` (`nro_pedido`),
  KEY `ind_fk_cod_cli12` (`cod_cliente`),
  KEY `ind_fk_cod_vend12` (`cod_vendedor`),
  KEY `ind_fk_cod_zona12` (`cod_zona_vta`),
  KEY `ind_fk_cod_art12` (`cod_articulo`),
  KEY `ind_fk_cod_user12` (`cod_usuario`),
  CONSTRAINT `fk_nro_ped12` FOREIGN KEY (`nro_pedido`) REFERENCES `pedidos` (`nro_pedido`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_cod_cli12` FOREIGN KEY (`cod_cliente`) REFERENCES `pedidos` (`cod_cliente`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_cod_vend12` FOREIGN KEY (`cod_vendedor`) REFERENCES `pedidos` (`cod_vendedor`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_cod_zona12` FOREIGN KEY (`cod_zona_vta`) REFERENCES `zona_venta` (`cod_zona_vta`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_coment12` FOREIGN KEY (`comentario`) REFERENCES `pedidos` (`comentario`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_cod_art12` FOREIGN KEY (`cod_articulo`) REFERENCES `pedidos` (`cod_articulo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_cant12` FOREIGN KEY (`cantidad`) REFERENCES `pedidos` (`cantidad`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_cod_user12` FOREIGN KEY (`cod_usuario`) REFERENCES `usuarios` (`cod_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE);

CREATE TABLE `entregas` (
  `nro_envío` int(10) NOT NULL AUTO_INCREMENT,
  `letra_remito` char(1) NOT NULL DEFAULT 'R' ,
  `serie_remito` char(4) NOT NULL,
  `nro_remito` int(8) NOT NULL,
  `fecha_remito` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_entrega` timestamp,
  `cod_usuario` char(6) NOT NULL DEFAULT 'DOU000',
  `fecha_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`nro_envío`),
  KEY `ind_fecha_mod` (`fecha_mod`),
  KEY `ind_fecha_entrega` (`fecha_entrega`),
  KEY `ind_fk_nro_rem` (`nro_remito`),
  KEY `ind_fk_fecha_rem` (`fecha_remito`),
  KEY `ind_fk_cod_user13` (`cod_usuario`),
  CONSTRAINT `fk_letra_rem` FOREIGN KEY (`letra_remito`) REFERENCES `remitos` (`letra_remito`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_serie_rem` FOREIGN KEY (`serie_remito`) REFERENCES `remitos` (`serie_remito`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_nro_rem` FOREIGN KEY (`nro_remito`) REFERENCES `remitos` (`nro_remito`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_fecha_rem` FOREIGN KEY (`fecha_remito`) REFERENCES `remitos` (`fecha_remito`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_cod_user13` FOREIGN KEY (`cod_usuario`) REFERENCES `usuarios` (`cod_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE);

