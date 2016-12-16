connect 'D:\BD\Medshop.fdb' user 'SYSDBA' password 'masterkey';
commit;

create table Category(
	ID_cat int primary key,
	Name varchar(30));
create table Cat_app(
	ID_cat_app int primary key,
	ID_cat int,
	ID_appoint int);
commit;

alter table Cat_app ADD constraint Cat_app_Cat foreign key (ID_cat) references Category (ID_cat);
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

insert into Cat_app values (1,1,1);
insert into Cat_app values (2,1,18);
insert into Cat_app values (3,2,2);
insert into Cat_app values (4,2,3);
insert into Cat_app values (5,3,4);
insert into Cat_app values (6,3,5);
insert into Cat_app values (7,3,8);
insert into Cat_app values (8,3,9);
insert into Cat_app values (9,3,10);
insert into Cat_app values (10,3,11);
insert into Cat_app values (11,4,6);
insert into Cat_app values (12,4,12);
insert into Cat_app values (13,5,7);
insert into Cat_app values (14,6,13);
insert into Cat_app values (15,7,14);
insert into Cat_app values (16,7,15);
insert into Cat_app values (17,8,16);
insert into Cat_app values (18,8,17);

commit;

select * from Category;
select * from Cat_app;