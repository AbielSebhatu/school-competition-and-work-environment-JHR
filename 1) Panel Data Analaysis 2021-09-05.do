*Panel Data Analysis

*set directory for dataset
*cd "directory of choice"

*insert data
use "1) Panel Dataset 2021-09-05.dta", clear


*Descriptives and correlations
mkcorr complaints disorder violence jh_herf jh_density jh_sistud jh_forbac jh_edupar minclog crime orgform jh_ctea jh_sctea jh_GPA s_sizelog if school_type==1 & year>1998, log("corr1.txt") cdec(3) mdec(3) lab means num casewise replace
mkcorr complaints disorder violence lsm_herf lsm_density lsm_sistud hs_forbac hs_edupar lsm_minclog lsm_crime orgform hs_ctea hs_sctea hs_GPA s_sizelog edu_trac if school_type==2 & year>1998, log("corr2.txt") cdec(3) mdec(3) lab means num casewise replace


*Results: Panel data analysis

	*Lower secondary schools, municipality fe
	xtmixed complaints jh_herf jh_density jh_sistud jh_forbac jh_edupar minclog crime i.orgform jh_ctea jh_sctea jh_GPA s_sizelog i.year i.municipality if school_type==1 & year>1998, || municipality:, || school_id:, ml var
	outreg2 using "main1.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) replace  ctitle(Complaints)
	xtmixed disorder jh_herf jh_density jh_sistud jh_forbac jh_edupar minclog crime  i.orgform jh_ctea jh_sctea jh_GPA s_sizelog i.year i.municipality if school_type==1 & year>1998, || municipality:, || school_id:, ml var
	outreg2 using "main1.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) append  ctitle(Disorder)
	xtmixed violence  jh_herf jh_density jh_sistud jh_forbac jh_edupar minclog crime i.orgform jh_ctea jh_sctea jh_GPA s_sizelog i.year i.municipality if school_type==1 & year>1998, || municipality:, || school_id:, ml var
	outreg2 using "main1.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) append  ctitle(Violence)
	xtmixed jh_GPA jh_herf jh_density jh_sistud jh_forbac jh_edupar minclog crime i.orgform jh_ctea jh_sctea s_sizelog i.year i.municipality if school_type==1 & year>1998, || municipality:, || school_id:, ml var
	outreg2 using "main1.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) append  ctitle(GPA)
	xtreg jh_GPA jh_herf jh_density jh_sistud jh_forbac jh_edupar minclog crime jh_ctea jh_sctea s_sizelog i.year i.municipality if school_type==1 & year>1998, fe i(school_id) cl(municipality)
	outreg2 using "main1.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Root MSE, e(rmse)) append  ctitle(GPA FE)
	seeout using "main1.txt", label
					
			*APPENDIX each competition variable separately
			xtmixed complaints jh_herf jh_forbac jh_edupar minclog crime i.orgform jh_ctea jh_sctea jh_GPA s_sizelog i.year i.municipality if school_type==1 & year>1998, || municipality:, || school_id:, ml var
			outreg2 using "main1u1.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) replace  ctitle(Complaints)
			xtmixed disorder jh_herf jh_forbac jh_edupar minclog crime  i.orgform jh_ctea jh_sctea jh_GPA s_sizelog i.year i.municipality if school_type==1 & year>1998, || municipality:, || school_id:, ml var
			outreg2 using "main1u1.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) append  ctitle(Disorder)
			xtmixed violence  jh_herf jh_forbac jh_edupar minclog crime i.orgform jh_ctea jh_sctea jh_GPA s_sizelog i.year i.municipality if school_type==1 & year>1998, || municipality:, || school_id:, ml var
			outreg2 using "main1u1.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) append  ctitle(Violence)
			xtmixed jh_GPA jh_herf jh_forbac jh_edupar minclog crime i.orgform jh_ctea jh_sctea s_sizelog i.year i.municipality if school_type==1 & year>1998, || municipality:, || school_id:, ml var
			outreg2 using "main1u1.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) append  ctitle(GPA)
			xtreg jh_GPA jh_herf jh_forbac jh_edupar minclog crime jh_ctea jh_sctea s_sizelog i.year i.municipality if school_type==1 & year>1998, fe i(school_id) cl(municipality)
			outreg2 using "main1u1.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Root MSE, e(rmse)) append  ctitle(GPA FE)
			seeout using "main1u1.txt", label

			xtmixed complaints jh_density jh_forbac jh_edupar minclog crime i.orgform jh_ctea jh_sctea jh_GPA s_sizelog i.year i.municipality if school_type==1 & year>1998, || municipality:, || school_id:, ml var
			outreg2 using "main1u2.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) replace  ctitle(Complaints)
			xtmixed disorder jh_density jh_forbac jh_edupar minclog crime  i.orgform jh_ctea jh_sctea jh_GPA s_sizelog i.year i.municipality if school_type==1 & year>1998, || municipality:, || school_id:, ml var
			outreg2 using "main1u2.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) append  ctitle(Disorder)
			xtmixed violence  jh_density jh_forbac jh_edupar minclog crime i.orgform jh_ctea jh_sctea jh_GPA s_sizelog i.year i.municipality if school_type==1 & year>1998, || municipality:, || school_id:, ml var
			outreg2 using "main1u2.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) append  ctitle(Violence)
			xtmixed jh_GPA jh_density jh_forbac jh_edupar minclog crime i.orgform jh_ctea jh_sctea s_sizelog i.year i.municipality if school_type==1 & year>1998, || municipality:, || school_id:, ml var
			outreg2 using "main1u2.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) append  ctitle(GPA)
			xtreg jh_GPA jh_density jh_forbac jh_edupar minclog crime jh_ctea jh_sctea s_sizelog i.year i.municipality if school_type==1 & year>1998, fe i(school_id) cl(municipality)
			outreg2 using "main1u2.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Root MSE, e(rmse)) append  ctitle(GPA FE)
			seeout using "main1u2.txt", label

			xtmixed complaints jh_sistud jh_forbac jh_edupar minclog crime i.orgform jh_ctea jh_sctea jh_GPA s_sizelog i.year i.municipality if school_type==1 & year>1998, || municipality:, || school_id:, ml var
			outreg2 using "main1u3.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) replace  ctitle(Complaints)
			xtmixed disorder jh_sistud jh_forbac jh_edupar minclog crime  i.orgform jh_ctea jh_sctea jh_GPA s_sizelog i.year i.municipality if school_type==1 & year>1998, || municipality:, || school_id:, ml var
			outreg2 using "main1u3.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) append  ctitle(Disorder)
			xtmixed violence  jh_sistud jh_forbac jh_edupar minclog crime i.orgform jh_ctea jh_sctea jh_GPA s_sizelog i.year i.municipality if school_type==1 & year>1998, || municipality:, || school_id:, ml var
			outreg2 using "main1u3.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) append  ctitle(Violence)
			xtmixed jh_GPA jh_sistud jh_forbac jh_edupar minclog crime i.orgform jh_ctea jh_sctea s_sizelog i.year i.municipality if school_type==1 & year>1998, || municipality:, || school_id:, ml var
			outreg2 using "main1u3.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) append  ctitle(GPA)
			xtreg jh_GPA jh_sistud jh_forbac jh_edupar minclog crime jh_ctea jh_sctea s_sizelog i.year i.municipality if school_type==1 & year>1998, fe i(school_id) cl(municipality)
			outreg2 using "main1u3.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Root MSE, e(rmse)) append  ctitle(GPA FE)
			seeout using "main1u3.txt", label
		
	*Upper secondary school, LSM fe
	xtmixed complaints lsm_herf lsm_density lsm_sistud i.edu_trac hs_forbac hs_edupar lsm_minclog lsm_crime i.orgform hs_ctea hs_sctea hs_GPA s_sizelog i.year i.lsmarket if school_type==2 & year>1998, || lsmarket:, || school_id:, ml var
	outreg2 using "main2.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) replace  ctitle(Complaints)
	xtmixed disorder lsm_herf lsm_density lsm_sistud i.edu_trac hs_forbac hs_edupar lsm_minclog lsm_crime i.orgform hs_ctea hs_sctea hs_GPA s_sizelog i.year i.lsmarket if school_type==2 & year>1998, || lsmarket:, || school_id:, ml var
	outreg2 using "main2.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) append  ctitle(Disorder)
	xtmixed violence lsm_herf lsm_density lsm_sistud i.edu_trac hs_forbac hs_edupar lsm_minclog lsm_crime i.orgform hs_ctea hs_sctea hs_GPA s_sizelog i.year i.lsmarket if school_type==2 & year>1998, || lsmarket:, || school_id:, ml var
	outreg2 using "main2.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) append  ctitle(Violence)
	xtmixed hs_GPA lsm_herf lsm_density lsm_sistud i.edu_trac hs_forbac hs_edupar lsm_minclog lsm_crime i.orgform hs_ctea hs_sctea s_sizelog i.year i.lsmarket if school_type==2 & year>1998, || lsmarket:, || school_id:, ml var
	outreg2 using "main2.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) append  ctitle(GPA)
	xtreg hs_GPA lsm_herf lsm_density lsm_sistud i.edu_trac hs_forbac hs_edupar lsm_minclog lsm_crime hs_ctea hs_sctea s_sizelog i.year i.lsmarket if school_type==2 & year>1998, fe i(school_id) cl(lsmarket)
	outreg2 using "main2.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Root MSE, e(rmse)) append  ctitle(GPA FE)
	seeout using "main2.txt", label
						
			*APPENDIX, each competition variable separately
			xtmixed complaints lsm_herf   i.edu_trac hs_forbac hs_edupar lsm_minclog lsm_crime i.orgform hs_ctea hs_sctea hs_GPA s_sizelog i.year i.lsmarket if school_type==2 & year>1998, || lsmarket:, || school_id:, ml var
			outreg2 using "main2u1.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) replace  ctitle(Complaints)
			xtmixed disorder lsm_herf  i.edu_trac hs_forbac hs_edupar lsm_minclog lsm_crime i.orgform hs_ctea hs_sctea hs_GPA s_sizelog i.year i.lsmarket if school_type==2 & year>1998, || lsmarket:, || school_id:, ml var
			outreg2 using "main2u1.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) append  ctitle(Disorder)
			xtmixed violence lsm_herf  i.edu_trac hs_forbac hs_edupar lsm_minclog lsm_crime i.orgform hs_ctea hs_sctea hs_GPA s_sizelog i.year i.lsmarket if school_type==2 & year>1998, || lsmarket:, || school_id:, ml var
			outreg2 using "main2u1.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) append  ctitle(Violence)
			xtmixed hs_GPA lsm_herf   i.edu_trac hs_forbac hs_edupar lsm_minclog lsm_crime i.orgform hs_ctea hs_sctea s_sizelog i.year i.lsmarket if school_type==2 & year>1998, || lsmarket:, || school_id:, ml var
			outreg2 using "main2u1.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) append  ctitle(GPA)
			xtreg hs_GPA lsm_herf   i.edu_trac hs_forbac hs_edupar lsm_minclog lsm_crime hs_ctea hs_sctea s_sizelog i.year i.lsmarket if school_type==2 & year>1998, fe i(school_id) cl(lsmarket)
			outreg2 using "main2u1.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Root MSE, e(rmse)) append  ctitle(GPA FE)
			seeout using "main2u1.txt", label
		
			xtmixed complaints lsm_density   i.edu_trac hs_forbac hs_edupar lsm_minclog lsm_crime i.orgform hs_ctea hs_sctea hs_GPA s_sizelog i.year i.lsmarket if school_type==2 & year>1998, || lsmarket:, || school_id:, ml var
			outreg2 using "main2u2.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) replace  ctitle(Complaints)
			xtmixed disorder lsm_density  i.edu_trac hs_forbac hs_edupar lsm_minclog lsm_crime i.orgform hs_ctea hs_sctea hs_GPA s_sizelog i.year i.lsmarket if school_type==2 & year>1998, || lsmarket:, || school_id:, ml var
			outreg2 using "main2u2.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) append  ctitle(Disorder)
			xtmixed violence lsm_density  i.edu_trac hs_forbac hs_edupar lsm_minclog lsm_crime i.orgform hs_ctea hs_sctea hs_GPA s_sizelog i.year i.lsmarket if school_type==2 & year>1998, || lsmarket:, || school_id:, ml var
			outreg2 using "main2u2.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) append  ctitle(Violence)
			xtmixed hs_GPA lsm_density   i.edu_trac hs_forbac hs_edupar lsm_minclog lsm_crime i.orgform hs_ctea hs_sctea s_sizelog i.year i.lsmarket if school_type==2 & year>1998, || lsmarket:, || school_id:, ml var
			outreg2 using "main2u2.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) append  ctitle(GPA)
			xtreg hs_GPA lsm_density   i.edu_trac hs_forbac hs_edupar lsm_minclog lsm_crime hs_ctea hs_sctea s_sizelog i.year i.lsmarket if school_type==2 & year>1998, fe i(school_id) cl(lsmarket)
			outreg2 using "main2u2.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Root MSE, e(rmse)) append  ctitle(GPA FE)
			seeout using "main2u2.txt", label

			xtmixed complaints lsm_sistud   i.edu_trac hs_forbac hs_edupar lsm_minclog lsm_crime i.orgform hs_ctea hs_sctea hs_GPA s_sizelog i.year i.lsmarket if school_type==2 & year>1998, || lsmarket:, || school_id:, ml var
			outreg2 using "main2u3.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) replace  ctitle(Complaints)
			xtmixed disorder lsm_sistud  i.edu_trac hs_forbac hs_edupar lsm_minclog lsm_crime i.orgform hs_ctea hs_sctea hs_GPA s_sizelog i.year i.lsmarket if school_type==2 & year>1998, || lsmarket:, || school_id:, ml var
			outreg2 using "main2u3.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) append  ctitle(Disorder)
			xtmixed violence lsm_sistud  i.edu_trac hs_forbac hs_edupar lsm_minclog lsm_crime i.orgform hs_ctea hs_sctea hs_GPA s_sizelog i.year i.lsmarket if school_type==2 & year>1998, || lsmarket:, || school_id:, ml var
			outreg2 using "main2u3.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) append  ctitle(Violence)
			xtmixed hs_GPA lsm_sistud   i.edu_trac hs_forbac hs_edupar lsm_minclog lsm_crime i.orgform hs_ctea hs_sctea s_sizelog i.year i.lsmarket if school_type==2 & year>1998, || lsmarket:, || school_id:, ml var
			outreg2 using "main2u3.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(Year dummies, YES) addstat ("-2LL",e(ll),"df",e(df_m)) append  ctitle(GPA)
			xtreg hs_GPA lsm_sistud   i.edu_trac hs_forbac hs_edupar lsm_minclog lsm_crime hs_ctea hs_sctea s_sizelog i.year i.lsmarket if school_type==2 & year>1998, fe i(school_id) cl(lsmarket)
			outreg2 using "main2u3.txt", label bdec(3) rdec(3) excel symbol(***, **, *, +) alpha(0.001, 0.01, 0.05, 0.10) addtext(School FE, YES, Year dummies, YES, Regression Model, GLS) addsta(Adjusted R-square, e(r2_a), F, e(F), Within R-square, e(r2_w), Between R-square, e(r2_b), Overall R-square, e(r2_o), Log likelihood, e(ll), Root MSE, e(rmse)) append  ctitle(GPA FE)
			seeout using "main2u3.txt", label




			


