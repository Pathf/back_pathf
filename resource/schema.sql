CREATE TABLE Users
(
	idUser Bigint NOT NULL,
	nameId varchar[255],
	psw varchar[255] NOT NULL,
	
	nameUser varchar[255],
	birthday date,
	mail varchar[255],
	
	description text,
	icon OID,
	
	CONSTRAINT User_pk PRIMARY KEY (idUser)
);

CREATE TABLE Items
(
	idItem Bigint NOT NULL,
	idMedia Bigint NOT NULL,
	properties text,
	description text,
	image OID,
	
	CONSTRAINT Item_pk PRIMARY KEY (idItem)
);

CREATE TABLE Medias
(
	idMedia Bigint NOT NULL,
	name varchar[255],
	type char[3],
	
	CONSTRAINT Media_pk PRIMARY KEY (idMedia)
);

CREATE TABLE User_Item
(
	idUser Bigint NOT NULL,
	idItem Bigint NOT NULL,
	CONSTRAINT User_Item_pk PRIMARY KEY (idUser, idItem),
    FOREIGN KEY (idUser) REFERENCES Users(idUser),
    FOREIGN KEY (idItem) REFERENCES Items(idItem)
);

CREATE TABLE Log
(
	idLog Bigint NOT NULL,
	type  char[1],
	query text,
	idUser int,
	
	CONSTRAINT Log_pk PRIMARY KEY (idLog),
    FOREIGN KEY (idUser) REFERENCES Users(idUser)
);


CREATE TABLE RP_Sessions
(
	idRP Bigint NOT NULL,
	
	nameRP varchar[255],
	nameGM varchar[255],
	description text,
	
	CONSTRAINT RP_pk PRIMARY KEY (idRP)
);

CREATE TABLE Users_RP
(
	idUser Bigint NOT NULL,
	idRP Bigint NOT NULL,
	CONSTRAINT User_RP_pk PRIMARY KEY (idUser, idRP),
    FOREIGN KEY (idUser) REFERENCES Users(idUser),
    FOREIGN KEY (idRP) REFERENCES RP_Sessions(idRP)
);

CREATE TABLE Sheets
(
	idSheet Bigint NOT NULL,
	
	CONSTRAINT Sheet_pk PRIMARY KEY (idSheet)
);

CREATE TABLE Properties
(
	idProperty Bigint NOT NULL,
	name varchar[255],
	value text,
	
	CONSTRAINT Property_pk PRIMARY KEY (idProperty)
);

CREATE TABLE Sheets_Properties
(
	idSheet Bigint NOT NULL,
	idProperty Bigint NOT NULL,
	CONSTRAINT Sheet_Property_pk PRIMARY KEY (idSheet, idProperty),
    FOREIGN KEY (idSheet) REFERENCES Sheets(idSheet),
    FOREIGN KEY (idProperty) REFERENCES Properties(idProperty)
);

CREATE TABLE Users_Sheets
(
	idUser Bigint NOT NULL,
	idSheet Bigint NOT NULL,
	CONSTRAINT User_Sheet_pk PRIMARY KEY (idUser, idSheet),
    FOREIGN KEY (idUser) REFERENCES Users(idUser),
    FOREIGN KEY (idSheet) REFERENCES Sheets(idSheet)
);
