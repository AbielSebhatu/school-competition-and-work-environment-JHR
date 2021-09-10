*Testing mechanisms

*set directory for dataset
*cd "directory of choice"

*insert data from DiD sample with all schools in the sample
use "Did testing mechanisms dataset 2021-03-23.dta", clear

*school size and competition
	xtmixed s_sizelog hs_herf hs_density hs_sistud  hs_GPA i.edu_trac hs_forbac hs_edupar minclog crime hs_ctea hs_sctea   i.year i.municipality if year>1998, || municipality:, || school_id:, ml var nolog
	outreg2 using "tm1.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) append  ctitle(Complaints)

*complaints X highly edcated parents
	xtmixed complaints hs_herf hs_density hs_sistud hs_GPA i.edu_trac hs_forbac c.hs_edupar##c.hs_herf minclog crime hs_ctea hs_sctea s_sizelog   i.year i.municipality if year>1998 & treatment==1, || municipality:, || school_id:, ml var nolog
	outreg2 using "tm2.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) append  ctitle(School size log)
	xtmixed complaints hs_herf hs_density hs_sistud hs_GPA i.edu_trac hs_forbac c.hs_edupar##c.hs_density minclog crime hs_ctea hs_sctea s_sizelog   i.year i.municipality if year>1998 & treatment==1, || municipality:, || school_id:, ml var nolog
	outreg2 using "tm3.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) append  ctitle(School size log)
	xtmixed complaints hs_herf hs_density hs_sistud hs_GPA i.edu_trac hs_forbac c.hs_edupar##c.hs_sistud minclog crime hs_ctea hs_sctea s_sizelog   i.year i.municipality if year>1998 & treatment==1, || municipality:, || school_id:, ml var nolog
	outreg2 using "tm4.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) append  ctitle(School size log)
		
	seeout using "tm5.txt", label
