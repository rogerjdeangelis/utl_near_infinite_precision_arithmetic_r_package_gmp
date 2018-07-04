
Near infinite precision arithmetic r package gmp

  Problem: Add (big integers)

    1111111111111111111111111111111111111111
    2222222222222222222222222222222222222222

see
https://goo.gl/g7RQew
https://communities.sas.com/t5/General-SAS-Programming/Length-of-numeric-variable/m-p/368774

R extended srithmetic accuracy R packages

  Rmpfr
  GMP

Python

  mpmath


INPUT
=====

   %let e1=1111111111111111111111111111111111111111;
   %let e2=2222222222222222222222222222222222222222;

EXAMPLE OUTPUT is macro variable e3
-------------------------------------

  %put &=e3;

  E3=3333333333333333333333333333333333333333


PROCESS (working code)
======================

      e1 <- as.bigz("1111111111111111111111111111111111111111");
      e2 <- as.bigz("2222222222222222222222222222222222222222");
      e3 <- add.bigz(e1, e2);

OUTPUT
===

e1 = 1111111111111111111111111111111111111111
e2 = 2222222222222222222222222222222222222222

WANT
===

e3 = 3333333333333333333333333333333333333333

*          _       _   _
 ___  ___ | |_   _| |_(_) ___  _ __
/ __|/ _ \| | | | | __| |/ _ \| '_ \
\__ \ (_) | | |_| | |_| | (_) | | | |
|___/\___/|_|\__,_|\__|_|\___/|_| |_|

;

%symdel e3 / nowarn; * just in case;

%utl_submit_wps64x('
options set=R_HOME "C:/Program Files/R/R-3.3.2";
proc r;
submit;
source("C:/Program Files/R/R-3.3.2/etc/Rprofile.site", echo=T);
library(gmp);
e1 <- as.bigz("&e1");
e2 <- as.bigz("&e2");
e3 <- add.bigz(e1, e2);
txt<-as.character(e3);
class(e3);
writeClipboard(txt);
endsubmit;
run;quit;
',returnVarName=e3);

%put &=e3;



