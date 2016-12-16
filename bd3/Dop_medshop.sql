connect 'D:\BD\Medshop.fdb' user 'SYSDBA' password 'masterkey';
commit;

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

commit;

select * from Category;
select * from Pre_Category;
select * from Cat_pre;
select * from Cat_app;