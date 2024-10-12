-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2024 at 03:50 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `plantbazaardb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminId` int(11) NOT NULL,
  `adminEmail` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `loginTime` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `messageId` int(11) NOT NULL,
  `senderId` int(11) NOT NULL,
  `receiverId` int(11) NOT NULL,
  `messageContent` text NOT NULL,
  `messageFiles` varchar(128) NOT NULL,
  `messageDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `plantid` int(10) NOT NULL,
  `added_by` int(11) NOT NULL,
  `plantname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `img1` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `img2` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `img3` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `plantColor` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `plantSize` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `plantcategories` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`plantid`, `added_by`, `plantname`, `img1`, `img2`, `img3`, `plantColor`, `plantSize`, `plantcategories`, `details`, `location`, `price`, `createdAt`, `updatedAt`) VALUES
(39, 2, 'Succulent', 'succulent.jpg', '', '', 'Green', '6cm', 'Succulent', 'Easy to maintain plant', 'Gapan', 200, '2024-09-18 15:01:52', '2024-09-18 15:01:52'),
(57, 2, 'Sample Plant 2', '1726340409519.jpg', 'default-image.jpg', 'default-image.jpg', 'asd', '4inch', 'Cactus', 'qwe', 'Hello po', 111, '2024-09-29 09:58:36', '2024-09-29 09:58:36'),
(66, 3, 'What is ap', 'Screenshot 2024-09-26 221933.png', 'Screenshot 2024-09-27 130308.png', 'default-image.jpg', 'Bayolet', 'Malaki', 'Cactus', 'Etong halaman na ito ay aking pinaglumaan na halaman', 'Caloocan', 200, '2024-10-01 13:48:50', '2024-10-01 13:48:50');

-- --------------------------------------------------------

--
-- Table structure for table `product_archive`
--

CREATE TABLE `product_archive` (
  `archiveID` int(11) NOT NULL,
  `plantid` int(11) DEFAULT NULL,
  `postedBy` varchar(50) NOT NULL,
  `postPlantName` varchar(50) NOT NULL,
  `img1` varchar(128) NOT NULL,
  `img2` varchar(128) NOT NULL,
  `img3` varchar(128) NOT NULL,
  `plantSize` varchar(20) NOT NULL,
  `plantCategories` varchar(40) NOT NULL,
  `plantColor` varchar(128) NOT NULL,
  `details` varchar(128) NOT NULL,
  `location` int(70) NOT NULL,
  `price` int(10) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_archive`
--

INSERT INTO `product_archive` (`archiveID`, `plantid`, `postedBy`, `postPlantName`, `img1`, `img2`, `img3`, `plantSize`, `plantCategories`, `plantColor`, `details`, `location`, `price`, `createdAt`, `updatedAt`) VALUES
(1, 40, '3', 'Cube', 'Screenshot 2024-06-11 010053.png', 'Screenshot 2024-08-17 094044.png', 'Screenshot 2024-08-17 094044.png', '4inch', 'Cactus', 'Violet', '', 0, 600, '2024-09-30 14:11:10', '2024-09-30 14:11:10'),
(2, 41, '', 'Halimaw', '1.png\r\n', '', '', '2 Meters', 'Halamang Gamot', 'White', '', 0, 100, '2024-09-30 14:13:31', '2024-09-30 14:13:31'),
(3, 54, 'maranathabarredo@gmail.com', 'asd', 'Screenshot 2024-06-11 010053.png', 'default-image.jpg', 'default-image.jpg', '4inch', 'Cactus', 'Violet', '', 0, 123, '2024-09-30 14:14:00', '2024-09-30 14:14:00'),
(4, 60, 'maranathabarredo@gmail.com', 'Korikong', '1722610764706.jpeg', 'default-image.jpg', 'default-image.jpg', '4inch', 'Tinola', 'Violet', '', 0, 120, '2024-09-30 15:03:43', '2024-09-30 15:03:43'),
(5, 61, 'maranathabarredo@gmail.com', 'Wala lang 123', 'Javascript Workshop.jpg', 'default-image.jpg', 'default-image.jpg', '123', 'Tinola', 'Violet', '', 0, 123, '2024-09-30 15:05:51', '2024-09-30 15:05:51'),
(6, 55, 'maranathabarredo@gmail.com', 'Kangkong', 'Nike Banner.jpg', 'default-image.jpg', 'default-image.jpg', '4inch', 'Tinola', 'Violet', '', 0, 666, '2024-09-30 15:06:19', '2024-09-30 15:06:19'),
(7, 62, 'maranathabarredo@gmail.com', 'Halaman na Kulay Green', '1720091745842.jpeg', '1717595108231.jpg', '1717595108231.jpg', 'Malaki', 'Kangkong', 'Bayolet', '', 0, 200, '2024-09-30 15:09:38', '2024-09-30 15:09:38'),
(8, 63, 'maranathabarredo@gmail.com', 'Sigel', 'Screenshot 2024-08-27 203154.png', 'default-image.jpg', 'default-image.jpg', '4inch', 'Tinola', 'asd', '', 0, 121, '2024-09-30 15:12:59', '2024-09-30 15:12:59'),
(9, 64, 'maranathabarredo@gmail.com', 'Wala lang 123', '1718904635480.jpg', 'default-image.jpg', 'default-image.jpg', '4inch', 'Cactus', 'Violet', '', 0, 123, '2024-09-30 15:16:43', '2024-09-30 15:16:43'),
(10, 65, 'maranathabarredo@gmail.com', 'Kangkong Chips', '1.png', '2.png', '3.png', 'Malaki', 'Kangkong', 'Bayolet', '', 0, 220, '2024-09-30 17:52:54', '2024-09-30 17:52:54');

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `seller_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ratings` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`seller_id`, `user_id`, `ratings`) VALUES
(2, 1, 4.8),
(3, 41, 5);

-- --------------------------------------------------------

--
-- Table structure for table `seller_applicant`
--

CREATE TABLE `seller_applicant` (
  `applicantID` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `validId` varchar(128) NOT NULL,
  `selfieValidId` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seller_applicant`
--

INSERT INTO `seller_applicant` (`applicantID`, `user_id`, `validId`, `selfieValidId`) VALUES
(2, 1, 'pogiako.png', 'pogiako.png\r\n'),
(4, 41, 'pogiKami.png', 'pogiKami.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `proflePicture` varchar(128) DEFAULT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `phoneNumber` bigint(12) NOT NULL,
  `address` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `proflePicture`, `firstname`, `lastname`, `email`, `gender`, `phoneNumber`, `address`, `password`, `status`) VALUES
(1, 'eugenevanlinsangan1204@gmail.com.jpg', 'Juan', 'DelaCruz', 'eugenevanlinsangan1204@gmail.com', 'male', 91234351, 'Gapan', 'Test123@', 1),
(41, 'maranathabarredo@gmail.com.png', 'Maranatha', 'Barredo', 'maranathabarredo@gmail.com', 'male', 974236516, 'Papaya', 'Test123@', 1),
(48, '2.png', 'qwe', 'qwe', 'mbarredo2n.neust@gmail.com', 'Male', 123, 'qwe', 'qwe', 0),
(49, 'wadom93936_daypey_com.png', 'Wadow', 'Doe', 'wadom93936@daypey.com', 'Male', 123, 'qwe', '$2y$10$u/5.tT1u86/PS7aFWhDVz.L1CZ7ZuueVul0TPmtCjeOCF32ITx9Rm', 0),
(50, 'maranathabarredo_yahoo_com.png', 'Maranatha', 'Asd', 'maranathabarredo@yahoo.com', 'Male', 123131, 'Malaysia', '$2y$10$ILGRd.Qd2cz.kx.4CqZSC.pPsilssMFrk4sXceLKg7.m.M1WEyTbi', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminId`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`messageId`),
  ADD KEY `senderId` (`senderId`,`receiverId`),
  ADD KEY `receiverId` (`receiverId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`plantid`),
  ADD KEY `seller_id` (`added_by`);

--
-- Indexes for table `product_archive`
--
ALTER TABLE `product_archive`
  ADD PRIMARY KEY (`archiveID`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`seller_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `seller_applicant`
--
ALTER TABLE `seller_applicant`
  ADD PRIMARY KEY (`applicantID`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `email` (`email`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `messageId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `plantid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `product_archive`
--
ALTER TABLE `product_archive`
  MODIFY `archiveID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `seller_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `seller_applicant`
--
ALTER TABLE `seller_applicant`
  MODIFY `applicantID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chats_ibfk_1` FOREIGN KEY (`senderId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `chats_ibfk_2` FOREIGN KEY (`receiverId`) REFERENCES `users` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `sellers` (`seller_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sellers`
--
ALTER TABLE `sellers`
  ADD CONSTRAINT `sellers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `seller_applicant`
--
ALTER TABLE `seller_applicant`
  ADD CONSTRAINT `seller_applicant_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
