***** Q13. Read specific records from csv file. *****;

data members;
	infile 'C:\testdata\mem.txt' dsd;
	input name $ @;
	if substr(name, 1, 2) = 'Ke' then do;
		input age address $ memberfee : dollar10.;
		output;
	end;
run;

***** Q14. Read observations appropriately. *****;

data studentmark;
	input identity $ @;
	if identity in ('answer1','answer2','answer3') then
	input a1 $ a2 $ a3 $ a4 $ a5$;
	else input a1 $ a2 $ a3 $ a4 $ a5$;
	datalines;
	answer1 A C D A B
	answer2 A D D B B
	answer3 C C D B B
	001 A C D C B 002 A C D C B
	003 B C B C B
	;
run;
