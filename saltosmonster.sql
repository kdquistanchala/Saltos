-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 09, 2020 at 05:56 AM
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
(53, 46, 23, 'root@hotmail.com', '2653693'),
(55, 48, 23, 'karla@hotmail.com', '0987589664'),
(56, 49, 28, 'andrea@hotmail.com', '2653698');

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

-- --------------------------------------------------------

--
-- Table structure for table `horario`
--

CREATE TABLE `horario` (
  `HORARIO_ID` int(11) NOT NULL,
  `HORARIO_FECHA` date DEFAULT NULL,
  `HORARIO_HORA` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Table structure for table `modulotree`
--

CREATE TABLE `modulotree` (
  `mod_codigo` int(11) NOT NULL,
  `rol_id` int(11) DEFAULT NULL,
  `subsistema_id` int(11) DEFAULT NULL,
  `opcion_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `modulotree`
--

INSERT INTO `modulotree` (`mod_codigo`, `rol_id`, `subsistema_id`, `opcion_id`) VALUES
(1, 2, 1, 1),
(2, 2, 1, 12);

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
(4, 3, 'Registrar Vuelo', 'RegistrarVuelosReservas/CreateVueloSalto.xhtml'),
(5, 5, 'Gestionar mi perfil', 'GestionarMiPerfilCliente/Read.xhtml'),
(6, 10, 'Disponibilidad de vuelos', 'GestionarReservaParacaidista/ReadHorario.xhtml'),
(7, 11, 'Reserva', 'GestionarReservaParacaidista/ReadReserva.xhtml'),
(8, 6, 'Disponibilidad de vuelos', 'GestionarReservaCliente/ReadHorario.xhtml'),
(9, 7, 'Reserva', 'GestionarReservaCliente/ReadReserva.xhtml'),
(10, 3, 'Horarios', 'RegistrarVuelosReservas/ReadVueloSalto.xhtml'),
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

-- --------------------------------------------------------

--
-- Table structure for table `persona`
--

CREATE TABLE `persona` (
  `PERSONA_ID` int(11) NOT NULL,
  `PERSONA_NOMBRES` varchar(50) DEFAULT NULL,
  `PERSONA_APELLIDOS` varchar(50) DEFAULT NULL,
  `PERSONA_CEDULA` varchar(10) DEFAULT NULL,
  `PERSONA_FOTO` longblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `persona`
--

INSERT INTO `persona` (`PERSONA_ID`, `PERSONA_NOMBRES`, `PERSONA_APELLIDOS`, `PERSONA_CEDULA`, `PERSONA_FOTO`) VALUES
(53, 'root', 'root', '1720875879', NULL),
(55, 'Karla Daniela', 'Quistanchala Suntaxi', '1720875879', NULL),
(56, 'Andrea', 'Quistanchala', '1720875874', NULL);

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

-- --------------------------------------------------------

--
-- Table structure for table `reservavuelo`
--

CREATE TABLE `reservavuelo` (
  `codReserva` int(11) NOT NULL,
  `numVuelo` int(11) NOT NULL,
  `horarioVuelo` date NOT NULL,
  `pasajero` varchar(120) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `valor` decimal(10,0) NOT NULL,
  `equipo` decimal(10,0) NOT NULL,
  `camarografo` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservavuelo`
--

INSERT INTO `reservavuelo` (`codReserva`, `numVuelo`, `horarioVuelo`, `pasajero`, `tipo`, `valor`, `equipo`, `camarografo`) VALUES
(1, 1, '2020-09-09', 'Karla Daniela Quistanchala Suntaxi', 'tandem cliente', '308', '0', '70'),
(2, 1, '2020-09-09', 'Andrea Quistanchala', 'tandem instructor', '0', '0', '0');

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
(11, 20, 'Mis Reservas Libre');

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

-- --------------------------------------------------------

--
-- Table structure for table `tarifa`
--

CREATE TABLE `tarifa` (
  `TARIFA_ID` int(11) NOT NULL,
  `TARIFA_COSTO` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(21, 53, 2, 'root', '63a9f0ea7bb98050796b649e85481845'),
(22, 55, 1, 'karla@hotmail.com', '5fcd162c2418ef549b7b912976468942'),
(23, 56, 1, 'andrea@hotmail.com', '1c42f9c1ca2f65441465b43cd9339d6c');

-- --------------------------------------------------------

--
-- Table structure for table `usurol`
--

CREATE TABLE `usurol` (
  `usucodigo` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usurol`
--

INSERT INTO `usurol` (`usucodigo`, `rol_id`, `usuario_id`) VALUES
(3, 1, 22),
(4, 1, 23);

-- --------------------------------------------------------

--
-- Table structure for table `vuelo`
--

CREATE TABLE `vuelo` (
  `VUELO_ID` int(11) NOT NULL,
  `HORARIO_ID` int(11) NOT NULL,
  `VUELO_CODIGO` varchar(10) DEFAULT NULL,
  `VUELO_AVION` varchar(25) DEFAULT NULL,
  `VUELO_TANDEM` int(11) DEFAULT NULL,
  `VUELO_LIBRE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vuelosalto`
--

CREATE TABLE `vuelosalto` (
  `salto_id` int(11) NOT NULL,
  `vuelo_avion` varchar(25) DEFAULT NULL,
  `vuelo_tandem` int(11) DEFAULT NULL,
  `vuelo_libre` int(11) DEFAULT NULL,
  `horario_fecha` date DEFAULT NULL,
  `horario_hora` time DEFAULT NULL,
  `disponible` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vuelosalto`
--

INSERT INTO `vuelosalto` (`salto_id`, `vuelo_avion`, `vuelo_tandem`, `vuelo_libre`, `horario_fecha`, `horario_hora`, `disponible`) VALUES
(1, 'Cesnna 206', 2, 1, '2020-09-09', '15:00:00', 2);

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
-- Indexes for table `modulotree`
--
ALTER TABLE `modulotree`
  ADD PRIMARY KEY (`mod_codigo`);

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
-- Indexes for table `reservavuelo`
--
ALTER TABLE `reservavuelo`
  ADD PRIMARY KEY (`codReserva`);

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
-- Indexes for table `usurol`
--
ALTER TABLE `usurol`
  ADD PRIMARY KEY (`usucodigo`);

--
-- Indexes for table `vuelo`
--
ALTER TABLE `vuelo`
  ADD PRIMARY KEY (`VUELO_ID`),
  ADD KEY `FK_VUE_HOR` (`HORARIO_ID`);

--
-- Indexes for table `vuelosalto`
--
ALTER TABLE `vuelosalto`
  ADD PRIMARY KEY (`salto_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adicional`
--
ALTER TABLE `adicional`
  MODIFY `ADICIONAL_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `CLIENTE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `curso`
--
ALTER TABLE `curso`
  MODIFY `CURSO_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `horario`
--
ALTER TABLE `horario`
  MODIFY `HORARIO_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `libre`
--
ALTER TABLE `libre`
  MODIFY `LIBRE_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `licencia`
--
ALTER TABLE `licencia`
  MODIFY `LICENCIA_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modulotree`
--
ALTER TABLE `modulotree`
  MODIFY `mod_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `opcion`
--
ALTER TABLE `opcion`
  MODIFY `OPCION_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `paracaidista`
--
ALTER TABLE `paracaidista`
  MODIFY `PARACAIDISTA_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `persona`
--
ALTER TABLE `persona`
  MODIFY `PERSONA_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `reserva`
--
ALTER TABLE `reserva`
  MODIFY `RESERVA_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservavuelo`
--
ALTER TABLE `reservavuelo`
  MODIFY `codReserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rol`
--
ALTER TABLE `rol`
  MODIFY `ROL_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `subsistema`
--
ALTER TABLE `subsistema`
  MODIFY `SUBSISTEMA_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tandem`
--
ALTER TABLE `tandem`
  MODIFY `TANDEM_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tarifa`
--
ALTER TABLE `tarifa`
  MODIFY `TARIFA_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `USUARIO_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `usurol`
--
ALTER TABLE `usurol`
  MODIFY `usucodigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vuelo`
--
ALTER TABLE `vuelo`
  MODIFY `VUELO_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vuelosalto`
--
ALTER TABLE `vuelosalto`
  MODIFY `salto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
