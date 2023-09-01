/* Hypothetical Dataset Generated with a Constant RR  */
%macro sse_RR_RR(RR, nn, ss);
title "generate with fixed RR and use RR measure to estimate effect";
data temp;
 totalA=0; totalB=0;
 do s = 1 to &ss; 
	 brisk = s*0.02;
	 eventA = round(brisk*&nn);
	 eventB = round(brisk*&nn*&RR);
	 enotA = &nn-eventA;
	 enotB = &nn-eventB;
 	totalA=totalA+eventA;
 	totalB=totalB+eventB;
	 output;
 end;
 eventA=totalA;
 eventB=totalB;
 output;
 run; 
 data temp2; set temp;
 if _n_ = &ss+1 then large = 1; else large = 0 ; 
 r = eventA; n = &nn; trt = 0; sse = trt*large; output;
 r = eventB; n = &nn; trt = 1; sse = trt*large; output;
 keep s r n trt sse;
run;

data temp2; set temp2; if s = &ss+1  then n=&ss*&nn; run;

proc glimmix data = temp2 METHOD=QUAD ; 
class s; 
model r/n = s trt sse/ddfm=RES link = log cl noint solution chisq; 
run;
%mend sse_RR_RR;

%sse_RR_RR(2, 200, 20);


%macro sse_RR_OR(RR, nn, ss);
title "generate with fixed RR and use OR measure to estimate effect";
data temp;
 totalA=0; totalB=0;
 do s = 1 to &ss; 
	 brisk = s*0.02;
	 eventA = round(brisk*&nn);
	 eventB = round(brisk*&nn*&RR);
	 enotA = &nn-eventA;
	 enotB = &nn-eventB;
 	totalA=totalA+eventA;
 	totalB=totalB+eventB;
	 output;
 end;
 eventA=totalA;
 eventB=totalB;
 output;
 run; 
 data temp2; set temp;
 if _n_ = &ss+1 then large = 1; else large = 0 ; 
 r = eventA; n = &nn; trt = 0; sse = trt*large; output;
 r = eventB; n = &nn; trt = 1; sse = trt*large; output;
 keep s r n trt sse;
run;

data temp2; set temp2; if s = &ss+1  then n=&ss*&nn; run;

proc glimmix data = temp2 METHOD=QUAD ; 
class s; 
model r/n = s trt sse/ddfm=RES link = logit cl noint solution chisq; 
run;
%mend sse_RR_OR;

%sse_RR_OR(2, 200, 20);




/* Hypothetical Dataset Generated with a Constant OR  */
%macro sse_OR_RR(OR, nn, ss);
title "generate with fixed OR and use RR measure to estimate effect";
data temp;
 totalA=0; totalB=0;
 do s = 1 to &ss; 
	 brisk = s*0.03;
	 eventA = round(brisk*&nn);
	 eventB = round(&nn*brisk*&OR/(1-brisk+brisk*&OR));
	 enotA = &nn-eventA;
	 enotB = &nn-eventB;
 	totalA=totalA+eventA;
 	totalB=totalB+eventB;
	 output;
 end;
 eventA=totalA;
 eventB=totalB;
 output;
 run; 
 data temp2; set temp;
 if _n_ = &ss+1 then large = 1; else large = 0 ; 
 r = eventA; n = &nn; trt = 0; sse = trt*large; output;
 r = eventB; n = &nn; trt = 1; sse = trt*large; output;
 keep s r n trt sse;
run;

data temp2; set temp2; if s = &ss+1  then n=&ss*&nn; run;

proc glimmix data = temp2 METHOD=QUAD ; 
class s; 
model r/n = s trt sse/ddfm=RES link = log cl noint solution chisq; 
run;
%mend sse_OR_RR;

%sse_OR_RR(5, 200, 20);


%macro sse_OR_OR(OR, nn, ss);
title "generate with fixed RR and use OR measure to estimate effect";
data temp;
 totalA=0; totalB=0;
 do s = 1 to &ss; 
	 brisk = s*0.03;
	 eventA = round(brisk*&nn);
	 eventB = round(&nn*brisk*&OR/(1-brisk+brisk*&OR));
	 enotA = &nn-eventA;
	 enotB = &nn-eventB;
 	totalA=totalA+eventA;
 	totalB=totalB+eventB;
	 output;
 end;
 eventA=totalA;
 eventB=totalB;
 output;
 run; 
 data temp2; set temp;
 if _n_ = &ss+1 then large = 1; else large = 0 ; 
 r = eventA; n = &nn; trt = 0; sse = trt*large; output;
 r = eventB; n = &nn; trt = 1; sse = trt*large; output;
 keep s r n trt sse;
run;

data temp2; set temp2; if s = &ss+1  then n=&ss*&nn; run;

proc glimmix data = temp2 METHOD=QUAD ; 
class s; 
model r/n = s trt sse/ddfm=RES link = logit cl noint solution chisq; 
run;
%mend sse_OR_OR;

%sse_OR_OR(5, 200, 20);
