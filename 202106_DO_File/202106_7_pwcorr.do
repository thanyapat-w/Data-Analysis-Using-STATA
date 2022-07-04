*This do-flies running under stata versions
version 15.0

/********************************************************************************************************************\
  Project Title: Grace's master thesis
  Author       : Thanyapat W. [Grace]
  Start Date   : 01 June 2021
  Last Modified: 03 June 2021
  Description  : Correlation table
\********************************************************************************************************************/

clear
capture log close
capture cmdlog close
set more off

**********************************************************************************************************************
*Directory: File location
	cd "D:\Master Thesis\202106_DataAnalysis"
*log: record everything done in stata.
	log using "D:\Master Thesis\202106_DataAnalysis\202106_LOG_File\202106_7_pwcorr.log", text append
*cmdlog: saves every command used in stata.
	cmdlog using "D:\Master Thesis\202106_DataAnalysis\202106_LOGCMD_File\202106_7_pwcorrcmd.log", append
**********************************************************************************************************************

/***********************************************************************************************************\
  Correlation table
\***********************************************************************************************************/
	use "D:\Master Thesis\202106_DataAnalysis\202106_DTA_File\202106_EUS_dataset.dta"
	
*20210514 After running, this table still stuck at setstar
asdoc pwcorr TobinQ CRER CEOBoardMember CEOCompensationLinktoTSR FirmSize FirmLeverage, star(all) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_6_pwcorr.doc) label replace setstars(*@.05, **@.01, ***@.001) nonum
