ALTER TABLE `medical_records` 
 ADD `___op_done___vasc_resect___left_hepatic_art` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' AFTER `___op_done___vasc_resect___common_hepatic_art___resect_extent`,
 ADD `___op_done___vasc_resect___left_hepatic_art___resect_type` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' AFTER `___op_done___vasc_resect___left_hepatic_art`,
 ADD `___op_done___vasc_resect___left_hepatic_art___resect_extent` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' AFTER `___op_done___vasc_resect___left_hepatic_art___resect_type`,
 ADD `___op_done___vasc_resect___right_hepatic_art` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' AFTER `___op_done___vasc_resect___left_hepatic_art___resect_extent`,
 ADD `___op_done___vasc_resect___right_hepatic_art___resect_type` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' AFTER `___op_done___vasc_resect___right_hepatic_art`,
 ADD `___op_done___vasc_resect___right_hepatic_art___resect_extent` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' AFTER `___op_done___vasc_resect___right_hepatic_art___resect_type`;
