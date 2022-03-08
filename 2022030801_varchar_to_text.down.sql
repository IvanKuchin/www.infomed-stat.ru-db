ALTER TABLE `medical_records`
CHANGE `___another_organ_resect___other___another_option` `___another_organ_resect___other___another_option` varchar(65) COLLATE 'utf8_general_ci' NOT NULL AFTER `___another_organ_resect___other`;
ALTER TABLE `medical_records`
CHANGE `___other___another_option` `___other___another_option` varchar(65) COLLATE 'utf8_general_ci' NOT NULL AFTER `___other`;
ALTER TABLE `medical_records`
CHANGE `___relapse_metastases___other___another_option` `___relapse_metastases___other___another_option` varchar(65) COLLATE 'utf8_general_ci' NOT NULL AFTER `___relapse_metastases___other`;
