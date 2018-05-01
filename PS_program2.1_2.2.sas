*** Program 2.1
 This section of code performs the baseline treatment
 comparisons *;

data ados;
	set '/folders/myfolders/chapter2_data_ados.sas7bdat';
run;

proc ttest data = ados;
	class tx;
	var age phq1;
run;

proc freq data = ados;
	table (sex spouse work)*tx / chisq ;
run;

*** Program 2.2
This section of code computes the propensity scores and
the quintiles of the propensity scores;

*** estimation of the propensity scores;

proc logistic data = ados;
	class gender spouse work;
	model tx = gender spouse work age phq1;
	output out = ados2 predicted = PS;
	run;

data ados2;
	set ados2;
	label PS = 'propensity score';
run;

*** quintiles of propensity scores;

proc rank data=ados2 out=ados3 groups=5;
	ranks quintiles_ps;
	var ps;
run;
