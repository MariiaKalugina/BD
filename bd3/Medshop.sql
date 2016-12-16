create database 'D:\BD\Medshop.fdb' user 'SYSDBA' password 'masterkey';
commit;
connect 'D:\BD\Medshop.fdb' user 'SYSDBA' password 'masterkey';
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
	Summ int);
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

show tables;