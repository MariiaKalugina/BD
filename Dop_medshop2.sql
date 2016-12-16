connect 'D:\BD\Medshop.fdb' user 'SYSDBA' password 'masterkey';
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

select * from Analog;
