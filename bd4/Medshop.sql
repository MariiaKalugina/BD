create database 'D:\BD\l4\Medshop.fdb' user 'SYSDBA' password 'masterkey';
commit;
connect 'D:\BD\l4\Medshop.fdb' user 'SYSDBA' password 'masterkey';
commit;

create table Medd(
	ID_Med int primary key,
	Name varchar(30),
	Prescription int,
	Weight int);
	
create table Consigment(
	ID_cons int primary key,
	Provider varchar(50),
	Site varchar(30));
	
create table Delivery(
	ID_cons int primary key,
	ID_prov int,
	ID_med int,
	Shelf_life date);
	
create table Clients(
	ID_client int primary key,
	Discount int,
	Name varchar(20));
	
create table Orders(
	ID_order int primary key,
	ID_client int,
	Summ int,
	Date_ofo date);
create table Ord_med(
	ID_ord_med int primary key,
	ID_ord int,
	ID_med int,
	Quantity int);
create table Appointment(
	ID_appoint int primary key,
	Name varchar(50));
create table Appoint_med(
	ID_app_med int primary key,
	ID_appoint int,
	ID_med int);
create table Side_effects(
	ID_effect int primary key,
	Name varchar(40));
create table Eff_med(
	ID_eff_med int primary key,
	ID_eff int,
	ID_med int,
	Risk int);
create table Constraindications(
	ID_const int primary key,
	Name varchar(40));
create table Const_med(
	ID_const_med int primary key,
	ID_const int,
	ID_med int);
commit;

alter table Delivery ADD constraint Del_Cons foreign key (ID_prov) references Consigment (ID_cons);
alter table Delivery ADD constraint Del_Med foreign key (ID_med) references Medd (ID_med);
alter table Orders ADD constraint Ord_Cli foreign key (ID_client) references Clients (ID_client);
alter table Ord_med ADD constraint Ord_med_Ord foreign key (ID_ord) references Orders (ID_order);
alter table Ord_med ADD constraint Ord_med_Med foreign key (ID_med) references Medd (ID_med);
alter table Appoint_med ADD constraint App_med_App foreign key (ID_appoint) references Appointment (ID_appoint);
alter table Appoint_med ADD constraint App_med_Med foreign key (ID_med) references Medd (ID_med);
alter table Eff_med ADD constraint Eff_med_Side foreign key (ID_eff) references Side_effects (ID_effect);
alter table Eff_med ADD constraint Eff_med_Med foreign key (ID_med) references Medd (ID_med);
alter table Const_med ADD constraint Const_med_Const foreign key (ID_const) references Constraindications (ID_const);
alter table Const_med ADD constraint Const_med_Med foreign key (ID_med) references Medd (ID_med);

--show tables;

commit;

insert into Medd values (1,'Regaine',0,60);
insert into Medd values (2,'Lacipil',1,40);
insert into Medd values (3,'Aevit',0,10);
insert into Medd values (4,'Aqua Maris',0,30);
insert into Medd values (5,'Baneocin',0,10);
insert into Medd values (6,'Berocca',0,80);
insert into Medd values (7,'Vibrocil',0,15);
insert into Medd values (8,'Vitrum',0,120);
insert into Medd values (9,'Hexoral',0,40);
insert into Medd values (10,'Hydrocortisone',1,1000);
insert into Medd values (11,'Dimedrol',0,500);
insert into Medd values (12,'Ibuprofen',0,20);
insert into Medd values (13,'Kagocel',0,12);
insert into Medd values (14,'Coldrex',0,50);
insert into Medd values (15,'Nasivin',0,10);

insert into Consigment values (1,'GlaxoSmithKline Pharmaceuticals','ru.gsk.com');
insert into Consigment values (2,'Lumi','www.lumi.spb.ru');
insert into Consigment values (3,'Jadran Galenski Laboratorij','www.jadran.ru');
insert into Consigment values (4,'Sandoz','www.sandoz.ru');
insert into Consigment values (5,'Bayer Sante Familiale','www.bayer.fr');
insert into Consigment values (6,'Novartis Consumer Health','www.novartis.ru');
insert into Consigment values (7,'Unipharm','www.unipharm.ru');
insert into Consigment values (8,'Farmak','farmak.ua');
insert into Consigment values (9,'Dalchimfarm','dhf.khv.ru');
insert into Consigment values (10,'Johnson & Johnson','www.jnj.ru');
insert into Consigment values (11,'Sintez','www.kurgansintez.ru');
insert into Consigment values (12,'Nearmedic','www.nearmedic.ru');
insert into Consigment values (13,'Merck Selbstmedikation GmbH','www.merckselbstmedikation.de');

insert into Delivery values (1,10,1,'01.05.2018');
insert into Delivery values (2,1,2,'01.06.2018');
insert into Delivery values (3,2,3,'01.09.2017');
insert into Delivery values (4,3,4,'01.10.2017');
insert into Delivery values (5,4,5,'01.06.2018');
insert into Delivery values (6,5,6,'01.04.2018');
insert into Delivery values (7,6,7,'31.08.2017');
insert into Delivery values (8,7,8,'01.10.2020');
insert into Delivery values (9,10,9,'31.12.2017');
insert into Delivery values (10,8,10,'01.04.2019');
insert into Delivery values (11,9,11,'03.07.2018');
insert into Delivery values (12,11,12,'01.01.2018');
insert into Delivery values (13,12,13,'01.05.2018');
insert into Delivery values (14,1,14,'01.05.2018');
insert into Delivery values (15,13,15,'01.07.2019');

insert into Clients values (1,5,'Veris');
insert into Clients values (2,7,'Goremykina');
insert into Clients values (3,7,'Smirnov');
insert into Clients values (4,10,'Kalugina');
insert into Clients values (5,12,'Drozdovskii');
insert into Clients values (6,12,'Grigoriev');
insert into Clients values (7,12,'Zhemelev');
insert into Clients values (8,12,'Nagornov');
insert into Clients values (9,15,'Puzanov');
insert into Clients values (10,15,'Kirillov');
insert into Clients values (11,15,'Krichevski');
insert into Clients values (12,15,'Evseev');
insert into Clients values (14,15,'Malishev');


insert into Orders values (1,1,0,'02.12.2016');
insert into Orders values (2,3,4206,'02.12.2016');
insert into Orders values (3,5,15,'02.12.2016');
insert into Orders values (4,2,150,'02.12.2016');
insert into Orders values (5,3,337,'02.12.2016');
insert into Orders values (6,1,110,'02.12.2016');
insert into Orders values (7,8,110,'02.12.2016');
insert into Orders values (8,4,110,'02.12.2016');
insert into Orders values (9,9,110,'05.12.2016');
insert into Orders values (10,7,110,'02.12.2016');
insert into Orders values (11,10,110,'02.12.2016');
insert into Orders values (12,11,110,'02.12.2016');
insert into Orders values (13,12,110,'02.12.2016');

insert into Ord_med values (1,6,6,2);
insert into Ord_med values (2,2,1,3);
insert into Ord_med values (3,4,10,2);
insert into Ord_med values (4,6,3,3);
insert into Ord_med values (5,3,12,1);
insert into Ord_med values (6,10,2,5);
insert into Ord_med values (7,1,2,3);
insert into Ord_med values (8,5,2,4);
insert into Ord_med values (9,8,2,2);
insert into Ord_med values (10,9,2,1);
insert into Ord_med values (11,11,2,3);
insert into Ord_med values (12,4,10,3);
insert into Ord_med values (13,13,10,12);
insert into Ord_med values (14,1,2,30);
insert into Ord_med values (15,13,10,4);

insert into Appointment values (1,'Baldness');
insert into Appointment values (2,'Hypertension');
insert into Appointment values (3,'Arteriosclerosis');
insert into Appointment values (4,'Diseases of nasal cavity');
insert into Appointment values (5,'Adenoiditis');
insert into Appointment values (6,'Skin Infections');
insert into Appointment values (7,'Vitamin deficiency');
insert into Appointment values (8,'Rhinitis');
insert into Appointment values (9,'Sinusitis');
insert into Appointment values (10,'Angina');
insert into Appointment values (11,'Pharyngitis');
insert into Appointment values (12,'Inflammation');
insert into Appointment values (13,'Allergy');
insert into Appointment values (14,'Rheumatoid arthritis');
insert into Appointment values (15,'Radiculitis');
insert into Appointment values (16,'Flu');
insert into Appointment values (17,'Fever heat');
insert into Appointment values (18,'Seasikness');

insert into Appoint_med values (1,1,1);
insert into Appoint_med values (2,2,2);
insert into Appoint_med values (3,3,3);
insert into Appoint_med values (4,4,3);
insert into Appoint_med values (5,5,4);
insert into Appoint_med values (6,6,5);
insert into Appoint_med values (7,7,6);
insert into Appoint_med values (8,8,7);
insert into Appoint_med values (9,9,7);
insert into Appoint_med values (10,7,8);
insert into Appoint_med values (11,10,9);
insert into Appoint_med values (12,11,9);
insert into Appoint_med values (13,12,10);
insert into Appoint_med values (14,13,10);
insert into Appoint_med values (15,13,11);
insert into Appoint_med values (16,18,11);
insert into Appoint_med values (17,14,12);
insert into Appoint_med values (18,15,12);
insert into Appoint_med values (19,16,13);
insert into Appoint_med values (20,16,14);
insert into Appoint_med values (21,17,14);
insert into Appoint_med values (22,8,15);
insert into Appoint_med values (23,9,15);

insert into Constraindications values (1,'Myocardial infarction');
insert into Constraindications values (2,'Abnormal liver function');
insert into Constraindications values (3,'Thyrotoxicosis');
insert into Constraindications values (4,'Pregnancy');
insert into Constraindications values (5,'Extensive skin lesions');
insert into Constraindications values (6,'Atrophic rhinitis');
insert into Constraindications values (7,'Hypersensitivity');
insert into Constraindications values (8,'Systemic mycoses');
insert into Constraindications values (9,'Ulcerative colitis');
insert into Constraindications values (10,'Lactation');
insert into Constraindications values (11,'No');

insert into Const_med values (1,11,1);
insert into Const_med values (2,1,2);
insert into Const_med values (3,2,2);
insert into Const_med values (4,3,3);
insert into Const_med values (5,4,3);
insert into Const_med values (6,11,4);
insert into Const_med values (7,5,5);
insert into Const_med values (8,2,5);
insert into Const_med values (9,11,6);
insert into Const_med values (10,6,7);
insert into Const_med values (11,7,8);
insert into Const_med values (12,11,9);
insert into Const_med values (13,7,10);
insert into Const_med values (14,8,10);
insert into Const_med values (15,4,10);
insert into Const_med values (16,10,10);
insert into Const_med values (18,7,11);
insert into Const_med values (19,7,12);
insert into Const_med values (20,9,12);
insert into Const_med values (21,2,12);
insert into Const_med values (23,4,13);
insert into Const_med values (24,10,13);
insert into Const_med values (25,7,14);
insert into Const_med values (26,11,15);

insert into Side_effects values (1,'Headache');
insert into Side_effects values (2,'Dizziness');
insert into Side_effects values (3,'Nausea');
insert into Side_effects values (4,'Allergic reactions');
insert into Side_effects values (5,'Drowsiness');
insert into Side_effects values (6,'Weakness');
insert into Side_effects values (7,'Anorexia');
insert into Side_effects values (8,'Flatulence');
insert into Side_effects values (9,'Sneezing');
insert into Side_effects values (10,'No');

insert into Eff_med values (1,10,1,0);
insert into Eff_med values (2,1,2,75);
insert into Eff_med values (3,2,2,75);
insert into Eff_med values (4,3,2,25);
insert into Eff_med values (5,10,3,0);
insert into Eff_med values (6,10,4,0);
insert into Eff_med values (7,4,5,25);
insert into Eff_med values (8,10,5,0);
insert into Eff_med values (9,10,6,0);
insert into Eff_med values (10,10,7,0);
insert into Eff_med values (11,4,8,50);
insert into Eff_med values (12,10,9,0);
insert into Eff_med values (13,10,10,0);
insert into Eff_med values (14,5,11,75);
insert into Eff_med values (15,2,11,75);
insert into Eff_med values (16,3,11,75);
insert into Eff_med values (17,6,11,75);
insert into Eff_med values (18,1,11,75);
insert into Eff_med values (19,3,12,75);
insert into Eff_med values (20,7,12,75);
insert into Eff_med values (21,8,12,75);
insert into Eff_med values (22,2,12,75);
insert into Eff_med values (23,1,12,75);
insert into Eff_med values (24,4,12,75);
insert into Eff_med values (25,4,13,50);
insert into Eff_med values (26,4,14,75);
insert into Eff_med values (27,9,15,50);
insert into Eff_med values (28,5,15,25);
insert into Eff_med values (29,1,15,25);
insert into Eff_med values (30,3,15,25);

--commit;

--select * from Medd;
--select * from Consigment;
--select * from Delivery;
--select * from Clients;
--select * from Orders;
--select * from Ord_med;
--select * from Appointment;
--select * from Appoint_med;
--select * from Constraindications;
--select * from Const_med;
--select * from Side_effects;
--select * from Eff_med;

--commit;

create table Category(
	ID_cat int primary key,
	Name varchar(30));
	
create table Pre_Category(
	ID_precat int primary key,
	Name varchar(50));
	
create table Cat_pre(
	ID_catpre int primary key,
	ID_cat int,
	ID_precat int);
	
create table Cat_app(
	ID_cat_app int primary key,
	ID_precat int,
	ID_appoint int);
	
commit;

alter table Cat_pre ADD constraint Cat_pre_Cat foreign key (ID_cat) references Category (ID_cat);
alter table Cat_pre ADD constraint Cat_pre_Pre_cat foreign key (ID_precat) references Pre_Category (ID_precat);
alter table Cat_app ADD constraint Cat_app_Cat_pre foreign key (ID_precat) references Cat_pre (ID_catpre);
alter table Cat_app ADD constraint Cat_app_App foreign key (ID_appoint) references Appointment (ID_appoint);

commit;

insert into Category values (1,'Neurology');
insert into Category values (2,'Cardiology');
insert into Category values (3,'Otorhinolaryngology');
insert into Category values (4,'Dermatology');
insert into Category values (5,'Vitamins');
insert into Category values (6,'Immunology');
insert into Category values (7,'Rheumatology');
insert into Category values (8,'SARS');

insert into Pre_Category values (1,'Hematopathy');
insert into Pre_Category values (2,'Circulatory system');
insert into Pre_Category values (3,'Heart disease');
insert into Pre_Category values (4,'Diseases of the ear');
insert into Pre_Category values (5,'Respiratory diseases');
insert into Pre_Category values (6,'Infection');
insert into Pre_Category values (7,'Skin diseases');
insert into Pre_Category values (8,'Avitaminosis');
insert into Pre_Category values (9,'Supervitaminosis');
insert into Pre_Category values (10,'Maintaining immunity');
insert into Pre_Category values (11,'Restoring immunity');
insert into Pre_Category values (12,'Connective tissue disorders');
insert into Pre_Category values (13,'Arthrosis');
insert into Pre_Category values (14,'Arthropathy');
insert into Pre_Category values (15,'Flu');
insert into Pre_Category values (16,'Pneumonia');
insert into Pre_Category values (17,'Temporary disorders of the nervous system');
insert into Pre_Category values (18,'Meningitis');

insert into Cat_pre values (1,1,17);
insert into Cat_pre values (2,1,18);
insert into Cat_pre values (3,2,1);
insert into Cat_pre values (4,2,2);
insert into Cat_pre values (5,2,3);
insert into Cat_pre values (6,3,4);
insert into Cat_pre values (7,3,5);
insert into Cat_pre values (8,4,6);
insert into Cat_pre values (9,4,7);
insert into Cat_pre values (10,5,8);
insert into Cat_pre values (11,5,9);
insert into Cat_pre values (12,6,10);
insert into Cat_pre values (13,6,11);
insert into Cat_pre values (14,7,12);
insert into Cat_pre values (15,7,13);
insert into Cat_pre values (16,7,14);
insert into Cat_pre values (17,8,15);
insert into Cat_pre values (18,8,16);

insert into Cat_app values (1,1,1);
insert into Cat_app values (2,4,2);
insert into Cat_app values (3,4,3);
insert into Cat_app values (4,7,4);
insert into Cat_app values (5,7,5);
insert into Cat_app values (6,9,6);
insert into Cat_app values (7,3,7);

/* commit;

select * from Category;
select * from Pre_Category;
select * from Cat_pre;
select * from Cat_app; */

commit;

create table Analog(
	ID_an_med int primary key,
	ID_med int,
	ID_analog int);

commit;

alter table Analog ADD constraint An_Med1 foreign key (ID_med) references Medd (ID_med);
alter table Analog ADD constraint An_Med2 foreign key (ID_analog) references Medd (ID_med);

commit;

insert into Analog values (1,1,7);
insert into Analog values (2,2,8);
insert into Analog values (3,3,9);
insert into Analog values (4,4,10);
insert into Analog values (5,5,11);
insert into Analog values (6,6,12);
insert into Analog values (7,7,1);
insert into Analog values (8,8,2);
insert into Analog values (9,9,3);
insert into Analog values (10,10,4);
insert into Analog values (11,11,5);
insert into Analog values (12,12,6);
insert into Analog values (13,13,7);
insert into Analog values (14,14,3);
insert into Analog values (15,15,2);

commit;

--select * from Analog;