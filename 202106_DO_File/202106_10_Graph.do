*This do-flies running under stata versions
version 15.0

/********************************************************************************************************************\
  Project Title: Grace's master thesis
  Author       : Thanyapat W. [Grace]
  Start Date   : 01 June 2021
  Last Modified: 12 June 2021
  Description  : Graph
\********************************************************************************************************************/

clear
capture log close
capture cmdlog close
set more off

**********************************************************************************************************************
*Directory: File location
	cd "D:\Master Thesis\202106_DataAnalysis"
*log: record everything done in stata.
	log using "D:\Master Thesis\202106_DataAnalysis\202106_LOG_File\202106_10_Graph.log", text append
*cmdlog: saves every command used in stata.
	cmdlog using "D:\Master Thesis\202106_DataAnalysis\202106_LOGCMD_File\202106_10_Graphcmd.log", append
**********************************************************************************************************************

/**********************\
  Graph use for thesis
\**********************/
	*To exporting graph I have to define new directory 
	cd "D:\Master Thesis\202106_DataAnalysis\202106_Result_Figure"
	*Import dataset
	use "D:\Master Thesis\202106_DataAnalysis\202106_DTA_File\202106_EUS_dataset.dta"
	
	tsset FirmID FiscalYear, yearly

/***************************************\
  Corporate real estate ownership ratio
\***************************************/
	gen CRER_old = PPETotalNet/TotalAssets
	
	/***************\
	  CRER US Trend
	\***************/
		egen CRER_US_mean = mean(CRER) if Region == 0, by(FiscalYear)
		label variable CRER_US_mean "CRER US Trend calculate using Building(gross)+Land(gross)+Construction(gross)/Total Asset(gross)"
		egen CRER_old_US_mean = mean(CRER_old) if Region == 0, by(FiscalYear)
		label variable CRER_old_US_mean "CRER US Trend calculate using Net PP&E/Total Asset(net)"
		sort(FiscalYear) 
		line CRER_US_mean CRER_old_US_mean FiscalYear, title("CRER Trend in US") xtitle("Fiscal Year") ytitle("Corporate real estate ownership ratio") xscale(range(2010 2021)) yscale(range(0 0.25)) ylabel(0 (0.05) 0.25) 
		graph save CRER_US_Trend, replace
		graph use "CRER_US_Trend.gph", play("CRER_US_Trend.grec") 
		graph export CRER_US_Trend.png, replace
	/***************\
	  CRER EU Trend
	\***************/
		egen CRER_EU_mean = mean(CRER) if Region == 1, by(FiscalYear)
		label variable CRER_EU_mean "CRER EU Trend calculate using Building(gross)+Land(gross)+Construction(gross)/Total Asset(gross)"
		egen CRER_old_EU_mean = mean(CRER_old) if Region == 1, by(FiscalYear)
		label variable CRER_old_EU_mean "CRER EU Trend calculate using Net PP&E/Total Asset(net)"
		sort(FiscalYear) 
		line CRER_EU_mean CRER_old_EU_mean FiscalYear,title("CRER Trend in EU") xtitle("Fiscal Year") ytitle("Corporate real estate ownership ratio") xscale(range(2010 2021)) yscale(range(0 0.25)) ylabel(0 (0.05) 0.25) 
		graph save CRER_EU_Trend, replace
		graph use "CRER_EU_Trend.gph", play("CRER_EU_Trend.grec") 
		graph export CRER_EU_Trend.png, replace
	
	/******************\
	  CRER EU US Trend
	\******************/	
		line CRER_EU_mean CRER_old_EU_mean CRER_US_mean CRER_old_US_mean FiscalYear, xtitle("Fiscal Year") ytitle("Corporate real estate ownership ratio") xscale(range(2010 2021)) yscale(range(0 0.25)) ylabel(0 (0.05) 0.25) 
		graph export CRER_EU_US_Trend.png, replace
	
		
		/****************************************************\
		  The code in this topic the thing we cannot explain
		\****************************************************/
		/*	egen CRER_old_US_mean_Mat = mean(CRER_old)if Region == 0 & Indus == 1, by(FiscalYear)
			egen CRER_old_US_mean_Concy = mean(CRER_old)if Region == 0 & Indus == 2, by(FiscalYear)
			egen CRER_old_US_mean_Connoncy = mean(CRER_old)if Region == 0 & Indus == 3, by(FiscalYear)
			egen CRER_old_US_mean_Energy = mean(CRER_old)if Region == 0 & Indus == 4, by(FiscalYear)
			egen CRER_old_US_mean_Finance = mean(CRER_old)if Region == 0 & Indus == 5, by(FiscalYear)
			egen CRER_old_US_mean_Health = mean(CRER_old)if Region == 0 & Indus == 6, by(FiscalYear)
			egen CRER_old_US_mean_Industrials = mean(CRER_old)if Region == 0 & Indus == 7, by(FiscalYear)
			egen CRER_old_US_mean_Tech = mean(CRER_old)if Region == 0 & Indus == 8, by(FiscalYear)
			egen CRER_old_US_mean_Utilities = mean(CRER_old)if Region == 0 & Indus == 9, by(FiscalYear)
			line CRER_old_US_mean CRER_old_US_mean_Mat CRER_old_US_mean_Concy CRER_old_US_mean_Connoncy CRER_old_US_mean_Energy CRER_old_US_mean_Finance CRER_old_US_mean_Health CRER_old_US_mean_Industrials CRER_old_US_mean_Tech CRER_old_US_mean_Utilities FiscalYear, sort(FiscalYear)
			
			egen CRER_US_mean_Mat = mean(CRER)if Region == 0 & Indus == 1, by(FiscalYear)
			egen CRER_US_mean_Concy = mean(CRER)if Region == 0 & Indus == 2, by(FiscalYear)
			egen CRER_US_mean_Connoncy = mean(CRER)if Region == 0 & Indus == 3, by(FiscalYear)
			egen CRER_US_mean_Energy = mean(CRER)if Region == 0 & Indus == 4, by(FiscalYear)
			egen CRER_US_mean_Finance = mean(CRER)if Region == 0 & Indus == 5, by(FiscalYear)
			egen CRER_US_mean_Health = mean(CRER)if Region == 0 & Indus == 6, by(FiscalYear)
			egen CRER_US_mean_Industrials = mean(CRER)if Region == 0 & Indus == 7, by(FiscalYear)
			egen CRER_US_mean_Tech = mean(CRER)if Region == 0 & Indus == 8, by(FiscalYear)
			egen CRER_US_mean_Utilities = mean(CRER)if Region == 0 & Indus == 9, by(FiscalYear)
			line CRER_US_mean CRER_US_mean_Mat CRER_US_mean_Concy CRER_US_mean_Connoncy CRER_US_mean_Energy CRER_US_mean_Finance CRER_US_mean_Health CRER_US_mean_Industrials CRER_US_mean_Tech CRER_US_mean_Utilities FiscalYear, sort(FiscalYear)
		
			line CRER_US_mean_Mat CRER_old_US_mean_Mat FiscalYear, sort(FiscalYear)
			line CRER_US_mean_Concy CRER_old_US_mean_Concy FiscalYear, sort(FiscalYear)
			line CRER_US_mean_Connoncy CRER_old_US_mean_Connoncy FiscalYear, sort(FiscalYear)
			line CRER_US_mean_Energy CRER_old_US_mean_Energy FiscalYear, sort(FiscalYear)
			line CRER_US_mean_Finance CRER_old_US_mean_Finance FiscalYear, sort(FiscalYear)
			line CRER_US_mean_Health CRER_old_US_mean_Health FiscalYear, sort(FiscalYear)
			line CRER_US_mean_Industrials CRER_old_US_mean_Industrials FiscalYear, sort(FiscalYear)
			line CRER_US_mean_Tech CRER_old_US_mean_Tech FiscalYear, sort(FiscalYear)
			line CRER_US_mean_Utilities CRER_old_US_mean_Utilities FiscalYear, sort(FiscalYear)
		*/
		
		/*
		egen CRER_EU_mean = mean(CRER)if Region == 1, by(FiscalYear)
		line CRER_US_mean CRER_EU_mean CRER_US_mean_Mat FiscalYear, sort(FiscalYear)

		hist CRER CRER_US_mean CRER_EU_mean

twoway kdensity bmi if rural, xtitle("BMI (kg/m2)") ytitle(Density) ///
title(Body mass index in 338 semi-rural and 290 urban women in Ghana, size(medium) span) ///
subtitle(Kernel density plots, size(medium small) span) ///
color(blue*.5) lcolor(blue)  lwidth(medthick)  || ///
kdensity bmi if !rural ,    ///
color(red*.1) lcolor(red) lpattern(dash) lwidth(medthick) ///
legend(order(1 "semi-rural women" 2 "rural women") col(1) pos(1) ring(0))

gen Tobinsq = CRER^2
twoway qfit Tobinsq CRER, sort
