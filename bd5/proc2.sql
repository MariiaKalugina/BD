connect 'D:\BD\l5\Medshop.fdb' user 'SYSDBA' password 'masterkey';

SET TERM ^ ;

CREATE or alter PROCEDURE stat (dat1 date, dat2 date) 
returns (str varchar(5), num smallint, minimum int, average int, maximum int)
as
declare variable tmpdat date;
begin
	num = 0;
	tmpdat = :dat1;
	str = 'week';
	while (:tmpdat < :dat2) do begin
			select min(summ) as minimum, avg(summ) as average, max(summ) as maximum
			from orders
			where date_ofo between :dat1 and :dat2 
			and EXTRACT(week FROM date_ofo) = EXTRACT(week FROM :tmpdat)
			and EXTRACT(month FROM date_ofo) = EXTRACT(month FROM :tmpdat)
			and EXTRACT(year FROM date_ofo) = EXTRACT(year FROM :tmpdat)
			
			into :minimum,:average,:maximum;
			num = :num + 1;
			tmpdat = :tmpdat + 7;
			suspend;
	end
	
	num = 0;
	tmpdat = :dat1;
		str = 'month';
	while (:tmpdat < :dat2) do begin
			select min(summ) as minimum, avg(summ) as average, max(summ) as maximum
			from orders
			where date_ofo between :dat1 and :dat2 
			and EXTRACT(month FROM date_ofo) = EXTRACT(month FROM :tmpdat)
			and EXTRACT(year FROM date_ofo) = EXTRACT(year FROM :tmpdat)
			
			into :minimum,:average,:maximum;
			num = :num + 1;
			tmpdat = :tmpdat + 30;
			suspend;
	end	
	
	num = 0;
	tmpdat = :dat1;
	str = 'year';
	while (:tmpdat < :dat2) do begin
			select min(summ) as minimum, avg(summ) as average, max(summ) as maximum
			from orders
			where date_ofo between :dat1 and :dat2 
			and EXTRACT(year FROM date_ofo) = EXTRACT(year FROM :tmpdat)
			
			into :minimum,:average,:maximum;
			num = :num + 1;
			tmpdat = :tmpdat + 365;
			suspend;
	end	
end
^
SET TERM ; ^