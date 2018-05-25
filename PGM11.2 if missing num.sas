libname learn "/folders/myfolders/DATA/Learning";
run;

data test_miss;
	set learn.blood;
	if Gender = ' ' then MissGender + 1;
	if WBC = . then MissWBC + 1;
	if RBC = . then MissRBC + 1;
	if Chol < 200 and Chol ne . then Level = 'Low';
	else if Chol >= 200 then Level = 'High';
run;
