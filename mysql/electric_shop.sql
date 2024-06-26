SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------

--
-- Database: `electric-shop`
--
CREATE DATABASE IF NOT EXISTS electric_shop;

USE electric_shop;
-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(50) NOT NULL,
  `uid` int(50) NOT NULL,
  `product` varchar(50) NOT NULL,
  `price` int(50) NOT NULL,
  `quantity` int(50) NOT NULL,
  `status` enum('active','purchased') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`sid`, `pid`, `uid`, `product`, `price`, `quantity`, `status`) VALUES
(261, 30, 26, 'Geforce keyboard', 2000, 2, 'active'),
(262, 32, 31, 'HP inteli11', 150000, 2, 'active'),
(264, 34, 24, 'Lokai', 15000, 2, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(100) NOT NULL AUTO_INCREMENT,
  `customer_fname` varchar(50) NOT NULL,
  `customer_email` varchar(100) NOT NULL,
  `customer_pwd` varchar(100) NOT NULL,
  `customer_phone` varchar(15) NOT NULL,
  `customer_address` text NOT NULL,
  `customer_role` varchar(50) NOT NULL DEFAULT 'normal',
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_email` (`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_fname`, `customer_email`, `customer_pwd`, `customer_phone`, `customer_address`, `customer_role`) VALUES
(9, 'bhabishya', 'bhabishyaghimire88@gmail.com', 'samaj123', '9817604185', 'jambudada,jorpati', 'admin'),
(20, 'binit bista', 'binitbist707@gmail.com', 'kitsune', '9813458210', 'baneswor ,kathmandu', 'normal'),
(23, 'test', 'test@gmail.com', 'test', '9817265432', 'birgunj', 'normal'),
(26, 'admin', 'admin@gmail.com', 'admin', '9817604185', 'baneswor ,kathmandu', 'admin'),
(31, 'user', 'user@gmail.com', '2345', '9817604345', 'Lalbandi,Sarlahi', 'normal');

-- --------------------------------------------------------

--
-- Table structure for table `email`
--

CREATE TABLE `email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(120) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `email`
--

INSERT INTO `email` (`id`, `name`, `email`, `subject`, `message`) VALUES
(6, 'bhabishyaghimire', 'bhabishyaghimire88@gmail.com', 'Request', 'I like to request you to bring iphone 14 pro max sooner');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL AUTO_INCREMENT,
  `product_catag` varchar(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_date` varchar(50) NOT NULL,
  `product_img` text NOT NULL,
  `product_left` int(100) NOT NULL,
  `product_author` varchar(100) NOT NULL DEFAULT 'admin',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_catag`, `product_title`, `product_price`, `product_desc`, `product_date`, `product_img`, `product_left`, `product_author`) VALUES
(19, 'mouse', 'Digicom (DG-w10)', 400, 'Digicom futuristics technologictics industries with 1500dpi anti slip and it is easy on hand for general gaming homeuse and business purpose.   ', '8, feb, 2022', 'dgw10.jpg', 50, 'bhabishya'),
(21, 'laptop', 'Asus Gaming ', 80000, 'It has 8gb Ram, 4GB AmdRyzon graphics card with backlit keyboard.', '9, feb, 2022', 'asusx550c.jpg', 100, 'bhabishya'),
(22, 'laptop', 'Acer', 60000, 'It is acer series.It has 6gb ram with 2Gb Nvidia graphics along with 1 TB HDD ', '9, feb, 2022', 'laptop1.jpg', 18, 'bhabishya'),
(23, 'mouse', 'Hp-Mouse', 6000, 'Hp branded USA mouse industry has 2500dpi with anti slip technology', '9, feb, 2022', 'mouse2.jpg', 50, 'bhabishya'),
(24, 'keyboard', 'Digicom-keyboard', 1500, ' It has 126 key and has backlit with water resistence features along and suspension.', '9, feb, 2022', 'keyboard1.jpg', 56, 'bhabishya'),
(25, 'laptop', 'Lenovo xx556G i7', 120000, 'It is Lonovo series.It has 6gb ram with 2Gb\r\n Nvidia graphics along with 1TB ssd', '9, feb, 2022', 'laptop2.jpg', 30, 'bhabishya'),
(26, 'mouse', 'Nokia mouse', 1500, 'Nokia branded USA mouse industry has 3500dpi with anti slip technology.', '9, feb, 2022', 'mouse4.jpg', 50, 'bhabishya'),
(27, 'keyboard', 'HP-Desertkey', 700, 'It has 128 key and has backlit with water resistence and great touch.\r\nfeatures along and suspension.', '9, feb, 2022', 'keyboard2.jpg', 40, 'bhabishya'),
(28, 'laptop', 'Dell intel i9', 110000, 'It is dell series.It has 6gb ram with 2Gb Rygen graphics along with 500gb ssd.', '9, feb, 2022', 'laptop3.jpg', 49, 'bhabishya'),
(29, 'mouse', 'Sea-Mouse', 300, 'Sea branded USA mouse industry has 500dpi with anti slip technology.', '9, feb, 2022', 'mouse3.jpg', 45, 'bhabishya'),
(30, 'keyboard', 'Geforce keyboard', 2000, 'Gaming keyboard and has backlit with water resistence features along and suspension.', '9, feb, 2022', 'keyboard3.jpg', 56, 'bhabishya'),
(31, 'laptop', 'HP-77GT intel i5', 60000, ' It has 4gb ram with 256gb ssd and having 3gb HUD graphics.', '9, feb, 2022', 'laptop5.jpg', 45, 'bhabishya'),
(32, 'laptop', 'HP inteli11', 150000, '  It has intel core processor i11 with new technology gaming laptop with 8gb ram.', ' 10, Feb 2022', 'laptop6.png', 100, 'bhabishya'),
(33, 'mouse', 'L12 Tri', 2000, '  Mouse of tri-lateral button, having 3500dpi with anti-slip  technology.', '10,2,2022', 'mouse5.jpg', 25, 'bhabishya'),
(34, 'keyboard', 'Lokai', 15000, 'It is a cheap backlit gaming keyboard with 120keys along with water resistance.', '10,2,2022', 'keyboard4a.jpg', 120, 'bhabishya'),
(35, 'mobile', 'Iphone12', 130000, '     It is apple usa company with water resistance along with 6gb ram with fired processor.It has smooth glasses to protect screen.', '10,2,2022', 'mobile4.jpg', 25, 'bhabishya');

-- --------------------------------------------------------

--
-- Table structure for table `repair`
--

CREATE TABLE `repair` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `p_name` varchar(25) NOT NULL,
  `category` varchar(20) NOT NULL,
  `damage_type` varchar(40) NOT NULL,
  `uuid` varchar(40) DEFAULT NULL,
  `advance_amt` int(20) NOT NULL,
  `due` int(20) DEFAULT NULL,
  `status` enum('repaired','pending') NOT NULL DEFAULT 'pending',
  `booked_date` varchar(25) NOT NULL,
  `return_date` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `servicestatus`
--

CREATE TABLE `servicestatus` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `pid` int(11) DEFAULT NULL,
  `uuid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `website_name` varchar(60) NOT NULL,
  `website_logo` varchar(50) NOT NULL,
  `website_footer` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`website_name`, `website_logo`, `website_footer`) VALUES
('Electric-Shop', 'logo2023.png', '© Electric Shop 2021 <br> All right reserved.');

-- --------------------------------------------------------

--
-- Table structure for table `soldproducts`
--

CREATE TABLE `soldproducts` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `quantity` int(50) NOT NULL DEFAULT 1,
  `price` int(11) NOT NULL,
  `date` varchar(60) DEFAULT NULL,
  `status` enum('pending','delivered') NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
