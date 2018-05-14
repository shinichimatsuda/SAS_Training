********** Udemy Q6 **********;

proc print data = sasuser.houses;
run;

option pageno = 1; /* This resets the page number to 1 for the second report */

proc freq data = student;
	tables Gender*agegrp;
run;
