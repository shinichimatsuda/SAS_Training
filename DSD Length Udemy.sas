********** Udemy Q9 ***********
DSD option
Length statement
*******************************;

data book;
	infile datalines dlm = '|' dsd;
	length name page number $100.;
	input name $ page $ number $;
	datalines;
application of computer|page3|2342#
computer||234
;
run;
