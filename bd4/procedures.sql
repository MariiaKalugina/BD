set term ^ ;
create procedure insert_tables
as begin
insert into Medd values (16,'Nasivin',0,10);
insert into Consigment values (14,'GlaxoSmithKline Pharmaceuticals','ru.gsk.com');
insert into Delivery values (16,10,1,'01.05.2018');
insert into Clients values (13,5,'Veris');
insert into Orders values (14,1,0,'02.12.2016');
insert into Ord_med values (16,13,10,4);
insert into Appointment values (19,'Seasikness');
insert into Appoint_med values (24,9,15);
insert into Constraindications values (12,'No');
insert into Const_med values (27,11,15);
insert into Side_effects values (11,'No');
insert into Eff_med values (31,3,15,25);
insert into Category values (9,'SARS');
insert into Pre_Category values (19,'Meningitis');
insert into Cat_pre values (19,8,16);
insert into Cat_app values (8,3,7);
insert into Analog values (16,15,2);
end ^

create procedure updates_tables
as begin
update Medd set Prescription=1, Name=Name || 's'  where Weight>60;
end ^

create procedure del_tables
as begin 
delete from Delivery where Shelf_life = (select min(Shelf_life) from Delivery);
delete from Clients where ID_client not in (select ID_client from Orders);
end ^
set term ; ^