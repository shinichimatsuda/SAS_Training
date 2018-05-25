libname learn "/folders/myfolders/DATA/Learning";
run;

data test_miss;
	set learn.blood;
	if missing(Gender) then MissGender + 1;
	if missing(WBC) then MissWBC + 1;
	if missing(RBC) then MissRBC + 1;
	if Chol < 200 and not missing(Chol) then Level = 'Low';
	else if Chol >= 200 then Level = 'High';
run;
