data psych;
	input ID $ Q1-Q10;
	if n(of Q1-Q10) >= 7 then Score = mean(of Q1-Q10);
	MaxScore = max(of Q1-Q10);
	MinScore = min(of Q1-Q10);
	datalines;
001 4 1 3 9 1 2 3 5 . 3
002 3 5 4 2 . . . 2 4 .
003 9 8 7 6 5 4 3 2 1 5
;
