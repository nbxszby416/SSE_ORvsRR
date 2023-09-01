/* Read csv file */

proc import out=real
	datafile="data_IS_vs_DFS.csv"
	dbms=csv
	replace;
	getnames=YES;
run;

proc print data = real;
title "RR and OR REAL";
run;


/* Regression model for RR */
proc glimmix data = real METHOD=QUAD ; 
class s; 
model r/n = s trt sse/ddfm=RES link = log cl noint solution chisq;
random trt / subject=s;
run;

/* Regression model for OR */
proc glimmix data = real METHOD=QUAD ; 
class s; 
model r/n = s trt sse/ddfm=RES link = logit cl noint solution chisq;
random trt / subject=s;
run;