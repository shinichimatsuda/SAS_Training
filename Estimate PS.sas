libname health "/folders/myfolders/DATA/Health";
run;

***** This section of code performs the baseline treatment comparison;

proc ttest data=health.chapter2_data_ados;
	class TX;
	var AGE PHQ1;
run;

***** This section of code comuputes the propensity scores and
the quintiles of the propensity scores;

*** estimation of propensity scores;

proc logistic data=health.chapter2_data_ados;
	class GENDER SPOUSE WORK;
	model TX=GENDER SPOUSE WORK AGE PHQ1;
	output out=health.ADOS2 predicted=PS;
run;

data health.ados2;
	set health.ados2;
	label PS='Propensity Score';
run;

*** quintiles of propensity scores;

proc rank data=health.ados2 out=health.ados3 groups=5;
	ranks Quintiles_PS;
	var PS;
run;
