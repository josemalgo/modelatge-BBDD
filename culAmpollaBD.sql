-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-03-2020 a las 00:18:51
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `culAmpolla`
--
CREATE DATABASE IF NOT EXISTS `culAmpolla` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `culAmpolla`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `address`
--

CREATE TABLE `address` (
  `idAddress` int(11) NOT NULL,
  `street` varchar(45) NOT NULL,
  `number` int(4) NOT NULL,
  `floor` int(3) NOT NULL,
  `door` int(2) NOT NULL,
  `city` varchar(45) NOT NULL,
  `zipCode` int(5) NOT NULL,
  `country` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `address`
--

INSERT INTO `address` (`idAddress`, `street`, `number`, `floor`, `door`, `city`, `zipCode`, `country`) VALUES
(1, 'martorell', 13, 4, 2, 'bcn', 88803, 'España'),
(3, 'mas', 12, 3, 1, 'bcn', 88902, 'españa'),
(4, 'rest', 122, 1, 4, 'val', 28906, 'españa'),
(5, 'oriente', 43, 2, 4, 'mad', 99902, 'españa'),
(6, 'llança', 2, 5, 4, 'cad', 23232, 'españa'),
(7, 'olzinelles', 23, 1, 4, 'bcn', 8654, 'España'),
(8, 'Riego', 12, 3, 2, 'bcn', 8417, 'España'),
(9, 'Valencia', 312, 4, 3, 'bcn', 8687, 'España'),
(10, 'Mallorca', 102, 1, 2, 'bcn', 8128, 'España');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `idBrands` int(11) NOT NULL,
  `Suppliers_idSuppliers` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`idBrands`, `Suppliers_idSuppliers`, `name`) VALUES
(3, 1, 'Police'),
(5, 1, 'Ray-Ban'),
(6, 2, 'Oackley'),
(7, 1, 'Vogue'),
(8, 2, 'Polaroid'),
(9, 4, 'Carrera'),
(10, 3, 'Gucci');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `idCustomers` int(11) NOT NULL,
  `Address_idAddress` int(11) NOT NULL,
  `Customers_idCustomers` int(11) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `phone` int(9) NOT NULL,
  `email` varchar(60) NOT NULL,
  `dateReg` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `customers`
--

INSERT INTO `customers` (`idCustomers`, `Address_idAddress`, `Customers_idCustomers`, `name`, `phone`, `email`, `dateReg`) VALUES
(1, 3, NULL, 'Ramon Caceres', 675498623, 'ramoncaceres@gmail.com', '2020-03-10'),
(2, 7, 1, 'Silvia Gascón', 654793123, 'SilviaGascon@gmail.com', '2020-03-11'),
(3, 8, NULL, 'Genaro Urcullo', 654768522, 'Genarourcullo@gmail.com', '2020-03-11'),
(4, 8, 3, 'Pepe Ruiz', 675890009, 'peperuiz@gmail.com', '2020-03-16'),
(5, 10, 1, 'Ana Sanchez', 655445454, 'anasanchez@gmail.com', '2020-03-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee`
--

CREATE TABLE `employee` (
  `idEmployee` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `nif` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `employee`
--

INSERT INTO `employee` (`idEmployee`, `name`, `nif`) VALUES
(1, 'Rubén Sanchez', '34321453c'),
(2, 'Vicente Amigo', '34234565k'),
(3, 'Paco Estrada', '64523222r');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glasses`
--

CREATE TABLE `glasses` (
  `idGlasses` int(11) NOT NULL,
  `Brands_idBrands` int(11) NOT NULL,
  `rightGraduation` float NOT NULL,
  `leftGraduation` float NOT NULL,
  `type` enum('Pasta','Flotant','Metalica') NOT NULL,
  `color` varchar(45) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `glasses`
--

INSERT INTO `glasses` (`idGlasses`, `Brands_idBrands`, `rightGraduation`, `leftGraduation`, `type`, `color`, `price`) VALUES
(1, 9, 0.5, 1.25, 'Pasta', 'negro', 90),
(2, 9, 0.5, 1.25, 'Pasta', 'rojo', 23.58),
(3, 10, 0.75, 1, 'Flotant', 'red', 69.5),
(4, 9, 0, 0, 'Metalica', 'amarillo', 80),
(5, 5, 3, 2.75, 'Pasta', 'marron', 55),
(6, 5, 3, 4, 'Flotant', 'azul', 76),
(7, 3, 1, 1, 'Metalica', 'verde', 65),
(8, 3, 1, 1.25, 'Metalica', 'verde', 65),
(9, 6, 3, 2, 'Metalica', 'rojo', 90),
(10, 6, 3.75, 2.75, 'Metalica', 'rojo', 90),
(11, 7, 2, 2.5, 'Pasta', 'marron', 70),
(12, 10, 0, 0, '', '', 0),
(13, 8, 0.5, 0.75, 'Pasta', 'azul', 56);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoice`
--

CREATE TABLE `invoice` (
  `idInvoice` int(11) NOT NULL,
  `Customers_idCustomers` int(11) NOT NULL,
  `Employee_idEmployee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `invoice`
--

INSERT INTO `invoice` (`idInvoice`, `Customers_idCustomers`, `Employee_idEmployee`) VALUES
(1, 1, 2),
(2, 2, 2),
(3, 3, 1),
(4, 4, 3),
(5, 5, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoicedetails`
--

CREATE TABLE `invoicedetails` (
  `idInvoiceDetails` int(11) NOT NULL,
  `Invoice_idInvoice` int(11) NOT NULL,
  `Glasses_idGlasses` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `invoicedetails`
--

INSERT INTO `invoicedetails` (`idInvoiceDetails`, `Invoice_idInvoice`, `Glasses_idGlasses`) VALUES
(3, 2, 2),
(4, 3, 3),
(6, 4, 4),
(1, 1, 6),
(7, 5, 7),
(5, 3, 9),
(8, 5, 11),
(2, 1, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suppliers`
--

CREATE TABLE `suppliers` (
  `idSuppliers` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `phone` int(9) NOT NULL,
  `fax` int(9) NOT NULL,
  `nif` varchar(9) NOT NULL,
  `Address_idAddress` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `suppliers`
--

INSERT INTO `suppliers` (`idSuppliers`, `name`, `phone`, `fax`, `nif`, `Address_idAddress`) VALUES
(1, 'Amazon', 934564564, 934564567, '34546756c', 1),
(2, 'Moxyn', 912345567, 912342341, '22316954k', 4),
(3, 'Comercial ernest', 943234234, 945345876, '38494523c', 5),
(4, 'Prosun', 967123733, 967429836, '38438454r', 6);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`idAddress`);

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`idBrands`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `fk_Brands_Suppliers_idx` (`Suppliers_idSuppliers`);

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`idCustomers`),
  ADD KEY `fk_Customers_Address1_idx` (`Address_idAddress`),
  ADD KEY `fk_Customers_Customers1_idx` (`Customers_idCustomers`);

--
-- Indices de la tabla `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`idEmployee`);

--
-- Indices de la tabla `glasses`
--
ALTER TABLE `glasses`
  ADD PRIMARY KEY (`idGlasses`),
  ADD KEY `fk_Glasses_Brands1_idx` (`Brands_idBrands`);

--
-- Indices de la tabla `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`idInvoice`),
  ADD KEY `fk_Invoice_Customers1_idx` (`Customers_idCustomers`),
  ADD KEY `fk_Invoice_Employee1_idx` (`Employee_idEmployee`);

--
-- Indices de la tabla `invoicedetails`
--
ALTER TABLE `invoicedetails`
  ADD PRIMARY KEY (`idInvoiceDetails`,`Invoice_idInvoice`),
  ADD KEY `fk_Invoice_has_Glasses_Glasses1_idx` (`Glasses_idGlasses`),
  ADD KEY `fk_Invoice_has_Glasses_Invoice1_idx` (`Invoice_idInvoice`);

--
-- Indices de la tabla `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`idSuppliers`),
  ADD KEY `fk_Suppliers_Address1_idx` (`Address_idAddress`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `address`
--
ALTER TABLE `address`
  MODIFY `idAddress` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `brands`
--
ALTER TABLE `brands`
  MODIFY `idBrands` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `customers`
--
ALTER TABLE `customers`
  MODIFY `idCustomers` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `employee`
--
ALTER TABLE `employee`
  MODIFY `idEmployee` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `glasses`
--
ALTER TABLE `glasses`
  MODIFY `idGlasses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `invoice`
--
ALTER TABLE `invoice`
  MODIFY `idInvoice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `invoicedetails`
--
ALTER TABLE `invoicedetails`
  MODIFY `idInvoiceDetails` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `idSuppliers` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `fk_Brands_Suppliers` FOREIGN KEY (`Suppliers_idSuppliers`) REFERENCES `suppliers` (`idSuppliers`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `fk_Customers_Address1` FOREIGN KEY (`Address_idAddress`) REFERENCES `address` (`idAddress`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Customers_Customers1` FOREIGN KEY (`Customers_idCustomers`) REFERENCES `customers` (`idCustomers`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `glasses`
--
ALTER TABLE `glasses`
  ADD CONSTRAINT `fk_Glasses_Brands1` FOREIGN KEY (`Brands_idBrands`) REFERENCES `brands` (`idBrands`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `fk_Invoice_Customers1` FOREIGN KEY (`Customers_idCustomers`) REFERENCES `customers` (`idCustomers`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Invoice_Employee1` FOREIGN KEY (`Employee_idEmployee`) REFERENCES `employee` (`idEmployee`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `invoicedetails`
--
ALTER TABLE `invoicedetails`
  ADD CONSTRAINT `fk_Invoice_has_Glasses_Glasses1` FOREIGN KEY (`Glasses_idGlasses`) REFERENCES `glasses` (`idGlasses`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Invoice_has_Glasses_Invoice1` FOREIGN KEY (`Invoice_idInvoice`) REFERENCES `invoice` (`idInvoice`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `suppliers`
--
ALTER TABLE `suppliers`
  ADD CONSTRAINT `fk_Suppliers_Address1` FOREIGN KEY (`Address_idAddress`) REFERENCES `address` (`idAddress`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
