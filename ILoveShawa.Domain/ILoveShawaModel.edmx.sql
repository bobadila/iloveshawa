










































-- -----------------------------------------------------------
-- Entity Designer DDL Script for MySQL Server 4.1 and higher
-- -----------------------------------------------------------
-- Date Created: 10/22/2015 23:03:13

-- Generated from EDMX file: C:\Projects\VC#\ILoveShawa\ILoveShawa.Domain\ILoveShawaModel.edmx
-- Target version: 3.0.0.0

-- --------------------------------------------------



-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- NOTE: if the constraint does not exist, an ignorable error will be reported.
-- --------------------------------------------------


--    ALTER TABLE `Images` DROP CONSTRAINT `fk_image_shawarma_shop1`;

--    ALTER TABLE `Likes` DROP CONSTRAINT `fk_like_review1`;

--    ALTER TABLE `Likes` DROP CONSTRAINT `fk_like_user1`;

--    ALTER TABLE `Reviews` DROP CONSTRAINT `fk_review_shawarma_shop1`;

--    ALTER TABLE `Reviews` DROP CONSTRAINT `fk_review_user1`;

--    ALTER TABLE `Scores` DROP CONSTRAINT `fk_score_shawarma_shop1`;

--    ALTER TABLE `Scores` DROP CONSTRAINT `fk_score_user1`;


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------
SET foreign_key_checks = 0;

    DROP TABLE IF EXISTS `Images`;

    DROP TABLE IF EXISTS `Likes`;

    DROP TABLE IF EXISTS `Reviews`;

    DROP TABLE IF EXISTS `Scores`;

    DROP TABLE IF EXISTS `ShawaShops`;

    DROP TABLE IF EXISTS `Users`;

SET foreign_key_checks = 1;

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------


CREATE TABLE `Images`(
	`id` int NOT NULL, 
	`url` varchar (45) NOT NULL, 
	`shop_id` int NOT NULL);

ALTER TABLE `Images` ADD PRIMARY KEY (id);





CREATE TABLE `Likes`(
	`id` int NOT NULL, 
	`user_id` int NOT NULL, 
	`review_id` int NOT NULL);

ALTER TABLE `Likes` ADD PRIMARY KEY (id);





CREATE TABLE `Reviews`(
	`id` int NOT NULL, 
	`text` longtext NOT NULL, 
	`positive` bool NOT NULL, 
	`user_id` int NOT NULL, 
	`shop_id` int NOT NULL);

ALTER TABLE `Reviews` ADD PRIMARY KEY (id);





CREATE TABLE `Scores`(
	`id` int NOT NULL, 
	`value` int NOT NULL, 
	`user_id` int NOT NULL, 
	`shop_id` int NOT NULL);

ALTER TABLE `Scores` ADD PRIMARY KEY (id);





CREATE TABLE `ShawaShops`(
	`id` int NOT NULL, 
	`name` varchar (45) NOT NULL, 
	`coordinates` varchar (100) NOT NULL);

ALTER TABLE `ShawaShops` ADD PRIMARY KEY (id);





CREATE TABLE `Users`(
	`id` int NOT NULL, 
	`name` varchar (45) NOT NULL, 
	`image_url` varchar (45), 
	`email` varchar (45) NOT NULL);

ALTER TABLE `Users` ADD PRIMARY KEY (id);







-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------


-- Creating foreign key on `shop_id` in table 'Images'

ALTER TABLE `Images`
ADD CONSTRAINT `fk_image_shawarma_shop1`
    FOREIGN KEY (`shop_id`)
    REFERENCES `ShawaShops`
        (`id`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;


-- Creating non-clustered index for FOREIGN KEY 'fk_image_shawarma_shop1'

CREATE INDEX `IX_fk_image_shawarma_shop1`
    ON `Images`
    (`shop_id`);



-- Creating foreign key on `review_id` in table 'Likes'

ALTER TABLE `Likes`
ADD CONSTRAINT `fk_like_review1`
    FOREIGN KEY (`review_id`)
    REFERENCES `Reviews`
        (`id`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;


-- Creating non-clustered index for FOREIGN KEY 'fk_like_review1'

CREATE INDEX `IX_fk_like_review1`
    ON `Likes`
    (`review_id`);



-- Creating foreign key on `user_id` in table 'Likes'

ALTER TABLE `Likes`
ADD CONSTRAINT `fk_like_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `Users`
        (`id`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;


-- Creating non-clustered index for FOREIGN KEY 'fk_like_user1'

CREATE INDEX `IX_fk_like_user1`
    ON `Likes`
    (`user_id`);



-- Creating foreign key on `shop_id` in table 'Reviews'

ALTER TABLE `Reviews`
ADD CONSTRAINT `fk_review_shawarma_shop1`
    FOREIGN KEY (`shop_id`)
    REFERENCES `ShawaShops`
        (`id`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;


-- Creating non-clustered index for FOREIGN KEY 'fk_review_shawarma_shop1'

CREATE INDEX `IX_fk_review_shawarma_shop1`
    ON `Reviews`
    (`shop_id`);



-- Creating foreign key on `user_id` in table 'Reviews'

ALTER TABLE `Reviews`
ADD CONSTRAINT `fk_review_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `Users`
        (`id`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;


-- Creating non-clustered index for FOREIGN KEY 'fk_review_user1'

CREATE INDEX `IX_fk_review_user1`
    ON `Reviews`
    (`user_id`);



-- Creating foreign key on `shop_id` in table 'Scores'

ALTER TABLE `Scores`
ADD CONSTRAINT `fk_score_shawarma_shop1`
    FOREIGN KEY (`shop_id`)
    REFERENCES `ShawaShops`
        (`id`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;


-- Creating non-clustered index for FOREIGN KEY 'fk_score_shawarma_shop1'

CREATE INDEX `IX_fk_score_shawarma_shop1`
    ON `Scores`
    (`shop_id`);



-- Creating foreign key on `user_id` in table 'Scores'

ALTER TABLE `Scores`
ADD CONSTRAINT `fk_score_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `Users`
        (`id`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;


-- Creating non-clustered index for FOREIGN KEY 'fk_score_user1'

CREATE INDEX `IX_fk_score_user1`
    ON `Scores`
    (`user_id`);



-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
