libname clinical "/folders/myfolders/DATA/Clinical";
run;

data aes_2;
	set aes;
	by subjectid;
	/* PARENT-CHILD WARNING */
	if (aeyn ne 'Yes' and aetext ne '') or
	(aeyn = 'Yes' and aetext='') then
	put "WARN""NING: ae parent-child bug" aeyn=aetext=;
	if aeyn = 'Yes' or aetext ne '';
run;
