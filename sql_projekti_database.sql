-- sql projektin tietokanta


/* droppaa taulut jos on tarve

drop table if exists tuote_omistaja;
drop table if exists lainattu;
drop table if exists asiakas;
drop table if exists tuote;
drop table if exists omistaja;
drop table if exists valmistaja;
*/


-- luodaan taulu omistaja
create table Omistaja (
	omistajaID int not null,
	etunimi varchar(60) not null,
	sukunimi varchar(60) not null,
	puh varchar(30),
	email varchar(60),
	
	primary key (omistajaID)
	);
	
insert into omistaja values 
(1, 'Maija', 'Myyrä', '040-123123', 'mm@hmeil.fi'),
(2, 'Hannu', 'Hanhi', '050-12121212', null),
(3, 'Alli', 'Apina', '098098098', 'alli@alli.fi'),
(4, 'Bella', 'Bambi', '+385 12 23 45', 'bb@umail.com'),
(5, 'Repe', 'Sorsa', '09-121314', 'repe@juu.com');

 
-- luodaan taulu valmistaja
create table valmistaja	(
	valmistajaID int Not null,
	nimi varchar(60) not null,
	
	primary key (valmistajaID)
	);
	
insert into valmistaja values
(1, 'Versace'),
(2, 'Gucci'),
(3, 'Adidas'),
(4, 'Calvin Klein'),
(5, 'Ivana Helsinki'),
(6, 'Marimekko'),
(7, 'Alexander McQueen'),
(8, 'BOSS'),
(9, 'Burberry'),
(10, 'Desigual');
	
    
-- luodaan taulu asiakas
create table asiakas (
	asiakasID int not null,
	etunimi varchar(60) not null,
	sukunimi varchar(60) not null,
	puh varchar(30),
	email varchar(60),
	
	primary key (asiakasID)
	);

insert into asiakas values 
(1, 'Elli', 'Etana', '040-676767', 'ee@hmeil.fi'),
(2, 'Noora', 'Norsu', '050-145454545', 'nooran@hotmail.com'),
(3, 'Titi', 'Tyy', '08121314', 'titityy@hmail.com'),
(4, 'Nipa', 'Näätä', '+385 65 67 67', 'nn@umail.com'),
(5, 'Harry', 'Hylje', '05012345678', 'harry@juu.com'),
(6, 'Ippu', 'Pötökkä', '040-2344567', 'ippu@hmeil.fi'),
(7, 'Mauri', 'Mäyrä', '050-456363', 'maumau@hotmail.com'),
(8, 'Tali', 'Tintti', '050989898', 'tintti@hmail.com'),
(9, 'Janne', 'Jaguraari', '+385 45 45 45', 'jagge@umail.com'),
(10, 'Pekka', 'Poro', '0605757575', 'pporo@juu.com');
	
	
-- create table Tuote
create table Tuote (
	tuoteID int not null,
	omistajaID int not null,
	valmistajaID int not null,
	vaatelaji varchar(30) not null,
	hinta decimal(5,2),
	koko varchar(10),
	
	primary key (tuoteID),
	foreign key (omistajaID) references omistaja(omistajaID),
	foreign key (valmistajaID) references valmistaja(valmistajaID)
	);

insert into tuote values
(1, 1, 1, 'iltapuku', '112.00', 's'),
(2, 5, 3, 'takki', '30.00', 'm'),
(3, 5, 2, 'mekko', '50.00', '38'),
(4, 2, 4, 'farkut', '20.00', 'L'),
(5, 3, 5, 'paita', '35.00', 's'),
(6, 3, 7, 'mekko', '90.00', '36'),
(7, 5, 8, 'housut', '30.00', 'M'),
(8, 4, 9, 'takki', '80.00', 'xs'),
(9, 4, 10, 'paita', '32.00', 'XL'),
(10, 5, 6, 'paita', '15.00', '38'),
(11, 1, 6, 'takki', '40.00', '38'),
(12, 2, 7, 'iltapuku', '130.00', '42'),
(13, 2, 4, 'takki', '60.00', 'S'),
(14, 3, 5, 'hame', '30.00', '36'),
(15, 4, 8, 'hame', '40.00', '40');

-- luodaan taulu lainattu
create table lainattu (
	lainaID int not null,
	asiakasID int not null,
	tuoteID int not null,
	lainaPVM date not null,
    palautusPVM date,
    
	 
	 primary key (lainaID),
	 foreign key (asiakasID) references asiakas(asiakasID),
	 foreign key (tuoteID) references tuote(tuoteID)
	 );
	
insert into lainattu values
(1, 3, 5, '2021-02-02', '2021-02-09'),
(2, 5, 15, '2020-10-10', '2020-10-17'),
(3, 1, 6, '2020-09-02', '2020-09-09'),
(4, 10, 9, '2020-07-07', '2020-07-07'),
(5, 9, 3, '2020-10-11', '2020-10-16'),
(6, 9, 3, '2020-12-02', '2020-12-20'),
(7, 4, 8, '2020-05-02', '2020-05-09'),
(8, 6, 5, '2021-12-02', '2021-12-07'),
(9, 7, 6, '2020-12-02', '2020-12-09'),
(10, 2, 7, '2020-12-02', '2020-12-10'),
(11, 8, 1, '2019-12-02', '2019-12-08'),
(12, 9, 10, '2019-04-11', '2019-04-18'),
(13, 1, 2, '2020-12-02', null),
(14, 10, 12, '2021-02-08', '2021-02-15');




	


