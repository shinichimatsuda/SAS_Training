********** Udemy Q5 **********;

data investment;
	year=1;
	total=100;
	do until (year>10);
	 total=total*(1+0.1)**year;
	 year=year+1;
	end;
run;

proc print data=investment;
run;
