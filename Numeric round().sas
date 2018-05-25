data truncate;
	input Age Weight;
	Age = int(Age);
	WtKg = round(2.2*Weight, .1);
	Weight = round(Weight);
	datalines;
18.8 100.7
25.12 122.4
64.99 188
;
