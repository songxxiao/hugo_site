cd "C:\Users\xsong\Desktop\table\highdata\mlepre"

use chip88.dta,clear

mixed logearn || geo: , variance


mixed logearn edu || geo: edu, variance

mixed logearn edu || geo: , variance

mixed logearn edu gross_d c.edu#c.gross_d || geo: edu, variance




