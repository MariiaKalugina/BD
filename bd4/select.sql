connect 'D:\BD\l4\Medshop.fdb' user 'SYSDBA' password 'masterkey';
commit;

create view view01 as select * from Medd;
create view view11 as select * from Consigment;
create view view21 as select * from Clients;
create view view31 as select * from Orders;
create view view41 as select * from Ord_med;
create view view51 as select * from Appointment;
create view view61 as select * from Appoint_med;
create view view71 as select * from Side_effects;
create view view81 as select * from Constraindications;
create view view91 as select * from Category;
create view view101 as select * from Pre_Category;
create view view111 as select * from Cat_pre;
create view view121 as select * from Cat_app;
create view view131 as select * from Analog;

create view view1 as select Name,Prescription, Weight from Medd where Prescription in (0)
and Weight between 20 and 50; 

create view view2 as select Provider, Site from Consigment where Provider like ('%c%')
or Site like ('%ni%'); 

create view view3 as select Name, Discount from Clients where Name like ('%a') 
or Discount between 7 and 12;

create view view4 as select sum(Summ) from Orders;

create view view5 as select Name, Weight from Medd
order by Weight, Name;

create view view6 as select min(Summ) as Minimum, avg(Summ) as Average, max(Summ) as Maximum
from Orders;

create view view7 as select Clients.Name, Orders.ID_order, Orders.Summ
from Clients, Orders
where Orders.Summ >120 and
Clients.ID_client=Orders.ID_client;

create view view8 as select Category.Name, Pre_Category.Name
from Cat_pre, Category, Pre_Category
where Pre_Category.Name like ('A%')
and Category.ID_cat=Cat_pre.ID_cat
and Pre_Category.ID_precat=Cat_pre.ID_precat;

create view view9 as select Name, min(Weight)
from Medd group by Name having min(Weight)>20;

create view view10 as select Shelf_life from Delivery
where ID_prov in 
(select ID_cons
from Consigment
where Provider like('N%'));

insert into Side_effects values (11,'Apathy');
insert into Medd values (16,'Panadol',0,50);

select * from Medd where Weight>60;
create view view11 as update Medd set Prescription=1, Name=Name || 's' where Weight>60;
select * from Medd where Weight>60;

select * from Delivery;
create view view12 as delete from Delivery where Shelf_life = (select min(Shelf_life) from Delivery);
select * from Delivery;

select * from Clients;
create view view13 as delete from Clients where ID_client not in
(select ID_client from Orders);
select * from Clients;  
--1
create view view14 as select first 10 Clients.Name, sum(Ord_med.Quantity) as Quantity_sum
from Clients
natural join Orders 
join Ord_Med on (Orders.ID_order=ID_ord)
where Date_ofo between '01.12.2016' and '03.12.2016'
group by Clients.Name
order by Quantity_sum desc;
--2
create view view15 as select first 3 Name, count(Const_med.ID_const)
from Constraindications
join Const_med using (ID_const)
where Constraindications.ID_const = Const_med.ID_const
group by Name
order by count(Const_med.ID_const) desc;
--3
create view view16 as delete from Ord_med where Quantity=0;
create view view17 as delete from Orders where ID_order not in
(select ID_ord from Ord_med);
 