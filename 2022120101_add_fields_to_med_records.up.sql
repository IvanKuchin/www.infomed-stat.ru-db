ALTER TABLE `medical_records` 
    ADD `___op_done___assistant` VARCHAR(32) NOT NULL DEFAULT '' AFTER `___op_done___operation_class`, 
    ADD `___op_done___blood_loss` VARCHAR(32) NOT NULL DEFAULT '' AFTER `___op_done___assistant`, 
    ADD `___op_done___blood_transfusion` VARCHAR(32) NOT NULL DEFAULT '' AFTER `___op_done___blood_loss`, 
    ADD `___op_done___duration` VARCHAR(32) NOT NULL DEFAULT '' AFTER `___op_done___blood_transfusion`, 
    ADD `___op_done___recovery_days` VARCHAR(32) NOT NULL DEFAULT '' AFTER `___op_done___duration`;
