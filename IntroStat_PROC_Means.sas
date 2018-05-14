libname statdata "/folders/myfolders/DATA/ECST131";
run;

********* Practice *********************************************
****************************************************************
You want to understand if true mean body temperature is 98.6 and 
whether women's body temperatures are the same as men's body temperatures.
The Statdata.NormTemp data set contains the data that you need.
***************************************************************;

******************
Use PROC MEANS to determine the overall mean and standard deviation 
of the variable BodyTemp in the data set NormTemp. 
Ensure that SAS displays statistics for all requested combinations
 of the class variable.
******************;

proc means data=statdata.NormTemp mean stddev;
	var BodyTemp;
run;

***** Do the mean values seem to differ between men and women?;

proc means data=statdata.NormTemp mean;
	class gender;
	var BodyTemp;
run;

***** What is the interquartile range of body temperature?;
 
proc means data=statdata.NormTemp Q1 Q3 QRANGE;
	class gender;
	var BodyTemp;
run;
