drop database if exists springbootrocks;
create database springbootrocks;
use springbootrocks;

create table app_user(
id BIGINT NOT NULL AUTO_INCREMENT,
username VARCHAR(150) NOT NULL,
password VARCHAR(150) NOT NULL,
useremail VARCHAR(150) NOT NULL,
userfirstname VARCHAR(150) NOT NULL,
userlastname VARCHAR(150) NOT NULL,
useraddress VARCHAR(150) NOT NULL,
PRIMARY KEY (id),
UNIQUE (username)) ENGINE=InnoDB;

create table app_role(
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(150) NOT NULL,
PRIMARY KEY (id),
UNIQUE (name)) ENGINE=InnoDB;
   
CREATE TABLE app_user_role (
id BIGINT NOT NULL AUTO_INCREMENT,
userid BIGINT NOT NULL,
roleid INT NOT NULL,
PRIMARY KEY (id))ENGINE=InnoDB;

create table persistent_logins (
username varchar(64) not null,
series varchar(64) primary key,
token varchar(64) not null,
last_used timestamp not null)ENGINE=InnoDB;

create table app_agency(
id INT NOT NULL AUTO_INCREMENT,
agencyname VARCHAR(150) NOT NULL,
agencylocation VARCHAR(150) NOT NULL,
agencyaddress VARCHAR(150) NOT NULL,
agencyheadname VARCHAR(150) NOT NULL,
agencyheademail VARCHAR(150) NOT NULL,
PRIMARY KEY (id),
UNIQUE (agencyname)) ENGINE=InnoDB;

create table app_programarea(
id BIGINT NOT NULL AUTO_INCREMENT,
programareaname VARCHAR(150) NOT NULL,
programarealocation VARCHAR(150) NOT NULL,
programareaaddress VARCHAR(150) NOT NULL,
programareaheadname VARCHAR(150) NOT NULL,
programareaheademail VARCHAR(150) NOT NULL,
programareaagencyid INT NOT NULL,
PRIMARY KEY (id),
UNIQUE (programareaname)) ENGINE=InnoDB;


-- CREATE TABLE file_storage(
-- id BIGINT NOT NULL AUTO_INCREMENT,
-- user_id BIGINT NOT NULL,
-- name  VARCHAR(100) NOT NULL,
-- description VARCHAR(255) ,
-- type VARCHAR(100) NOT NULL,
-- content longblob NOT NULL,
-- PRIMARY KEY (id),
-- CONSTRAINT user_pic FOREIGN KEY (userid) REFERENCES app_user (id) 
-- ON UPDATE CASCADE ON DELETE CASCADE)ENGINE=InnoDB;


ALTER TABLE app_user_role ADD CONSTRAINT FK_AURUSERID FOREIGN KEY (userid) REFERENCES app_user (id);
ALTER TABLE app_user_role ADD CONSTRAINT FK_AURROLEID FOREIGN KEY (roleid) REFERENCES app_role (id); 
ALTER TABLE app_programarea ADD CONSTRAINT FK_APAAGENCYID FOREIGN KEY (programareaagencyid) REFERENCES app_agency (id);

INSERT INTO `springbootrocks`.`app_user` (`username`, `password`, `useremail`, `userfirstname`, `userlastname`, `useraddress`) VALUES ('admin@admin', '$2a$10$EVfGJ5O6YLQs5Jj5ZOAKGuZ/2sLqXkNLw8j.MotNnYgHa1h2qUyIW', 'admin@admin', 'admin@admin', 'admin@admin', 'admin@admin');   
INSERT INTO `springbootrocks`.`app_user` (`username`, `password`, `useremail`, `userfirstname`, `userlastname`, `useraddress`) VALUES ('admin1@admin1', '$2a$10$EVfGJ5O6YLQs5Jj5ZOAKGuZ/2sLqXkNLw8j.MotNnYgHa1h2qUyIW', 'admin1@admin1', 'admin1@admin1', 'admin1@admin1', 'admin1@admin1');
INSERT INTO `springbootrocks`.`app_user` (`username`, `password`, `useremail`, `userfirstname`, `userlastname`, `useraddress`) VALUES ('admin2@admin2', '$2a$10$EVfGJ5O6YLQs5Jj5ZOAKGuZ/2sLqXkNLw8j.MotNnYgHa1h2qUyIW', 'admin2@admin2', 'admin2@admin2', 'admin2@admin2', 'admin2@admin2');
INSERT INTO `springbootrocks`.`app_user` (`username`, `password`, `useremail`, `userfirstname`, `userlastname`, `useraddress`) VALUES ('admin3@admin3', '$2a$10$EVfGJ5O6YLQs5Jj5ZOAKGuZ/2sLqXkNLw8j.MotNnYgHa1h2qUyIW', 'admin3@admin3', 'admin3@admin3', 'admin3@admin3', 'admin3@admin3');
INSERT INTO `springbootrocks`.`app_user` (`username`, `password`, `useremail`, `userfirstname`, `userlastname`, `useraddress`) VALUES ('admin4@admin4', '$2a$10$EVfGJ5O6YLQs5Jj5ZOAKGuZ/2sLqXkNLw8j.MotNnYgHa1h2qUyIW', 'admin4@admin4', 'admin4@admin4', 'admin4@admin4', 'admin4@admin4');
INSERT INTO `springbootrocks`.`app_user` (`username`, `password`, `useremail`, `userfirstname`, `userlastname`, `useraddress`) VALUES ('admin5@admin5', '$2a$10$EVfGJ5O6YLQs5Jj5ZOAKGuZ/2sLqXkNLw8j.MotNnYgHa1h2qUyIW', 'admin5@admin5', 'admin5@admin5', 'admin5@admin5', 'admin5@admin5');
INSERT INTO `springbootrocks`.`app_user` (`username`, `password`, `useremail`, `userfirstname`, `userlastname`, `useraddress`) VALUES ('admin6@admin6', '$2a$10$EVfGJ5O6YLQs5Jj5ZOAKGuZ/2sLqXkNLw8j.MotNnYgHa1h2qUyIW', 'admin6@admin6', 'admin6@admin6', 'admin6@admin6', 'admin6@admin6');
INSERT INTO `springbootrocks`.`app_user` (`username`, `password`, `useremail`, `userfirstname`, `userlastname`, `useraddress`) VALUES ('admin7@admin7', '$2a$10$EVfGJ5O6YLQs5Jj5ZOAKGuZ/2sLqXkNLw8j.MotNnYgHa1h2qUyIW', 'admin7@admin7', 'admin7@admin7', 'admin7@admin7', 'admin7@admin7');
INSERT INTO `springbootrocks`.`app_user` (`username`, `password`, `useremail`, `userfirstname`, `userlastname`, `useraddress`) VALUES ('admin8@admin8', '$2a$10$EVfGJ5O6YLQs5Jj5ZOAKGuZ/2sLqXkNLw8j.MotNnYgHa1h2qUyIW', 'admin8@admin8', 'admin8@admin8', 'admin8@admin8', 'admin8@admin8');
INSERT INTO `springbootrocks`.`app_user` (`username`, `password`, `useremail`, `userfirstname`, `userlastname`, `useraddress`) VALUES ('admin9@admin9', '$2a$10$EVfGJ5O6YLQs5Jj5ZOAKGuZ/2sLqXkNLw8j.MotNnYgHa1h2qUyIW', 'admin9@admin9', 'admin9@admin9', 'admin9@admin9', 'admin9@admin9');
INSERT INTO `springbootrocks`.`app_user` (`username`, `password`, `useremail`, `userfirstname`, `userlastname`, `useraddress`) VALUES ('admin10@admin10', '$2a$10$EVfGJ5O6YLQs5Jj5ZOAKGuZ/2sLqXkNLw8j.MotNnYgHa1h2qUyIW', 'admin10@admin10', 'admin10@admin10', 'admin10@admin10', 'admin10@admin10');
INSERT INTO `springbootrocks`.`app_user` (`username`, `password`, `useremail`, `userfirstname`, `userlastname`, `useraddress`) VALUES ('admin11@admin11', '$2a$10$EVfGJ5O6YLQs5Jj5ZOAKGuZ/2sLqXkNLw8j.MotNnYgHa1h2qUyIW', 'admin11@admin11', 'admin11@admin11', 'admin11@admin11', 'admin11@admin11');
INSERT INTO `springbootrocks`.`app_user` (`username`, `password`, `useremail`, `userfirstname`, `userlastname`, `useraddress`) VALUES ('admin12@admin12', '$2a$10$EVfGJ5O6YLQs5Jj5ZOAKGuZ/2sLqXkNLw8j.MotNnYgHa1h2qUyIW', 'admin12@admin12', 'admin12@admin12', 'admin12@admin12', 'admin12@admin12');
INSERT INTO `springbootrocks`.`app_user` (`username`, `password`, `useremail`, `userfirstname`, `userlastname`, `useraddress`) VALUES ('admin13@admin13', '$2a$10$EVfGJ5O6YLQs5Jj5ZOAKGuZ/2sLqXkNLw8j.MotNnYgHa1h2qUyIW', 'admin13@admin13', 'admin13@admin13', 'admin13@admin13', 'admin13@admin13');
INSERT INTO `springbootrocks`.`app_user` (`username`, `password`, `useremail`, `userfirstname`, `userlastname`, `useraddress`) VALUES ('admin14@admin14', '$2a$10$EVfGJ5O6YLQs5Jj5ZOAKGuZ/2sLqXkNLw8j.MotNnYgHa1h2qUyIW', 'admin14@admin14', 'admin14@admin14', 'admin14@admin14', 'admin14@admin14');
INSERT INTO `springbootrocks`.`app_user` (`username`, `password`, `useremail`, `userfirstname`, `userlastname`, `useraddress`) VALUES ('admin15@admin15', '$2a$10$EVfGJ5O6YLQs5Jj5ZOAKGuZ/2sLqXkNLw8j.MotNnYgHa1h2qUyIW', 'admin15@admin15', 'admin15@admin15', 'admin15@admin15', 'admin15@admin15');

INSERT INTO `springbootrocks`.`app_role` (`id`, `name`) VALUES ('1', 'ADMIN');
INSERT INTO `springbootrocks`.`app_role` (`id`, `name`) VALUES ('2', 'EDITOR');
INSERT INTO `springbootrocks`.`app_role` (`id`, `name`) VALUES ('3', 'VIEWER');


INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('1', '1');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('1', '2');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('1', '3');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('2', '1');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('2', '2');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('2', '3');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('3', '1');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('3', '2');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('3', '3');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('4', '1');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('4', '2');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('4', '3');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('5', '1');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('5', '2');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('5', '3');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('6', '1');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('6', '2');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('6', '3');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('7', '1');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('7', '2');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('7', '3');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('8', '1');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('8', '2');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('8', '3');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('9', '1');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('9', '2');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('9', '3');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('10', '1');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('10', '2');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('10', '3');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('11', '1');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('11', '2');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('11', '3');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('12', '1');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('12', '2');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('12', '3');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('13', '1');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('13', '2');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('13', '3');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('14', '1');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('14', '2');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('14', '3');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('15', '1');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('15', '2');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('15', '3');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('16', '1');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('16', '2');
INSERT INTO `springbootrocks`.`app_user_role` (`userid`, `roleid`) VALUES ('16', '3');

INSERT INTO `springbootrocks`.`app_agency` (`agencyname`, `agencylocation`, `agencyaddress`, `agencyheadname`, `agencyheademail`) VALUES ('Agency1', 'Agency1 Location', 'Agency1 Address', 'Agency1 HeadName', 'Agency1Head@email.com');
INSERT INTO `springbootrocks`.`app_agency` (`agencyname`, `agencylocation`, `agencyaddress`, `agencyheadname`, `agencyheademail`) VALUES ('Agency2', 'Agency2 Location', 'Agency2 Address', 'Agency2 HeadName', 'Agency2Head@email.com');
INSERT INTO `springbootrocks`.`app_agency` (`agencyname`, `agencylocation`, `agencyaddress`, `agencyheadname`, `agencyheademail`) VALUES ('Agency3', 'Agency3 Location', 'Agency3 Address', 'Agency3 HeadName', 'Agency3Head@email.com');
INSERT INTO `springbootrocks`.`app_agency` (`agencyname`, `agencylocation`, `agencyaddress`, `agencyheadname`, `agencyheademail`) VALUES ('Agency4', 'Agency4 Location', 'Agency4 Address', 'Agency4 HeadName', 'Agency4Head@email.com');
INSERT INTO `springbootrocks`.`app_agency` (`agencyname`, `agencylocation`, `agencyaddress`, `agencyheadname`, `agencyheademail`) VALUES ('Agency5', 'Agency5 Location', 'Agency5 Address', 'Agency5 HeadName', 'Agency5Head@email.com');

INSERT INTO `springbootrocks`.`app_programarea` (`programareaname`, `programarealocation`, `programareaaddress`, `programareaheadname`, `programareaheademail`, `programareaagencyid`) VALUES ('Programarea1', 'Programarea1 Location', 'Programarea1 Address', 'Programarea1HeadName', 'Programarea1Head@email.com', '1');
INSERT INTO `springbootrocks`.`app_programarea` (`programareaname`, `programarealocation`, `programareaaddress`, `programareaheadname`, `programareaheademail`, `programareaagencyid`) VALUES ('Programarea2', 'Programarea2 Location', 'Programarea2 Address', 'Programarea2HeadName', 'Programarea2Head@email.com', '1');
INSERT INTO `springbootrocks`.`app_programarea` (`programareaname`, `programarealocation`, `programareaaddress`, `programareaheadname`, `programareaheademail`, `programareaagencyid`) VALUES ('Programarea3', 'Programarea3 Location', 'Programarea3 Address', 'Programarea3HeadName', 'Programarea3Head@email.com', '1');
INSERT INTO `springbootrocks`.`app_programarea` (`programareaname`, `programarealocation`, `programareaaddress`, `programareaheadname`, `programareaheademail`, `programareaagencyid`) VALUES ('Programarea4', 'Programarea4 Location', 'Programarea4 Address', 'Programarea4HeadName', 'Programarea4Head@email.com', '2');
INSERT INTO `springbootrocks`.`app_programarea` (`programareaname`, `programarealocation`, `programareaaddress`, `programareaheadname`, `programareaheademail`, `programareaagencyid`) VALUES ('Programarea5', 'Programarea5 Location', 'Programarea5 Address', 'Programarea5HeadName', 'Programarea5Head@email.com', '2');
INSERT INTO `springbootrocks`.`app_programarea` (`programareaname`, `programarealocation`, `programareaaddress`, `programareaheadname`, `programareaheademail`, `programareaagencyid`) VALUES ('Programarea6', 'Programarea6 Location', 'Programarea6 Address', 'Programarea6HeadName', 'Programarea6Head@email.com', '2');
INSERT INTO `springbootrocks`.`app_programarea` (`programareaname`, `programarealocation`, `programareaaddress`, `programareaheadname`, `programareaheademail`, `programareaagencyid`) VALUES ('Programarea7', 'Programarea7 Location', 'Programarea7 Address', 'Programarea7HeadName', 'Programarea7Head@email.com', '3');
INSERT INTO `springbootrocks`.`app_programarea` (`programareaname`, `programarealocation`, `programareaaddress`, `programareaheadname`, `programareaheademail`, `programareaagencyid`) VALUES ('Programarea8', 'Programarea8 Location', 'Programarea8 Address', 'Programarea8HeadName', 'Programarea8Head@email.com', '3');
INSERT INTO `springbootrocks`.`app_programarea` (`programareaname`, `programarealocation`, `programareaaddress`, `programareaheadname`, `programareaheademail`, `programareaagencyid`) VALUES ('Programarea9', 'Programarea9 Location', 'Programarea9 Address', 'Programarea9HeadName', 'Programarea9Head@email.com', '3');
INSERT INTO `springbootrocks`.`app_programarea` (`programareaname`, `programarealocation`, `programareaaddress`, `programareaheadname`, `programareaheademail`, `programareaagencyid`) VALUES ('Programarea10', 'Programarea10 Location', 'Programarea10 Address', 'Programarea10HeadName', 'Programarea10Head@email.com', '4');
INSERT INTO `springbootrocks`.`app_programarea` (`programareaname`, `programarealocation`, `programareaaddress`, `programareaheadname`, `programareaheademail`, `programareaagencyid`) VALUES ('Programarea11', 'Programarea11 Location', 'Programarea11 Address', 'Programarea11HeadName', 'Programarea11Head@email.com', '4');
INSERT INTO `springbootrocks`.`app_programarea` (`programareaname`, `programarealocation`, `programareaaddress`, `programareaheadname`, `programareaheademail`, `programareaagencyid`) VALUES ('Programarea12', 'Programarea12 Location', 'Programarea12 Address', 'Programarea12HeadName', 'Programarea12Head@email.com', '4');
INSERT INTO `springbootrocks`.`app_programarea` (`programareaname`, `programarealocation`, `programareaaddress`, `programareaheadname`, `programareaheademail`, `programareaagencyid`) VALUES ('Programarea13', 'Programarea13 Location', 'Programarea13 Address', 'Programarea13HeadName', 'Programarea13Head@email.com', '5');
INSERT INTO `springbootrocks`.`app_programarea` (`programareaname`, `programarealocation`, `programareaaddress`, `programareaheadname`, `programareaheademail`, `programareaagencyid`) VALUES ('Programarea14', 'Programarea14 Location', 'Programarea14 Address', 'Programarea14HeadName', 'Programarea14Head@email.com', '5');
INSERT INTO `springbootrocks`.`app_programarea` (`programareaname`, `programarealocation`, `programareaaddress`, `programareaheadname`, `programareaheademail`, `programareaagencyid`) VALUES ('Programarea15', 'Programarea15 Location', 'Programarea15 Address', 'Programarea15HeadName', 'Programarea15Head@email.com', '5');


