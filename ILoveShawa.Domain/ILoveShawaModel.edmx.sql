










































-- -----------------------------------------------------------
-- Entity Designer DDL Script for MySQL Server 4.1 and higher
-- -----------------------------------------------------------
-- Date Created: 11/26/2015 19:37:10

-- Generated from EDMX file: C:\Users\valey\Source\Repos\iloveshawa\ILoveShawa.Domain\ILoveShawaModel.edmx
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
	`Id` int NOT NULL AUTO_INCREMENT UNIQUE, 
	`Url` longtext NOT NULL, 
	`ShopId` int NOT NULL);

ALTER TABLE `Images` ADD PRIMARY KEY (Id);





CREATE TABLE `Likes`(
	`Id` int NOT NULL AUTO_INCREMENT UNIQUE, 
	`UserId` int NOT NULL, 
	`ReviewId` int NOT NULL);

ALTER TABLE `Likes` ADD PRIMARY KEY (Id);





CREATE TABLE `Reviews`(
	`Id` int NOT NULL AUTO_INCREMENT UNIQUE, 
	`Text` longtext NOT NULL, 
	`Positive` bool NOT NULL, 
	`UserId` int NOT NULL, 
	`ShopId` int NOT NULL);

ALTER TABLE `Reviews` ADD PRIMARY KEY (Id);





CREATE TABLE `Scores`(
	`Id` int NOT NULL AUTO_INCREMENT UNIQUE, 
	`Value` int NOT NULL, 
	`UserId` int NOT NULL, 
	`ShopId` int NOT NULL);

ALTER TABLE `Scores` ADD PRIMARY KEY (Id);





CREATE TABLE `ShawaShops`(
	`Id` int NOT NULL AUTO_INCREMENT UNIQUE, 
	`Name` varchar (45) NOT NULL, 
	`Latitude` double NOT NULL, 
	`Longitude` double NOT NULL, 
	`ImageUrl` longtext, 
	`Address` longtext);

ALTER TABLE `ShawaShops` ADD PRIMARY KEY (Id);





CREATE TABLE `Users`(
	`Id` int NOT NULL AUTO_INCREMENT UNIQUE, 
	`Name` varchar (45) NOT NULL, 
	`ImageUrl` varchar (45), 
	`Email` varchar (45) NOT NULL, 
	`Password` varchar (100) NOT NULL);

ALTER TABLE `Users` ADD PRIMARY KEY (Id);







-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------


-- Creating foreign key on `ShopId` in table 'Images'

ALTER TABLE `Images`
ADD CONSTRAINT `fk_image_shawarma_shop1`
    FOREIGN KEY (`ShopId`)
    REFERENCES `ShawaShops`
        (`Id`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;


-- Creating non-clustered index for FOREIGN KEY 'fk_image_shawarma_shop1'

CREATE INDEX `IX_fk_image_shawarma_shop1`
    ON `Images`
    (`ShopId`);



-- Creating foreign key on `ReviewId` in table 'Likes'

ALTER TABLE `Likes`
ADD CONSTRAINT `fk_like_review1`
    FOREIGN KEY (`ReviewId`)
    REFERENCES `Reviews`
        (`Id`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;


-- Creating non-clustered index for FOREIGN KEY 'fk_like_review1'

CREATE INDEX `IX_fk_like_review1`
    ON `Likes`
    (`ReviewId`);



-- Creating foreign key on `UserId` in table 'Likes'

ALTER TABLE `Likes`
ADD CONSTRAINT `fk_like_user1`
    FOREIGN KEY (`UserId`)
    REFERENCES `Users`
        (`Id`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;


-- Creating non-clustered index for FOREIGN KEY 'fk_like_user1'

CREATE INDEX `IX_fk_like_user1`
    ON `Likes`
    (`UserId`);



-- Creating foreign key on `ShopId` in table 'Reviews'

ALTER TABLE `Reviews`
ADD CONSTRAINT `fk_review_shawarma_shop1`
    FOREIGN KEY (`ShopId`)
    REFERENCES `ShawaShops`
        (`Id`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;


-- Creating non-clustered index for FOREIGN KEY 'fk_review_shawarma_shop1'

CREATE INDEX `IX_fk_review_shawarma_shop1`
    ON `Reviews`
    (`ShopId`);



-- Creating foreign key on `UserId` in table 'Reviews'

ALTER TABLE `Reviews`
ADD CONSTRAINT `fk_review_user1`
    FOREIGN KEY (`UserId`)
    REFERENCES `Users`
        (`Id`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;


-- Creating non-clustered index for FOREIGN KEY 'fk_review_user1'

CREATE INDEX `IX_fk_review_user1`
    ON `Reviews`
    (`UserId`);



-- Creating foreign key on `ShopId` in table 'Scores'

ALTER TABLE `Scores`
ADD CONSTRAINT `fk_score_shawarma_shop1`
    FOREIGN KEY (`ShopId`)
    REFERENCES `ShawaShops`
        (`Id`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;


-- Creating non-clustered index for FOREIGN KEY 'fk_score_shawarma_shop1'

CREATE INDEX `IX_fk_score_shawarma_shop1`
    ON `Scores`
    (`ShopId`);



-- Creating foreign key on `UserId` in table 'Scores'

ALTER TABLE `Scores`
ADD CONSTRAINT `fk_score_user1`
    FOREIGN KEY (`UserId`)
    REFERENCES `Users`
        (`Id`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;


-- Creating non-clustered index for FOREIGN KEY 'fk_score_user1'

CREATE INDEX `IX_fk_score_user1`
    ON `Scores`
    (`UserId`);



-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
