﻿USE [master];
GO

/*SE VALIDA SI EXISTA LA BASE DE DATOS ANTES DE CREARLA*/
IF EXISTS(SELECT 1 FROM SYS.databases WHERE NAME = 'ProyectoII') 
	DROP DATABASE [ProyectoII]
GO
CREATE DATABASE ProyectoII;
GO

/*NOS UBICAMOS EN LA BASE DATOS LUEGO DE CREADA*/
USE [ProyectoII];
GO

/*SE VALIDA SI EXISTA EL ESQUEMA ANTES DE CREARLO*/
IF EXISTS(SELECT 1 FROM SYS.schemas WHERE NAME = 'Proyecto2') 
	DROP SCHEMA Proyecto2;
GO
CREATE SCHEMA [Proyecto2]; 
GO

BEGIN TRAN

	/*CREACI�N DE TABLAS*/

	IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'GEO_PAIS' AND type ='U') 
		DROP TABLE Proyecto2.GEO_PAIS

	CREATE TABLE Proyecto2.GEO_PAIS ( 
		COD_PAIS INTEGER not null, 
		NOMBRE_PAIS VARCHAR(100),
		CONSTRAINT GEP_PAIS_PK PRIMARY KEY ( COD_PAIS)
	);

	IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'GEO_PROVINCIA' AND type ='U') 
		DROP TABLE Proyecto2.GEO_PROVINCIA

	CREATE TABLE Proyecto2.GEO_PROVINCIA ( 
		COD_PAIS INTEGER not null, 
		COD_PROVINCIA INTEGER not null, 
		NOMBRE_PRO VARCHAR(100),
		CONSTRAINT GEO_PRO_PK PRIMARY KEY ( COD_PAIS, COD_PROVINCIA ),
		CONSTRAINT GEO_PRO_FK1 FOREIGN KEY (COD_PAIS) REFERENCES Proyecto2.GEO_PAIS ( COD_PAIS )
	);

	IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'GEO_CANTON' AND type ='U') 
		DROP TABLE Proyecto2.GEO_CANTON

	CREATE TABLE Proyecto2.GEO_CANTON ( 
		COD_PAIS INTEGER not null, 
		COD_PROVINCIA INTEGER not null, 
		COD_CANTON INTEGER not null, 
		NOMBRE_CAN VARCHAR(100),
		CONSTRAINT GEO_CAN_PK PRIMARY KEY ( COD_PAIS, COD_PROVINCIA, COD_CANTON ),
		CONSTRAINT GEO_CAN_FK1 FOREIGN KEY (COD_PAIS, COD_PROVINCIA) REFERENCES Proyecto2.GEO_PROVINCIA ( COD_PAIS, COD_PROVINCIA )
	);

	IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'GEO_DISTRITO' AND type ='U') 
		DROP TABLE Proyecto2.GEO_DISTRITO

	CREATE TABLE Proyecto2.GEO_DISTRITO ( 
		COD_PAIS INTEGER not null, 
		COD_PROVINCIA INTEGER not null, 
		COD_CANTON INTEGER not null, 
		COD_DISTRITO INTEGER not null, 
		NOMBRE_DIST VARCHAR(100), 
		AREA DECIMAL(7,2),/*AGREGO LOS DECIMALES PARA LUEGO PODER REDONDEAR*/
		CONSTRAINT GEO_DIST_PK PRIMARY KEY ( COD_PAIS, COD_PROVINCIA, COD_CANTON, COD_DISTRITO ),
		CONSTRAINT GEO_DIST_FK1 FOREIGN KEY (COD_PAIS, COD_PROVINCIA, COD_CANTON) REFERENCES Proyecto2.GEO_CANTON ( COD_PAIS, COD_PROVINCIA , COD_CANTON)
	);

	/*INSERT DE DATOS EN TABLAS PA�S Y PROVINCIA*/

	INSERT INTO Proyecto2.GEO_PAIS ( COD_PAIS, NOMBRE_PAIS ) VALUES ( 1, 'COSTA RICA');
	INSERT INTO Proyecto2.GEO_PROVINCIA ( COD_PAIS, COD_PROVINCIA, NOMBRE_PRO ) VALUES (1,1,'San Jose');
	INSERT INTO Proyecto2.GEO_PROVINCIA ( COD_PAIS, COD_PROVINCIA, NOMBRE_PRO ) VALUES (1,2,'Alajuela');
	INSERT INTO Proyecto2.GEO_PROVINCIA ( COD_PAIS, COD_PROVINCIA, NOMBRE_PRO ) VALUES (1,3,'Cartago');
	INSERT INTO Proyecto2.GEO_PROVINCIA ( COD_PAIS, COD_PROVINCIA, NOMBRE_PRO ) VALUES (1,4,'Heredia');
	INSERT INTO Proyecto2.GEO_PROVINCIA ( COD_PAIS, COD_PROVINCIA, NOMBRE_PRO ) VALUES (1,5,'Guanacaste');
	INSERT INTO Proyecto2.GEO_PROVINCIA ( COD_PAIS, COD_PROVINCIA, NOMBRE_PRO ) VALUES (1,6,'Puntarenas');
	INSERT INTO Proyecto2.GEO_PROVINCIA ( COD_PAIS, COD_PROVINCIA, NOMBRE_PRO ) VALUES (1,7,'Limon');

	/* INCISO #1 COMANDO PARA CARGAR CANTONES Y DISTRITOS*/
	/*INSERT DE DATOS PARA LA TABLA DE CANTONES*/
	/*CANTONES DE SAN JOSÉ*/
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,1,101,'San José');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,1,102,'Escazú');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,1,103,'Desamparados');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,1,104,'Puriscal');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,1,105,'Tarrazú');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,1,106,'Aserrí');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,1,107,'Mora');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,1,108,'Goicoechea');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,1,109,'Santa Ana');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,1,110,'Alajuelita');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,1,111,'Vázquez de Coronado');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,1,112,'Acosta');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,1,113,'Tibás');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,1,114,'Moravia');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,1,115,'Montes de Oca');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,1,116,'Turrubares');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,1,117,'Dota');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,1,118,'Curridabat');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,1,119,'Pérez Zeledón');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,1,120,'León Cortés Castro');
	/* CANTONES DE ALAJUELA */
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,2,201,'Alajuela');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,2,202,'San Ramón');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,2,203,'Grecia');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,2,204,'San Mateo');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,2,205,'Atenas');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,2,206,'Naranjo');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,2,207,'Palmares');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,2,208,'Poás');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,2,209,'Orotina');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,2,210,'San Carlos');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,2,211,'Zarcero');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,2,212,'Sarchí');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,2,213,'Upala');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,2,214,'Los Chiles');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,2,215,'Guatuso');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,2,216,'Río Cuarto');
	/* CANTONES DE CARTAGO*/
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,3,301,'Cartago');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,3,302,'Paraíso');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,3,303,'La Unión');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,3,304,'Jiménez');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,3,305,'Turrialba');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,3,306,'Alvarado');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,3,307,'Oreamuno');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,3,308,'El Guarco');
	/* CANTONES DE HEREDIA*/
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,4,401,'Heredia');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,4,402,'Barva');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,4,403,'Santo Domingo');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,4,404,'Santa Bárbara');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,4,405,'San Rafael');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,4,406,'San Isidro');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,4,407,'Belén');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,4,408,'Flores');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,4,409,'San Pablo');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,4,410,'Sarapiquí');
	/*CANTONES DE GUANACASTE*/
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,5,501,'Liberia');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,5,502,'Nicoya');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,5,503,'Santa Cruz');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,5,504,'Bagaces');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,5,505,'Carrillo');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,5,506,'Cañas');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,5,507,'Abangares');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,5,508,'Tilarán');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,5,509,'Nandayure');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,5,510,'La Cruz');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,5,511,'Hojancha');
	/*CANTONES DE PUNTARENAS*/
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,6,601,'Puntarenas');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,6,602,'Esparza');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,6,603,'Buenos Aires');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,6,604,'Montes de Oro');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,6,605,'Osa');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,6,606,'Quepos');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,6,607,'Golfito');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,6,608,'Coto Brus');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,6,609,'Parrita');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,6,610,'Corredores');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES(1,6,611,'Garabito');
	/*CANTONES DE LIMÓN*/
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,7,701,'Limón');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,7,702,'Pococí');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,7,703,'Siquirres');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,7,704,'Talamanca');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,7,705,'Matina');
	INSERT INTO Proyecto2.GEO_CANTON (COD_PAIS, COD_PROVINCIA, COD_CANTON, NOMBRE_CAN) VALUES (1,7,706,'Guácimo');

	/*INSERT DE DATOS PARA LA TABLA DE LOS DISTRITOS*/

	INSERT INTO Proyecto2.GEO_DISTRITO  (COD_PAIS, COD_PROVINCIA, COD_CANTON, COD_DISTRITO, NOMBRE_DIST, AREA) VALUES
	(1,1,101,10101,'Carmen',1.49),
	(1,1,101,10102,'Merced',2.2),
	(1,1,101,10103,'Hospital',3.32),
	(1,1,101,10104,'Catedral',2.37),
	(1,1,101,10105,'Zapote',2.86),
	(1,1,101,10106,'San Francisco de Dos Ríos',2.64),
	(1,1,101,10107,'Uruca',8.39),
	(1,1,101,10108,'Mata Redonda',3.66),
	(1,1,101,10109,'Pavas',9.35),
	(1,1,101,10110,'Hatillo',4.37),
	(1,1,101,10111,'San Sebastián',3.97),
	(1,1,102,10201,'Escazú',4.53),
	(1,1,102,10202,'San Antonio',16.96),
	(1,1,102,10203,'San Rafael',13.04),
	(1,1,103,10301,'Desamparados',3.32),
	(1,1,103,10302,'San Miguel',21.34),
	(1,1,103,10303,'San Juan de Dios',2.85),
	(1,1,103,10304,'San Rafael Arriba',3.23),
	(1,1,103,10305,'San Antonio',2.07),
	(1,1,103,10306,'Frailes',19.67),
	(1,1,103,10307,'Patarra',15.88),
	(1,1,103,10308,'San Cristobal',25.03),
	(1,1,103,10309,'Rosario',14.85),
	(1,1,103,10310,'Damas',2.65),
	(1,1,103,10311,'San Rafael Abajo',2.02),
	(1,1,103,10312,'Gravilias',2.94),
	(1,1,103,10313,'Los Guido',3.06),
	(1,1,104,10401,'Santiago',34.52),
	(1,1,104,10402,'Mercedes Sur',183.55),
	(1,1,104,10403,'Barbacoas',18.62),
	(1,1,104,10404,'Grifo Alto',26.4),
	(1,1,104,10405,'San Rafael',15.5),
	(1,1,104,10406,'Candelarita',24.94),
	(1,1,104,10407,'Desamparaditos',7.22),
	(1,1,104,10408,'San Antonio',14.62),
	(1,1,104,10409,'Chires',229.66),
	(1,1,105,10501,'San Marcos',46.02),
	(1,1,105,10502,'San Lorenzo',186.29),
	(1,1,105,10503,'San Carlos',58.96),
	(1,1,106,10601,'Aserrí',15.26),
	(1,1,106,10602,'Tarbaca',15.34),
	(1,1,106,10603,'Vuelta de Jorco',22.05),
	(1,1,106,10604,'San Gabriel',11.73),
	(1,1,106,10605,'Legua',81.26),
	(1,1,106,10606,'Monterrey',8.28),
	(1,1,106,10607,'Salitrillos',14.34),
	(1,1,107,10701,'Colón',39.89),
	(1,1,107,10702,'Guayabo',9.01),
	(1,1,107,10703,'Tabarcia',40.43),
	(1,1,107,10704,'Piedras Negras',14.88),
	(1,1,107,10705,'Picagres',27.16),
	(1,1,107,10706,'Jaris',5.49),
	(1,1,107,10707,'Quitirrisí',26.62),
	(1,1,108,10801,'Guadalupe',2.39),
	(1,1,108,10802,'San Francisco',0.58),
	(1,1,108,10803,'Calle Blancos',2.36),
	(1,1,108,10804,'Mata de Plátano',7.79),
	(1,1,108,10805,'Ipis',2.5),
	(1,1,108,10806,'Rancho Redondo',13.08),
	(1,1,108,10807,'Purral',3),
	(1,1,109,10901,'Santa Ana',5.44),
	(1,1,109,10902,'Salitral',20.29),
	(1,1,109,10903,'Pozos',13.35),
	(1,1,109,10904,'Uruca',7.03),
	(1,1,109,10905,'Piedades',12.07),
	(1,1,109,10906,'Brasil',3.24),
	(1,1,110,11001,'Alajuelita',1.27),
	(1,1,110,11002,'San Josecito',2.37),
	(1,1,110,11003,'San Antonio',10.26),
	(1,1,110,11004,'Concepción',2.43),
	(1,1,110,11005,'San Felipe',5.13),
	(1,1,111,11101,'San Isidro',5.16),
	(1,1,111,11102,'San Rafael',16.91),
	(1,1,111,11103,'Dulce Nombre de Jesús',67.92),
	(1,1,111,11104,'Patalillo',1.92),
	(1,1,111,11105,'Cascajal',132.02),
	(1,1,112,11201,'San Ignacio',22.74),
	(1,1,112,11202,'Guaitil',43.99),
	(1,1,112,11203,'Palmichal',34.14),
	(1,1,112,11204,'Cangrejal',64.33),
	(1,1,112,11205,'Sabanillas',177.36),
	(1,1,113,11301,'San Juan',3.51),
	(1,1,113,11302,'Cinco Esquinas',0.65),
	(1,1,113,11303,'Anselmo Llorente',1.37),
	(1,1,113,11304,'León XIII',0.72),
	(1,1,113,11305,'Colima',2.01),
	(1,1,114,11401,'San Vicente',5.4),
	(1,1,114,11402,'San Jerónimo',18.53),
	(1,1,114,11403,'La Trinidad',4.9),
	(1,1,115,11501,'San Pedro',4.74),
	(1,1,115,11502,'Sabanilla',1.79),
	(1,1,115,11503,'Mercedes',1.43),
	(1,1,115,11504,'San Rafael',7.82),
	(1,1,116,11601,'San Pablo',26.41),
	(1,1,116,11602,'San Pedro',39.2),
	(1,1,116,11603,'San Juan de Mata',86.25),
	(1,1,116,11604,'San Luis',43.84),
	(1,1,116,11605,'Carara',220.55),
	(1,1,117,11701,'Santa María',93.6),
	(1,1,117,11702,'Jardín',33.27),
	(1,1,117,11703,'Copey',277.58),
	(1,1,118,11801,'Curridabat',6.17),
	(1,1,118,11802,'Granadilla',3.51),
	(1,1,118,11803,'Sánchez',4.51),
	(1,1,118,11804,'Tirrases',1.88),
	(1,1,119,11901,'San Isidro de El General',191.82),
	(1,1,119,11902,'El General',76.88),
	(1,1,119,11903,'Daniel Flores',64.06),
	(1,1,119,11904,'Rivas',310),
	(1,1,119,11905,'San Pedro',206.12),
	(1,1,119,11906,'Platanares',80.92),
	(1,1,119,11907,'Pejibaye',141.18),
	(1,1,119,11908,'Cajón',118.63),
	(1,1,119,11909,'Barú',189.66),
	(1,1,119,11910,'Río Nuevo',242.19),
	(1,1,119,11911,'Paramo',203.33),
	(1,1,119,11912,'La Amistad',76.29),
	(1,1,120,12001,'San Pablo',20.76),
	(1,1,120,12002,'San Andrés',16.1),
	(1,1,120,12003,'Llano Bonito',34.1),
	(1,1,120,12004,'San Isidro',19.02),
	(1,1,120,12005,'Santa Cruz',21.78),
	(1,1,120,12006,'San Antonio',10.14),
	(1,2,201,20101,'Alajuela',10.61),
	(1,2,201,20102,'San José',14.87),
	(1,2,201,20103,'Carrizal',16.22),
	(1,2,201,20104,'San Antonio',8.76),
	(1,2,201,20105,'Guácima',28.07),
	(1,2,201,20106,'San Isidro',34.69),
	(1,2,201,20107,'Sabanilla',43.18),
	(1,2,201,20108,'San Rafael',19.33),
	(1,2,201,20109,'Río Segundo',5.46),
	(1,2,201,20110,'Desamparados',12.95),
	(1,2,201,20111,'Turrucares',35.89),
	(1,2,201,20112,'Tambor',13.89),
	(1,2,201,20113,'Garita',33.9),
	(1,2,201,20114,'Sarapiquí',113.79),
	(1,2,202,20201,'San Ramón',1.28),
	(1,2,202,20202,'Santiago',61.06),
	(1,2,202,20203,'San Juan',5.12),
	(1,2,202,20204,'Piedades Norte',47.68),
	(1,2,202,20205,'Piedades Sur',115.63),
	(1,2,202,20206,'San Rafael',30.69),
	(1,2,202,20207,'San Isidro',8.69),
	(1,2,202,20208,'Ángeles',84.91),
	(1,2,202,20209,'Alfaro',17.84),
	(1,2,202,20210,'Volio',20.67),
	(1,2,202,20211,'Concepción',9.51),
	(1,2,202,20212,'Zapotal',67.13),
	(1,2,202,20213,'Peñas Blancas',246.8),
	(1,2,202,20214,'San Lorenzo',304.74),
	(1,2,203,20301,'Grecia',7.57),
	(1,2,203,20302,'San Isidro',16.83),
	(1,2,203,20303,'San José',12.41),
	(1,2,203,20304,'San Roque',26.95),
	(1,2,203,20305,'Tacares',24.9),
	(1,2,203,20307,'Puente de Piedra',23.03),
	(1,2,203,20308,'Bolivar',30.78),
	(1,2,204,20401,'San Mateo',64.89),
	(1,2,204,20402,'Desmonte',20.22),
	(1,2,204,20403,'Jesús María',18.66),
	(1,2,204,20404,'Labrador',21.26),
	(1,2,205,20501,'Atenas',9.76),
	(1,2,205,20502,'Jesús',18.11),
	(1,2,205,20503,'Mercedes',7.84),
	(1,2,205,20504,'San Isidro',14.39),
	(1,2,205,20505,'Concepción',21.91),
	(1,2,205,20506,'San José',13.47),
	(1,2,205,20507,'Santa Eulalia',14.56),
	(1,2,205,20508,'Escobal',26.28),
	(1,2,206,20601,'Naranjo',16.85),
	(1,2,206,20602,'San Miguel',15.59),
	(1,2,206,20603,'San José',20.9),
	(1,2,206,20604,'Cirrí Sur',32.11),
	(1,2,206,20605,'San Jerónimo',9.05),
	(1,2,206,20606,'San Juan',7.15),
	(1,2,206,20607,'El Rosario',17.15),
	(1,2,206,20608,'Palmitos',8.23),
	(1,2,207,20701,'Palmares',1.19),
	(1,2,207,20702,'Zaragoza',8.43),
	(1,2,207,20703,'Buenos Aires',6.84),
	(1,2,207,20704,'Santiago',7.96),
	(1,2,207,20705,'Candelaria',4.72),
	(1,2,207,20706,'Esquipulas',5.4),
	(1,2,207,20707,'La Granja',4.39),
	(1,2,208,20801,'San Pedro',13.58),
	(1,2,208,20802,'San Juan',16.38),
	(1,2,208,20803,'San Rafael',14.18),
	(1,2,208,20804,'Carrillos',10.13),
	(1,2,208,20805,'Sabana Redonda',20.21),
	(1,2,209,20901,'Orotina',21.56),
	(1,2,209,20902,'El Mastate',9.5),
	(1,2,209,20903,'Hacienda Vieja',16.91),
	(1,2,209,20904,'Coyolar',36.48),
	(1,2,209,20905,'La Ceiba',60.66),
	(1,2,210,21001,'Quesada',143.48),
	(1,2,210,21002,'Florencia',199.66),
	(1,2,210,21003,'Buenavista',25.97),
	(1,2,210,21004,'Aguas Zarcas',185.7),
	(1,2,210,21005,'Venecia',132.53),
	(1,2,210,21006,'Pital',379.27),
	(1,2,210,21007,'La Fortuna',229.59),
	(1,2,210,21008,'La Tigra',56.21),
	(1,2,210,21009,'La Palmera',100.36),
	(1,2,210,21010,'Venado',169.17),
	(1,2,210,21011,'Cutris',849.19),
	(1,2,210,21012,'Monterrey',220.59),
	(1,2,210,21013,'Pocosol',660.59),
	(1,2,211,21101,'Zarcero',11.83),
	(1,2,211,21102,'Laguna',23.28),
	(1,2,211,21103,'Tapesco',6.39),
	(1,2,211,21104,'Guadalupe',22.58),
	(1,2,211,21105,'Palmira',30.67),
	(1,2,211,21106,'Zapote',44.76),
	(1,2,211,21107,'Brisas',17.85),
	(1,2,212,21201,'Sarchí Norte',21.14),
	(1,2,212,21202,'Sarchí Sur',6.35),
	(1,2,212,21203,'Toro Amarillo',91.13),
	(1,2,212,21204,'San Pedro',10.87),
	(1,2,212,21205,'Rodríguez',7.28),
	(1,2,213,21301,'Upala',148.65),
	(1,2,213,21302,'Aguas Claras',408.54),
	(1,2,213,21303,'San José O Pizote',285.43),
	(1,2,213,21304,'Bijagua',186.8),
	(1,2,213,21305,'Delicias',98.52),
	(1,2,213,21306,'Dos Ríos',218.67),
	(1,2,213,21307,'Yolillal',139.62),
	(1,2,213,21308,'Canalete',106.45),
	(1,2,214,21401,'Los Chiles',503.61),
	(1,2,214,21402,'Caño Negro',301.27),
	(1,2,214,21403,'El Amparo',312.89),
	(1,2,214,21404,'San Jorge',214.95),
	(1,2,215,21501,'San Rafael',304),
	(1,2,215,21502,'Buenavista',150.86),
	(1,2,215,21503,'Cote',183.58),
	(1,2,215,21504,'Katira',114.4),
	(1,2,216,21601,'Río Cuarto',97.62),
	(1,2,216,21602,'Santa Rita',53.19),
	(1,2,216,21603,'Santa Isabel',104.09),
	(1,3,301,30101,'Oriental',2.04),
	(1,3,301,30102,'Occidental',2.01),
	(1,3,301,30103,'Carmen',4.33),
	(1,3,301,30104,'San Nicolás',29.23),
	(1,3,301,30105,'Aguacaliente o San Francisco',99.26),
	(1,3,301,30106,'Guadalupe o Arenilla',13.16),
	(1,3,301,30107,'Corralillo',32.69),
	(1,3,301,30108,'Tierra Blanca',12.8),
	(1,3,301,30109,'Dulce Nombre',33.64),
	(1,3,301,30110,'Llano Grande',30.35),
	(1,3,301,30111,'Quebradilla',19.15),
	(1,3,302,30201,'Paraíso',27.17),
	(1,3,302,30202,'Santiago',25.64),
	(1,3,302,30203,'Orosi',376.54),
	(1,3,302,30204,'Cachí',41.11),
	(1,3,302,30205,'Llanos de Santa Lucía',6.54),
	(1,3,303,30301,'Tres Ríos',2.28),
	(1,3,303,30302,'San Diego',8.08),
	(1,3,303,30303,'San Juan',3.95),
	(1,3,303,30304,'San Rafael',9.51),
	(1,3,303,30305,'Concepción',3.79),
	(1,3,303,30306,'Dulce Nombre',8.26),
	(1,3,303,30307,'San Ramón',3.47),
	(1,3,303,30308,'Río Azul',4.85),
	(1,3,304,30401,'Juan Viñas',43.37),
	(1,3,304,30402,'Tucurrique',33.5),
	(1,3,304,30403,'Pejibaye',173.2),
	(1,3,305,30501,'Turrialba',56.63),
	(1,3,305,30502,'La Suiza',160.93),
	(1,3,305,30503,'Peralta',9.69),
	(1,3,305,30504,'Santa Cruz',129.57),
	(1,3,305,30505,'Santa Teresita',60.14),
	(1,3,305,30506,'Pavones',42.05),
	(1,3,305,30507,'Tuis',39.2),
	(1,3,305,30508,'Tayutic',74.77),
	(1,3,305,30509,'Santa Rosa',18.62),
	(1,3,305,30510,'Tres Equis',36.95),
	(1,3,305,30511,'La Isabel',19.79),
	(1,3,305,30512,'Chirripó',940.9),
	(1,3,306,30601,'Pacayas',29.62),
	(1,3,306,30602,'Cervantes',15.18),
	(1,3,306,30603,'Capellades',34.39),
	(1,3,307,30701,'San Rafael',10.28),
	(1,3,307,30702,'Cot',14.86),
	(1,3,307,30703,'Potrero Cerrado',18.11),
	(1,3,307,30704,'Cipreses',9.37),
	(1,3,307,30705,'Santa Rosa',150.27),
	(1,3,308,30801,'El Tejar',6.12),
	(1,3,308,30802,'San Isidro',134.88),
	(1,3,308,30803,'Tobosi',20.06),
	(1,3,308,30804,'Patio de Agua',10.94),
	(1,4,401,40101,'Heredia',2.86),
	(1,4,401,40102,'Mercedes',4.15),
	(1,4,401,40103,'San Francisco',6.56),
	(1,4,401,40104,'Ulloa',11.38),
	(1,4,401,40105,'Varablanca',258.17),
	(1,4,402,40201,'Barva',0.84),
	(1,4,402,40202,'San Pedro',7.17),
	(1,4,402,40203,'San Pablo',6.83),
	(1,4,402,40204,'San Roque',1.28),
	(1,4,402,40205,'Santa Lucía',2.86),
	(1,4,402,40206,'San José de la Montaña',37.04),
	(1,4,403,40301,'Santo Domingo',0.78),
	(1,4,403,40302,'San Vicente',2.88),
	(1,4,403,40303,'San Miguel',5.9),
	(1,4,403,40304,'Paracito',1.27),
	(1,4,403,40305,'Santo Tomás',3.54),
	(1,4,403,40306,'Santa Rosa',4.27),
	(1,4,403,40307,'Tures',3.88),
	(1,4,403,40308,'Pará',2.87),
	(1,4,404,40401,'Santa Bárbara',1.28),
	(1,4,404,40402,'San Pedro',2.56),
	(1,4,404,40403,'San Juan',4.48),
	(1,4,404,40404,'Jesús',11.15),
	(1,4,404,40405,'Santo Domingo',26.49),
	(1,4,404,40406,'Purabá',6.14),
	(1,4,405,40501,'San Rafael',1.33),
	(1,4,405,40502,'San Josecito',1.35),
	(1,4,405,40503,'Santiago',1.57),
	(1,4,405,40504,'Ángeles',21.24),
	(1,4,405,40505,'Concepción',22.81),
	(1,4,406,40601,'San Isidro',2.67),
	(1,4,406,40602,'San José',11.37),
	(1,4,406,40603,'Concepción',8.07),
	(1,4,406,40604,'San Francisco',4.56),
	(1,4,407,40701,'San Antonio',3.56),
	(1,4,407,40702,'La Ribera',4.26),
	(1,4,407,40703,'La Asunción',4.57),
	(1,4,408,40801,'San Joaquín',2.75),
	(1,4,408,40802,'Barrantes',2.14),
	(1,4,408,40803,'Llorente',1.86),
	(1,4,409,40901,'San Pablo',5.93),
	(1,4,409,40902,'Rincón de Sabanilla',2.41),
	(1,4,410,41001,'Puerto Viejo',428.52),
	(1,4,410,41002,'La Virgen',514.19),
	(1,4,410,41003,'Las Horquetas',564.59),
	(1,4,410,41004,'Llanuras del Gaspar',267.34),
	(1,4,410,41005,'Cureña',369.73),
	(1,5,501,50101,'Liberia',563.02),
	(1,5,501,50102,'Cañas Dulces',243.41),
	(1,5,501,50103,'Mayorga',227.51),
	(1,5,501,50104,'Nacascolo',326.91),
	(1,5,501,50105,'Curubandé',81.32),
	(1,5,502,50201,'Nicoya',310.66),
	(1,5,502,50202,'Mansión',212.15),
	(1,5,502,50203,'San Antonio',339.5),
	(1,5,502,50204,'Quebrada Honda',109.17),
	(1,5,502,50205,'Sámara',109.36),
	(1,5,502,50206,'Nosara',133.65),
	(1,5,502,50207,'Belén de Nosarita',123.07),
	(1,5,503,50301,'Santa Cruz',288.92),
	(1,5,503,50302,'Bolsón',32.28),
	(1,5,503,50303,'Veintisiete de Abril',303),
	(1,5,503,50304,'Tempate',139.69),
	(1,5,503,50305,'Cartagena',72.9),
	(1,5,503,50306,'Cuajiniquil',218),
	(1,5,503,50307,'Diriá',66.22),
	(1,5,503,50308,'Cabo Velas',73.7),
	(1,5,503,50309,'Tamarindo',126.09),
	(1,5,504,50401,'Bagaces',889.07),
	(1,5,504,50402,'La Fortuna',163.47),
	(1,5,504,50403,'Mogote',181.77),
	(1,5,504,50404,'Río Naranjo',43.62),
	(1,5,505,50501,'Filadelfia',125.24),
	(1,5,505,50502,'Palmira',31.46),
	(1,5,505,50503,'Sardinal',260.17),
	(1,5,505,50504,'Belén',182.14),
	(1,5,506,50601,'Cañas',193.09),
	(1,5,506,50602,'Palmira',204.03),
	(1,5,506,50603,'San Miguel',120.95),
	(1,5,506,50604,'Bebedero',58.06),
	(1,5,506,50605,'Porozal',110.91),
	(1,5,507,50701,'Las Juntas',228.71),
	(1,5,507,50702,'Sierra',112),
	(1,5,507,50703,'San Juan',107.47),
	(1,5,507,50704,'Colorado',197.84),
	(1,5,508,50801,'Tilarán',144.75),
	(1,5,508,50802,'Quebrada Grande',34.45),
	(1,5,508,50803,'Tronadora',139.93),
	(1,5,508,50804,'Santa Rosa',71.06),
	(1,5,508,50805,'Líbano',72.13),
	(1,5,508,50806,'Tierras Morenas',83.32),
	(1,5,508,50807,'Arenal',72.67),
	(1,5,508,50808,'Cabeceras',50.93),
	(1,5,509,50901,'Carmona',31.66),
	(1,5,509,50902,'Santa Rita',51.38),
	(1,5,509,50903,'Zapotal',105.08),
	(1,5,509,50904,'San Pablo',78.08),
	(1,5,509,50905,'Porvenir',40.15),
	(1,5,509,50906,'Bejuco',261.78),
	(1,5,510,51001,'La Cruz',344.39),
	(1,5,510,51002,'Santa Cecilia',258.01),
	(1,5,510,51003,'La Garita',273.39),
	(1,5,510,51004,'Santa Elena',509.59),
	(1,5,511,51101,'Hojancha',70.4),
	(1,5,511,51102,'Monte Romo',75.27),
	(1,5,511,51103,'Puerto Carrillo',76.87),
	(1,5,511,51104,'Huacas',31.74),
	(1,5,511,51105,'Matambú',8.71),
	(1,6,601,60101,'Puntarenas',34.03),
	(1,6,601,60102,'Pitahaya',109.55),
	(1,6,601,60103,'Chomes',118.95),
	(1,6,601,60104,'Lepanto',424.31),
	(1,6,601,60105,'Paquera',335.63),
	(1,6,601,60106,'Manzanillo',59.86),
	(1,6,601,60107,'Guacimal',114.94),
	(1,6,601,60108,'Barranca',36.21),
	(1,6,601,60109,'Monte Verde',53.47),
	(1,6,601,60110,'Isla del Coco',23.52),
	(1,6,601,60111,'Cóbano',319.27),
	(1,6,601,60112,'Chacarita',4.92),
	(1,6,601,60113,'Chira',42.02),
	(1,6,601,60114,'Acapulco',110.91),
	(1,6,601,60115,'El Roble',7.93),
	(1,6,601,60116,'Arancibia',44.86),
	(1,6,602,60201,'Espíritu Santo',18.91),
	(1,6,602,60202,'San Juan Grande',18.71),
	(1,6,602,60203,'Macacona',34.13),
	(1,6,602,60204,'San Rafael',34.32),
	(1,6,602,60205,'San Jerónimo',49.14),
	(1,6,602,60206,'Caldera',62.02),
	(1,6,603,60301,'Buenos Aires',554.83),
	(1,6,603,60302,'Volcán',187.41),
	(1,6,603,60303,'Potrero Grande',626.7),
	(1,6,603,60304,'Boruca',125.79),
	(1,6,603,60305,'Pilas',114.34),
	(1,6,603,60306,'Colinas',128.8),
	(1,6,603,60307,'Chánguena',273.04),
	(1,6,603,60308,'Biolley',208.27),
	(1,6,603,60309,'Brunka',163.77),
	(1,6,604,60401,'Miramar',110.96),
	(1,6,604,60402,'La Unión',78.93),
	(1,6,604,60403,'San Isidro',57.71),
	(1,6,605,60501,'Puerto Cortés',234.39),
	(1,6,605,60502,'Palmar',250.8),
	(1,6,605,60503,'Sierpe',634.18),
	(1,6,605,60504,'Bahía Ballena',158.33),
	(1,6,605,60505,'Piedras Blancas',262.58),
	(1,6,605,60506,'Bahía Drake',391.74),
	(1,6,606,60601,'Quepos',236.05),
	(1,6,606,60602,'Savegre',216.47),
	(1,6,606,60603,'Naranjito',105.33),
	(1,6,607,60701,'Golfito',355.9),
	(1,6,607,60702,'Puerto Jiménez',721.1),
	(1,6,607,60703,'Guaycará',323.1),
	(1,6,607,60704,'Pavón',353.32),
	(1,6,608,60801,'San Vito',74.59),
	(1,6,608,60802,'Sabalito',186.86),
	(1,6,608,60803,'Aguabuena',63.89),
	(1,6,608,60804,'Limoncito',123.64),
	(1,6,608,60805,'Pittier',257.05),
	(1,6,608,60806,'Gutiérrez Braun',238.19),
	(1,6,609,60901,'Parrita',483.22),
	(1,6,610,61001,'Corredor',275.67),
	(1,6,610,61002,'La Cuesta',37.08),
	(1,6,610,61003,'Canoas',122.02),
	(1,6,610,61004,'Laurel',188.85),
	(1,6,611,61101,'Jacó',141.37),
	(1,6,611,61102,'Tárcoles',174.64),
	(1,7,701,70101,'Limón',59.18),
	(1,7,701,70102,'Valle La Estrella',1238.42),
	(1,7,701,70103,'Río Blanco',131.31),
	(1,7,701,70104,'Matama',340.47),
	(1,7,702,70201,'Guápiles',221.74),
	(1,7,702,70202,'Jiménez',108.23),
	(1,7,702,70203,'Rita',503.74),
	(1,7,702,70204,'Roxana',176.79),
	(1,7,702,70205,'Cariari',201.03),
	(1,7,702,70206,'Colorado',1158.44),
	(1,7,702,70207,'La Colonia',38.79),
	(1,7,703,70301,'Siquirres',184.21),
	(1,7,703,70302,'Pacuarito',220.02),
	(1,7,703,70303,'Florida',81.93),
	(1,7,703,70304,'Germania',33.96),
	(1,7,703,70305,'El Cairo',106.96),
	(1,7,703,70306,'Alegría',38.05),
	(1,7,703,70307,'Reventazón',190.01),
	(1,7,704,70401,'Bratsi',180.85),
	(1,7,704,70402,'Sixaola',169.01),
	(1,7,704,70403,'Cahuita',234.07),
	(1,7,704,70404,'Telire',2208.3),
	(1,7,705,70501,'Matina',351.45),
	(1,7,705,70502,'Batán',213.41),
	(1,7,705,70503,'Carrandí',205.54),
	(1,7,706,70601,'Guácimo',223.79),
	(1,7,706,70602,'Mercedes',90.06),
	(1,7,706,70603,'Pocora',72.88),
	(1,7,706,70604,'Río Jiménez',113.2),
	(1,7,706,70605,'Duacarí',81.12);

	
	/* INCISO #2 COMANDO PARA DEVOLVER CODIGO PROVINCIA Y CODIGO CANTÓN*/
	SELECT Proyecto2.GEO_PROVINCIA.COD_PROVINCIA,Proyecto2.GEO_CANTON.COD_CANTON
		FROM Proyecto2.GEO_PROVINCIA INNER JOIN Proyecto2.GEO_CANTON ON Proyecto2.GEO_CANTON.COD_PROVINCIA = Proyecto2.GEO_PROVINCIA.COD_PROVINCIA
		WHERE Proyecto2.GEO_PROVINCIA.NOMBRE_PRO = 'San Jose' and Proyecto2.GEO_CANTON.NOMBRE_CAN = 'León Cortés Castro';

	/*INCISO #3 COMANDO PARA DEVOLVER EL ÁREA DE UN CANTÓN*/
	SELECT SUM (AREA) as AreaKM_Canton
		FROM Proyecto2.GEO_DISTRITO INNER JOIN Proyecto2.GEO_CANTON ON Proyecto2.GEO_DISTRITO.COD_CANTON = Proyecto2.GEO_CANTON.COD_CANTON
		INNER JOIN Proyecto2.GEO_PROVINCIA ON Proyecto2.GEO_CANTON.COD_PROVINCIA = Proyecto2.GEO_PROVINCIA.COD_PROVINCIA 
		WHERE Proyecto2.GEO_PROVINCIA.NOMBRE_PRO = 'Guanacaste' and Proyecto2.GEO_CANTON.NOMBRE_CAN = 'Hojancha';

	/*INCISO #4 COMANDO PARA ELIMINAR LOS DISTRITOS DEL CANTÓN INDICADO*/
	DELETE Proyecto2.GEO_DISTRITO
		FROM Proyecto2.GEO_DISTRITO INNER JOIN Proyecto2.GEO_CANTON ON Proyecto2.GEO_DISTRITO.COD_CANTON = Proyecto2.GEO_CANTON.COD_CANTON
		WHERE Proyecto2.GEO_CANTON.NOMBRE_CAN = 'San Pablo';

	/*INCISO #5 COMANDO PARA REDONDEAR EL ÁREA DE LOS DISTRITOS DE LA PROVINCIA Y CANTÓN INDICADO*/
	SELECT proyecto2.GEO_DISTRITO.AREA, FORMAT(GEO_DISTRITO.AREA,N'00.00') as Area_conFormato
		FROM Proyecto2.GEO_DISTRITO INNER JOIN Proyecto2.GEO_CANTON ON Proyecto2.GEO_DISTRITO.COD_CANTON = Proyecto2.GEO_CANTON.COD_CANTON
		INNER JOIN Proyecto2.GEO_PROVINCIA ON Proyecto2.GEO_CANTON.COD_PROVINCIA = Proyecto2.GEO_PROVINCIA.COD_PROVINCIA 
		WHERE Proyecto2.GEO_PROVINCIA.NOMBRE_PRO = 'Alajuela' and Proyecto2.GEO_CANTON.NOMBRE_CAN = 'Palmares';

COMMIT TRAN;