
***** Prepare the data set *****;

data cstest;
	input Exposure Outcome Count;
	datalines;
	0 0 900
	0 1 100
	1 0 170
	1 1 30
;

proc sort data=cstest out=cstest_s;
	by descending Exposure descending Outcome;
run;

***** Compute Relative risk with 95% CI and statistics;

proc freq data=cstest_s order=data;
	tables Exposure*Outcome / nocol norow nopercent chisq relrisk;
	exact pchi;
	weight Count;
	title 'Cohort study';
run;
