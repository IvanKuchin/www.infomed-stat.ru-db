CREATE TABLE `users_visibility_scope` ( `id` INT NOT NULL AUTO_INCREMENT , `user_id` INT NOT NULL , `scope` ENUM('local','global') NOT NULL , PRIMARY KEY (`id`), INDEX (`user_id`), INDEX (`scope`)) ENGINE = InnoDB;
ALTER TABLE `users_visibility_scope` ADD FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE `users_visibility_scope` CHANGE `scope` `scope` ENUM('local','global') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local';
INSERT INTO `users_visibility_scope` (`user_id`) (SELECT `id` FROM `users`);
