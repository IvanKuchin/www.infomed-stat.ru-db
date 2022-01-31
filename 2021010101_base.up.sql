-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 30, 2022 at 05:50 PM
-- Server version: 5.7.33-0ubuntu0.16.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dev.infomed-stat.ru`
--

-- --------------------------------------------------------

--
-- Table structure for table `action_category`
--

CREATE TABLE `action_category` (
  `id` int(11) NOT NULL,
  `title` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_male` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_female` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `action_types`
--

CREATE TABLE `action_types` (
  `id` int(11) NOT NULL,
  `categoryID` int(3) NOT NULL,
  `title` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_male` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_female` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isShowFeed` int(1) NOT NULL,
  `isShowNotification` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activators`
--

CREATE TABLE `activators` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` enum('regNewUser','password_recovery') COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL DEFAULT '2000-01-01 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `captcha`
--

CREATE TABLE `captcha` (
  `id` int(5) NOT NULL,
  `session` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purpose` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_contact_list`
--

CREATE TABLE `chat_contact_list` (
  `id` int(10) NOT NULL,
  `userID` int(10) NOT NULL,
  `friendID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` bigint(20) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `messageType` enum('text','image') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `fromType` enum('fromUser','fromCompany') COLLATE utf8mb4_unicode_ci NOT NULL,
  `fromID` int(11) NOT NULL,
  `toType` enum('toUser','toCompany','toGroup','Broadcast') COLLATE utf8mb4_unicode_ci NOT NULL,
  `toID` int(11) NOT NULL,
  `messageStatus` enum('unread','read','unread_const','delivered','sent') COLLATE utf8mb4_unicode_ci NOT NULL,
  `eventTimestamp` datetime NOT NULL,
  `secondsSinceY2k` bigint(15) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `title` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `eventTimestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_data_access`
--

CREATE TABLE `company_data_access` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `company_id_data_available` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_employment`
--

CREATE TABLE `company_employment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dictionary_adverse`
--

CREATE TABLE `dictionary_adverse` (
  `id` int(11) NOT NULL,
  `word` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_change_tokens`
--

CREATE TABLE `email_change_tokens` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `new_email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `eventTimestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exception`
--

CREATE TABLE `exception` (
  `identifier` int(3) UNSIGNED NOT NULL,
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `template` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lng` char(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `role` enum('subcontractor','helpdesk','agency','approver','user') COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feed`
--

CREATE TABLE `feed` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `srcType` enum('user','company','group') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `userId` int(11) NOT NULL COMMENT 'srcID (something producing action)',
  `dstType` enum('user','company','group','') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `dstID` int(11) NOT NULL DEFAULT '0',
  `actionTypeId` int(11) NOT NULL COMMENT 'Action type',
  `actionId` int(11) NOT NULL DEFAULT '0' COMMENT 'Additional data',
  `eventTimestamp` datetime NOT NULL COMMENT 'format YYYY-MM-DD HH:MM:SS'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feed_images`
--

CREATE TABLE `feed_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `setID` int(11) NOT NULL DEFAULT '0',
  `srcType` enum('user','company','group') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `userID` int(10) NOT NULL,
  `folder` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mediaType` enum('image','video','youtube_video') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image',
  `isActive` tinyint(1) NOT NULL DEFAULT '0',
  `tempSet` int(9) NOT NULL,
  `removeFlag` enum('keep','remove') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'keep',
  `exifDateTime` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifGPSAltitude` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifGPSLatitude` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifGPSLongitude` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifGPSSpeed` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifModel` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifAuthors` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifApertureValue` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifBrightnessValue` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifColorSpace` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifComponentsConfiguration` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifCompression` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifDateTimeDigitized` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifDateTimeOriginal` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifExifImageLength` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifExifImageWidth` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifExifOffset` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifExifVersion` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifExposureBiasValue` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifExposureMode` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifExposureProgram` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifExposureTime` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifFlash` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifFlashPixVersion` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifFNumber` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifFocalLength` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifFocalLengthIn35mmFilm` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifGPSDateStamp` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifGPSDestBearing` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifGPSDestBearingRef` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifGPSImgDirection` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifGPSImgDirectionRef` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifGPSInfo` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifGPSTimeStamp` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifISOSpeedRatings` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifJPEGInterchangeFormat` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifJPEGInterchangeFormatLength` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifMake` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifMeteringMode` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifOrientation` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifResolutionUnit` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifSceneCaptureType` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifSceneType` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifSensingMethod` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifShutterSpeedValue` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifSoftware` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifSubjectArea` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifSubSecTimeDigitized` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifSubSecTimeOriginal` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifWhiteBalance` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifXResolution` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifYCbCrPositioning` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifYResolution` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feed_message`
--

CREATE TABLE `feed_message` (
  `id` int(11) NOT NULL,
  `title` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `imageSetID` int(11) NOT NULL,
  `access` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ATTENTION ! "Table truncation" must be implemented with care';

-- --------------------------------------------------------

--
-- Table structure for table `feed_message_comment`
--

CREATE TABLE `feed_message_comment` (
  `id` int(11) NOT NULL,
  `messageID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `type` enum('message','book','certification','university','course','language','school','company') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'message',
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `eventTimestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feed_message_params`
--

CREATE TABLE `feed_message_params` (
  `id` int(10) UNSIGNED NOT NULL,
  `parameter` enum('like','spam','likeBook','likeCertification','likeUniversityDegree','likeCourse','likeLanguage','likeSchool','likeCompany') COLLATE utf8mb4_unicode_ci NOT NULL,
  `messageID` int(11) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `geo_country`
--

CREATE TABLE `geo_country` (
  `id` int(11) NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `geo_locality`
--

CREATE TABLE `geo_locality` (
  `id` int(11) NOT NULL,
  `geo_region_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `population` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `geo_region`
--

CREATE TABLE `geo_region` (
  `id` int(11) NOT NULL,
  `geo_country_id` int(11) NOT NULL DEFAULT '7',
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `geo_zip`
--

CREATE TABLE `geo_zip` (
  `id` int(11) NOT NULL,
  `zip` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `geo_locality_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `geo_zip_view`
--
CREATE TABLE `geo_zip_view` (
`zip_id` int(11)
,`zip` varchar(16)
,`locality_id` int(11)
,`locality_title` varchar(128)
,`region_id` int(11)
,`region_title` varchar(128)
,`country_id` int(11)
,`country_title` varchar(128)
);

-- --------------------------------------------------------

--
-- Table structure for table `helpdesk_tickets`
--

CREATE TABLE `helpdesk_tickets` (
  `id` int(11) NOT NULL,
  `title` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `helpdesk_ticket_attaches`
--

CREATE TABLE `helpdesk_ticket_attaches` (
  `id` int(11) NOT NULL,
  `helpdesk_ticket_history_id` int(11) NOT NULL,
  `filename` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `helpdesk_ticket_history`
--

CREATE TABLE `helpdesk_ticket_history` (
  `id` int(11) NOT NULL,
  `helpdesk_ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `severity` int(11) NOT NULL,
  `state` enum('new','customer_pending','company_pending','assigned','solution_provided','monitoring','close_pending','closed','severity_changed','change_company_user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `eventTimestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `helpdesk_ticket_history_helpdesk_users_view`
--
CREATE TABLE `helpdesk_ticket_history_helpdesk_users_view` (
`id` int(11)
,`helpdesk_ticket_id` int(11)
,`user_id` int(11)
,`severity` int(11)
,`state` enum('new','customer_pending','company_pending','assigned','solution_provided','monitoring','close_pending','closed','severity_changed','change_company_user')
,`description` text
,`eventTimestamp` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `helpdesk_ticket_history_last_case_state_view`
--
CREATE TABLE `helpdesk_ticket_history_last_case_state_view` (
`id` int(11)
,`helpdesk_ticket_id` int(11)
,`user_id` int(11)
,`severity` int(11)
,`state` enum('new','customer_pending','company_pending','assigned','solution_provided','monitoring','close_pending','closed','severity_changed','change_company_user')
,`description` text
,`eventTimestamp` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `helpdesk_ticket_history_last_helpdesk_user_update_view`
--
CREATE TABLE `helpdesk_ticket_history_last_helpdesk_user_update_view` (
`id` int(11)
,`helpdesk_ticket_id` int(11)
,`user_id` int(11)
,`severity` int(11)
,`state` enum('new','customer_pending','company_pending','assigned','solution_provided','monitoring','close_pending','closed','severity_changed','change_company_user')
,`description` text
,`eventTimestamp` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `id` int(11) NOT NULL,
  `title` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo_folder` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `logo_filename` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medical_records`
--

CREATE TABLE `medical_records` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL COMMENT 'possession identification',
  `submitter_user_id` int(11) NOT NULL COMMENT 'used for edit and removal',
  `eventTimestamp` int(11) NOT NULL,
  `___last_name` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___first_name` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___middle_name` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___birthdate` date NOT NULL,
  `___medical_history_number` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___phone` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___zip_code` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___region` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___locality` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___comment` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___cancer_type` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___non_pancreatobiliary_sickness` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___resectability` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___brca` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___brca_localization_breast` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___brca_localization_ovaries` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___portal_vein` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___sup_mesent_vein` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___venous_confluence` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___top_branches` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___portal_vein___lesion_volume` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___portal_vein___roughness_contour` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___portal_vein___envasion_extent` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___portal_vein___thrombosis` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___sup_mesent_vein___lesion_volume` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___sup_mesent_vein___roughness_contour` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___sup_mesent_vein___envasion_extent` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___sup_mesent_vein___thrombosis` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___venous_confluence___lesion_volume` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___venous_confluence___roughness_contour` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___venous_confluence___envasion_extent` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___venous_confluence___thrombosis` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___top_branches___lesion_volume` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___top_branches___roughness_contour` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___top_branches___envasion_extent` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___top_branches___thrombosis` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___sup_mesent_artery` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___celiac_trunk` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___common_hepatic_art` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___sup_mesent_artery___lesion_volume` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___sup_mesent_artery___roughness_contour` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___sup_mesent_artery___envasion_extent` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___sup_mesent_artery___thrombosis` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___celiac_trunk___lesion_volume` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___celiac_trunk___roughness_contour` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___celiac_trunk___envasion_extent` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___celiac_trunk___thrombosis` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___common_hepatic_art___lesion_volume` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___common_hepatic_art___roughness_contour` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___common_hepatic_art___envasion_extent` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_petct___common_hepatic_art___thrombosis` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___portal_vein` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___sup_mesent_vein` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___venous_confluence` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___top_branches` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___portal_vein___lesion_volume` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___portal_vein___roughness_contour` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___portal_vein___envasion_extent` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___portal_vein___thrombosis` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___sup_mesent_vein___lesion_volume` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___sup_mesent_vein___roughness_contour` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___sup_mesent_vein___envasion_extent` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___sup_mesent_vein___thrombosis` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___venous_confluence___lesion_volume` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___venous_confluence___roughness_contour` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___venous_confluence___envasion_extent` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___venous_confluence___thrombosis` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___top_branches___lesion_volume` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___top_branches___roughness_contour` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___top_branches___envasion_extent` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___top_branches___thrombosis` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___sup_mesent_artery` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___celiac_trunk` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___common_hepatic_art` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___sup_mesent_artery___lesion_volume` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___sup_mesent_artery___roughness_contour` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___sup_mesent_artery___envasion_extent` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___sup_mesent_artery___thrombosis` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___celiac_trunk___lesion_volume` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___celiac_trunk___roughness_contour` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___celiac_trunk___envasion_extent` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___celiac_trunk___thrombosis` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___common_hepatic_art___lesion_volume` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___common_hepatic_art___roughness_contour` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___common_hepatic_art___envasion_extent` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_ct___common_hepatic_art___thrombosis` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___damage_to_lymph_nodes` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___distant_metastases` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___liver` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___lungs` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___peritoneum` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___other` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___other___another_option` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_lab_ca_level_19` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_lab_rea` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_lab_nse` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_lab_chromo` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pre_op_lab_serot` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___bilirubin_level_at_operation` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___drainage` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___drainage___drainage_options` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___neoadj_chemo` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___neoadj_chemo___scheme_name` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___neoadj_chemo___scheme_quantity` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___neoadj_chemo___start_date` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___neoadj_chemo___finish_date` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___neoadj_chemo___adverse_event` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___ray_therapy` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___neoadj_chemo___idworak` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___ray_therapy___another_option` text CHARACTER SET utf8 NOT NULL,
  `___brachi_therapy` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___brachi_therapy___another_option` text CHARACTER SET utf8 NOT NULL,
  `___loko_therapy` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___loko_therapy___another_option` text CHARACTER SET utf8 NOT NULL,
  `___ct_post_adj_therapy` varchar(8) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___portal_vein` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___sup_mesent_vein` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___venous_confluence` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___top_branches` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___portal_vein___lesion_volume` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___portal_vein___roughness_contour` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___portal_vein___envasion_extent` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___portal_vein___thrombosis` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___sup_mesent_vein___lesion_volume` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___sup_mesent_vein___roughness_contour` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___sup_mesent_vein___envasion_extent` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___sup_mesent_vein___thrombosis` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___venous_confluence___lesion_volume` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___venous_confluence___roughness_contour` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___venous_confluence___envasion_extent` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___venous_confluence___thrombosis` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___top_branches___lesion_volume` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___top_branches___roughness_contour` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___top_branches___envasion_extent` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___top_branches___thrombosis` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___sup_mesent_artery` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___celiac_trunk` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___common_hepatic_art` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___sup_mesent_artery___lesion_volume` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___sup_mesent_artery___roughness_contour` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___sup_mesent_artery___envasion_extent` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___sup_mesent_artery___thrombosis` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___celiac_trunk___lesion_volume` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___celiac_trunk___roughness_contour` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___celiac_trunk___envasion_extent` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___celiac_trunk___thrombosis` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___common_hepatic_art___lesion_volume` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___common_hepatic_art___roughness_contour` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___common_hepatic_art___envasion_extent` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___common_hepatic_art___thrombosis` varchar(32) NOT NULL DEFAULT '',
  `___ct_post_adj_therapy___recist` varchar(32) NOT NULL DEFAULT '',
  `___op_done` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___op_done___invasion_date` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___op_done___operation_type` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___op_done___operation_class` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___op_done___vasc_resect` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___op_done___vasc_resect___portal_vein` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___op_done___vasc_resect___sup_mesent_vein` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___op_done___vasc_resect___venous_confluence` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___op_done___vasc_resect___top_branches` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___op_done___vasc_resect___portal_vein___resect_type` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___op_done___vasc_resect___portal_vein___resect_extent` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___op_done___vasc_resect___sup_mesent_vein___resect_type` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___op_done___vasc_resect___sup_mesent_vein___resect_extent` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___op_done___vasc_resect___venous_confluence___resect_type` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___op_done___vasc_resect___venous_confluence___resect_extent` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___op_done___vasc_resect___top_branches___resect_type` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___op_done___vasc_resect___top_branches___resect_extent` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___op_done___vasc_resect___sup_mesent_artery` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___op_done___vasc_resect___celiac_trunk` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___op_done___vasc_resect___common_hepatic_art` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___op_done___vasc_resect___sup_mesent_artery___resect_type` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___op_done___vasc_resect___sup_mesent_artery___resect_extent` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___op_done___vasc_resect___celiac_trunk___resect_type` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___op_done___vasc_resect___celiac_trunk___resect_extent` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___op_done___vasc_resect___common_hepatic_art___resect_type` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___op_done___vasc_resect___common_hepatic_art___resect_extent` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___another_organ_resect` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___another_organ_resect___liver` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___another_organ_resect___colon` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___another_organ_resect___bud` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___another_organ_resect___other` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___another_organ_resect___other___another_option` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___complications` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___complications___clavien_dindo_complications` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___pancreatic_fistula` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___differentiation_level` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___cancer_size` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___lymph_node_damage` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___lymph_node_damage___number_lymph_node_damage` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___separate_metastases` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___resect_edge_type_r1` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___resect_edge_type_r1___front` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___resect_edge_type_r1___back` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___resect_edge_type_r1___medial` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___resect_edge_type_r1___top` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___vascular_growing` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___vascular_growing___vascular_type_artery` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___vascular_growing___vascular_type_artery___invasion_level` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___vascular_growing___vascular_type_vein` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___vascular_growing___vascular_type_vein___invasion_level` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___preneural_invasion` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___adjuvant_chemotherapy_conduct` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___adjuvant_chemotherapy_conduct___scheme_name` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___adjuvant_chemotherapy_conduct___scheme_quantity` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___adjuvant_chemotherapy_conduct___adverse_event` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___adjuvant_chemotherapy_conduct___start_date` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___adjuvant_chemotherapy_conduct___finish_date` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___relapse_date` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___relapse_biochemical` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___relapse_metastases` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___relapse_local` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___relapse_local___chemo_therapy` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___relapse_local___chemo_therapy___second_line` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___relapse_local___chemo_therapy___second_line___scheme_name` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___relapse_local___chemo_therapy___second_line___scheme_quantity` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___relapse_local___chemo_therapy___second_line___start_date` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___relapse_local___chemo_therapy___second_line___finish_date` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___relapse_local___chemo_therapy___second_line___adverse_event` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___relapse_local___chemo_therapy___third_line` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___relapse_local___chemo_therapy___third_line___scheme_name` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___relapse_local___chemo_therapy___third_line___scheme_quantity` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___relapse_local___chemo_therapy___third_line___start_date` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___relapse_local___chemo_therapy___third_line___finish_date` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___relapse_local___chemo_therapy___third_line___adverse_event` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___relapse_local___syrgical_treatment` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___relapse_local___xray_therapy` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___relapse_metastases___liver` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___relapse_metastases___lungs` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___relapse_metastases___peritoneum` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___relapse_metastases___other` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___relapse_metastases___other___another_option` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___study_retirement_date` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `___death_date` varchar(65) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `name_sex`
--

CREATE TABLE `name_sex` (
  `id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_dictionary_adjectives`
--

CREATE TABLE `password_dictionary_adjectives` (
  `id` int(11) NOT NULL,
  `word` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_dictionary_characteristics`
--

CREATE TABLE `password_dictionary_characteristics` (
  `id` int(11) NOT NULL,
  `word` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_dictionary_nouns`
--

CREATE TABLE `password_dictionary_nouns` (
  `id` int(11) NOT NULL,
  `word` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_confirmation`
--

CREATE TABLE `phone_confirmation` (
  `id` int(11) NOT NULL,
  `session` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `confirmation_code` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone_number` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attempt` int(11) NOT NULL DEFAULT '0',
  `eventTimestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL,
  `country_auto` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `city_auto` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lng` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ip` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `http_user_agent` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `expire` int(11) NOT NULL DEFAULT '3600' COMMENT 'session duration in seconds',
  `remove_flag` enum('N','Y','pending') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `remove_flag_timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'troubleshooting purposes',
  `previous_sessid` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions_persistence_ratelimit`
--

CREATE TABLE `sessions_persistence_ratelimit` (
  `id` int(11) NOT NULL,
  `ip` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` int(11) NOT NULL,
  `eventTimestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings_default`
--

CREATE TABLE `settings_default` (
  `id` int(11) NOT NULL,
  `setting` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_themes`
--

CREATE TABLE `site_themes` (
  `id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_report`
--

CREATE TABLE `sms_report` (
  `id` int(11) NOT NULL,
  `number` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sms_id` int(11) NOT NULL,
  `sms_cost` float NOT NULL,
  `sms_quantity` int(11) NOT NULL DEFAULT '1',
  `sms_text` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `current_balance` float NOT NULL,
  `eventTimestamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temp_media`
--

CREATE TABLE `temp_media` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'user uploaded image',
  `mediaType` enum('image','youtube_video') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image',
  `folder` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `eventTimestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email_changeable` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `type` enum('subcontractor','approver','agency','no role','user','guest','helpdesk') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `isactivated` enum('N','Y') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `isblocked` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `lng` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ru',
  `regdate` date NOT NULL DEFAULT '2000-01-01',
  `partnerid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `country` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `geo_locality_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nameLast` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nameMiddle` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `country_code` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_phone_confirmed` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `cv` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `passport_series` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `passport_number` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `passport_issue_date` date NOT NULL DEFAULT '1900-01-01',
  `passport_issue_authority` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `foreign_passport_number` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `foreign_passport_expiration_date` date NOT NULL DEFAULT '1900-01-01',
  `first_name_en` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `last_name_en` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `middle_name_en` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `citizenship_code` enum('RU') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'RU',
  `sex` enum('male','female','') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `birthday` date NOT NULL DEFAULT '1900-01-01',
  `birthdayAccess` enum('public','private') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'private',
  `site_theme_id` int(11) NOT NULL DEFAULT '1',
  `smartway_employee_id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `appliedVacanciesRender` enum('all','inprogress') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all' COMMENT 'declares vacancies render in profile_edit: "show all" / "in-progress"',
  `helpdesk_new_notification_S1_sms` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `helpdesk_new_notification_S2_sms` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `helpdesk_new_notification_S3_sms` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `helpdesk_new_notification_S4_sms` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `helpdesk_new_notification_S1_email` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `helpdesk_new_notification_S2_email` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `helpdesk_new_notification_S3_email` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `helpdesk_new_notification_S4_email` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `helpdesk_subscription_S1_sms` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `helpdesk_subscription_S2_sms` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `helpdesk_subscription_S3_sms` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `helpdesk_subscription_S4_sms` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `helpdesk_subscription_S1_email` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `helpdesk_subscription_S2_email` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `helpdesk_subscription_S3_email` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `helpdesk_subscription_S4_email` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `last_online` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT 'используется для presence',
  `last_onlineSecondsSinceY2k` bigint(15) NOT NULL DEFAULT '0',
  `ip` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `activated` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `activator_sent` datetime NOT NULL DEFAULT '2000-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_aaa`
--

CREATE TABLE `users_aaa` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_avatars`
--

CREATE TABLE `users_avatars` (
  `id` int(10) UNSIGNED NOT NULL,
  `userid` int(10) NOT NULL,
  `folder` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_block`
--

CREATE TABLE `users_block` (
  `userid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `notes` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_company`
--

CREATE TABLE `users_company` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `position_title_id` int(11) NOT NULL,
  `occupation_start` date NOT NULL,
  `occupation_finish` date NOT NULL,
  `current_company` tinyint(1) NOT NULL,
  `responsibilities` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_friends`
--

CREATE TABLE `users_friends` (
  `id` int(10) UNSIGNED NOT NULL,
  `userID` int(11) NOT NULL,
  `friendID` int(11) NOT NULL,
  `state` enum('requested','confirmed','blocked','ignored','requesting') COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_notification`
--

CREATE TABLE `users_notification` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `userId` int(11) NOT NULL COMMENT 'User making an action',
  `actionTypeId` int(11) NOT NULL COMMENT 'Action type',
  `actionId` int(11) NOT NULL DEFAULT '0' COMMENT 'Additional data',
  `notificationStatus` enum('read','unread') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `eventTimestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_passwd`
--

CREATE TABLE `users_passwd` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `passwd` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isActive` enum('true','false') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `eventTimestamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_watched`
--

CREATE TABLE `users_watched` (
  `id` int(11) NOT NULL,
  `watched_userID` int(11) NOT NULL,
  `watching_userID` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure for view `geo_zip_view`
--
DROP TABLE IF EXISTS `geo_zip_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `geo_zip_view`  AS  select `geo_zip`.`id` AS `zip_id`,`geo_zip`.`zip` AS `zip`,`geo_locality`.`id` AS `locality_id`,`geo_locality`.`title` AS `locality_title`,`geo_region`.`id` AS `region_id`,`geo_region`.`title` AS `region_title`,`geo_country`.`id` AS `country_id`,`geo_country`.`title` AS `country_title` from (((`geo_zip` join `geo_locality` on((`geo_zip`.`geo_locality_id` = `geo_locality`.`id`))) join `geo_region` on((`geo_region`.`id` = `geo_locality`.`geo_region_id`))) join `geo_country` on((`geo_region`.`geo_country_id` = `geo_country`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `helpdesk_ticket_history_helpdesk_users_view`
--
DROP TABLE IF EXISTS `helpdesk_ticket_history_helpdesk_users_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `helpdesk_ticket_history_helpdesk_users_view`  AS  select `helpdesk_ticket_history`.`id` AS `id`,`helpdesk_ticket_history`.`helpdesk_ticket_id` AS `helpdesk_ticket_id`,`helpdesk_ticket_history`.`user_id` AS `user_id`,`helpdesk_ticket_history`.`severity` AS `severity`,`helpdesk_ticket_history`.`state` AS `state`,`helpdesk_ticket_history`.`description` AS `description`,`helpdesk_ticket_history`.`eventTimestamp` AS `eventTimestamp` from `helpdesk_ticket_history` where `helpdesk_ticket_history`.`user_id` in (select `users`.`id` from `users` where (`users`.`type` = 'helpdesk')) ;

-- --------------------------------------------------------

--
-- Structure for view `helpdesk_ticket_history_last_case_state_view`
--
DROP TABLE IF EXISTS `helpdesk_ticket_history_last_case_state_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `helpdesk_ticket_history_last_case_state_view`  AS  select `a`.`id` AS `id`,`a`.`helpdesk_ticket_id` AS `helpdesk_ticket_id`,`a`.`user_id` AS `user_id`,`a`.`severity` AS `severity`,`a`.`state` AS `state`,`a`.`description` AS `description`,`a`.`eventTimestamp` AS `eventTimestamp` from (`helpdesk_ticket_history` `a` left join `helpdesk_ticket_history` `b` on(((`a`.`helpdesk_ticket_id` = `b`.`helpdesk_ticket_id`) and (`a`.`eventTimestamp` < `b`.`eventTimestamp`)))) where isnull(`b`.`helpdesk_ticket_id`) ;

-- --------------------------------------------------------

--
-- Structure for view `helpdesk_ticket_history_last_helpdesk_user_update_view`
--
DROP TABLE IF EXISTS `helpdesk_ticket_history_last_helpdesk_user_update_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `helpdesk_ticket_history_last_helpdesk_user_update_view`  AS  select `a`.`id` AS `id`,`a`.`helpdesk_ticket_id` AS `helpdesk_ticket_id`,`a`.`user_id` AS `user_id`,`a`.`severity` AS `severity`,`a`.`state` AS `state`,`a`.`description` AS `description`,`a`.`eventTimestamp` AS `eventTimestamp` from (`helpdesk_ticket_history_helpdesk_users_view` `a` left join `helpdesk_ticket_history_helpdesk_users_view` `b` on(((`a`.`helpdesk_ticket_id` = `b`.`helpdesk_ticket_id`) and (`a`.`eventTimestamp` < `b`.`eventTimestamp`)))) where isnull(`b`.`helpdesk_ticket_id`) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `action_category`
--
ALTER TABLE `action_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `action_types`
--
ALTER TABLE `action_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryID` (`categoryID`),
  ADD KEY `title` (`title`),
  ADD KEY `isShowNotification` (`isShowNotification`),
  ADD KEY `isShowFeed` (`isShowFeed`);

--
-- Indexes for table `activators`
--
ALTER TABLE `activators`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `captcha`
--
ALTER TABLE `captcha`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `id_3` (`id`),
  ADD KEY `id_4` (`id`);

--
-- Indexes for table `chat_contact_list`
--
ALTER TABLE `chat_contact_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fromType` (`fromType`),
  ADD KEY `fromID` (`fromID`),
  ADD KEY `toType` (`toType`),
  ADD KEY `toID` (`toID`),
  ADD KEY `messageStatus` (`messageStatus`),
  ADD KEY `secondsSinceY2k` (`secondsSinceY2k`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`title`);

--
-- Indexes for table `company_data_access`
--
ALTER TABLE `company_data_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `company_id_data_available` (`company_id_data_available`);

--
-- Indexes for table `company_employment`
--
ALTER TABLE `company_employment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id_2` (`user_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `dictionary_adverse`
--
ALTER TABLE `dictionary_adverse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_change_tokens`
--
ALTER TABLE `email_change_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `new_email` (`new_email`),
  ADD KEY `token` (`token`),
  ADD KEY `eventTimestamp` (`eventTimestamp`);

--
-- Indexes for table `exception`
--
ALTER TABLE `exception`
  ADD PRIMARY KEY (`identifier`);

--
-- Indexes for table `feed`
--
ALTER TABLE `feed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `eventTimestamp` (`eventTimestamp`),
  ADD KEY `actionTypeId` (`actionTypeId`),
  ADD KEY `actionId` (`actionId`),
  ADD KEY `srcType` (`srcType`),
  ADD KEY `dstType` (`dstType`),
  ADD KEY `dstID` (`dstID`);

--
-- Indexes for table `feed_images`
--
ALTER TABLE `feed_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `tempSet` (`tempSet`),
  ADD KEY `setID` (`setID`),
  ADD KEY `srcType` (`srcType`);

--
-- Indexes for table `feed_message`
--
ALTER TABLE `feed_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `imageSetID` (`imageSetID`);

--
-- Indexes for table `feed_message_comment`
--
ALTER TABLE `feed_message_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messageID` (`messageID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `feed_message_params`
--
ALTER TABLE `feed_message_params`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messageID` (`messageID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `parameter` (`parameter`);

--
-- Indexes for table `geo_country`
--
ALTER TABLE `geo_country`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `geo_locality`
--
ALTER TABLE `geo_locality`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`),
  ADD KEY `geo_region_id` (`geo_region_id`);

--
-- Indexes for table `geo_region`
--
ALTER TABLE `geo_region`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`),
  ADD KEY `geo_country_id` (`geo_country_id`);

--
-- Indexes for table `geo_zip`
--
ALTER TABLE `geo_zip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zip` (`zip`),
  ADD KEY `geo_locality_id` (`geo_locality_id`) USING BTREE;

--
-- Indexes for table `helpdesk_tickets`
--
ALTER TABLE `helpdesk_tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`),
  ADD KEY `opener_user_id` (`customer_user_id`);

--
-- Indexes for table `helpdesk_ticket_attaches`
--
ALTER TABLE `helpdesk_ticket_attaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `helpdesk_ticket_history_id` (`helpdesk_ticket_history_id`);

--
-- Indexes for table `helpdesk_ticket_history`
--
ALTER TABLE `helpdesk_ticket_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `helpdesk_ticket_id` (`helpdesk_ticket_id`),
  ADD KEY `state` (`state`),
  ADD KEY `eventTimestamp` (`eventTimestamp`),
  ADD KEY `company_user_id` (`user_id`),
  ADD KEY `severity` (`severity`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `medical_records`
--
ALTER TABLE `medical_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `submitter_user_id` (`submitter_user_id`),
  ADD KEY `___last_name` (`___last_name`),
  ADD KEY `___first_name` (`___first_name`),
  ADD KEY `___middle_name` (`___middle_name`),
  ADD KEY `___birthdate` (`___birthdate`);

--
-- Indexes for table `name_sex`
--
ALTER TABLE `name_sex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `sex` (`sex`);

--
-- Indexes for table `password_dictionary_adjectives`
--
ALTER TABLE `password_dictionary_adjectives`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_dictionary_characteristics`
--
ALTER TABLE `password_dictionary_characteristics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_dictionary_nouns`
--
ALTER TABLE `password_dictionary_nouns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_confirmation`
--
ALTER TABLE `phone_confirmation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session` (`session`),
  ADD KEY `confirmation_code` (`confirmation_code`),
  ADD KEY `eventTimestamp` (`eventTimestamp`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `time` (`time`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `previous_sesid` (`previous_sessid`);

--
-- Indexes for table `sessions_persistence_ratelimit`
--
ALTER TABLE `sessions_persistence_ratelimit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ip` (`ip`),
  ADD KEY `eventTimestamp` (`eventTimestamp`);

--
-- Indexes for table `settings_default`
--
ALTER TABLE `settings_default`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting` (`setting`);

--
-- Indexes for table `site_themes`
--
ALTER TABLE `site_themes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_report`
--
ALTER TABLE `sms_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_media`
--
ALTER TABLE `temp_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `eventTimestamp` (`eventTimestamp`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `mediaType` (`mediaType`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `login` (`login`),
  ADD KEY `email` (`email`),
  ADD KEY `name` (`name`),
  ADD KEY `nameLast` (`nameLast`),
  ADD KEY `birthdayAccess` (`birthdayAccess`),
  ADD KEY `birthday` (`birthday`),
  ADD KEY `nameMiddle` (`nameMiddle`),
  ADD KEY `phone` (`phone`),
  ADD KEY `country_code` (`country_code`),
  ADD KEY `site_theme_id` (`site_theme_id`),
  ADD KEY `helpdesk_subscription_S4_email` (`helpdesk_subscription_S4_email`),
  ADD KEY `helpdesk_subscription_S3_email` (`helpdesk_subscription_S3_email`),
  ADD KEY `helpdesk_subscription_S2_email` (`helpdesk_subscription_S2_email`),
  ADD KEY `helpdesk_subscription_S1_email` (`helpdesk_subscription_S1_email`),
  ADD KEY `helpdesk_subscription_S4_sms` (`helpdesk_subscription_S4_sms`),
  ADD KEY `helpdesk_subscription_S3_sms` (`helpdesk_subscription_S3_sms`),
  ADD KEY `helpdesk_subscription_S2_sms` (`helpdesk_subscription_S2_sms`),
  ADD KEY `helpdesk_subscription_S1_sms` (`helpdesk_subscription_S1_sms`),
  ADD KEY `helpdesk_new_notification_S4_email` (`helpdesk_new_notification_S4_email`),
  ADD KEY `helpdesk_new_notification_S3_email` (`helpdesk_new_notification_S3_email`),
  ADD KEY `helpdesk_new_notification_S2_email` (`helpdesk_new_notification_S2_email`),
  ADD KEY `helpdesk_new_notification_S1_email` (`helpdesk_new_notification_S1_email`),
  ADD KEY `helpdesk_new_notification_S4_sms` (`helpdesk_new_notification_S4_sms`),
  ADD KEY `helpdesk_new_notification_S3_sms` (`helpdesk_new_notification_S3_sms`),
  ADD KEY `helpdesk_new_notification_S2_sms` (`helpdesk_new_notification_S2_sms`),
  ADD KEY `helpdesk_new_notification_S1_sms` (`helpdesk_new_notification_S1_sms`);

--
-- Indexes for table `users_aaa`
--
ALTER TABLE `users_aaa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `users_avatars`
--
ALTER TABLE `users_avatars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `isActive` (`isActive`);

--
-- Indexes for table `users_company`
--
ALTER TABLE `users_company`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `position_title_id` (`position_title_id`);

--
-- Indexes for table `users_friends`
--
ALTER TABLE `users_friends`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `friendID` (`friendID`),
  ADD KEY `state` (`state`);

--
-- Indexes for table `users_notification`
--
ALTER TABLE `users_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `actionTypeId` (`actionTypeId`),
  ADD KEY `actionId` (`actionId`),
  ADD KEY `notificationStatus` (`notificationStatus`),
  ADD KEY `eventTimestamp_2` (`eventTimestamp`);

--
-- Indexes for table `users_passwd`
--
ALTER TABLE `users_passwd`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `isActive` (`isActive`),
  ADD KEY `passwd` (`passwd`);

--
-- Indexes for table `users_watched`
--
ALTER TABLE `users_watched`
  ADD PRIMARY KEY (`id`),
  ADD KEY `watching_userID` (`watching_userID`),
  ADD KEY `eventTimestamp` (`eventTimestamp`),
  ADD KEY `watched_userID` (`watched_userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `action_category`
--
ALTER TABLE `action_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;
--
-- AUTO_INCREMENT for table `action_types`
--
ALTER TABLE `action_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2001;
--
-- AUTO_INCREMENT for table `captcha`
--
ALTER TABLE `captcha`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `chat_contact_list`
--
ALTER TABLE `chat_contact_list`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2951;
--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `company_data_access`
--
ALTER TABLE `company_data_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `company_employment`
--
ALTER TABLE `company_employment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `dictionary_adverse`
--
ALTER TABLE `dictionary_adverse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `email_change_tokens`
--
ALTER TABLE `email_change_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exception`
--
ALTER TABLE `exception`
  MODIFY `identifier` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;
--
-- AUTO_INCREMENT for table `feed`
--
ALTER TABLE `feed`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8129;
--
-- AUTO_INCREMENT for table `feed_images`
--
ALTER TABLE `feed_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1455;
--
-- AUTO_INCREMENT for table `feed_message`
--
ALTER TABLE `feed_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=279;
--
-- AUTO_INCREMENT for table `feed_message_comment`
--
ALTER TABLE `feed_message_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=233;
--
-- AUTO_INCREMENT for table `feed_message_params`
--
ALTER TABLE `feed_message_params`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=301;
--
-- AUTO_INCREMENT for table `geo_country`
--
ALTER TABLE `geo_country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=381;
--
-- AUTO_INCREMENT for table `geo_locality`
--
ALTER TABLE `geo_locality`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29819;
--
-- AUTO_INCREMENT for table `geo_region`
--
ALTER TABLE `geo_region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=785;
--
-- AUTO_INCREMENT for table `geo_zip`
--
ALTER TABLE `geo_zip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44992;
--
-- AUTO_INCREMENT for table `helpdesk_tickets`
--
ALTER TABLE `helpdesk_tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `helpdesk_ticket_attaches`
--
ALTER TABLE `helpdesk_ticket_attaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `helpdesk_ticket_history`
--
ALTER TABLE `helpdesk_ticket_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;
--
-- AUTO_INCREMENT for table `medical_records`
--
ALTER TABLE `medical_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `name_sex`
--
ALTER TABLE `name_sex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=753;
--
-- AUTO_INCREMENT for table `password_dictionary_adjectives`
--
ALTER TABLE `password_dictionary_adjectives`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=370;
--
-- AUTO_INCREMENT for table `password_dictionary_characteristics`
--
ALTER TABLE `password_dictionary_characteristics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=738;
--
-- AUTO_INCREMENT for table `password_dictionary_nouns`
--
ALTER TABLE `password_dictionary_nouns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1383;
--
-- AUTO_INCREMENT for table `phone_confirmation`
--
ALTER TABLE `phone_confirmation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sessions_persistence_ratelimit`
--
ALTER TABLE `sessions_persistence_ratelimit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=824;
--
-- AUTO_INCREMENT for table `settings_default`
--
ALTER TABLE `settings_default`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `site_themes`
--
ALTER TABLE `site_themes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sms_report`
--
ALTER TABLE `sms_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `temp_media`
--
ALTER TABLE `temp_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1031;
--
-- AUTO_INCREMENT for table `users_aaa`
--
ALTER TABLE `users_aaa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `users_avatars`
--
ALTER TABLE `users_avatars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;
--
-- AUTO_INCREMENT for table `users_company`
--
ALTER TABLE `users_company`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users_friends`
--
ALTER TABLE `users_friends`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;
--
-- AUTO_INCREMENT for table `users_notification`
--
ALTER TABLE `users_notification`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users_passwd`
--
ALTER TABLE `users_passwd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT for table `users_watched`
--
ALTER TABLE `users_watched`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `action_types`
--
ALTER TABLE `action_types`
  ADD CONSTRAINT `action_types_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `action_category` (`id`);

--
-- Constraints for table `company_data_access`
--
ALTER TABLE `company_data_access`
  ADD CONSTRAINT `company_data_access_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  ADD CONSTRAINT `company_data_access_ibfk_2` FOREIGN KEY (`company_id_data_available`) REFERENCES `company` (`id`);

--
-- Constraints for table `company_employment`
--
ALTER TABLE `company_employment`
  ADD CONSTRAINT `company_employment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `company_employment_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`);

--
-- Constraints for table `email_change_tokens`
--
ALTER TABLE `email_change_tokens`
  ADD CONSTRAINT `email_change_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `geo_locality`
--
ALTER TABLE `geo_locality`
  ADD CONSTRAINT `geo_locality_ibfk_1` FOREIGN KEY (`geo_region_id`) REFERENCES `geo_region` (`id`);

--
-- Constraints for table `geo_region`
--
ALTER TABLE `geo_region`
  ADD CONSTRAINT `geo_region_ibfk_1` FOREIGN KEY (`geo_country_id`) REFERENCES `geo_country` (`id`);

--
-- Constraints for table `geo_zip`
--
ALTER TABLE `geo_zip`
  ADD CONSTRAINT `geo_zip_ibfk_1` FOREIGN KEY (`geo_locality_id`) REFERENCES `geo_locality` (`id`);

--
-- Constraints for table `helpdesk_tickets`
--
ALTER TABLE `helpdesk_tickets`
  ADD CONSTRAINT `helpdesk_tickets_ibfk_1` FOREIGN KEY (`customer_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `helpdesk_ticket_attaches`
--
ALTER TABLE `helpdesk_ticket_attaches`
  ADD CONSTRAINT `helpdesk_ticket_attaches_ibfk_1` FOREIGN KEY (`helpdesk_ticket_history_id`) REFERENCES `helpdesk_ticket_history` (`id`);

--
-- Constraints for table `helpdesk_ticket_history`
--
ALTER TABLE `helpdesk_ticket_history`
  ADD CONSTRAINT `helpdesk_ticket_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `helpdesk_ticket_history_ibfk_2` FOREIGN KEY (`helpdesk_ticket_id`) REFERENCES `helpdesk_tickets` (`id`);

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`site_theme_id`) REFERENCES `site_themes` (`id`);

--
-- Constraints for table `users_aaa`
--
ALTER TABLE `users_aaa`
  ADD CONSTRAINT `users_aaa_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users_avatars`
--
ALTER TABLE `users_avatars`
  ADD CONSTRAINT `users_avatars_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`id`);

--
-- Constraints for table `users_notification`
--
ALTER TABLE `users_notification`
  ADD CONSTRAINT `users_notification_ibfk_1` FOREIGN KEY (`actionTypeId`) REFERENCES `action_types` (`id`);

--
-- Constraints for table `users_passwd`
--
ALTER TABLE `users_passwd`
  ADD CONSTRAINT `users_passwd_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
