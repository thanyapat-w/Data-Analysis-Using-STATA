*This do-flies running under stata versions
version 15.0

/********************************************************************************************************************\
  Project Title: Grace's master thesis
  Author       : Thanyapat W. [Grace]
  Start Date   : 01 June 2021
  Last Modified: 03 June 2021
  Description  : This do file will append(combine) all industrial in to one file
				 By the way, I will separate it into two file: EU_US_Dataset_202106
\********************************************************************************************************************/

clear
capture log close
capture cmdlog close
set more off

**********************************************************************************************************************
*Directory: File location
	cd "D:\Master Thesis\202106_DataAnalysis"
*log: record everything done in stata.
	log using "D:\Master Thesis\202106_DataAnalysis\202106_LOG_File\202106_2_Append.log", text append
*cmdlog: saves every command used in stata.
	cmdlog using "D:\Master Thesis\202106_DataAnalysis\202106_LOGCMD_File\202106_2_Appendcmd.log", append
**********************************************************************************************************************

/***************\
  EU_US_Dataset	
\***************/
	*Create a new dta file to be a base file that all industries data will be store
		*I will start with Academic industry
		use "D:\Master Thesis\202106_DataAnalysis\202106_DTA_File\202106_EUS_Academic.dta"
		sort Identifier FiscalYear
		save "D:\Master Thesis\202106_DataAnalysis\202106_DTA_File\202106_EUS.dta", replace
	*Define specific directory for using the name of dta file without typing all directory
	cd "D:\Master Thesis\202106_DataAnalysis\202106_DTA_File"
		*Now EU_US_Dataset.dta is in memory then I will use append command to add another industries into EU_US_Dataset.dta
		append using 202106_EUS_BasicMaterials 202106_EUS_ConsumerCyclicals 202106_EUS_ConsumerNonCyclicals 202106_EUS_Energy 202106_EUS_Financials 202106_EUS_Healthcare 202106_EUS_Industrials 202106_EUS_Technology 202106_EUS_Utilities
		save "D:\Master Thesis\202106_DataAnalysis\202106_DTA_File\202106_EUS.dta", replace
		clear
