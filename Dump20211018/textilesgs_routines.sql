-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: textilesgs
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `producto_venta`
--

DROP TABLE IF EXISTS `producto_venta`;
/*!50001 DROP VIEW IF EXISTS `producto_venta`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `producto_venta` AS SELECT 
 1 AS `idproducto`,
 1 AS `nombre`,
 1 AS `estilo`,
 1 AS `color`,
 1 AS `cant_rollo`,
 1 AS `yardaporrollo`,
 1 AS `cant_yarda`,
 1 AS `precio_rollo`,
 1 AS `precio_yarda`,
 1 AS `ubicacion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `numero_orden`
--

DROP TABLE IF EXISTS `numero_orden`;
/*!50001 DROP VIEW IF EXISTS `numero_orden`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `numero_orden` AS SELECT 
 1 AS `numero_orden`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `producto_venta`
--

/*!50001 DROP VIEW IF EXISTS `producto_venta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `producto_venta` AS select `p`.`idproducto` AS `idproducto`,`p`.`nombre` AS `nombre`,`p`.`estilo` AS `estilo`,`p`.`color` AS `color`,`p`.`cant_rollo` AS `cant_rollo`,`p`.`yardaporrollo` AS `yardaporrollo`,`p`.`cant_yarda` AS `cant_yarda`,`pr`.`preciorollo` AS `precio_rollo`,`pr`.`precioyarda` AS `precio_yarda`,`p`.`ubicacion` AS `ubicacion` from (`producto` `p` left join `precio` `pr` on(((`pr`.`idproducto` = `p`.`idproducto`) and (`pr`.`preciorollo` = (select max(`precio`.`preciorollo`) from `precio` where (`precio`.`idproducto` = `p`.`idproducto`)))))) where ((`p`.`cant_rollo` > 0) or (`p`.`cant_yarda` > 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `numero_orden`
--

/*!50001 DROP VIEW IF EXISTS `numero_orden`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `numero_orden` AS select (coalesce(max(`factura`.`idfactura`),0) + 1) AS `numero_orden` from `factura` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-18 21:29:00
