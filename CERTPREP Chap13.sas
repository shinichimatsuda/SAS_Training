***** SAS Certification Prep Guide;
libname certprep "/folders/myfolders/certprep";

*---- Chapter13: Combining SAS Data Sets ---------
-------------------------------------------------;

***** Using concatenating to combine data sets;
data certprep.concat;
	set certprep.therapy2012 certprep.therapy2013;
run;

***** Using the PROC APPEND Statement to bombine data sets;
proc append base=certprep.totals2005 data=certprep.totals2011;
run;

***** Using the FORCE option with Unlike-Structured data sets;
proc append base=certprep.patients data= certprep.append force;
run;

***** Using Interleaving to combine data sets;
data certprep.interlv;
	set certprep.therapy2012 certprep.therapy2013;
	by month;
run;

***** Using Match-Merging to combine data sets;
data certprep.demog2;
	input ID $1-4 Age 6-7 Sex $9 Date $11-18;
	datalines;
A007	39	M	11/11/05
A005	44	F	02/24/05
A004	.		01/27/06
A003	24	F	08/17/07
A002	32	M	06/15/06
A001	21	M	05/22/07
;
run;

proc sort data=certprep.demog2 out=certprep.demog2_s;
	by id;
run;

*** Create a data set;
data certprep.visit2;
	input ID $1-4 Age 6-7 Visit 9 SysBP 11-13 DiasBP 15-16 Weight 18-20 Date $22-29;
	datalines;
A008	26	1	126	80	182	05/22/09
A005	33	1	136	76	174	02/27/09
A005	31	2	132	78	175	07/11/09
A005	29	3	134	78	176	04/16/09
A004	26	1	143	86	204	03/30/09
A003	38	1	118	68	125	08/12/09
A003	41	2	112	65	123	08/21/09
A002	22	1	121	75	168	04/14/09
A001	23	1	140	85	195	11/05/09
A001	38	2	138	90	198	10/13/09
A001	35	3	145	95	200	07/04/09
;
run;

proc sort data=certprep.visit2 out=certprep.visit2_s;
	by id;
run;

proc print data=certprep.visit2;
run;

*** merge demog2_s dataset and visit2_s dataset;

data certprep.merged;
	merge certprep.demog2_s certprep.visit2_s;
	by id;
run;

*** Renaming variables;
data certprep.merged2;
	merge certprep.demog2_s (rename=(date=BirthDate))
		  certprep.visit2_s (rename=(date=VisitDate));
	by ID;
run;

proc print data=certprep.merged2;
run;

*** Using IN option to select matching observations;
data certprep.merged3;
	merge certprep.demog2_s (in=indemog)
		  certprep.visit2_s (in=invisit rename=(Date=VisitDate));
	by id;
	if indemog=1 and invisit=1;
run;

proc print data=certprep.merged3;
run;

/* The following script gets the same result */
data certprep.merged3;
	merge certprep.demog2_s (in=indemog)
		  certprep.visit2_s (in=invisit rename=(Date=VisitDate));
	by id;
	if indemog and invisit;
run;

*** Chapter Quiz;

data work.one;
	input VarX VarY $;
	datalines;
 	 1 Groucho
 	 3 Harpo
 	 5 Karl
;
run;

data work.two;
	input VarX VarZ $;
	datalines;
 	 2 Chico
 	 4 Zeppo
;
run;

data three;
	set one;
	set two;
run;

proc print data=one;
run;

proc print data=two;
run;

proc print data=three;
run;

*** Problem 2;
data certprep.Props1;
	input Actor $ Prop $;
	datalines;
Curly Anvil
Larry Ladder
Moe Poker
;
run;

data certprep.Props2;
	input Actor $ Prop $;
	datalines;
Curly Ladder
Moe Pilers
;
run;

data certprep.Props3;
	set certprep.Props1 certprep.Props2;
run;

*** Problem 3;
data certprep.dataone;
	input Career Supervis Finance;
	datalines;
72 26 9
63 76 7
96 31 7
96 98 6
84 94 6
;
run;

data certprep.datatwo;
	input Variety Feedback Autonon;
	datalines;
10 11 70
85 22 93
83 63 73
82 75 97
36 77 97
;
run;

data work.jobsatis;
	set certprep.dataone certprep.datatwo;
run;

proc print data=work.jobsatis;
run;
