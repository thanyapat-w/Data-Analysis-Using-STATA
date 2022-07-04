*This do-flies running under stata versions
version 15.0

/********************************************************************************************************************\
  Project Title: Grace's master thesis
  Author       : Thanyapat W. [Grace]
  Start Date   : 01 June 2021
  Last Modified: 03 June 2021
  Description  : Baseline Model
\********************************************************************************************************************/

clear
capture log close
capture cmdlog close
set more off

**********************************************************************************************************************
*Directory: File location
	cd "D:\Master Thesis\202106_DataAnalysis"
*log: record everything done in stata.
	log using "D:\Master Thesis\202106_DataAnalysis\202106_LOG_File\202106_8_BaselineModel.log", text append
*cmdlog: saves every command used in stata.
	cmdlog using "D:\Master Thesis\202106_DataAnalysis\202106_LOGCMD_File\202106_8_BaselineModelcmd.log", append
**********************************************************************************************************************

/***********************************************************************************************************\
  Baseline Regression Model
\***********************************************************************************************************/
	use "D:\Master Thesis\202106_DataAnalysis\202106_DTA_File\202106_EUS_dataset.dta"

*Baseline model: Overall
asdoc reg TobinQ CRER FirmSize FirmLeverage , add(Industry FE, No, Country FE, No) dec(3) title(Baseline Regression Model: Tobin's Q) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_8_BaselineModel.doc) label nest rep(p) replace setstars(*@.05, **@.01, ***@.001)
asdoc reg TobinQ CRER FirmSize FirmLeverage  i.Indus, add(Industry FE, Yes, Country FE, No) drop(i.Indus) dec(3) title(Baseline Regression Model: Tobin's Q) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_8_BaselineModel.doc) label nest rep(p) setstars(*@.05, **@.01, ***@.001)
asdoc reg TobinQ CRER FirmSize FirmLeverage  i.Region, add(Industry FE, No, Country FE, Yes) drop(i.Region) dec(3) title(Baseline Regression Model: Tobin's Q) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_8_BaselineModel.doc) label nest rep(p) setstars(*@.05, **@.01, ***@.001)
asdoc reg TobinQ CRER FirmSize FirmLeverage  i.Indus i.Region, add(Industry FE, Yes, Country FE, Yes) drop(i.Indus i.Region) dec(3) title(Baseline Regression Model: Tobin's Q) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_8_BaselineModel.doc) label nest rep(p) setstars(*@.05, **@.01, ***@.001)]

*Baseline model: EU
asdoc reg TobinQ CRER FirmSize FirmLeverage if Region == 1, add(Industry FE, No) dec(3) title(Baseline Regression Model: Tobin's Q) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_8_BaselineModel_EU.doc) label nest rep(p) replace setstars(*@.05, **@.01, ***@.001)
asdoc reg TobinQ CRER FirmSize FirmLeverage i.Indus if Region == 1, add(Industry FE, Yes) drop(i.Indus) dec(3) title(Baseline Regression Model: Tobin's Q) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_8_BaselineModel_EU.doc) label nest rep(p) setstars(*@.05, **@.01, ***@.001)

*Baseline model: US
asdoc reg TobinQ CRER FirmSize FirmLeverage if Region == 0, add(Industry FE, No) dec(3) title(Baseline Regression Model: Tobin's Q) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_8_BaselineModel_US.doc) label nest rep(p) replace setstars(*@.05, **@.01, ***@.001)
asdoc reg TobinQ CRER FirmSize FirmLeverage i.Indus if Region == 0, add(Industry FE, Yes) drop(i.Indus) dec(3) title(Baseline Regression Model: Tobin's Q) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_8_BaselineModel_US.doc) label nest rep(p) setstars(*@.05, **@.01, ***@.001)
