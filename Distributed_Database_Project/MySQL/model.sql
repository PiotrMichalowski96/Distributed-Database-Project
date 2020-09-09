CREATE DATABASE IF NOT EXISTS ReadingService;
USE ReadingService;

CREATE TABLE `Publisher`
(
 `publisherId`   integer NOT NULL ,
 `publisherName` varchar(45) NOT NULL ,

PRIMARY KEY (`publisherId`)
);



CREATE TABLE `Newspaper`
(
 `newspaperId`   integer NOT NULL ,
 `newspaperName` varchar(45) NOT NULL ,
 `publishDate`   datetime NOT NULL ,
 `price`         integer NOT NULL ,
 `publisherId`   integer NOT NULL ,

PRIMARY KEY (`newspaperId`),
KEY `fkIdx_15` (`publisherId`),
CONSTRAINT `FK_15` FOREIGN KEY `fkIdx_15` (`publisherId`) REFERENCES `Publisher` (`publisherId`)
);



CREATE TABLE `Article`
(
 `articleId`         integer NOT NULL ,
 `articleTitleRef`   varchar(45) NOT NULL ,
 `publishedOn`       datetime NOT NULL ,
 `articleContentRef` varchar(45) NOT NULL ,
 `newspaperId`       integer NOT NULL ,

PRIMARY KEY (`articleId`),
KEY `fkIdx_28` (`newspaperId`),
CONSTRAINT `FK_28` FOREIGN KEY `fkIdx_28` (`newspaperId`) REFERENCES `Newspaper` (`newspaperId`)
);



CREATE TABLE `Source`
(
 `sourceId`   integer NOT NULL ,
 `sourceType` varchar(45) NOT NULL ,
 `sourceName` varchar(45) NOT NULL ,

PRIMARY KEY (`sourceId`)
);


CREATE TABLE `Category`
(
 `categoryId`   integer NOT NULL ,
 `categoryName` varchar(45) NOT NULL ,

PRIMARY KEY (`categoryId`)
);



CREATE TABLE `Author`
(
 `authorId`       integer NOT NULL ,
 `firstname`      varchar(45) NOT NULL ,
 `surname`        varchar(45) NOT NULL ,
 `specialization` varchar(45) NOT NULL ,

PRIMARY KEY (`authorId`)
);



CREATE TABLE `Article_has_Source`
(
 `sourceId`  integer NOT NULL ,
 `articleId` integer NOT NULL ,

PRIMARY KEY (`articleId`, `sourceId`),
KEY `fkIdx_64` (`sourceId`),
CONSTRAINT `FK_64` FOREIGN KEY `fkIdx_64` (`sourceId`) REFERENCES `Source` (`sourceId`),
KEY `fkIdx_67` (`articleId`),
CONSTRAINT `FK_67` FOREIGN KEY `fkIdx_67` (`articleId`) REFERENCES `Article` (`articleId`)
);



CREATE TABLE `Article_has_Category`
(
 `articleId`  integer NOT NULL ,
 `categoryId` integer NOT NULL ,

PRIMARY KEY (`articleId`, `categoryId`),
KEY `fkIdx_48` (`articleId`),
CONSTRAINT `FK_48` FOREIGN KEY `fkIdx_48` (`articleId`) REFERENCES `Article` (`articleId`),
KEY `fkIdx_51` (`categoryId`),
CONSTRAINT `FK_51` FOREIGN KEY `fkIdx_51` (`categoryId`) REFERENCES `Category` (`categoryId`)
);


CREATE TABLE `Article_has_Author`
(
 `articleId` integer NOT NULL ,
 `authorId`  integer NOT NULL ,

PRIMARY KEY (`articleId`, `authorId`),
KEY `fkIdx_56` (`articleId`),
CONSTRAINT `FK_56` FOREIGN KEY `fkIdx_56` (`articleId`) REFERENCES `Article` (`articleId`),
KEY `fkIdx_59` (`authorId`),
CONSTRAINT `FK_59` FOREIGN KEY `fkIdx_59` (`authorId`) REFERENCES `Author` (`authorId`)

);

