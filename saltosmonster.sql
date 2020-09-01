-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 01, 2020 at 11:37 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `saltosmonster`
--

-- --------------------------------------------------------

--
-- Table structure for table `adicional`
--

CREATE TABLE `adicional` (
  `ADICIONAL_ID` int(11) NOT NULL,
  `TARIFA_ID` int(11) NOT NULL,
  `CAMAROGRAFO_ID` decimal(10,0) DEFAULT NULL,
  `EQUIPO_ID` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adicional`
--

INSERT INTO `adicional` (`ADICIONAL_ID`, `TARIFA_ID`, `CAMAROGRAFO_ID`, `EQUIPO_ID`) VALUES
(1, 1, '70', '0'),
(2, 2, '70', '0'),
(3, 3, '70', '0'),
(4, 4, '70', '0'),
(5, 5, '0', '0'),
(6, 6, '70', '0'),
(7, 7, '70', '0');

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `PERSONA_ID` int(11) NOT NULL,
  `CLIENTE_ID` int(11) NOT NULL,
  `CLIENTE_EDAD` int(11) DEFAULT NULL,
  `CLIENTE_CORREO` varchar(50) DEFAULT NULL,
  `CLIENTE_TELEFONO` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`PERSONA_ID`, `CLIENTE_ID`, `CLIENTE_EDAD`, `CLIENTE_CORREO`, `CLIENTE_TELEFONO`) VALUES
(21, 15, 20, 'admin@hotmail.com', '2658748'),
(22, 16, 23, 'karly@hotmail.com', '0987158665'),
(23, 17, 15, 'rosa@hotmail.com', '2653963'),
(24, 18, 18, 'andrea@hotmail.com', '26536987'),
(25, 19, 30, 'rosa@hotmail.com', '2658978'),
(26, 20, 25, 'andrea@hotmail.com', '2658963'),
(27, 21, 16, 'hilda@hotmail.com', '0987158997'),
(33, 27, 23, 'renzormalla@gmail.com', '0996315006'),
(34, 28, 24, 'alejo@gmail.com', '062600485'),
(35, 29, 24, 'alejo@gmail.com', '062600485');

-- --------------------------------------------------------

--
-- Table structure for table `curso`
--

CREATE TABLE `curso` (
  `CURSO_ID` int(11) NOT NULL,
  `CLIENTE_ID` int(11) NOT NULL,
  `PARACAIDISTA_ID` int(11) NOT NULL,
  `CURSO_TIPO` varchar(50) DEFAULT NULL,
  `CURSO_LUGAR` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `curso`
--

INSERT INTO `curso` (`CURSO_ID`, `CLIENTE_ID`, `PARACAIDISTA_ID`, `CURSO_TIPO`, `CURSO_LUGAR`) VALUES
(1, 16, 1, 'Agua', 'Agua');

-- --------------------------------------------------------

--
-- Table structure for table `horario`
--

CREATE TABLE `horario` (
  `HORARIO_ID` int(11) NOT NULL,
  `HORARIO_FECHA` date DEFAULT NULL,
  `HORARIO_HORA` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `horario`
--

INSERT INTO `horario` (`HORARIO_ID`, `HORARIO_FECHA`, `HORARIO_HORA`) VALUES
(11, '2020-08-31', '15:00:00'),
(12, '2020-08-17', '15:00:00'),
(13, '2020-08-27', '18:00:00'),
(14, '2020-09-30', '13:00:00'),
(15, '2020-09-03', '15:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `libre`
--

CREATE TABLE `libre` (
  `LIBRE_ID` int(11) NOT NULL,
  `CLIENTE_ID` int(11) NOT NULL,
  `PARACAIDISTA_ID` int(11) NOT NULL,
  `VUELO_ID` int(11) NOT NULL,
  `LIBRE_DESCRIPCION` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `libre`
--

INSERT INTO `libre` (`LIBRE_ID`, `CLIENTE_ID`, `PARACAIDISTA_ID`, `VUELO_ID`, `LIBRE_DESCRIPCION`) VALUES
(1, 16, 1, 1, 'Libre');

-- --------------------------------------------------------

--
-- Table structure for table `licencia`
--

CREATE TABLE `licencia` (
  `LICENCIA_ID` int(11) NOT NULL,
  `CLIENTE_ID` int(11) NOT NULL,
  `PARACAIDISTA_ID` int(11) NOT NULL,
  `LICENCIA_CADUCIDAD` date DEFAULT NULL,
  `LICENCIA_TIPO` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `licencia`
--

INSERT INTO `licencia` (`LICENCIA_ID`, `CLIENTE_ID`, `PARACAIDISTA_ID`, `LICENCIA_CADUCIDAD`, `LICENCIA_TIPO`) VALUES
(1, 10, 1, '2020-08-17', 'B'),
(2, 9, 2, '2020-08-18', 'D'),
(3, 13, 3, '2022-08-10', 'B'),
(4, 16, 1, '2020-08-03', 'D');

-- --------------------------------------------------------

--
-- Table structure for table `opcion`
--

CREATE TABLE `opcion` (
  `OPCION_ID` int(11) NOT NULL,
  `SUBSISTEMA_ID` int(11) NOT NULL,
  `OPCION_DESCRIPCION` varchar(30) DEFAULT NULL,
  `OPCION_VISTA` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `opcion`
--

INSERT INTO `opcion` (`OPCION_ID`, `SUBSISTEMA_ID`, `OPCION_DESCRIPCION`, `OPCION_VISTA`) VALUES
(1, 1, 'Gestionar Perfiles', 'GestionarRoles/ReadD.xhtml'),
(2, 2, 'Gestionar Usuarios', 'GestionarClienteA/Read.xhtml'),
(4, 3, 'Registrar Vuelo', 'GestionarVuelos/Create.xhtml'),
(5, 5, 'Gestionar mi perfil', 'GestionarMiPerfilCliente/Read.xhtml'),
(6, 10, 'Disponibilidad de vuelos', 'GestionarReservaParacaidista/ReadHorario.xhtml'),
(7, 11, 'Reserva', 'GestionarReservaParacaidista/ReadReserva.xhtml'),
(8, 6, 'Disponibilidad de vuelos', 'GestionarReservaCliente/ReadHorario.xhtml'),
(9, 7, 'Reserva', 'GestionarReservaCliente/ReadReserva.xhtml'),
(10, 3, 'Horarios', 'GestionarVuelos/ReadHorario.xhtml'),
(11, 3, 'Informacion de vuelos', 'GestionarVuelos/ReadInforme.xhtml'),
(12, 1, 'Gestionar Opciones', 'GestionarRoles/ReadRO.xhtml');

-- --------------------------------------------------------

--
-- Table structure for table `paracaidista`
--

CREATE TABLE `paracaidista` (
  `PERSONA_ID` int(11) NOT NULL,
  `CLIENTE_ID` int(11) NOT NULL,
  `PARACAIDISTA_ID` int(11) NOT NULL,
  `PARACAIDISTA_TIPO` varchar(40) DEFAULT NULL,
  `PARACAIDISTA_ESCUELA` varchar(50) DEFAULT NULL,
  `PARACAIDISTA_NUMSALTOS` int(11) DEFAULT NULL,
  `PARACAIDISTA_FECHASALTO` date DEFAULT NULL,
  `PARACAIDISTA_FOTO` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paracaidista`
--

INSERT INTO `paracaidista` (`PERSONA_ID`, `CLIENTE_ID`, `PARACAIDISTA_ID`, `PARACAIDISTA_TIPO`, `PARACAIDISTA_ESCUELA`, `PARACAIDISTA_NUMSALTOS`, `PARACAIDISTA_FECHASALTO`, `PARACAIDISTA_FOTO`) VALUES
(22, 16, 1, 'Civil', 'ESPE', 15, '2020-08-26', 'FOTO');

-- --------------------------------------------------------

--
-- Table structure for table `persona`
--

CREATE TABLE `persona` (
  `PERSONA_ID` int(11) NOT NULL,
  `PERSONA_NOMBRES` varchar(50) DEFAULT NULL,
  `PERSONA_APELLIDOS` varchar(50) DEFAULT NULL,
  `PERSONA_CEDULA` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `persona`
--

INSERT INTO `persona` (`PERSONA_ID`, `PERSONA_NOMBRES`, `PERSONA_APELLIDOS`, `PERSONA_CEDULA`) VALUES
(14, 'Sonia Josefina', 'Suntaxi', '1706908090'),
(15, 'Gabriel', 'Saenz', '0400801064'),
(16, 'Karla', 'Quistanchala', '1720875879'),
(17, 'ANDREA', 'QUISTANCHALA', '1720875874'),
(18, 'ROSA', 'SANCHEZ', '1720875876'),
(19, 'Renzo Renato', 'Malla Intriago', '1723914378'),
(20, 'ANNIE', 'SUNTAXI', '1740508097'),
(21, 'Admin', 'Admin', '1740508090'),
(22, 'KARLA DANIELA', 'QUISTANCHALA SUNTAXI', '1720875879'),
(23, 'ROSA', 'SANCHEZ', '1720875879'),
(24, 'ANDREA', 'SUNTAXI', '1720875874'),
(25, 'ROSA', 'SANCHEZ', '1740508293'),
(26, 'Andrea', 'Suntaxi', '1740208056'),
(27, 'HILDA', 'MUÑOZ', '1720875874'),
(33, 'Renzo', 'Malla', '1723914378'),
(34, 'Michael', 'Villarruel', '1004017156'),
(35, 'Michael', 'Villarruel', '1004013156');

-- --------------------------------------------------------

--
-- Table structure for table `reserva`
--

CREATE TABLE `reserva` (
  `RESERVA_ID` int(11) NOT NULL,
  `VUELO_ID` int(11) NOT NULL,
  `TARIFA_ID` int(11) NOT NULL,
  `CLIENTE_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reserva`
--

INSERT INTO `reserva` (`RESERVA_ID`, `VUELO_ID`, `TARIFA_ID`, `CLIENTE_ID`) VALUES
(1, 1, 1, 17),
(2, 1, 2, 16),
(3, 2, 3, 17),
(4, 2, 4, 18),
(5, 5, 5, 27),
(6, 4, 6, 27),
(7, 1, 7, 29);

-- --------------------------------------------------------

--
-- Table structure for table `rol`
--

CREATE TABLE `rol` (
  `ROL_ID` int(11) NOT NULL,
  `ROL_DESCRIPCION` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rol`
--

INSERT INTO `rol` (`ROL_ID`, `ROL_DESCRIPCION`) VALUES
(1, 'Cliente'),
(2, 'Administrador'),
(3, 'Paracaidista'),
(4, 'Contador'),
(5, 'Venta'),
(9, 'Contabilidad'),
(10, 'Area financiera'),
(16, 'Gerentes'),
(17, 'Prueba'),
(18, 'No asignado'),
(20, 'System Manager');

-- --------------------------------------------------------

--
-- Table structure for table `subsistema`
--

CREATE TABLE `subsistema` (
  `SUBSISTEMA_ID` int(11) NOT NULL,
  `ROL_ID` int(11) NOT NULL,
  `SUBSISTEMA_DESCRIPCION` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subsistema`
--

INSERT INTO `subsistema` (`SUBSISTEMA_ID`, `ROL_ID`, `SUBSISTEMA_DESCRIPCION`) VALUES
(1, 2, 'Seguridad'),
(2, 2, 'Personal'),
(3, 2, 'Saltos'),
(4, 2, 'Finanzas'),
(5, 1, 'Mi Perfil'),
(6, 1, 'Compra Tandem'),
(7, 1, 'Mis Reservas Tandem'),
(10, 20, 'Compra Libre'),
(11, 20, 'Mis Reservas Libre'),
(15, 20, 'Prueba Rol');

-- --------------------------------------------------------

--
-- Table structure for table `tandem`
--

CREATE TABLE `tandem` (
  `TANDEM_ID` int(11) NOT NULL,
  `PERSONA_ID` int(11) NOT NULL,
  `CLIENTE_ID` int(11) NOT NULL,
  `VUELO_ID` int(11) NOT NULL,
  `TANDEM_DESCRIPCION` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tandem`
--

INSERT INTO `tandem` (`TANDEM_ID`, `PERSONA_ID`, `CLIENTE_ID`, `VUELO_ID`, `TANDEM_DESCRIPCION`) VALUES
(1, 23, 17, 1, 'Tandem'),
(2, 23, 17, 2, 'Tandem'),
(3, 24, 18, 2, 'Tandem'),
(4, 33, 27, 5, 'Tandem'),
(5, 33, 27, 4, 'Tandem'),
(6, 35, 29, 1, 'Tandem');

-- --------------------------------------------------------

--
-- Table structure for table `tarifa`
--

CREATE TABLE `tarifa` (
  `TARIFA_ID` int(11) NOT NULL,
  `TARIFA_COSTO` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tarifa`
--

INSERT INTO `tarifa` (`TARIFA_ID`, `TARIFA_COSTO`) VALUES
(1, '308'),
(2, '40'),
(3, '308'),
(4, '308'),
(5, '308'),
(6, '308'),
(7, '308');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `USUARIO_ID` int(11) NOT NULL,
  `PERSONA_ID` int(11) NOT NULL,
  `ROL_ID` int(11) NOT NULL,
  `USUARIO_NOMBRE` varchar(50) DEFAULT NULL,
  `USUARIO_PASSWORD` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`USUARIO_ID`, `PERSONA_ID`, `ROL_ID`, `USUARIO_NOMBRE`, `USUARIO_PASSWORD`) VALUES
(13, 21, 2, 'root', '63a9f0ea7bb98050796b649e85481845'),
(14, 22, 18, 'kdquistanchala', '5fcd162c2418ef549b7b912976468942'),
(15, 23, 18, 'rosa', '600c8fc5ac61fddcd128c6f6521e809d'),
(16, 24, 18, 'andrea', '1c42f9c1ca2f65441465b43cd9339d6c'),
(18, 26, 18, 'andreas', 'e024f9589c1e9d64b34cb1257d9c9dfc'),
(19, 33, 1, 'rrmalla', '8232e119d8f59aa83050a741631803a6'),
(20, 35, 1, 'mvillarruel', '25d55ad283aa400af464c76d713c07ad');

-- --------------------------------------------------------

--
-- Table structure for table `vuelo`
--

CREATE TABLE `vuelo` (
  `VUELO_ID` int(11) NOT NULL,
  `HORARIO_ID` int(11) NOT NULL,
  `VUELO_CODIGO` varchar(10) DEFAULT NULL,
  `VUELO_AVION` varchar(25) DEFAULT NULL,
  `VUELO_CAPACIDAD` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vuelo`
--

INSERT INTO `vuelo` (`VUELO_ID`, `HORARIO_ID`, `VUELO_CODIGO`, `VUELO_AVION`, `VUELO_CAPACIDAD`) VALUES
(1, 11, 'Vuelo 11', 'Cesnna 206', 2),
(2, 12, 'Vuelo 12', 'Cesnna 206', 2),
(3, 13, 'Vuelo 13', 'Cesnna 206', 2),
(4, 14, 'Vuelo 14', 'Cesnna 206', 2),
(5, 15, 'Vuelo 15', 'Cesnna 206', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adicional`
--
ALTER TABLE `adicional`
  ADD PRIMARY KEY (`ADICIONAL_ID`),
  ADD KEY `FK_TAR_ADI` (`TARIFA_ID`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CLIENTE_ID`),
  ADD KEY `FK_PER_CLI` (`PERSONA_ID`);

--
-- Indexes for table `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`CURSO_ID`),
  ADD KEY `PAR_CUR_FK` (`CLIENTE_ID`,`PARACAIDISTA_ID`);

--
-- Indexes for table `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`HORARIO_ID`);

--
-- Indexes for table `libre`
--
ALTER TABLE `libre`
  ADD PRIMARY KEY (`LIBRE_ID`),
  ADD KEY `PAR_LIB_FK` (`CLIENTE_ID`,`PARACAIDISTA_ID`),
  ADD KEY `FK_LIB_VUE` (`VUELO_ID`);

--
-- Indexes for table `licencia`
--
ALTER TABLE `licencia`
  ADD PRIMARY KEY (`LICENCIA_ID`),
  ADD KEY `PAR_LIC_FK` (`CLIENTE_ID`,`PARACAIDISTA_ID`);

--
-- Indexes for table `opcion`
--
ALTER TABLE `opcion`
  ADD PRIMARY KEY (`OPCION_ID`),
  ADD KEY `FK_SUB_OPC` (`SUBSISTEMA_ID`);

--
-- Indexes for table `paracaidista`
--
ALTER TABLE `paracaidista`
  ADD PRIMARY KEY (`PARACAIDISTA_ID`),
  ADD KEY `FK_CLI_PAR` (`PERSONA_ID`,`CLIENTE_ID`);

--
-- Indexes for table `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`PERSONA_ID`);

--
-- Indexes for table `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`RESERVA_ID`),
  ADD KEY `FK_RES_TAR` (`TARIFA_ID`),
  ADD KEY `FK_VUE_RES` (`VUELO_ID`);

--
-- Indexes for table `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`ROL_ID`);

--
-- Indexes for table `subsistema`
--
ALTER TABLE `subsistema`
  ADD PRIMARY KEY (`SUBSISTEMA_ID`),
  ADD KEY `FK_ROL_SUB` (`ROL_ID`);

--
-- Indexes for table `tandem`
--
ALTER TABLE `tandem`
  ADD PRIMARY KEY (`TANDEM_ID`),
  ADD KEY `FK_CLI_TAN` (`PERSONA_ID`,`CLIENTE_ID`),
  ADD KEY `FK_TAN_VUE` (`VUELO_ID`);

--
-- Indexes for table `tarifa`
--
ALTER TABLE `tarifa`
  ADD PRIMARY KEY (`TARIFA_ID`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`USUARIO_ID`),
  ADD KEY `FK_PER_USU` (`PERSONA_ID`),
  ADD KEY `FK_ROL_USU` (`ROL_ID`);

--
-- Indexes for table `vuelo`
--
ALTER TABLE `vuelo`
  ADD PRIMARY KEY (`VUELO_ID`),
  ADD KEY `FK_VUE_HOR` (`HORARIO_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adicional`
--
ALTER TABLE `adicional`
  MODIFY `ADICIONAL_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `CLIENTE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `curso`
--
ALTER TABLE `curso`
  MODIFY `CURSO_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `horario`
--
ALTER TABLE `horario`
  MODIFY `HORARIO_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `libre`
--
ALTER TABLE `libre`
  MODIFY `LIBRE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `licencia`
--
ALTER TABLE `licencia`
  MODIFY `LICENCIA_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `opcion`
--
ALTER TABLE `opcion`
  MODIFY `OPCION_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `paracaidista`
--
ALTER TABLE `paracaidista`
  MODIFY `PARACAIDISTA_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `persona`
--
ALTER TABLE `persona`
  MODIFY `PERSONA_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `reserva`
--
ALTER TABLE `reserva`
  MODIFY `RESERVA_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `rol`
--
ALTER TABLE `rol`
  MODIFY `ROL_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `subsistema`
--
ALTER TABLE `subsistema`
  MODIFY `SUBSISTEMA_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tandem`
--
ALTER TABLE `tandem`
  MODIFY `TANDEM_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tarifa`
--
ALTER TABLE `tarifa`
  MODIFY `TARIFA_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `USUARIO_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `vuelo`
--
ALTER TABLE `vuelo`
  MODIFY `VUELO_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adicional`
--
ALTER TABLE `adicional`
  ADD CONSTRAINT `FK_TAR_ADI` FOREIGN KEY (`TARIFA_ID`) REFERENCES `tarifa` (`TARIFA_ID`);

--
-- Constraints for table `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `FK_PER_CLI` FOREIGN KEY (`PERSONA_ID`) REFERENCES `persona` (`PERSONA_ID`);

--
-- Constraints for table `libre`
--
ALTER TABLE `libre`
  ADD CONSTRAINT `FK_LIB_VUE` FOREIGN KEY (`VUELO_ID`) REFERENCES `vuelo` (`VUELO_ID`);

--
-- Constraints for table `opcion`
--
ALTER TABLE `opcion`
  ADD CONSTRAINT `FK_SUB_OPC` FOREIGN KEY (`SUBSISTEMA_ID`) REFERENCES `subsistema` (`SUBSISTEMA_ID`);

--
-- Constraints for table `paracaidista`
--
ALTER TABLE `paracaidista`
  ADD CONSTRAINT `FK_CLI_PAR` FOREIGN KEY (`PERSONA_ID`,`CLIENTE_ID`) REFERENCES `cliente` (`PERSONA_ID`, `CLIENTE_ID`);

--
-- Constraints for table `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `FK_RES_TAR` FOREIGN KEY (`TARIFA_ID`) REFERENCES `tarifa` (`TARIFA_ID`),
  ADD CONSTRAINT `FK_VUE_RES` FOREIGN KEY (`VUELO_ID`) REFERENCES `vuelo` (`VUELO_ID`);

--
-- Constraints for table `subsistema`
--
ALTER TABLE `subsistema`
  ADD CONSTRAINT `FK_ROL_SUB` FOREIGN KEY (`ROL_ID`) REFERENCES `rol` (`ROL_ID`);

--
-- Constraints for table `tandem`
--
ALTER TABLE `tandem`
  ADD CONSTRAINT `FK_CLI_TAN` FOREIGN KEY (`PERSONA_ID`,`CLIENTE_ID`) REFERENCES `cliente` (`PERSONA_ID`, `CLIENTE_ID`),
  ADD CONSTRAINT `FK_TAN_VUE` FOREIGN KEY (`VUELO_ID`) REFERENCES `vuelo` (`VUELO_ID`);

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_PER_USU` FOREIGN KEY (`PERSONA_ID`) REFERENCES `persona` (`PERSONA_ID`),
  ADD CONSTRAINT `FK_ROL_USU` FOREIGN KEY (`ROL_ID`) REFERENCES `rol` (`ROL_ID`);

--
-- Constraints for table `vuelo`
--
ALTER TABLE `vuelo`
  ADD CONSTRAINT `FK_VUE_HOR` FOREIGN KEY (`HORARIO_ID`) REFERENCES `horario` (`HORARIO_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
