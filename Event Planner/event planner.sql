-- phpMyAdmin SQL Dump
-- version 2.11.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 07, 2017 at 06:10 AM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `event planner`
--

-- --------------------------------------------------------

--
-- Table structure for table `addtocart`
--

CREATE TABLE `addtocart` (
  `Addtocart_Id` int(11) NOT NULL auto_increment,
  `Customer_Id` int(11) NOT NULL,
  `Event_Id` int(11) NOT NULL,
  `Theme_Id` int(11) NOT NULL,
  `Venue_Id` int(11) NOT NULL,
  `Event_Date` date NOT NULL,
  `Person_No` int(11) NOT NULL,
  `Total_Price` int(11) NOT NULL,
  `Package_Name` varchar(2) NOT NULL,
  `Package_Id` int(11) NOT NULL,
  PRIMARY KEY  (`Addtocart_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `addtocart`
--

INSERT INTO `addtocart` (`Addtocart_Id`, `Customer_Id`, `Event_Id`, `Theme_Id`, `Venue_Id`, `Event_Date`, `Person_No`, `Total_Price`, `Package_Name`, `Package_Id`) VALUES
(1, 20, 105, 1, 1, '2017-05-31', 101, 78260, 'R', 9),
(2, 20, 103, 17, 1, '2017-06-02', 100, 76500, 'R', 5),
(3, 20, 101, 5, 1, '2017-06-01', 500, 176500, 'R', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `user_name` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`user_name`, `password`) VALUES
('admin@gmail.com', '123456789');

-- --------------------------------------------------------

--
-- Table structure for table `customer_master`
--

CREATE TABLE `customer_master` (
  `Customer_Id` int(20) NOT NULL auto_increment,
  `Customer_Name` varchar(20) NOT NULL,
  `Mobile_No` bigint(12) NOT NULL,
  `Email` varchar(80) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Date_Of_Registration` date NOT NULL,
  `City_Name` varchar(20) NOT NULL,
  PRIMARY KEY  (`Customer_Id`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `customer_master`
--

INSERT INTO `customer_master` (`Customer_Id`, `Customer_Name`, `Mobile_No`, `Email`, `Password`, `Date_Of_Registration`, `City_Name`) VALUES
(19, 'Ozair1', 1234567890, 'ozairgandhi84@gmail.com', '1234', '2017-04-25', 'Ahmedabad'),
(20, 'Divyang Yadav', 1234567890, 'kdgp1111@gmail.com', '123456789', '2017-04-25', 'Ahmedabad');

-- --------------------------------------------------------

--
-- Table structure for table `customize_package`
--

CREATE TABLE `customize_package` (
  `Order_Id` int(10) NOT NULL,
  `Soup_Id` int(5) default NULL,
  `Stater_Id` int(5) default NULL,
  `Roti_Id` int(5) default NULL,
  `Sabji_Id` int(5) default NULL,
  `Dal_Id` int(5) default NULL,
  `Rice_Id` int(5) default NULL,
  `Ice_Cream_Id` int(5) default NULL,
  `Chinese_Id` int(5) default NULL,
  `Cake_Id` int(5) default NULL,
  PRIMARY KEY  (`Order_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customize_package`
--

INSERT INTO `customize_package` (`Order_Id`, `Soup_Id`, `Stater_Id`, `Roti_Id`, `Sabji_Id`, `Dal_Id`, `Rice_Id`, `Ice_Cream_Id`, `Chinese_Id`, `Cake_Id`) VALUES
(3, 1, 6, 11, 16, 21, 26, 32, 36, 41),
(5, 3, 8, 13, 16, 21, 26, 31, 36, 41);

-- --------------------------------------------------------

--
-- Table structure for table `event_master`
--

CREATE TABLE `event_master` (
  `Event_Id` int(20) NOT NULL auto_increment,
  `Event_Name` varchar(20) NOT NULL,
  `Description` varchar(50) NOT NULL,
  `Photo` varchar(50) NOT NULL,
  `Theme_Photo` varchar(50) NOT NULL,
  PRIMARY KEY  (`Event_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=107 ;

--
-- Dumping data for table `event_master`
--

INSERT INTO `event_master` (`Event_Id`, `Event_Name`, `Description`, `Photo`, `Theme_Photo`) VALUES
(101, 'Birthday', 'hello', 'img\\Birthday\\3.jpg', 'img\\Birthday\\Theme\\4.jpg'),
(102, 'Wedding', 'hjk', 'img\\Wedding\\2.jpg', 'img\\Wedding\\Theme\\2.jpg'),
(103, 'Wedding Anniversarie', 'bv', 'img\\Wedding Anniversaries\\2.jpg', 'img\\Wedding Anniversaries\\Theme\\3.jpg'),
(104, 'Theme Parties', 'Award Ceremonies', 'img\\Theme parties\\2.jpg', ' img\\Theme parties\\Theme\\2.jpg'),
(105, 'Award Ceremonies', 'hello', 'img\\Award Ceremonies\\5.jpg', 'img\\Award Ceremonies\\Theme\\2.jpg'),
(106, 'Opening Ceremonies', 'hello', 'img\\Opening Ceremonies\\2.jpg', 'img\\Opening Ceremonies\\Theme\\4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `food_categorie`
--

CREATE TABLE `food_categorie` (
  `Categorie_Id` int(10) NOT NULL auto_increment,
  `Categorie` varchar(20) NOT NULL,
  `Photo` varchar(50) NOT NULL,
  PRIMARY KEY  (`Categorie_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `food_categorie`
--

INSERT INTO `food_categorie` (`Categorie_Id`, `Categorie`, `Photo`) VALUES
(1, 'Soup', 'img\\Menu\\Soup.gif'),
(2, 'Starter', 'img\\Menu\\Starter.gif'),
(3, 'Roti', 'img\\Menu\\Roti.gif'),
(4, 'Sabji', 'img\\Menu\\Sabji.gif'),
(5, 'Dal', 'img\\Menu\\Dal.gif'),
(6, 'Rice', 'img\\Menu\\Rice.gif'),
(7, 'Ice-Cream', 'img\\Menu\\Ice.gif'),
(8, 'Chinese', 'img\\Menu\\Chinese.gif'),
(9, 'Cake', 'img\\Menu\\Cake.gif');

-- --------------------------------------------------------

--
-- Table structure for table `food_item`
--

CREATE TABLE `food_item` (
  `Food_Item_Id` int(10) NOT NULL auto_increment,
  `Categorie_Id` int(10) NOT NULL,
  `Food_Item_Name` varchar(50) NOT NULL,
  `Price` int(10) NOT NULL,
  PRIMARY KEY  (`Food_Item_Id`),
  KEY `Categorie_Id` (`Categorie_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=50 ;

--
-- Dumping data for table `food_item`
--

INSERT INTO `food_item` (`Food_Item_Id`, `Categorie_Id`, `Food_Item_Name`, `Price`) VALUES
(1, 1, 'Veg.Manchow Soup', 60),
(2, 1, 'Tomato Soup', 90),
(3, 1, 'Hot & Sour Soup', 100),
(4, 1, 'Corn Soup', 80),
(5, 1, 'Veg. Soup', 60),
(6, 2, 'Aloo Tikki', 70),
(7, 2, 'Chinese Balls', 90),
(8, 2, 'Chinese Satay', 110),
(9, 2, 'Veg. Chicken Wings', 90),
(10, 2, 'Paneer Tikkas', 130),
(11, 3, 'Tandoori Roti', 30),
(12, 3, 'Paneer Kulcha', 60),
(13, 3, 'Makhani Roti', 50),
(14, 3, 'Khamiri Roti', 60),
(15, 3, 'Varqui Paratha', 70),
(16, 4, 'Paneer Palak', 60),
(17, 4, 'Phool Gobi', 160),
(18, 4, 'Paneer Bhurji', 90),
(19, 4, 'Kaju Khoya', 120),
(20, 4, 'Kaju Kari', 150),
(21, 5, 'Gujarati Mix Dal', 30),
(22, 5, 'Masoor Dal', 80),
(23, 5, 'Toor Dal', 90),
(24, 5, 'Urad dal', 120),
(25, 5, 'Dal Fry', 110),
(26, 6, 'Basmati Rice ', 60),
(27, 6, 'Glutinous RIce', 50),
(28, 6, 'Jasmine Rice', 60),
(29, 6, 'Grain Rice', 80),
(30, 6, 'White Pullaw', 110),
(31, 7, 'Apple Pie', 60),
(32, 7, 'Chocolate Chip', 90),
(33, 7, 'American Nuts ', 70),
(34, 7, 'Strawbarry Nutts', 120),
(35, 7, 'Kulfi', 50),
(36, 8, 'Chinese Manchurian', 80),
(37, 8, 'Chinese Noodles', 60),
(38, 8, 'Chinese Samosa', 40),
(39, 8, 'Chinese Rice', 90),
(40, 8, 'Chinese  Paneer Manc', 120),
(41, 9, 'Chocolate Cake', 120),
(42, 9, 'Black Forest', 250),
(43, 9, 'Fondant Fancy', 300),
(44, 9, 'Cheese Cake', 220),
(45, 9, 'Butter Cake', 110),
(49, 4, 'Bhurji', 120);

-- --------------------------------------------------------

--
-- Table structure for table `order_master`
--

CREATE TABLE `order_master` (
  `Order_Id` int(20) NOT NULL auto_increment,
  `Event_Id` int(20) NOT NULL,
  `Theme_Id` int(20) NOT NULL,
  `Venue_Id` int(20) NOT NULL,
  `Customer_Id` int(20) NOT NULL,
  `Date_Of_Event` date NOT NULL,
  `No_Of_Person` int(11) NOT NULL,
  `General_Total` int(11) NOT NULL,
  `Package_Id` int(10) NOT NULL,
  `Package_type` varchar(1) NOT NULL,
  `Invoice_Date` date NOT NULL,
  PRIMARY KEY  (`Order_Id`),
  KEY `Event_Id` (`Event_Id`,`Theme_Id`,`Venue_Id`,`Customer_Id`),
  KEY `Theme_Id` (`Theme_Id`),
  KEY `Venue_Id` (`Venue_Id`),
  KEY `Customer_Id` (`Customer_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `order_master`
--

INSERT INTO `order_master` (`Order_Id`, `Event_Id`, `Theme_Id`, `Venue_Id`, `Customer_Id`, `Date_Of_Event`, `No_Of_Person`, `General_Total`, `Package_Id`, `Package_type`, `Invoice_Date`) VALUES
(2, 101, 5, 1, 20, '2017-05-19', 450, 164000, 1, 'R', '2017-05-17'),
(3, 101, 1, 2, 20, '2017-05-25', 100, 71000, 0, 'C', '2017-05-17'),
(4, 102, 8, 1, 20, '2017-05-31', 100, 90000, 3, 'R', '2017-05-31'),
(5, 101, 5, 1, 20, '2017-06-01', 500, 101500, 0, 'C', '2017-05-31');

-- --------------------------------------------------------

--
-- Table structure for table `ready_package`
--

CREATE TABLE `ready_package` (
  `Ready_Package_Id` int(20) NOT NULL auto_increment,
  `Event_Id` int(20) NOT NULL,
  `Menu_Detail` varchar(200) NOT NULL,
  `Price` int(10) NOT NULL,
  `Photo` varchar(50) NOT NULL,
  PRIMARY KEY  (`Ready_Package_Id`),
  KEY `Event_Id` (`Event_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `ready_package`
--

INSERT INTO `ready_package` (`Ready_Package_Id`, `Event_Id`, `Menu_Detail`, `Price`, `Photo`) VALUES
(1, 101, 'Veg.Machow Soup , Aloo Tikki , Panner Palak , Paneer Kulcha , Toor Dal , Basmati Rice , Strawbarry Ice_Creme, Chocolate Cake', 250, 'img\\Ready\\1.jpg'),
(2, 101, 'Tomato Soup , Chinese Balls , Paneer Tikkas , Makhani Roti , Panner Bhurji , Masoor Dal , Grain Rice , Chocolate Chips , Black Forest', 320, 'img\\Ready\\2.jpg'),
(3, 102, 'Corn Soup , Aloo Tikki , Panner Tikkas , Makhani Roti , Gujarati Mix Dal , Jasmin Rice , American Nuts , Chinese Manchurian', 350, 'img\\Ready\\3.jpg'),
(4, 102, 'Hot & Sour Soup , Chinese Satay , Khamiri Roti , Khaju Khoya , Dal Fry , White Pullaw , Apple Pie , Chinese Noodles', 380, 'img\\Ready\\2.jpg'),
(5, 103, 'Tomato Soup , Chinese Balls , Paneer Tikkas , Makhani Roti , Gujarati Mix Dal , Jasmin Rice , American Nuts , Chinese Manchurian', 200, 'img\\Ready\\1.jpg'),
(6, 103, 'Hot & Sour Soup , Chinese Satay , Khamiri Roti , Khaju Khoya , Dal Fry , White Pullaw , Apple Pie , Chinese Noodles', 230, 'img\\Ready\\2.jpg'),
(7, 104, 'Veg.Machow Soup , Aloo Tikki , Panner Palak , Paneer Kulcha , Toor Dal , Basmati Rice , Strawbarry Ice_Creme', 240, 'img\\Ready\\3.jpg'),
(8, 104, 'Corn Soup , Aloo Tikki , Panner Tikkas , Makhani Roti , Gujarati Mix Dal , Jasmin Rice , American Nuts , Chinese Manchurian', 210, 'img\\Ready\\2.jpg'),
(9, 105, 'Hot & Sour Soup , Chinese Satay , Khamiri Roti , Khaju Khoya , Dal Fry , White Pullaw , Apple Pie , Chinese Noodles', 260, 'img\\Ready\\1.jpg'),
(10, 105, 'Veg.Machow Soup , Aloo Tikki , Panner Palak , Paneer Kulcha , Toor Dal , Basmati Rice , Strawbarry Ice_Creme', 280, 'img\\Ready\\2.jpg'),
(11, 106, 'Tomato Soup , Chinese Balls , Paneer Tikkas , Makhani Roti , Gujarati Mix Dal , Jasmin Rice , American Nuts , Chinese Manchurian', 240, 'img\\Ready\\3.jpg'),
(12, 106, 'Corn Soup , Aloo Tikki , Panner Tikkas , Makhani Roti , Gujarati Mix Dal , Jasmin Rice , American Nuts , Chinese Manchurian', 300, 'img\\Ready\\2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `slider_master`
--

CREATE TABLE `slider_master` (
  `Slider_Id` int(5) NOT NULL auto_increment,
  `Event_Id` int(5) NOT NULL,
  `Photo` varchar(50) NOT NULL,
  PRIMARY KEY  (`Slider_Id`),
  KEY `Event_Id` (`Event_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `slider_master`
--

INSERT INTO `slider_master` (`Slider_Id`, `Event_Id`, `Photo`) VALUES
(1, 101, 'img\\Birthday\\1.jpg'),
(2, 101, 'img\\Birthday\\2.jpg'),
(3, 101, 'img\\Birthday\\3.jpg'),
(4, 101, 'img\\Birthday\\4.jpg'),
(5, 101, 'img\\Birthday\\5.jpg'),
(6, 102, 'img\\Wedding\\1.jpg'),
(7, 102, 'img\\Wedding\\2.jpg'),
(8, 102, 'img\\Wedding\\3.jpg'),
(9, 102, 'img\\Wedding\\4.jpeg'),
(10, 102, 'img\\Wedding\\5.jpg'),
(11, 103, 'img\\Wedding Anniversaries\\1.jpg'),
(12, 103, 'img\\Wedding Anniversaries\\2.jpg'),
(13, 103, 'img\\Wedding Anniversaries\\3.jpg'),
(14, 103, 'img\\Wedding Anniversaries\\4.jpg'),
(15, 103, 'img\\Wedding Anniversaries\\5.jpg'),
(16, 104, 'img\\Theme parties\\1.jpg'),
(17, 104, 'img\\Theme parties\\2.jpg'),
(18, 104, 'img\\Theme parties\\3.jpg'),
(19, 104, 'img\\Theme parties\\4.jpg'),
(20, 104, 'img\\Theme parties\\5.jpg'),
(21, 105, 'img\\Award Ceremonies\\1.jpg'),
(22, 105, 'img\\Award Ceremonies\\2.jpg'),
(23, 105, 'img\\Award Ceremonies\\3.jpg'),
(24, 105, 'img\\Award Ceremonies\\4.jpg'),
(25, 105, 'img\\Award Ceremonies\\5.jpg'),
(26, 106, 'img\\Opening Ceremonies\\1.jpg'),
(27, 106, 'img\\Opening Ceremonies\\2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `theme_master`
--

CREATE TABLE `theme_master` (
  `Theme_Id` int(20) NOT NULL auto_increment,
  `Event_Id` int(20) NOT NULL,
  `Theme_Name` varchar(50) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `Basic_Price` int(30) NOT NULL,
  `Photo` varchar(50) NOT NULL,
  PRIMARY KEY  (`Theme_Id`),
  KEY `Event_Id` (`Event_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `theme_master`
--

INSERT INTO `theme_master` (`Theme_Id`, `Event_Id`, `Theme_Name`, `Description`, `Basic_Price`, `Photo`) VALUES
(1, 101, 'Disney_Theme', 'Birthday  setup in area with Disney Theme', 2000, 'img\\Birthday\\Theme\\1.jpg'),
(2, 101, 'Doremon_Theme', 'Birthday  setup in area with Doremon_Theme', 1500, 'img\\Birthday\\Theme\\2.jpg'),
(3, 101, 'Chota Bheem_Theme', 'Birthday  setup in area with Chota Bheem_Theme', 3500, 'img\\Birthday\\Theme\\4.jpg'),
(4, 101, 'Jungle_Theme', 'Birthday  setup in area with Jungle_Theme', 1000, 'img\\Birthday\\Theme\\3.jpg'),
(5, 101, 'Bear_Theme', 'Birthday  setup in area with Bear_Theme', 1500, 'img\\Birthday\\Theme\\5.jpg'),
(6, 101, 'Barnyard_Theme', 'Birthday  setup in area with Barnyard_Theme', 2500, 'img\\Birthday\\Theme\\6.jpg'),
(7, 102, 'Gujarati Theme', 'Wedding   setup in area with Gujrati Theme', 2530, 'img\\Wedding\\Theme\\1.jpg'),
(8, 102, 'Rajasthani Theme', 'Wedding   setup in area with  Rajasthani Theme', 5000, 'img\\Wedding\\Theme\\2.jpg'),
(9, 102, 'Punjabi Theme', 'Wedding   setup in area with Punjabi Theme', 3500, 'img\\Wedding\\Theme\\3.jpg'),
(10, 102, 'Christian Theme', 'Wedding   setup in area with  Christian Theme', 3200, 'img\\Wedding\\Theme\\4.jpg'),
(11, 102, 'Marathi Theme', 'Wedding   setup in area with Marathi Theme', 3400, 'img\\Wedding\\Theme\\5.jpg'),
(12, 102, 'Bangoli Theme', 'Wedding   setup in area with  bangoli Theme', 4500, 'img\\Wedding\\Theme\\6.jpg'),
(13, 103, 'Lighting Theme', ' Wedding  anniversary setup in area with   Lightin', 6500, 'img\\Wedding Anniversaries\\Theme\\1.jpg'),
(14, 103, 'Rose Theme', ' Wedding  anniversary setup in area with  Rose Theme', 5600, 'img\\Wedding Anniversaries\\Theme\\2.jpg'),
(15, 103, 'White Head Table With Flower Theme', ' Wedding  anniversary setup in area with  White He', 2152, 'img\\Wedding Anniversaries\\Theme\\3.jpg'),
(16, 103, 'Whtie Head Table With Bridal Loungh Glass', 'Wedding  anniversary setup in area with Whtie Head', 4800, 'img\\Wedding Anniversaries\\Theme\\4.jpg'),
(17, 103, 'Flower With Lighting Theme', '  Wedding  anniversary setup in area with  Flower ', 6500, 'img\\Wedding Anniversaries\\Theme\\5.jpg'),
(18, 103, 'Green Flower Theme', 'Wedding  anniversary setup in area with  Green Flo', 6900, 'img\\Wedding Anniversaries\\Theme\\6.jpg'),
(19, 104, 'Lighting Theme', 'Theme Party setup in area with Lighting Theme', 1000, 'img\\Theme parties\\Theme\\1.jpg'),
(20, 104, 'Bollywood Theme', 'Theme Party setup in area with Bollywood Theme', 5600, 'img\\Theme parties\\Theme\\2.jpg'),
(21, 104, 'White Flower With Blue Lighting Theme', 'Theme Party setup in area with  White Flower With ', 4500, 'img\\Theme parties\\Theme\\3.jpg'),
(22, 104, 'Orage lighting With Candlse Theme', 'Theme Party setup in area with Orage lighting With', 7800, 'img\\Theme parties\\Theme\\4.jpg'),
(23, 104, 'White Flower With Withe and Blue Lighting Theme', 'Theme Party setup in area with  White Flower With ', 5600, 'img\\Theme parties\\Theme\\5.jpg'),
(24, 104, 'Blue Lighting Theme', 'Theme Party setup in area with  Blue Lighting Them', 8750, 'img\\Theme parties\\Theme\\6.jpg'),
(25, 105, 'Head Table with Purple Lighting Theme', 'Award Ceremonies setup in area With Head Table wit', 3600, 'img\\Award Ceremonies\\Theme\\1.jpg'),
(26, 105, 'Red and Blue Lighting Theme', 'Award Ceremonies setup in area With Red and Blue L', 5500, 'img\\Award Ceremonies\\Theme\\2.jpg'),
(27, 105, 'Head Table With Blue Lighting Theme', 'Award Ceremonies setup in area With Head Table Wit', 8500, 'img\\Award Ceremonies\\Theme\\3.jpg'),
(28, 105, 'Head Table With Blue Lighting Theme', 'Award Ceremonies setup in area With Head Table Wit', 4500, 'img\\Award Ceremonies\\Theme\\4.jpg'),
(29, 105, 'Yellow Flower With  Head Table Theme', 'Award Ceremonies setup in area With Yellow Flower ', 7500, 'img\\Award Ceremonies\\Theme\\5.jpg'),
(30, 105, 'Blue Lighting With Dance Floor', 'Award Ceremonies setup in area With Blue Lighting ', 1200, 'img\\Award Ceremonies\\Theme\\6.jpg'),
(31, 106, 'Red Lighting Theme', 'Opening Ceremonies setup in area with  Red Lightin', 4500, 'img\\Opening Ceremonies\\Theme\\1.jpg'),
(32, 106, 'Blue Lighting Theme', 'Opening Ceremonies setup in area with  Blue Lighti', 6500, 'img\\Opening Ceremonies\\Theme\\2.jpg'),
(33, 106, 'Blue Lighting With Dance Floor Theme', 'Opening Ceremonies setup in area With Blue Lightin', 4500, 'img\\Opening Ceremonies\\Theme\\3.jpg'),
(34, 106, 'Blue and While Lighting Theme', 'Opening Ceremonies setup in area With Blue and Whi', 8500, 'img\\Opening Ceremonies\\Theme\\4.jpg'),
(35, 106, 'Blue Theme', 'Opening Ceremonies setup in area With Blue Theme', 3565, 'img\\Opening Ceremonies\\Theme\\5.jpg'),
(36, 106, 'Blue Lighting With Amimation Theme', ' Opening Ceremonies setup in area With Blue Lighti', 7500, 'img\\Opening Ceremonies\\Theme\\6.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `venue_master`
--

CREATE TABLE `venue_master` (
  `Venue_Id` int(20) NOT NULL auto_increment,
  `Venue_Name` varchar(40) NOT NULL,
  `Address` varchar(90) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Basic_Price` int(30) NOT NULL,
  `Mobile_No` bigint(20) NOT NULL,
  `Photo` varchar(50) NOT NULL,
  `Area` int(10) NOT NULL,
  `Capacity` int(10) NOT NULL,
  PRIMARY KEY  (`Venue_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `venue_master`
--

INSERT INTO `venue_master` (`Venue_Id`, `Venue_Name`, `Address`, `Email`, `Basic_Price`, `Mobile_No`, `Photo`, `Area`, `Capacity`) VALUES
(1, 'Vaibhav Hall', 'Maninagar Crossing, Maninagar , Ahmedabad, Gujarat', 'vaibhav@gmail.com', 50000, 9898989800, 'img\\Venue\\Maninagar\\1.jpg', 250, 500),
(2, 'Keshav Party Plot ', 'Near- Swaminarayan Temple, Maninagar Road , Ahmedabad', 'keshav@gmail.com', 60000, 9898989856, 'img\\Venue\\Maninagar\\2.jpg', 400, 800),
(3, 'Kesar Party Plot', 'Panchgini Road, Jodhpur, Satellite Area, C-G Road ', 'kesar@gmail.com ', 25000, 9853625612, 'img\\Venue\\C-G road\\1.jpg', 500, 1000),
(4, 'Amrutbaug Party Plot', 'Near, C-G Road, Ahmedabad , Ahmedabad.', 'amrubaug@gmail.com', 35000, 9898984556, 'img\\Venue\\C-G road\\2.jpg', 250, 500),
(5, 'Parth Party Plot', 'S.P Ring Road,S.G Highway, Ahmedabad.', 'parth@gmail.com', 40000, 9898986536, 'img\\Venue\\S-G highway\\1.jpg', 350, 700),
(6, 'Panchratna Party Plot', 'Near Wide Angel Theatre,Sg Highway,  Ahmedabad.', 'panchranta@gmail.com', 70000, 9825683696, 'img\\Venue\\S-G highway\\2.jpg', 450, 900);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customize_package`
--
ALTER TABLE `customize_package`
  ADD CONSTRAINT `customize_package_ibfk_1` FOREIGN KEY (`Order_Id`) REFERENCES `order_master` (`Order_Id`) ON DELETE CASCADE;

--
-- Constraints for table `food_item`
--
ALTER TABLE `food_item`
  ADD CONSTRAINT `food_item_ibfk_1` FOREIGN KEY (`Categorie_Id`) REFERENCES `food_categorie` (`Categorie_Id`);

--
-- Constraints for table `order_master`
--
ALTER TABLE `order_master`
  ADD CONSTRAINT `order_master_ibfk_10` FOREIGN KEY (`Theme_Id`) REFERENCES `theme_master` (`Theme_Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_master_ibfk_11` FOREIGN KEY (`Venue_Id`) REFERENCES `venue_master` (`Venue_Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_master_ibfk_12` FOREIGN KEY (`Customer_Id`) REFERENCES `customer_master` (`Customer_Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_master_ibfk_9` FOREIGN KEY (`Event_Id`) REFERENCES `event_master` (`Event_Id`) ON DELETE CASCADE;

--
-- Constraints for table `ready_package`
--
ALTER TABLE `ready_package`
  ADD CONSTRAINT `ready_package_ibfk_1` FOREIGN KEY (`Event_Id`) REFERENCES `event_master` (`Event_Id`);

--
-- Constraints for table `slider_master`
--
ALTER TABLE `slider_master`
  ADD CONSTRAINT `slider_master_ibfk_1` FOREIGN KEY (`Event_Id`) REFERENCES `event_master` (`Event_Id`);

--
-- Constraints for table `theme_master`
--
ALTER TABLE `theme_master`
  ADD CONSTRAINT `theme_master_ibfk_1` FOREIGN KEY (`Event_Id`) REFERENCES `event_master` (`Event_Id`);
