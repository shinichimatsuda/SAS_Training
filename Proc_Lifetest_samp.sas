*** Proc Lifetest procedure sample;

data work.survsamp;
	input Group Time Censor;
	datalines;
	1 4 1
	1 5 1
	1 9 1
	2 6 1
	2 10 1
	2 11 1
	;
run;

proc lifetest data = work.survsamp notable;
	time time*censor(0);
	strata group;
run;
