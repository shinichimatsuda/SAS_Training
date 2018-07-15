%let homefolder=/folders/myfolders/ECST142/data;

libname STAT1 "&homefolder";

options fmtsearch=(stat1.myfmts);

proc format library=stat1.myfmts;
run;

/* create macro variables to hold the names of the interval and */
/* categorical variables used in the demo and practice programs */

%let interval=Gr_Liv_Area Basement_Area Garage_Area Deck_Porch_Area 
         Lot_Area Age_Sold Bedroom_AbvGr Total_Bathroom;

%let categorical=House_Style2 Overall_Qual2 Overall_Cond2 Fireplaces 
         Season_Sold Garage_Type_2 Foundation_2 Heating_QC 
         Masonry_Veneer Lot_Shape_2 Central_Air;

***** Box plots *****;
proc sgplot data = STAT1.ameshousing3;
	vbox SalePrice / category = Central_Air connect = mean;
	title "Sale Price Differences across Central Air";
run;

