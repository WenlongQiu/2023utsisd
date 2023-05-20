-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 20, 2023 at 07:33 PM
-- Server version: 10.5.18-MariaDB-0+deb11u1
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `isd`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cartID` int(11) NOT NULL,
  `deviceID` int(11) NOT NULL,
  `deviceName` text NOT NULL,
  `amount` int(11) NOT NULL,
  `unitprice` double NOT NULL,
  `price` int(11) NOT NULL,
  `token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cartID`, `deviceID`, `deviceName`, `amount`, `unitprice`, `price`, `token`) VALUES
(25132695, 123, 'Raspberry Pi', 123, 100, 12300, '13886410'),
(25132695, 46781235, 'Security Camera', 2, 150, 300, '55458710'),
(25132695, 23741968, 'Wireless Headphones', 3, 100, 300, '24771680'),
(25132695, 59327684, 'Smart Lock', 23, 180, 4140, '41335776'),
(25132695, 72581934, 'Smart Doorbell', 2, 200, 400, '81136016'),
(65714786, 46781235, 'Security Camera', 3, 150, 450, '89762164'),
(65714786, 19257834, 'Fitness Tracker', 12, 80, 960, '84567191'),
(68985347, 123, 'Raspberry Pi', 10, 100, 1000, '53567532'),
(68985347, 18732945, 'Smart Air Conditioner', 10, 400, 4000, '24320793'),
(36307214, 123, 'Raspberry Pi', 12, 100, 1200, '99491133'),
(54372630, 123, 'Raspberry Pi', 12, 100, 1200, '72023743'),
(33008674, 123, 'Raspberry Pi', 12, 100, 1200, '85999540'),
(56540780, 18732945, 'Smart Air Conditioner', 12, 400, 4800, '54269890'),
(77363364, 18732945, 'Smart Air Conditioner', 12, 400, 4800, '23423652'),
(49549192, 23741968, 'Wireless Headphones', 12, 100, 1200, '64170700'),
(50846020, 23741968, 'Wireless Headphones', 2, 100, 200, '46791344'),
(56540780, 19257834, 'Fitness Tracker', 1, 80, 80, '79231458'),
(85721886, 123, 'Raspberry Pi', 13, 100, 1300, '34459019'),
(42265871, 123, 'Raspberry Pi', 4, 100, 400, '91039046'),
(68204074, 123, 'Raspberry Pi', 2, 100, 200, '10608490'),
(43197268, 123, 'Raspberry Pi', 2, 100, 200, '64468373'),
(43197268, 19257834, 'Fitness Tracker', 12, 80, 960, '31245149'),
(987654321, 23741968, 'JUnit Test', 1, 80, 80, '987654321'),
(89658045, 123, 'Raspberry Pi', 12, 100, 1200, '83009632'),
(89658045, 123, 'Raspberry Pi', 12, 100, 1200, '90651793'),
(17213384, 123, 'Raspberry Pi', 1, 100, 100, '60441687'),
(24006973, 123, 'Raspberry Pi', 1, 100, 100, '88256068'),
(48123262, 123, 'Raspberry Pi', 1, 100, 100, '98147453'),
(48123262, 123, 'Raspberry Pi', 1, 100, 100, '55381176'),
(96287077, 123, 'Raspberry Pi', 1, 100, 100, '48824373'),
(69435068, 123, 'Raspberry Pi', 1, 100, 100, '30018795'),
(82414742, 123, 'Raspberry Pi', 2, 100, 200, '91127730'),
(21598002, 123, 'Raspberry P', 2, 100, 200, '85794575'),
(59508303, 123, 'Raspberry P', 3, 100, 300, '75216947'),
(42265871, 123, 'Raspberry P', 2, 100, 200, '19938963');

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `deviceID` int(11) NOT NULL,
  `deviceName` text NOT NULL,
  `deviceDescription` text NOT NULL,
  `amount` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`deviceID`, `deviceName`, `deviceDescription`, `amount`, `price`) VALUES
(123, 'Raspberry P', 'A simple IoT Board', 100, 100),
(18732945, 'Smart Air Conditioner', 'Wi-Fi enabled air conditioner with smart temperature control', 6, 400),
(19257834, 'Fitness Tracker', 'Wristband fitness tracker with heart rate monitor', 15, 80),
(23741968, 'Wireless Headphones', 'Bluetooth wireless headphones with noise cancellation', 9, 100),
(30915682, 'Robot Vacuum', 'Autonomous vacuum cleaner with smart mapping technology', 4, 350),
(32174859, 'Smart Mirror', 'Interactive mirror with built-in display and voice assistant', 3, 300),
(37269148, 'Smart Speaker', 'Voice-controlled smart speaker with built-in virtual assistant', 12, 120),
(41985623, 'Smart Refrigerator', 'Refrigerator with built-in touch screen and food management', 7, 800),
(46781235, 'Security Camera', 'Indoor security camera with night vision', 5, 150),
(51367489, 'Smart Watch', 'Waterproof smartwatch with heart rate monitoring', 14, 200),
(57319468, 'Smart Door Lock', 'Smart lock for doors with keyless entry and remote access', 9, 150),
(58423917, 'Smart TV', 'Ultra HD smart television with internet connectivity', 6, 600),
(59327684, 'Smart Lock', 'Keyless entry door lock with smartphone control', 8, 180),
(64891523, 'Smart Bulb', 'Color-changing LED bulb with smartphone app control', 20, 40),
(72581934, 'Smart Doorbell', 'Video doorbell with motion detection and two-way audio', 7, 200),
(78629531, 'Smart Coffee Maker', 'Programmable coffee maker with smartphone control', 5, 80),
(82176493, 'Smart Thermostat', 'A programmable thermostat for smart homes', 10, 250),
(84956317, 'Smart Scale', 'Digital body weight scale with app integration', 11, 60),
(94185732, 'Smart Garage Door Opener', 'Garage door opener with smartphone app and voice control', 8, 120),
(94628731, 'Smart Plug', 'Wi-Fi enabled smart plug for remote control of devices', 18, 30),
(96713842, 'Air Purifier', 'HEPA air purifier with air quality sensors', 16, 180);

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `email` varchar(100) NOT NULL,
  `eventtime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `event` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`email`, `eventtime`, `event`) VALUES
('1@1.com', '2023-05-16 22:16:49', 'user logged'),
('johndoe@example.com', '2023-05-16 22:18:15', 'System startup'),
('janedoe@example.com', '2023-05-16 22:18:15', 'User login successful'),
('bobsmith@example.com', '2023-05-16 22:18:15', 'Database connection established'),
('sarahjones@example.com', '2023-05-16 22:18:15', 'File upload completed'),
('johndoe@example.com', '2023-05-16 22:18:15', 'Application error'),
('janedoe@example.com', '2023-05-16 22:18:15', 'User logout'),
('bobsmith@example.com', '2023-05-16 22:18:15', 'Database connection lost'),
('sarahjones@example.com', '2023-05-16 22:18:15', 'File download started'),
('johndoe@example.com', '2023-05-16 22:18:15', 'File deletion failed'),
('janedoe@example.com', '2023-05-16 22:18:15', 'User password reset'),
('bobsmith@example.com', '2023-05-16 22:18:15', 'Database backup started'),
('sarahjones@example.com', '2023-05-16 22:18:15', 'File copy completed'),
('johndoe@example.com', '2023-05-16 22:18:15', 'System shutdown'),
('janedoe@example.com', '2023-05-16 22:18:15', 'User profile updated'),
('bobsmith@example.com', '2023-05-16 22:18:15', 'Database maintenance started'),
('sarahjones@example.com', '2023-05-16 22:18:15', 'File encryption completed'),
('johndoe@example.com', '2023-05-16 22:18:15', 'Application upgrade'),
('janedoe@example.com', '2023-05-16 22:18:15', 'User registration'),
('bobsmith@example.com', '2023-05-16 22:18:15', 'Database query executed'),
('sarahjones@example.com', '2023-05-16 22:18:15', 'File compression completed');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderID` char(8) NOT NULL,
  `userID` varchar(255) NOT NULL,
  `orderDate` text NOT NULL,
  `cartid` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `phonenum` text NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderID`, `userID`, `orderDate`, `cartid`, `amount`, `name`, `address`, `phonenum`, `status`) VALUES
('10205240', 'junittest@gmail.com', '01/01/2000', 12345678, 1, 'junit', '123 Junit Street', '0412345678', 'saved'),
('12956743', 'user17@example.com', '17/05/2023', 4089276, 180, 'Amanda Allen', '210 Cedar St', '0476382915', 'saved'),
('13695415', '123@163.com', '01/05/2023', 36307214, 1200, '1', '12', '12', 'saved'),
('14051293', '1', '01/05/2023', 56540780, 4880, 'test', 'test', '0412345678', 'saved'),
('19354762', 'user12@example.com', '12/05/2023', 4098576, 80, 'Daniel White', '765 Maple St', '0432198765', 'placed'),
('21171022', 'junittest@gmail.com', '01/01/2000', 12345678, 1, 'junit', '123 Junit Street', '0412345678', 'saved'),
('23201186', '1@gmail.com', '02/05/2023', 68204074, 200, 'test', 'e3r', '21', 'placed'),
('23395840', '1@gmail.com', '02/05/2023', 43197268, 1160, 'John Smith2', '123 Test Street', '0412345678', 'saved'),
('25119851', 'junittest@gmail.com', '01/01/2000', 12345678, 1, 'junit', '123 Junit Street', '0412345678', 'saved'),
('25988153', '123@163.com', '01/05/2023', 68985347, 5000, 'ghgh', '1', '000', 'placed'),
('27177729', '1', '01/05/2023', 25132695, 17440, 'test', 'test', '0412345678', 'placed'),
('27584903', 'user8@example.com', '08/05/2023', 4236589, 90, 'David Miller', '543 Walnut St', '0423098765', 'placed'),
('34689257', 'user19@example.com', '18/05/2023', 4398576, 70, 'Christopher Johnson', '543 Pine St', '0412978532', 'placed'),
('35049432', '1', '01/05/2023', 65714786, 1410, 'test', 'test', '0423456789', 'saved'),
('37614892', 'user3@example.com', '03/05/2023', 4938576, 100, 'Alex Johnson', '789 Oak St', '0412345679', 'placed'),
('41027685', 'user6@example.com', '06/05/2023', 4329857, 150, 'Sarah Davis', '987 Maple St', '0410982765', 'placed'),
('43307158', '1', '01/05/2023', 50846020, 200, 'test', 'test', '12', 'placed'),
('48915273', 'user15@example.com', '15/05/2023', 4092385, 55, 'Samantha Clark', '654 Oak St', '0432567891', 'saved'),
('50691748', 'user9@example.com', '09/05/2023', 4321957, 60, 'Jennifer Wilson', '876 Pine St', '0410987654', 'saved'),
('52871934', 'user20@example.com', '19/05/2023', 4092837, 85, 'Stephanie Brown', '876 Oak St', '0498567230', 'saved'),
('53455326', 'test@gmail.com', '17/05/2023', 59508303, 300, 'test Smith', '123 test street', '123', 'placed'),
('53689247', 'user14@example.com', '14/05/2023', 4398672, 120, 'Andrew Martinez', '321 Pine St', '0412985763', 'placed'),
('56551351', 'test@gmail.com', '01/05/2023', 42265871, 100, 'test', '123 test street', '0412345678', 'saved'),
('57291086', 'user4@example.com', '04/05/2023', 4235678, 120, 'Emily Brown', '321 Pine St', '0476543210', 'placed'),
('63589271', 'user11@example.com', '11/05/2023', 4358962, 70, 'Karen Thompson', '432 Elm St', '0412978536', 'saved'),
('65905258', 'junittest@gmail.com', '01/01/2000', 12345678, 1, 'junit', '123 Junit Street', '0412345678', 'saved'),
('72465980', 'user2@example.com', '02/05/2023', 4098237, 75, 'Jane Smith', '456 Elm St', '0445678901', 'saved'),
('72689430', 'user16@example.com', '16/05/2023', 4293685, 130, 'Joshua Davis', '987 Elm St', '0412398576', 'placed'),
('74921506', 'user10@example.com', '10/05/2023', 4097238, 110, 'Robert Anderson', '109 Oak St', '0476321895', 'placed'),
('76020504', 'junittest@gmail.com', '01/01/2000', 12345678, 1, 'junit', '123 Junit Street', '0412345678', 'saved'),
('78451674', 'junitplacedtest@gmail.com', '01/05/2023', 123, 123, 'junit', 'Junittest', '04123456789', 'placed'),
('79805012', '1', '01/05/2023', 33008674, 1200, 'test', 'test', '0412345678', 'placed'),
('85926734', 'user1@example.com', '01/05/2023', 4398576, 50, 'John Doe', '123 Main St', '0412345678', 'saved'),
('89231414', 'junittest@gmail.com', '01/01/2000', 12345678, 1, 'junit', '123 Junit Street', '0412345678', 'saved'),
('90874523', 'user5@example.com', '05/05/2023', 4098723, 80, 'Michael Wilson', '654 Cedar St', '0432198765', 'saved'),
('93852701', 'user7@example.com', '07/05/2023', 4092876, 200, 'Jessica Taylor', '210 Birch St', '0498765432', 'saved'),
('93947152', 'test@gmail.com', '17/05/2023', 21598002, 200, '123', '123', '123', 'placed'),
('95612459', 'junittest@gmail.com', '01/01/2000', 12345678, 1, 'junit', '123 Junit Street', '0412345678', 'saved'),
('97575401', '1', '01/05/2023', 49549192, 1200, 'test', 'test', '123', 'saved'),
('97862431', 'user13@example.com', '13/05/2023', 4283576, 95, 'Michelle Garcia', '098 Cedar St', '0476509832', 'saved'),
('99040296', 'junittest@gmail.com', '01/01/2000', 12345678, 1, 'junit', '123 Junit Street', '0412345678', 'saved');

-- --------------------------------------------------------

--
-- Table structure for table `PAYMENT_T`
--

CREATE TABLE `PAYMENT_T` (
  `PAYMENT_ID` int(11) NOT NULL,
  `CARD_NO` varchar(20) DEFAULT NULL,
  `CARDHOLDER` varchar(50) DEFAULT NULL,
  `CARD_EXP` varchar(10) DEFAULT NULL,
  `CVV` varchar(10) DEFAULT NULL,
  `STATUS` varchar(20) DEFAULT NULL,
  `PAYMENT_METHOD` varchar(20) DEFAULT NULL,
  `AMOUNT` double DEFAULT NULL,
  `PAID_DATE` date DEFAULT NULL,
  `ORDER_ID` int(11) NOT NULL,
  `CUSTOMER_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` varchar(255) NOT NULL,
  `userPassword` text NOT NULL,
  `fullName` text NOT NULL,
  `address` text NOT NULL,
  `agreeTos` text NOT NULL,
  `role` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `userPassword`, `fullName`, `address`, `agreeTos`, `role`) VALUES
('adamjohnson123@example.com', 'johnson123', 'Adam Johnson', '456 Elm Blvd', 'true', 'admin'),
('avasmith789@example.com', 'smith789', 'Ava Smith', '456 Elm Rd', 'true', 'customer'),
('davidmiller789@example.com', 'miller789', 'David Miller', '789 Oak St', 'true', 'customer'),
('emilyjones456@example.com', 'emily456', 'Emily Jones', '321 Cedar Ave', 'true', 'customer'),
('ethanbrown123@example.com', 'brown123', 'Ethan Brown', '123 Main Ave', 'true', 'customer'),
('jamesmiller123@example.com', 'miller123', 'James Miller', '654 Pine Dr', 'true', 'admin'),
('janedoe456@example.com', 'qwerty456', 'Jane Doe', '456 Elm St', 'true', 'admin'),
('jessicathomas789@example.com', 'thomas789', 'Jessica Thomas', '123 Main Rd', 'true', 'customer'),
('johnsmith123@example.com', 'password123', 'John Smith', '123 Main St', 'true', 'customer'),
('junit@test.com', 'junit@test', 'Junit', '123 Test Street', 'true', 'customer'),
('lauradavis123@example.com', 'davis123', 'Laura Davis', '654 Pine Blvd', 'true', 'admin'),
('matthewwilson123@example.com', 'wilson123', 'Matthew Wilson', '321 Cedar Rd', 'true', 'customer'),
('michael456@example.com', 'abc123xyz', 'Michael Johnson', '789 Oak Ave', 'true', 'customer'),
('nataliedavis789@example.com', 'davis789', 'Natalie Davis', '654 Maple Ave', 'true', 'customer'),
('oliviajohnson789@example.com', 'johnson789', 'Olivia Johnson', '987 Elm St', 'true', 'admin'),
('peterwilson456@example.com', 'wilson456', 'Peter Wilson', '987 Elm Dr', 'true', 'customer'),
('robertbrown123@example.com', 'brownie123', 'Robert Brown', '654 Maple Rd', 'true', 'customer'),
('samanthabrown789@example.com', 'brown789', 'Samantha Brown', '789 Oak Dr', 'true', 'customer'),
('sarahwilson789@example.com', 'password789', 'Sarah Wilson', '987 Pine Ln', 'true', 'customer'),
('sophiajones456@example.com', 'jones456', 'Sophia Jones', '789 Oak Blvd', 'true', 'customer'),
('williamsmith123@example.com', 'smith123', 'William Smith', '987 Pine St', 'true', 'customer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD KEY `cartFK1` (`deviceID`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`deviceID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `ordersFK1` (`userID`) USING BTREE;

--
-- Indexes for table `PAYMENT_T`
--
ALTER TABLE `PAYMENT_T`
  ADD PRIMARY KEY (`PAYMENT_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cartFK1` FOREIGN KEY (`deviceID`) REFERENCES `devices` (`deviceID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
