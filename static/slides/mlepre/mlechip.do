cd "C:\Users\xsong\Desktop\table\highdata\mlepre"
use chip88.dta,clear

*组均值对中
sort geo
by geo:egen edumean=mean(edu) 
g cen_edu = edu-edumean



mixed logearn || geo: , variance

mixed logearn cen_edu || geo: , variance

mixed logearn cen_edu || geo: cen_edu, variance
estat icc

mixed logearn cen_edu gross_d c.cen_edu#c.gross_d || geo: cen_edu, variance
estat icc


mixed logearn cen_edu exp cpc sex gross_d c.cen_edu#c.gross_d || geo:exp cpc cen_edu, variance
estat icc
