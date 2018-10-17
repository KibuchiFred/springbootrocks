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
id INT NOT NULL AUTO_INCREMENT,
programareaname VARCHAR(150) NOT NULL,
programarealocation VARCHAR(150) NOT NULL,
programareaaddress VARCHAR(150) NOT NULL,
programareaheadname VARCHAR(150) NOT NULL,
programareaheademail VARCHAR(150) NOT NULL,
programareaagencyid INT NOT NULL,
PRIMARY KEY (id),
UNIQUE (programareaname)) ENGINE=InnoDB;

CREATE TABLE app_user_programarea (
id BIGINT NOT NULL AUTO_INCREMENT,
userid BIGINT NOT NULL,
programareaid INT NOT NULL,
PRIMARY KEY (id))ENGINE=InnoDB;


create table app_casetype(
id INT NOT NULL AUTO_INCREMENT,
casetypename VARCHAR(150) NOT NULL,
programareaid INT NOT NULL,
PRIMARY KEY (id),
UNIQUE (casetypename)) ENGINE=InnoDB;


create table app_casestep(
id INT NOT NULL AUTO_INCREMENT,
casestepname VARCHAR(150) NOT NULL,
roleid INT NOT NULL,
casetypeid INT NOT NULL,
PRIMARY KEY (id),
UNIQUE (casestepname)) ENGINE=InnoDB;

create table app_caseproperty(
id INT NOT NULL AUTO_INCREMENT,
caseproperty1 VARCHAR(150) NOT NULL,
caseproperty2 VARCHAR(150) NOT NULL,
caseproperty3 VARCHAR(150) NOT NULL,
caseproperty4 VARCHAR(150) NOT NULL,
caseproperty5 VARCHAR(150) NOT NULL,
casetypeid INT NOT NULL,
PRIMARY KEY (id)) ENGINE=InnoDB;

create table app_documenttype(
id INT NOT NULL AUTO_INCREMENT,
documenttypename VARCHAR(150) NOT NULL,
documenttypeproperty1 VARCHAR(150) NOT NULL,
documenttypeproperty2 VARCHAR(150) NOT NULL,
documenttypeproperty3 VARCHAR(150) NOT NULL,
documenttypeproperty4 VARCHAR(150) NOT NULL,
documenttypeproperty5 VARCHAR(150) NOT NULL,
casetypeid INT NOT NULL,
PRIMARY KEY (id),
UNIQUE (documenttypename)) ENGINE=InnoDB;


create table app_workqueue(
id INT NOT NULL AUTO_INCREMENT,
casetypeid INT NOT NULL,
casepropertyid INT NOT NULL,
casestepid INT NOT NULL,
PRIMARY KEY (id)) ENGINE=InnoDB;

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

ALTER TABLE app_user_programarea ADD CONSTRAINT FK_AUPUSERID FOREIGN KEY (userid) REFERENCES app_user (id);
ALTER TABLE app_user_programarea ADD CONSTRAINT FK_AUPPPAREAID FOREIGN KEY (programareaid) REFERENCES app_programarea (id);

ALTER TABLE app_programarea ADD CONSTRAINT FK_APAAGENCYID FOREIGN KEY (programareaagencyid) REFERENCES app_agency (id);

ALTER TABLE app_casetype ADD CONSTRAINT FK_ACTPAREAID FOREIGN KEY (programareaid) REFERENCES app_programarea (id);

ALTER TABLE app_caseproperty ADD CONSTRAINT FK_ACPCTID FOREIGN KEY (casetypeid) REFERENCES app_casetype (id);

ALTER TABLE app_documenttype ADD CONSTRAINT FK_ADTCTID FOREIGN KEY (casetypeid) REFERENCES app_casetype (id);

ALTER TABLE app_casestep ADD CONSTRAINT FK_ACSROLEID FOREIGN KEY (roleid) REFERENCES app_role (id);
ALTER TABLE app_casestep ADD CONSTRAINT FK_ACSCTID FOREIGN KEY (casetypeid) REFERENCES app_casetype (id);


ALTER TABLE app_workqueue ADD CONSTRAINT FK_AWQCTID FOREIGN KEY (casetypeid) REFERENCES app_casetype (id);
ALTER TABLE app_workqueue ADD CONSTRAINT FK_AWQCPID FOREIGN KEY (casepropertyid) REFERENCES app_caseproperty (id);
ALTER TABLE app_workqueue ADD CONSTRAINT FK_AWQCSID FOREIGN KEY (casestepid) REFERENCES app_casestep (id);

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

INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('1', '1');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('1', '2');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('1', '3');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('2', '4');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('2', '5');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('2', '6');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('3', '7');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('3', '8');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('3', '9');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('4', '10');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('4', '11');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('4', '12');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('5', '13');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('5', '14');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('5', '15');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('6', '1');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('6', '2');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('6', '3');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('7', '4');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('7', '5');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('7', '6');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('8', '7');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('8', '8');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('8', '9');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('9', '10');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('9', '11');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('9', '12');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('10', '13');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('10', '14');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('10', '15');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('11', '1');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('11', '2');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('11', '3');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('12', '4');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('12', '5');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('12', '6');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('13', '7');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('13', '8');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('13', '9');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('14', '10');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('14', '11');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('14', '12');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('15', '13');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('15', '14');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('15', '15');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('16', '1');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('16', '2');
INSERT INTO `springbootrocks`.`app_user_programarea` (`userid`, `programareaid`) VALUES ('16', '3');

INSERT INTO `springbootrocks`.`app_casetype` (`casetypename`, `programareaid`) VALUES ('casetype1', '1');
INSERT INTO `springbootrocks`.`app_casetype` (`casetypename`, `programareaid`) VALUES ('casetype2', '1');
INSERT INTO `springbootrocks`.`app_casetype` (`casetypename`, `programareaid`) VALUES ('casetype3', '1');
INSERT INTO `springbootrocks`.`app_casetype` (`casetypename`, `programareaid`) VALUES ('casetype4', '2');
INSERT INTO `springbootrocks`.`app_casetype` (`casetypename`, `programareaid`) VALUES ('casetype5', '2');
INSERT INTO `springbootrocks`.`app_casetype` (`casetypename`, `programareaid`) VALUES ('casetype6', '2');
INSERT INTO `springbootrocks`.`app_casetype` (`casetypename`, `programareaid`) VALUES ('casetype7', '3');
INSERT INTO `springbootrocks`.`app_casetype` (`casetypename`, `programareaid`) VALUES ('casetype8', '3');
INSERT INTO `springbootrocks`.`app_casetype` (`casetypename`, `programareaid`) VALUES ('casetype9', '3');
INSERT INTO `springbootrocks`.`app_casetype` (`casetypename`, `programareaid`) VALUES ('casetype10', '4');
INSERT INTO `springbootrocks`.`app_casetype` (`casetypename`, `programareaid`) VALUES ('casetype11', '4');
INSERT INTO `springbootrocks`.`app_casetype` (`casetypename`, `programareaid`) VALUES ('casetype12', '4');
INSERT INTO `springbootrocks`.`app_casetype` (`casetypename`, `programareaid`) VALUES ('casetype13', '5');
INSERT INTO `springbootrocks`.`app_casetype` (`casetypename`, `programareaid`) VALUES ('casetype14', '5');
INSERT INTO `springbootrocks`.`app_casetype` (`casetypename`, `programareaid`) VALUES ('casetype15', '5');
INSERT INTO `springbootrocks`.`app_casetype` (`casetypename`, `programareaid`) VALUES ('casetype16', '6');
INSERT INTO `springbootrocks`.`app_casetype` (`casetypename`, `programareaid`) VALUES ('casetype17', '6');
INSERT INTO `springbootrocks`.`app_casetype` (`casetypename`, `programareaid`) VALUES ('casetype18', '6');
INSERT INTO `springbootrocks`.`app_casetype` (`casetypename`, `programareaid`) VALUES ('casetype19', '7');
INSERT INTO `springbootrocks`.`app_casetype` (`casetypename`, `programareaid`) VALUES ('casetype20', '7');
INSERT INTO `springbootrocks`.`app_casetype` (`casetypename`, `programareaid`) VALUES ('casetype21', '7');
INSERT INTO `springbootrocks`.`app_casetype` (`casetypename`, `programareaid`) VALUES ('casetype22', '8');
INSERT INTO `springbootrocks`.`app_casetype` (`casetypename`, `programareaid`) VALUES ('casetype23', '8');
INSERT INTO `springbootrocks`.`app_casetype` (`casetypename`, `programareaid`) VALUES ('casetype24', '8');
INSERT INTO `springbootrocks`.`app_casetype` (`casetypename`, `programareaid`) VALUES ('casetype25', '9');
INSERT INTO `springbootrocks`.`app_casetype` (`casetypename`, `programareaid`) VALUES ('casetype26', '9');
INSERT INTO `springbootrocks`.`app_casetype` (`casetypename`, `programareaid`) VALUES ('casetype27', '9');
INSERT INTO `springbootrocks`.`app_casetype` (`casetypename`, `programareaid`) VALUES ('casetype28', '10');
INSERT INTO `springbootrocks`.`app_casetype` (`casetypename`, `programareaid`) VALUES ('casetype29', '10');
INSERT INTO `springbootrocks`.`app_casetype` (`casetypename`, `programareaid`) VALUES ('casetype30', '10');

INSERT INTO `springbootrocks`.`app_casestep` (`casestepname`, `roleid`, `casetypeid`) VALUES ('casestep1', '1', '1');
INSERT INTO `springbootrocks`.`app_casestep` (`casestepname`, `roleid`, `casetypeid`) VALUES ('casestep2', '1', '1');
INSERT INTO `springbootrocks`.`app_casestep` (`casestepname`, `roleid`, `casetypeid`) VALUES ('casestep3', '2', '2');
INSERT INTO `springbootrocks`.`app_casestep` (`casestepname`, `roleid`, `casetypeid`) VALUES ('casestep4', '2', '2');
INSERT INTO `springbootrocks`.`app_casestep` (`casestepname`, `roleid`, `casetypeid`) VALUES ('casestep5', '3', '3');
INSERT INTO `springbootrocks`.`app_casestep` (`casestepname`, `roleid`, `casetypeid`) VALUES ('casestep6', '3', '3');
INSERT INTO `springbootrocks`.`app_casestep` (`casestepname`, `roleid`, `casetypeid`) VALUES ('casestep7', '1', '4');
INSERT INTO `springbootrocks`.`app_casestep` (`casestepname`, `roleid`, `casetypeid`) VALUES ('casestep8', '1', '4');
INSERT INTO `springbootrocks`.`app_casestep` (`casestepname`, `roleid`, `casetypeid`) VALUES ('casestep9', '1', '5');
INSERT INTO `springbootrocks`.`app_casestep` (`casestepname`, `roleid`, `casetypeid`) VALUES ('casestep10', '1', '6');

INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype1', 'documenttype1', 'documenttype1', 'documenttype1', 'documenttype1', 'documenttype1', '1');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype2', 'documenttype2', 'documenttype2', 'documenttype2', 'documenttype2', 'documenttype2', '1');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype3', 'documenttype3', 'documenttype3', 'documenttype3', 'documenttype3', 'documenttype3', '1');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype4', 'documenttype4', 'documenttype4', 'documenttype4', 'documenttype4', 'documenttype4', '1');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype5', 'documenttype5', 'documenttype5', 'documenttype5', 'documenttype5', 'documenttype5', '1');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype6', 'documenttype6', 'documenttype6', 'documenttype6', 'documenttype6', 'documenttype6', '1');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype7', 'documenttype7', 'documenttype7', 'documenttype7', 'documenttype7', 'documenttype7', '1');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype8', 'documenttype8', 'documenttype8', 'documenttype8', 'documenttype8', 'documenttype8', '1');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype9', 'documenttype9', 'documenttype9', 'documenttype9', 'documenttype9', 'documenttype9', '1');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype10', 'documenttype10', 'documenttype10', 'documenttype10', 'documenttype10', 'documenttype10', '1');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype11', 'documenttype11', 'documenttype11', 'documenttype11', 'documenttype11', 'documenttype11', '2');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype12', 'documenttype12', 'documenttype12', 'documenttype12', 'documenttype12', 'documenttype12', '2');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype13', 'documenttype13', 'documenttype13', 'documenttype13', 'documenttype13', 'documenttype13', '2');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype14', 'documenttype14', 'documenttype14', 'documenttype14', 'documenttype14', 'documenttype14', '2');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype15', 'documenttype15', 'documenttype15', 'documenttype15', 'documenttype15', 'documenttype15', '2');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype16', 'documenttype16', 'documenttype16', 'documenttype16', 'documenttype16', 'documenttype16', '2');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype17', 'documenttype17', 'documenttype17', 'documenttype17', 'documenttype17', 'documenttype17', '2');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype18', 'documenttype18', 'documenttype18', 'documenttype18', 'documenttype18', 'documenttype18', '2');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype19', 'documenttype19', 'documenttype19', 'documenttype19', 'documenttype19', 'documenttype19', '2');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype20', 'documenttype20', 'documenttype20', 'documenttype20', 'documenttype20', 'documenttype20', '2');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype21', 'documenttype21', 'documenttype21', 'documenttype21', 'documenttype21', 'documenttype21', '3');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype22', 'documenttype22', 'documenttype22', 'documenttype22', 'documenttype22', 'documenttype22', '3');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype23', 'documenttype23', 'documenttype23', 'documenttype23', 'documenttype23', 'documenttype23', '3');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype24', 'documenttype24', 'documenttype24', 'documenttype24', 'documenttype24', 'documenttype24', '3');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype25', 'documenttype25', 'documenttype25', 'documenttype25', 'documenttype25', 'documenttype25', '3');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype26', 'documenttype26', 'documenttype26', 'documenttype26', 'documenttype26', 'documenttype26', '3');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype27', 'documenttype27', 'documenttype27', 'documenttype27', 'documenttype27', 'documenttype27', '3');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype28', 'documenttype28', 'documenttype28', 'documenttype28', 'documenttype28', 'documenttype28', '3');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype29', 'documenttype29', 'documenttype29', 'documenttype29', 'documenttype29', 'documenttype29', '3');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype30', 'documenttype30', 'documenttype30', 'documenttype30', 'documenttype30', 'documenttype30', '3');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype31', 'documenttype31', 'documenttype31', 'documenttype31', 'documenttype31', 'documenttype31', '4');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype32', 'documenttype32', 'documenttype32', 'documenttype32', 'documenttype32', 'documenttype32', '4');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype33', 'documenttype33', 'documenttype33', 'documenttype33', 'documenttype33', 'documenttype33', '4');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype34', 'documenttype34', 'documenttype34', 'documenttype34', 'documenttype34', 'documenttype34', '4');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype35', 'documenttype35', 'documenttype35', 'documenttype35', 'documenttype35', 'documenttype35', '4');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype36', 'documenttype36', 'documenttype36', 'documenttype36', 'documenttype36', 'documenttype36', '4');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype37', 'documenttype37', 'documenttype37', 'documenttype37', 'documenttype37', 'documenttype37', '4');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype38', 'documenttype38', 'documenttype38', 'documenttype38', 'documenttype38', 'documenttype38', '4');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype39', 'documenttype39', 'documenttype39', 'documenttype39', 'documenttype39', 'documenttype39', '4');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype40', 'documenttype40', 'documenttype40', 'documenttype40', 'documenttype40', 'documenttype40', '4');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype41', 'documenttype41', 'documenttype41', 'documenttype41', 'documenttype41', 'documenttype41', '5');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype42', 'documenttype42', 'documenttype42', 'documenttype42', 'documenttype42', 'documenttype42', '5');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype43', 'documenttype43', 'documenttype43', 'documenttype43', 'documenttype43', 'documenttype43', '5');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype44', 'documenttype44', 'documenttype44', 'documenttype44', 'documenttype44', 'documenttype44', '5');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype45', 'documenttype45', 'documenttype45', 'documenttype45', 'documenttype45', 'documenttype45', '5');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype46', 'documenttype46', 'documenttype46', 'documenttype46', 'documenttype46', 'documenttype46', '5');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype47', 'documenttype47', 'documenttype47', 'documenttype47', 'documenttype47', 'documenttype47', '5');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype48', 'documenttype48', 'documenttype48', 'documenttype48', 'documenttype48', 'documenttype48', '5');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype49', 'documenttype49', 'documenttype49', 'documenttype49', 'documenttype49', 'documenttype49', '5');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype50', 'documenttype50', 'documenttype50', 'documenttype50', 'documenttype50', 'documenttype50', '5');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype51', 'documenttype51', 'documenttype51', 'documenttype51', 'documenttype51', 'documenttype51', '6');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype52', 'documenttype52', 'documenttype52', 'documenttype52', 'documenttype52', 'documenttype52', '6');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype53', 'documenttype53', 'documenttype53', 'documenttype53', 'documenttype53', 'documenttype53', '6');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype54', 'documenttype54', 'documenttype54', 'documenttype54', 'documenttype54', 'documenttype54', '6');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype55', 'documenttype55', 'documenttype55', 'documenttype55', 'documenttype55', 'documenttype55', '6');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype56', 'documenttype56', 'documenttype56', 'documenttype56', 'documenttype56', 'documenttype56', '6');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype57', 'documenttype57', 'documenttype57', 'documenttype57', 'documenttype57', 'documenttype57', '6');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype58', 'documenttype58', 'documenttype58', 'documenttype58', 'documenttype58', 'documenttype58', '6');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype59', 'documenttype59', 'documenttype59', 'documenttype59', 'documenttype59', 'documenttype59', '6');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype60', 'documenttype60', 'documenttype60', 'documenttype60', 'documenttype60', 'documenttype60', '6');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype61', 'documenttype61', 'documenttype61', 'documenttype61', 'documenttype61', 'documenttype61', '7');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype62', 'documenttype62', 'documenttype62', 'documenttype62', 'documenttype62', 'documenttype62', '7');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype63', 'documenttype63', 'documenttype63', 'documenttype63', 'documenttype63', 'documenttype63', '7');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype64', 'documenttype64', 'documenttype64', 'documenttype64', 'documenttype64', 'documenttype64', '7');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype65', 'documenttype65', 'documenttype65', 'documenttype65', 'documenttype65', 'documenttype65', '7');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype66', 'documenttype66', 'documenttype66', 'documenttype66', 'documenttype66', 'documenttype66', '7');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype67', 'documenttype67', 'documenttype67', 'documenttype67', 'documenttype67', 'documenttype67', '7');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype68', 'documenttype68', 'documenttype68', 'documenttype68', 'documenttype68', 'documenttype68', '7');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype69', 'documenttype69', 'documenttype69', 'documenttype69', 'documenttype69', 'documenttype69', '7');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype70', 'documenttype70', 'documenttype70', 'documenttype70', 'documenttype70', 'documenttype70', '7');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype71', 'documenttype71', 'documenttype71', 'documenttype71', 'documenttype71', 'documenttype71', '8');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype72', 'documenttype72', 'documenttype72', 'documenttype72', 'documenttype72', 'documenttype72', '8');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype73', 'documenttype73', 'documenttype73', 'documenttype73', 'documenttype73', 'documenttype73', '8');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype74', 'documenttype74', 'documenttype74', 'documenttype74', 'documenttype74', 'documenttype74', '8');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype75', 'documenttype75', 'documenttype75', 'documenttype75', 'documenttype75', 'documenttype75', '8');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype76', 'documenttype76', 'documenttype76', 'documenttype76', 'documenttype76', 'documenttype76', '8');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype77', 'documenttype77', 'documenttype77', 'documenttype77', 'documenttype77', 'documenttype77', '8');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype78', 'documenttype78', 'documenttype78', 'documenttype78', 'documenttype78', 'documenttype78', '8');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype79', 'documenttype79', 'documenttype79', 'documenttype79', 'documenttype79', 'documenttype79', '8');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype80', 'documenttype80', 'documenttype80', 'documenttype80', 'documenttype80', 'documenttype80', '8');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype81', 'documenttype81', 'documenttype81', 'documenttype81', 'documenttype81', 'documenttype81', '9');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype82', 'documenttype82', 'documenttype82', 'documenttype82', 'documenttype82', 'documenttype82', '9');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype83', 'documenttype83', 'documenttype83', 'documenttype83', 'documenttype83', 'documenttype83', '9');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype84', 'documenttype84', 'documenttype84', 'documenttype84', 'documenttype84', 'documenttype84', '9');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype85', 'documenttype85', 'documenttype85', 'documenttype85', 'documenttype85', 'documenttype85', '9');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype86', 'documenttype86', 'documenttype86', 'documenttype86', 'documenttype86', 'documenttype86', '9');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype87', 'documenttype87', 'documenttype87', 'documenttype87', 'documenttype87', 'documenttype87', '9');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype88', 'documenttype88', 'documenttype88', 'documenttype88', 'documenttype88', 'documenttype88', '9');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype89', 'documenttype89', 'documenttype89', 'documenttype89', 'documenttype89', 'documenttype89', '9');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype90', 'documenttype90', 'documenttype90', 'documenttype90', 'documenttype90', 'documenttype90', '9');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype91', 'documenttype91', 'documenttype91', 'documenttype91', 'documenttype91', 'documenttype91', '10');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype92', 'documenttype92', 'documenttype92', 'documenttype92', 'documenttype92', 'documenttype92', '10');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype93', 'documenttype93', 'documenttype93', 'documenttype93', 'documenttype93', 'documenttype93', '10');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype94', 'documenttype94', 'documenttype94', 'documenttype94', 'documenttype94', 'documenttype94', '10');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype95', 'documenttype95', 'documenttype95', 'documenttype95', 'documenttype95', 'documenttype95', '10');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype96', 'documenttype96', 'documenttype96', 'documenttype96', 'documenttype96', 'documenttype96', '10');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype97', 'documenttype97', 'documenttype97', 'documenttype97', 'documenttype97', 'documenttype97', '10');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype98', 'documenttype98', 'documenttype98', 'documenttype98', 'documenttype98', 'documenttype98', '10');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype99', 'documenttype99', 'documenttype99', 'documenttype99', 'documenttype99', 'documenttype99', '10');
INSERT INTO `springbootrocks`.`app_documenttype` (`documenttypename`, `documenttypeproperty1`, `documenttypeproperty2`, `documenttypeproperty3`, `documenttypeproperty4`, `documenttypeproperty5`, `casetypeid`) VALUES ('documenttype100', 'documenttype100', 'documenttype100', 'documenttype100', 'documenttype100', 'documenttype100', '10');
