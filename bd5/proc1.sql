connect 'D:\BD\l5\Medshop.fdb' user 'SYSDBA' password 'masterkey';

SET TERM ^ ;

CREATE or alter PROCEDURE numerate 
returns (num int, cly int, dat date)
as
declare variable I int;
begin
	I = 0;
	for select :I, id_client, date_ofo
	from orders
	group by date_ofo, id_client
	order by id_client, date_ofo
	into :num,:cly, :dat
	do begin
		I = I + 1;
		suspend;
	end
end
^

CREATE or alter PROCEDURE find_interval 
returns ( client int, interv int, interv1 date, interv2 date)
as
begin
	for select o1.cly, (o2.dat - o1.dat) as interv, o1.dat as dat1, o2.dat as dat2
	from numerate as o1, numerate as o2
	where o2.num = o1.num + 1
	and o1.cly = o2.cly
	order by o1.dat, o2.dat
	into :client, :interv, :interv1, :interv2
	do begin
		suspend;
	end	
end 
^

CREATE or alter PROCEDURE find_clients (interv int)
returns ( client int, avg_interv int)
as
begin
	for select client, avg_interval from
		(
		select client, avg(interv) as avg_interval 
		from find_interval 
		group by client
		)
	where avg_interval > :interv
	into :client,:avg_interv
	do begin
		suspend;
	end
end
^

SET TERM ; ^