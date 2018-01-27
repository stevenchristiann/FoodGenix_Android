-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2017 at 03:32 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_foodgenix`
--
CREATE DATABASE IF NOT EXISTS `db_foodgenix` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_foodgenix`;

-- --------------------------------------------------------

--
-- Table structure for table `block`
--

DROP TABLE IF EXISTS `block`;
CREATE TABLE `block` (
  `ID` varchar(255) NOT NULL,
  `USER_ID` varchar(10) NOT NULL,
  `USER_BLOCKED_ID` varchar(10) NOT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DELETED_AT` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `block`:
--   `USER_BLOCKED_ID`
--       `user` -> `ID`
--   `USER_ID`
--       `user` -> `ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `ID` varchar(10) NOT NULL,
  `USER_ID` varchar(10) NOT NULL,
  `POST_ID` varchar(10) NOT NULL,
  `COMMENT_TEXT` varchar(255) NOT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DELETED_AT` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `comment`:
--   `POST_ID`
--       `post` -> `ID`
--   `USER_ID`
--       `user` -> `ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment_hashtag`
--

DROP TABLE IF EXISTS `comment_hashtag`;
CREATE TABLE `comment_hashtag` (
  `ID` varchar(10) NOT NULL,
  `COMMENT_ID` varchar(10) NOT NULL,
  `HASHTAG_ID` varchar(10) NOT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DELETED_AT` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `comment_hashtag`:
--   `COMMENT_ID`
--       `comment` -> `ID`
--   `HASHTAG_ID`
--       `hashtag` -> `ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `ID` varchar(10) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `ADDRESS` varchar(255) NOT NULL,
  `CITY` varchar(100) NOT NULL,
  `STATE` varchar(100) NOT NULL,
  `PHONE_NUMBER` varchar(20) DEFAULT NULL,
  `CP_NAME` varchar(100) DEFAULT NULL,
  `CP_PHONE_NUMBER` varchar(20) DEFAULT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DELETED_AT` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `company`:
--

-- --------------------------------------------------------

--
-- Table structure for table `exchange_voucher`
--

DROP TABLE IF EXISTS `exchange_voucher`;
CREATE TABLE `exchange_voucher` (
  `ID` varchar(10) NOT NULL,
  `VOUCHER_ID` varchar(10) NOT NULL,
  `USER_ID` varchar(10) NOT NULL,
  `COUNT` int(10) NOT NULL DEFAULT '1',
  `REAL_PRICE` int(10) NOT NULL,
  `FOODGENIX_PRICE` int(10) NOT NULL,
  `REAL_TOTAL` int(15) NOT NULL,
  `FOODGENIX_TOTAL` int(15) NOT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DELETED_AT` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `exchange_voucher`:
--   `VOUCHER_ID`
--       `voucher` -> `ID`
--   `USER_ID`
--       `user` -> `ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `exchange_voucher_code`
--

DROP TABLE IF EXISTS `exchange_voucher_code`;
CREATE TABLE `exchange_voucher_code` (
  `ID` varchar(255) NOT NULL,
  `EXCHANGE_VOUCHER_ID` varchar(10) NOT NULL,
  `VOUCHER_CODE_ID` varchar(255) NOT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DELETED_AT` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `exchange_voucher_code`:
--   `EXCHANGE_VOUCHER_ID`
--       `exchange_voucher` -> `ID`
--   `VOUCHER_CODE_ID`
--       `voucher_code` -> `ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite` (
  `ID` varchar(10) NOT NULL,
  `POST_ID` varchar(10) NOT NULL,
  `USER_ID` varchar(10) NOT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DELETED_AT` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `favorite`:
--   `USER_ID`
--       `user` -> `ID`
--   `POST_ID`
--       `post` -> `ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
  `ID` varchar(255) NOT NULL,
  `USER_ID` varchar(10) NOT NULL,
  `USER_FOLLOWED_ID` varchar(10) NOT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DELETED_AT` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `follow`:
--   `USER_FOLLOWED_ID`
--       `user` -> `ID`
--   `USER_ID`
--       `user` -> `ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `hashtag`
--

DROP TABLE IF EXISTS `hashtag`;
CREATE TABLE `hashtag` (
  `ID` varchar(10) NOT NULL,
  `TEXT` varchar(255) NOT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DELETED_AT` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `hashtag`:
--

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
CREATE TABLE `location` (
  `ID` varchar(10) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `LATITUDE` double NOT NULL,
  `LONGITUDE` double NOT NULL,
  `GOOGLE_MAP_LINK` varchar(255) NOT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DELETED_AT` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `location`:
--

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `ID` varchar(10) NOT NULL,
  `USER_ID` varchar(10) NOT NULL,
  `TEXT` varchar(255) NOT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DELETED_AT` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `log`:
--   `USER_ID`
--       `user` -> `ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `mention`
--

DROP TABLE IF EXISTS `mention`;
CREATE TABLE `mention` (
  `ID` varchar(10) NOT NULL,
  `COMMENT_ID` varchar(10) NOT NULL,
  `USER_ID` varchar(10) NOT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DELETED_AT` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `mention`:
--   `COMMENT_ID`
--       `comment` -> `ID`
--   `USER_ID`
--       `user` -> `ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `photo_tag`
--

DROP TABLE IF EXISTS `photo_tag`;
CREATE TABLE `photo_tag` (
  `ID` varchar(10) NOT NULL,
  `POST_ID` varchar(10) NOT NULL,
  `USER_ID` varchar(10) NOT NULL,
  `X_COORDINATE` int(5) NOT NULL,
  `Y_COORDINATE` int(5) NOT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DELETED_AT` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `photo_tag`:
--   `USER_ID`
--       `user` -> `ID`
--   `POST_ID`
--       `post` -> `ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `point_add`
--

DROP TABLE IF EXISTS `point_add`;
CREATE TABLE `point_add` (
  `ID` varchar(10) NOT NULL,
  `USER_ID` varchar(10) NOT NULL,
  `USER_LIKE_ID` varchar(10) NOT NULL,
  `COUNT` int(7) NOT NULL DEFAULT '0',
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DELETED_AT` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `point_add`:
--   `USER_ID`
--       `user` -> `ID`
--   `USER_LIKE_ID`
--       `user_like` -> `ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `ID` varchar(10) NOT NULL,
  `USER_ID` varchar(10) NOT NULL,
  `POST_URL` varchar(255) NOT NULL,
  `PHOTO_URL` varchar(255) NOT NULL,
  `CAPTION_ID` varchar(10) DEFAULT NULL,
  `LOCATION_ID` varchar(10) DEFAULT NULL,
  `LAST_COMMENT_ID` varchar(10) DEFAULT NULL,
  `SECOND_LAST_COMMENT_ID` varchar(10) DEFAULT NULL,
  `LIKE_COUNT` int(15) NOT NULL DEFAULT '0',
  `COMMENT_COUNT` int(15) NOT NULL DEFAULT '0',
  `IS_PROMOTION` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 not, 1 yes',
  `IS_VIDEO` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 not, 1 yes',
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DELETED_AT` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `post`:
--   `USER_ID`
--       `user` -> `ID`
--   `CAPTION_ID`
--       `comment` -> `ID`
--   `LAST_COMMENT_ID`
--       `comment` -> `ID`
--   `SECOND_LAST_COMMENT_ID`
--       `comment` -> `ID`
--   `LOCATION_ID`
--       `location` -> `ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `post_view`
--

DROP TABLE IF EXISTS `post_view`;
CREATE TABLE `post_view` (
  `ID` varchar(255) NOT NULL,
  `USER_ID` varchar(10) NOT NULL,
  `POST_VIEWED_ID` varchar(10) NOT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DELETED_AT` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `post_view`:
--   `USER_ID`
--       `user` -> `ID`
--   `POST_VIEWED_ID`
--       `post` -> `ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `ID` varchar(255) NOT NULL,
  `POST_ID` varchar(10) NOT NULL,
  `USER_ID` varchar(10) NOT NULL,
  `REASON` varchar(255) NOT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DELETED_AT` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `report`:
--   `POST_ID`
--       `post` -> `ID`
--   `USER_ID`
--       `user` -> `ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `search`
--

DROP TABLE IF EXISTS `search`;
CREATE TABLE `search` (
  `ID` varchar(10) NOT NULL,
  `USER_ID` varchar(10) NOT NULL,
  `KEYWORD` varchar(255) NOT NULL,
  `TYPE` int(1) NOT NULL DEFAULT '0' COMMENT '0 user, 1 hashtag, 2 place',
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DELETED_AT` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `search`:
--   `USER_ID`
--       `user` -> `ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting` (
  `ID` varchar(10) NOT NULL,
  `LANGUAGE` varchar(10) NOT NULL DEFAULT 'ID',
  `PRIVATE_ACCOUNT` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 not, 1 yes',
  `LIKE_NOTIFICATION` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 not, 1 yes',
  `COMMENT_NOTIFICATION` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 not, 1 yes',
  `TAG_NOTIFICATION` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 not, 1 yes',
  `MENTION_NOTIFICATION` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 not, 1 yes',
  `LIKE_COMMENT_TAGGED_NOTIFICATION` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 not, 1 yes',
  `NEW_FOLLOWER_NOTIFICATION` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 not, 1 yes',
  `SAVE_ORIGINAL_PHOTO` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 not, 1 yes',
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DELETED_AT` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `setting`:
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `ID` varchar(10) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `PHONE_NUMBER` varchar(20) NOT NULL,
  `GENDER` tinyint(1) NOT NULL COMMENT '1 male, 0 female',
  `BIRTHDATE` date NOT NULL,
  `FACEBOOK_ID` varchar(255) DEFAULT NULL,
  `GOOGLE_ID` varchar(255) DEFAULT NULL,
  `POST_COUNT` int(15) NOT NULL DEFAULT '0',
  `FOLLOWER_COUNT` int(15) NOT NULL DEFAULT '0',
  `FOLLOWING_COUNT` int(15) NOT NULL DEFAULT '0',
  `PHOTO_URL` varchar(255) DEFAULT NULL,
  `BIO` varchar(255) NOT NULL,
  `FOODGENIX_POINTS` int(15) NOT NULL DEFAULT '0',
  `IS_RESTAURANT` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 not, 1 yes',
  `SETTING_ID` varchar(10) NOT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DELETED_AT` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `user`:
--   `SETTING_ID`
--       `setting` -> `ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `user_like`
--

DROP TABLE IF EXISTS `user_like`;
CREATE TABLE `user_like` (
  `ID` varchar(10) NOT NULL,
  `POST_ID` varchar(10) NOT NULL,
  `USER_ID` varchar(10) NOT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DELETED_AT` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `user_like`:
--   `USER_ID`
--       `user` -> `ID`
--   `POST_ID`
--       `post` -> `ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `user_view`
--

DROP TABLE IF EXISTS `user_view`;
CREATE TABLE `user_view` (
  `ID` varchar(255) NOT NULL,
  `USER_ID` varchar(10) NOT NULL,
  `USER_VIEWED_ID` varchar(10) NOT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DELETED_AT` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `user_view`:
--   `USER_VIEWED_ID`
--       `user` -> `ID`
--   `USER_ID`
--       `user` -> `ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `user_voucher`
--

DROP TABLE IF EXISTS `user_voucher`;
CREATE TABLE `user_voucher` (
  `ID` varchar(10) NOT NULL,
  `USER_ID` varchar(10) NOT NULL,
  `VOUCHER_CODE_ID` varchar(255) NOT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DELETED_AT` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `user_voucher`:
--   `VOUCHER_CODE_ID`
--       `voucher_code` -> `ID`
--   `USER_ID`
--       `user` -> `ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

DROP TABLE IF EXISTS `voucher`;
CREATE TABLE `voucher` (
  `ID` varchar(10) NOT NULL,
  `COMPANY_ID` varchar(10) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `REAL_PRICE` int(10) NOT NULL,
  `FOODGENIX_PRICE` int(10) NOT NULL,
  `START_STOCK` int(10) NOT NULL,
  `REMAINING_STOCK` int(10) NOT NULL,
  `MAX_BUY` int(10) NOT NULL,
  `EXP_DATE` date DEFAULT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DELETED_AT` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `voucher`:
--   `COMPANY_ID`
--       `company` -> `ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `voucher_code`
--

DROP TABLE IF EXISTS `voucher_code`;
CREATE TABLE `voucher_code` (
  `ID` varchar(255) NOT NULL,
  `VOUCHER_ID` varchar(10) NOT NULL,
  `CODE` varchar(255) NOT NULL,
  `REDEEM_DATETIME` timestamp NULL DEFAULT NULL,
  `EXP_DATE` date DEFAULT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DELETED_AT` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `voucher_code`:
--   `VOUCHER_ID`
--       `voucher` -> `ID`
--

--
-- Indexes for dumped tables
--

--
-- Indexes for table `block`
--
ALTER TABLE `block`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_REFERENCE_16` (`USER_BLOCKED_ID`),
  ADD KEY `FK_REFERENCE_17` (`USER_ID`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_REFERENCE_6` (`POST_ID`),
  ADD KEY `FK_REFERENCE_7` (`USER_ID`);

--
-- Indexes for table `comment_hashtag`
--
ALTER TABLE `comment_hashtag`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_REFERENCE_23` (`COMMENT_ID`),
  ADD KEY `FK_REFERENCE_24` (`HASHTAG_ID`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `exchange_voucher`
--
ALTER TABLE `exchange_voucher`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_REFERENCE_35` (`VOUCHER_ID`),
  ADD KEY `FK_REFERENCE_36` (`USER_ID`);

--
-- Indexes for table `exchange_voucher_code`
--
ALTER TABLE `exchange_voucher_code`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_REFERENCE_37` (`EXCHANGE_VOUCHER_ID`),
  ADD KEY `FK_REFERENCE_38` (`VOUCHER_CODE_ID`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_REFERENCE_29` (`USER_ID`),
  ADD KEY `FK_REFERENCE_30` (`POST_ID`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_REFERENCE_14` (`USER_FOLLOWED_ID`),
  ADD KEY `FK_REFERENCE_15` (`USER_ID`);

--
-- Indexes for table `hashtag`
--
ALTER TABLE `hashtag`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_REFERENCE_20` (`USER_ID`);

--
-- Indexes for table `mention`
--
ALTER TABLE `mention`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_REFERENCE_25` (`COMMENT_ID`),
  ADD KEY `FK_REFERENCE_26` (`USER_ID`);

--
-- Indexes for table `photo_tag`
--
ALTER TABLE `photo_tag`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_REFERENCE_10` (`USER_ID`),
  ADD KEY `FK_REFERENCE_9` (`POST_ID`);

--
-- Indexes for table `point_add`
--
ALTER TABLE `point_add`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_REFERENCE_31` (`USER_ID`),
  ADD KEY `FK_REFERENCE_32` (`USER_LIKE_ID`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_REFERENCE_1` (`USER_ID`),
  ADD KEY `FK_REFERENCE_3` (`CAPTION_ID`),
  ADD KEY `FK_REFERENCE_4` (`LAST_COMMENT_ID`),
  ADD KEY `FK_REFERENCE_5` (`SECOND_LAST_COMMENT_ID`),
  ADD KEY `FK_REFERENCE_8` (`LOCATION_ID`);

--
-- Indexes for table `post_view`
--
ALTER TABLE `post_view`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_REFERENCE_18` (`USER_ID`),
  ADD KEY `FK_REFERENCE_19` (`POST_VIEWED_ID`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_REFERENCE_11` (`POST_ID`),
  ADD KEY `FK_REFERENCE_12` (`USER_ID`);

--
-- Indexes for table `search`
--
ALTER TABLE `search`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_REFERENCE_13` (`USER_ID`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FACEBOOK_ID` (`FACEBOOK_ID`),
  ADD KEY `GOOGLE_ID` (`GOOGLE_ID`),
  ADD KEY `SETTING_ID` (`SETTING_ID`),
  ADD KEY `USERNAME` (`USERNAME`);

--
-- Indexes for table `user_like`
--
ALTER TABLE `user_like`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_REFERENCE_27` (`USER_ID`),
  ADD KEY `FK_REFERENCE_28` (`POST_ID`);

--
-- Indexes for table `user_view`
--
ALTER TABLE `user_view`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_REFERENCE_21` (`USER_VIEWED_ID`),
  ADD KEY `FK_REFERENCE_22` (`USER_ID`);

--
-- Indexes for table `user_voucher`
--
ALTER TABLE `user_voucher`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_REFERENCE_39` (`VOUCHER_CODE_ID`),
  ADD KEY `FK_REFERENCE_40` (`USER_ID`);

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_REFERENCE_33` (`COMPANY_ID`);

--
-- Indexes for table `voucher_code`
--
ALTER TABLE `voucher_code`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_REFERENCE_34` (`VOUCHER_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `block`
--
ALTER TABLE `block`
  ADD CONSTRAINT `FK_REFERENCE_16` FOREIGN KEY (`USER_BLOCKED_ID`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `FK_REFERENCE_17` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_REFERENCE_6` FOREIGN KEY (`POST_ID`) REFERENCES `post` (`ID`),
  ADD CONSTRAINT `FK_REFERENCE_7` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`);

--
-- Constraints for table `comment_hashtag`
--
ALTER TABLE `comment_hashtag`
  ADD CONSTRAINT `FK_REFERENCE_23` FOREIGN KEY (`COMMENT_ID`) REFERENCES `comment` (`ID`),
  ADD CONSTRAINT `FK_REFERENCE_24` FOREIGN KEY (`HASHTAG_ID`) REFERENCES `hashtag` (`ID`);

--
-- Constraints for table `exchange_voucher`
--
ALTER TABLE `exchange_voucher`
  ADD CONSTRAINT `FK_REFERENCE_35` FOREIGN KEY (`VOUCHER_ID`) REFERENCES `voucher` (`ID`),
  ADD CONSTRAINT `FK_REFERENCE_36` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`);

--
-- Constraints for table `exchange_voucher_code`
--
ALTER TABLE `exchange_voucher_code`
  ADD CONSTRAINT `FK_REFERENCE_37` FOREIGN KEY (`EXCHANGE_VOUCHER_ID`) REFERENCES `exchange_voucher` (`ID`),
  ADD CONSTRAINT `FK_REFERENCE_38` FOREIGN KEY (`VOUCHER_CODE_ID`) REFERENCES `voucher_code` (`ID`);

--
-- Constraints for table `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `FK_REFERENCE_29` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `FK_REFERENCE_30` FOREIGN KEY (`POST_ID`) REFERENCES `post` (`ID`);

--
-- Constraints for table `follow`
--
ALTER TABLE `follow`
  ADD CONSTRAINT `FK_REFERENCE_14` FOREIGN KEY (`USER_FOLLOWED_ID`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `FK_REFERENCE_15` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`);

--
-- Constraints for table `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `FK_REFERENCE_20` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`);

--
-- Constraints for table `mention`
--
ALTER TABLE `mention`
  ADD CONSTRAINT `FK_REFERENCE_25` FOREIGN KEY (`COMMENT_ID`) REFERENCES `comment` (`ID`),
  ADD CONSTRAINT `FK_REFERENCE_26` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`);

--
-- Constraints for table `photo_tag`
--
ALTER TABLE `photo_tag`
  ADD CONSTRAINT `FK_REFERENCE_10` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `FK_REFERENCE_9` FOREIGN KEY (`POST_ID`) REFERENCES `post` (`ID`);

--
-- Constraints for table `point_add`
--
ALTER TABLE `point_add`
  ADD CONSTRAINT `FK_REFERENCE_31` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `FK_REFERENCE_32` FOREIGN KEY (`USER_LIKE_ID`) REFERENCES `user_like` (`ID`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FK_REFERENCE_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `FK_REFERENCE_3` FOREIGN KEY (`CAPTION_ID`) REFERENCES `comment` (`ID`),
  ADD CONSTRAINT `FK_REFERENCE_4` FOREIGN KEY (`LAST_COMMENT_ID`) REFERENCES `comment` (`ID`),
  ADD CONSTRAINT `FK_REFERENCE_5` FOREIGN KEY (`SECOND_LAST_COMMENT_ID`) REFERENCES `comment` (`ID`),
  ADD CONSTRAINT `FK_REFERENCE_8` FOREIGN KEY (`LOCATION_ID`) REFERENCES `location` (`ID`);

--
-- Constraints for table `post_view`
--
ALTER TABLE `post_view`
  ADD CONSTRAINT `FK_REFERENCE_18` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `FK_REFERENCE_19` FOREIGN KEY (`POST_VIEWED_ID`) REFERENCES `post` (`ID`);

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `FK_REFERENCE_11` FOREIGN KEY (`POST_ID`) REFERENCES `post` (`ID`),
  ADD CONSTRAINT `FK_REFERENCE_12` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`);

--
-- Constraints for table `search`
--
ALTER TABLE `search`
  ADD CONSTRAINT `FK_REFERENCE_13` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_REFERENCE_2` FOREIGN KEY (`SETTING_ID`) REFERENCES `setting` (`ID`);

--
-- Constraints for table `user_like`
--
ALTER TABLE `user_like`
  ADD CONSTRAINT `FK_REFERENCE_27` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `FK_REFERENCE_28` FOREIGN KEY (`POST_ID`) REFERENCES `post` (`ID`);

--
-- Constraints for table `user_view`
--
ALTER TABLE `user_view`
  ADD CONSTRAINT `FK_REFERENCE_21` FOREIGN KEY (`USER_VIEWED_ID`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `FK_REFERENCE_22` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`);

--
-- Constraints for table `user_voucher`
--
ALTER TABLE `user_voucher`
  ADD CONSTRAINT `FK_REFERENCE_39` FOREIGN KEY (`VOUCHER_CODE_ID`) REFERENCES `voucher_code` (`ID`),
  ADD CONSTRAINT `FK_REFERENCE_40` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`);

--
-- Constraints for table `voucher`
--
ALTER TABLE `voucher`
  ADD CONSTRAINT `FK_REFERENCE_33` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`ID`);

--
-- Constraints for table `voucher_code`
--
ALTER TABLE `voucher_code`
  ADD CONSTRAINT `FK_REFERENCE_34` FOREIGN KEY (`VOUCHER_ID`) REFERENCES `voucher` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
