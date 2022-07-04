*This do-flies running under stata versions
version 15.0

/********************************************************************************************************************\
  Project Title: Grace's master thesis
  Author       : Thanyapat W. [Grace]
  Start Date   : 01 June 2021
  Last Modified: 03 June 2021
  Description  : Corporate real estate ownership ratios by industry and country
\********************************************************************************************************************/

clear
capture log close
capture cmdlog close
set more off

**********************************************************************************************************************
*Directory: File location
	cd "D:\Master Thesis\202106_DataAnalysis"
*log: record everything done in stata.
	log using "D:\Master Thesis\202106_DataAnalysis\202106_LOG_File\202106_6_DescriptiveStat.log", text append
*cmdlog: saves every command used in stata.
	cmdlog using "D:\Master Thesis\202106_DataAnalysis\202106_LOGCMD_File\202106_6_DescriptiveStatcmd.log", append
**********************************************************************************************************************

/***********************************************************************************************************\
  Descriptive Statistic
\***********************************************************************************************************/
	use "D:\Master Thesis\202106_DataAnalysis\202106_DTA_File\202106_EUS_dataset.dta"

asdoc sum TobinQ CRER CEOBoardMember CEOCompensationLinktoTSR FirmSize FirmLeverage, dec(2) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_6_DescriptiveStat.doc) replace stat(N mean sd min max)
asdoc sum TobinQ CRER CEOBoardMember CEOCompensationLinktoTSR FirmSize FirmLeverage if Region == 0, dec(2) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_6_DescriptiveStat.doc) append stat(N mean sd min max)
asdoc sum TobinQ CRER CEOBoardMember CEOCompensationLinktoTSR FirmSize FirmLeverage if Region == 1, dec(2) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_6_DescriptiveStat.doc) append stat(N mean sd min max)
