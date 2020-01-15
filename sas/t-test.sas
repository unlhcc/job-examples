* load the dataset;
data pulse;
 input pre post;
datalines;
 62 61
 63 62
 58 59
 64 61
 64 63
 61 58
 68 61
 66 64
 65 62
 67 68
 69 65
 61 67
 64 65
 61 63
 63 62
;

* it is always a good idea to print out the dataset;
proc print;
run;

* perform the analysis using PROC TTEST;
proc ttest;
  paired pre*post; * tells sas to compute the test for the paired differences;
run;
