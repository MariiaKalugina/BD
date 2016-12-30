connect 'D:\BD\l6\Medshop.fdb' user 'SYSDBA' password 'masterkey';
commit;
set term ^;
create generator increment^
create or alter trigger gener for Clients 
before insert
as
begin
	new.ID_client = gen_id(increment,1);
end^

create exception error_stage1 'Error: cannot delete this'^
create or alter trigger Er_trig for Clients 
before delete or update
as
begin
If (old.ID_client in (select ID_client from Orders)) then
exception error_stage1;
end^ 

create exception error_stage2 'Error: this Constraindication already exists'^
create exception error_stage3 'Error: this Side_effect already exists'^
create or alter trigger Err_doubleC for Constraindications
before insert or update
as
begin
If (new.Name in (select Name from Constraindications)) then
exception error_stage2;
end^
create or alter trigger Err_doubleS for Side_effects
before insert or update
as
begin
If (new.Name in (select Name from Side_effects)) then
exception error_stage3;
end^


create or alter procedure Check_order(ID int)
as
declare variable countt int;
declare variable cnt int;
begin
	countt = 0;
	delete from Orders where ID_order not in
	(select ID_ord from Ord_Med);
end
^

create or alter trigger Del_order for Ord_med
after delete
as
begin
	execute procedure Check_order(old.ID_ord);
end
^
set term ;^