***** Udem Q.16 *****;

data A;
	id = 1;
	sales = 2000;
	output;
	id = 2;
	sales = 3000;
	id = 3;
	sales = 5000;
	output;
run;

data B;
	do id = 1 to 3;
		sales = 10000 * ranuni(33);
		output;
	end;
run;

data C;
	do id = 1 to 3;
		sales = 10000 * ranuni(313);
		output;
		output;
	end;
run;

data D;
	do id = 1 to 3;
		sales = 1000 * ranuni(313);
		output;
	end;
run;

data all;
	merge A B C D;
	by id;
run;

proc print data = A;
run;

proc print data = B;
run;

proc print data = C;
run;

proc print data = D;
run;

proc print data = all;
run;
