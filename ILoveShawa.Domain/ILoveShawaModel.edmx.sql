










































-- -----------------------------------------------------------
-- Entity Designer DDL Script for MySQL Server 4.1 and higher
-- -----------------------------------------------------------
-- Date Created: 10/12/2015 00:08:33

-- Generated from EDMX file: C:\Projects\VC#\ILoveShawa\ILoveShawa.Domain\ILoveShawaModel.edmx
-- Target version: 3.0.0.0

-- --------------------------------------------------



-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- NOTE: if the constraint does not exist, an ignorable error will be reported.
-- --------------------------------------------------



-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------
SET foreign_key_checks = 0;

SET foreign_key_checks = 1;

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------


CREATE TABLE `Entity1Set`(
	`Id` int NOT NULL AUTO_INCREMENT UNIQUE);

ALTER TABLE `Entity1Set` ADD PRIMARY KEY (Id);





CREATE TABLE `Entity2Set`(
	`Id` int NOT NULL AUTO_INCREMENT UNIQUE, 
	`Property1` longtext NOT NULL);

ALTER TABLE `Entity2Set` ADD PRIMARY KEY (Id);





CREATE TABLE `Entity3Set`(
	`Id` int NOT NULL AUTO_INCREMENT UNIQUE);

ALTER TABLE `Entity3Set` ADD PRIMARY KEY (Id);







-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
