*Difference-in-Difference Analysis

*set directory for dataset
*cd "directory of choice"

*insert data
use "2) DiD Dataset 2021-09-05.dta", clear

xtset school_id year

*Parallel trends assumption
	xtreg complaints  t11b t10b t9b t8b t7b t6b t5b t4b t3b t2b t1b t0 t1 t2 t3 t4d hs_ctea hs_sctea hs_forbac hs_edupar hs_GPA s_sizelog i.edu_trac minclog crime poplog i.year if in_group!=1, fe i(school_id) cl(_id)
	outreg2 using "didmatch.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Year dummies, YES, Control variables, Yes) replace  ctitle(Complaints)
	xtreg disorder  t11b t10b t9b t8b t7b t6b t5b t4b t3b t2b t1b t0 t1 t2 t3 t4d hs_ctea hs_sctea hs_forbac hs_edupar hs_GPA s_sizelog i.edu_trac minclog crime poplog i.year if in_group!=1, fe i(school_id) cl(_id)
	outreg2 using "didmatch.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Year dummies, YES, Control variables, Yes) append  ctitle(Disorder)
	xtreg violence  t11b t10b t9b t8b t7b t6b t5b t4b t3b t2b t1b t0 t1 t2 t3 t4d hs_ctea hs_sctea hs_forbac hs_edupar hs_GPA s_sizelog i.edu_trac minclog crime poplog i.year if in_group!=1, fe i(school_id) cl(_id)
	outreg2 using "didmatch.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Year dummies, YES, Control variables, Yes) append  ctitle(Violence)
	xtreg hs_GPA  t11b t10b t9b t8b t7b t6b t5b t4b t3b t2b t1b t0 t1 t2 t3 t4d hs_ctea hs_sctea hs_forbac hs_edupar s_sizelog i.edu_trac minclog crime poplog i.year if in_group!=1, fe i(school_id) cl(_id)
	outreg2 using "didmatch.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Year dummies, YES, Control variables, Yes) append  ctitle(GPA)

	seeout using "didmatch.txt", label	
	
*Results: Difference-in-Difference Analysis
	xtreg complaints treatment3 i.year if in_group!=1, fe i(school_id) cl(_id)
	outreg2 using "didmatch.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, match1 FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Root MSE, e(rmse)) replace  ctitle(Complaints)
	xtreg complaints treatment3 hs_ctea hs_sctea hs_forbac hs_edupar hs_GPA s_sizelog i.edu_trac i.year if in_group!=1, fe i(school_id) cl(_id)
	outreg2 using "didmatch.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, match1 FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Root MSE, e(rmse)) append  ctitle(Complaints)
	xtreg complaints treatment3   i.year if in_group!=1, fe i(school_id) cl(_id)
	outreg2 using "didmatch.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, match1 FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Root MSE, e(rmse)) append  ctitle(Complaints)
	xtreg complaints treatment3 hs_ctea hs_sctea hs_forbac hs_edupar hs_GPA s_sizelog i.edu_trac minclog crime poplog i.year if in_group!=1, fe i(school_id) cl(_id)
	outreg2 using "didmatch.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, match1 FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Root MSE, e(rmse)) append  ctitle(Complaints)

	xtreg disorder treatment3 i.year if in_group!=1, fe i(school_id) cl(_id)
	outreg2 using "didmatch.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, match1 FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Root MSE, e(rmse)) append  ctitle(Disorder)
	xtreg disorder treatment3 hs_ctea hs_sctea hs_forbac hs_edupar hs_GPA s_sizelog i.edu_trac i.year if in_group!=1, fe i(school_id) cl(_id)
	outreg2 using "didmatch.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, match1 FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Root MSE, e(rmse)) append  ctitle(Disorder)
	xtreg disorder treatment3 minclog crime poplog i.year if in_group!=1, fe i(school_id) cl(_id)
	outreg2 using "didmatch.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, match1 FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Root MSE, e(rmse)) append  ctitle(Disorder)
	xtreg disorder treatment3 hs_ctea hs_sctea hs_forbac hs_edupar hs_GPA s_sizelog i.edu_trac minclog crime poplog i.year if in_group!=1, fe i(school_id) cl(_id)
	outreg2 using "didmatch.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, match1 FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Root MSE, e(rmse)) append  ctitle(Disorder)

	xtreg violence treatment3 i.year if in_group!=1, fe i(school_id) cl(_id)
	outreg2 using "didmatch.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, match1 FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Root MSE, e(rmse)) append  ctitle(Violence)
	xtreg violence treatment3 hs_ctea hs_sctea hs_forbac hs_edupar hs_GPA s_sizelog i.edu_trac i.year if in_group!=1, fe i(school_id) cl(_id)
	outreg2 using "didmatch.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, match1 FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Root MSE, e(rmse)) append  ctitle(Violence)
	xtreg violence treatment3 minclog crime poplog i.year if in_group!=1, fe i(school_id) cl(_id)
	outreg2 using "didmatch.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, match1 FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Root MSE, e(rmse)) append  ctitle(Violence)
	xtreg violence treatment3 hs_ctea hs_sctea hs_forbac hs_edupar hs_GPA s_sizelog i.edu_trac minclog crime poplog i.year if in_group!=1, fe i(school_id) cl(_id)
	outreg2 using "didmatch.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, match1 FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Root MSE, e(rmse)) append  ctitle(Violence)

	xtreg hs_GPA treatment3 i.year if in_group!=1, fe i(school_id) cl(_id)
	outreg2 using "didmatch.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, match1 FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Root MSE, e(rmse)) append  ctitle(GPA)
	xtreg hs_GPA treatment3 hs_ctea hs_sctea hs_forbac hs_edupar s_sizelog i.edu_trac i.year if in_group!=1, fe i(school_id) cl(_id)
	outreg2 using "didmatch.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, match1 FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Root MSE, e(rmse)) append  ctitle(GPA)
	xtreg hs_GPA treatment3 minclog crime poplog i.year if in_group!=1, fe i(school_id) cl(_id)
	outreg2 using "didmatch.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, match1 FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Root MSE, e(rmse)) append  ctitle(GPA)
	xtreg hs_GPA treatment3 hs_ctea hs_sctea hs_forbac hs_edupar s_sizelog i.edu_trac minclog crime poplog i.year if in_group!=1, fe i(school_id) cl(_id)
	outreg2 using "didmatch.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, match1 FE, NO, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Root MSE, e(rmse)) append  ctitle(GPA)
	seeout using "didmatch.txt", label	



