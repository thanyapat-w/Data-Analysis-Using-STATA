*This do-flies running under stata versions
version 15.0

/********************************************************************************************************************\
  Project Title: Grace's master thesis
  Author       : Thanyapat W. [Grace]
  Start Date   : 01 June 2021
  Last Modified: 03 June 2021
  Description  : Interaction-term regression
\********************************************************************************************************************/

clear
capture log close
capture cmdlog close
set more off

**********************************************************************************************************************
*Directory: File location
	cd "D:\Master Thesis\202106_DataAnalysis"
*log: record everything done in stata.
	log using "D:\Master Thesis\202106_DataAnalysis\202106_LOG_File\202106_9_CRER_CEOchar_Model.log", text append
*cmdlog: saves every command used in stata.
	cmdlog using "D:\Master Thesis\202106_DataAnalysis\202106_LOGCMD_File\202106_9_CRER_CEOchar_Modelcmd.log", append
**********************************************************************************************************************

/***********************************************************************************************************\
  Interaction Regression Model
\***********************************************************************************************************/
	use "D:\Master Thesis\202106_DataAnalysis\202106_DTA_File\202106_EUS_dataset.dta"
	/************************\
	  CRER with CEO on board
	\************************/
		*CRER with CEO on board: Overall
		gen CRER_CEOBoardMember = CRER*CEOBoardMember
		asdoc reg TobinQ CRER CEOBoardMember CRER_CEOBoardMember FirmSize FirmLeverage , add(Industry FE, No, Country FE, No) dec(3) title(Interaction-term regression: CRER with CEO on board) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_CEOBoardMemberModel.doc) label nest rep(p) replace setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER CEOBoardMember CRER_CEOBoardMember FirmSize FirmLeverage  i.Indus, add(Industry FE, Yes, Country FE, No) drop(i.Indus) dec(3) title(Interaction-term regression: CRER with CEO on board) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_CEOBoardMemberModel.doc) label nest rep(p) setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER CEOBoardMember CRER_CEOBoardMember FirmSize FirmLeverage  i.Region, add(Industry FE, No, Country FE, Yes) drop(i.Region) dec(3) title(Interaction-term regression: CRER with CEO on board) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_CEOBoardMemberModel.doc) label nest rep(p) setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER CEOBoardMember CRER_CEOBoardMember FirmSize FirmLeverage  i.Indus i.Region, add(Industry FE, Yes, Country FE, Yes) drop(i.Indus i.Region) dec(3) title(Interaction-term regression: CRER with CEO on board) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_CEOBoardMemberModel.doc) label nest rep(p) setstars(*@.05, **@.01, ***@.001)]
		*CRER with CEO on board: EU
		asdoc reg TobinQ CRER CEOBoardMember CRER_CEOBoardMember FirmSize FirmLeverage if Region == 1, add(Industry FE, No) dec(3) title(Interaction-term regression: CRER with CEO on board) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_CEOBoardMemberModel_EU.doc) label nest rep(p) replace setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER CEOBoardMember CRER_CEOBoardMember FirmSize FirmLeverage  i.Indus if Region == 1, add(Industry FE, Yes) drop(i.Indus) dec(3) title(Interaction-term regression: CRER with CEO on board) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_CEOBoardMemberModel_EU.doc) label nest rep(p) setstars(*@.05, **@.01, ***@.001)
		*CRER with CEO on board: US
		asdoc reg TobinQ CRER CEOBoardMember CRER_CEOBoardMember FirmSize FirmLeverage if Region == 0, add(Industry FE, No) dec(3) title(Interaction-term regression: CRER with CEO on board) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_CEOBoardMemberModel_US.doc) label nest rep(p) replace setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER CEOBoardMember CRER_CEOBoardMember FirmSize FirmLeverage  i.Indus if Region == 0, add(Industry FE, Yes) drop(i.Indus) dec(3) title(Interaction-term regression: CRER with CEO on board) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_CEOBoardMemberModel_US.doc) label nest rep(p) setstars(*@.05, **@.01, ***@.001)

	/******************************\
	  CRER with Chairman is ex-CEO
	\******************************/
		*CRER with Chairman is ex-CEO: Overall
		gen CRER_ChairmanisexCEO = CRER*ChairmanisexCEO
		asdoc reg TobinQ CRER ChairmanisexCEO CRER_ChairmanisexCEO FirmSize FirmLeverage , add(Industry FE, No, Country FE, No) dec(3) title(Interaction-term regression: CRER with Chairman is ex-CEO) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_ChairmanisexCEOModel.doc) label nest rep(p) replace setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER ChairmanisexCEO CRER_ChairmanisexCEO FirmSize FirmLeverage  i.Indus, add(Industry FE, Yes, Country FE, No) drop(i.Indus) dec(3) title(Interaction-term regression: CRER with Chairman is ex-CEO) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_ChairmanisexCEOModel.doc) label nest rep(p) setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER ChairmanisexCEO CRER_ChairmanisexCEO FirmSize FirmLeverage  i.Region, add(Industry FE, No, Country FE, Yes) drop(i.Region) dec(3) title(Interaction-term regression: CRER with Chairman is ex-CEO) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_ChairmanisexCEOModel.doc) label nest rep(p) setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER ChairmanisexCEO CRER_ChairmanisexCEO FirmSize FirmLeverage  i.Indus i.Region, add(Industry FE, Yes, Country FE, Yes) drop(i.Indus i.Region) dec(3) title(Interaction-term regression: CRER with Chairman is ex-CEO) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_ChairmanisexCEOModel.doc) label nest rep(p) setstars(*@.05, **@.01, ***@.001)]
		*CRER with Chairman is ex-CEO: EU
		asdoc reg TobinQ CRER ChairmanisexCEO CRER_ChairmanisexCEO FirmSize FirmLeverage if Region == 1, add(Industry FE, No) dec(3) title(Interaction-term regression: CRER with Chairman is ex-CEO) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_ChairmanisexCEOModel_EU.doc) label nest rep(p) replace setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER ChairmanisexCEO CRER_ChairmanisexCEO FirmSize FirmLeverage  i.Indus if Region == 1, add(Industry FE, Yes) drop(i.Indus) dec(3) title(Interaction-term regression: CRER with Chairman is ex-CEO) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_ChairmanisexCEOModel_EU.doc) label nest rep(p) setstars(*@.05, **@.01, ***@.001)
		*CRER with Chairman is ex-CEO: US
		asdoc reg TobinQ CRER ChairmanisexCEO CRER_ChairmanisexCEO FirmSize FirmLeverage if Region == 0, add(Industry FE, No) dec(3) title(Interaction-term regression: CRER with Chairman is ex-CEO) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_ChairmanisexCEOModel_US.doc) label nest rep(p) replace setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER ChairmanisexCEO CRER_ChairmanisexCEO FirmSize FirmLeverage  i.Indus if Region == 0, add(Industry FE, Yes) drop(i.Indus) dec(3) title(Interaction-term regression: CRER with Chairman is ex-CEO) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_ChairmanisexCEOModel_US.doc) label nest rep(p) setstars(*@.05, **@.01, ***@.001)

	/************************************\
	  CRER with CEOCompensationLinktoTSR
	\************************************/
		gen CRER_CEOCompensationLinktoTSR = CRER*CEOCompensationLinktoTSR
		asdoc reg TobinQ CRER CEOCompensationLinktoTSR CRER_CEOCompensationLinktoTSR FirmSize FirmLeverage , add(Industry FE, No, Country FE, No) dec(3) title(Interaction-term regression: CRER with CEOCompensationLinktoTSR) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_CEOCompensationLinktoTSRModel.doc) label nest rep(p) replace setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER CEOCompensationLinktoTSR CRER_CEOCompensationLinktoTSR FirmSize FirmLeverage  i.Indus, add(Industry FE, Yes, Country FE, No) drop(i.Indus) dec(3) title(Interaction-term regression: CRER with CEOCompensationLinktoTSR) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_CEOCompensationLinktoTSRModel.doc) label nest rep(p) setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER CEOCompensationLinktoTSR CRER_CEOCompensationLinktoTSR FirmSize FirmLeverage  i.Region, add(Industry FE, No, Country FE, Yes) drop(i.Region) dec(3) title(Interaction-term regression: CRER with CEOCompensationLinktoTSR) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_CEOCompensationLinktoTSRModel.doc) label nest rep(p) setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER CEOCompensationLinktoTSR CRER_CEOCompensationLinktoTSR FirmSize FirmLeverage  i.Indus i.Region, add(Industry FE, Yes, Country FE, Yes) drop(i.Indus i.Region) dec(3) title(Interaction-term regression: CRER with CEOCompensationLinktoTSR) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_CEOCompensationLinktoTSRModel.doc) label nest rep(p) setstars(*@.05, **@.01, ***@.001)]
		*CRER with CEOCompensationLinktoTSR: EU
		asdoc reg TobinQ CRER CEOCompensationLinktoTSR CRER_CEOCompensationLinktoTSR FirmSize FirmLeverage if Region == 1, add(Industry FE, No) dec(3) title(Interaction-term regression: CRER with CEOCompensationLinktoTSR) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_CEOCompensationLinktoTSRModel_EU.doc) label nest rep(p) replace setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER CEOCompensationLinktoTSR CRER_CEOCompensationLinktoTSR FirmSize FirmLeverage  i.Indus if Region == 1, add(Industry FE, Yes) drop(i.Indus) dec(3) title(Interaction-term regression: CRER with CEOCompensationLinktoTSR) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_CEOCompensationLinktoTSRModel_EU.doc) label nest rep(p) setstars(*@.05, **@.01, ***@.001)
		*CRER with CEOCompensationLinktoTSR: US
		asdoc reg TobinQ CRER CEOCompensationLinktoTSR CRER_CEOCompensationLinktoTSR FirmSize FirmLeverage if Region == 0, add(Industry FE, No) dec(3) title(Interaction-term regression: CRER with CEOCompensationLinktoTSR) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_CEOCompensationLinktoTSRModel_US.doc) label nest rep(p) replace setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER CEOCompensationLinktoTSR CRER_CEOCompensationLinktoTSR FirmSize FirmLeverage  i.Indus if Region == 0, add(Industry FE, Yes) drop(i.Indus) dec(3) title(Interaction-term regression: CRER with CEOCompensationLinktoTSR) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_CEOCompensationLinktoTSRModel_US.doc) label nest rep(p) setstars(*@.05, **@.01, ***@.001)

	/*********************\
	  CRER with BoardSize
	\*********************/
		gen CRER_BoardSize = CRER*BoardSize
		asdoc reg TobinQ CRER BoardSize CRER_BoardSize FirmSize FirmLeverage , add(Industry FE, No, Country FE, No) dec(3) title(Interaction-term regression: CRER with BoardSize) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_BoardSizeModel.doc) label nest rep(p) replace setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER BoardSize CRER_BoardSize FirmSize FirmLeverage  i.Indus, add(Industry FE, Yes, Country FE, No) drop(i.Indus) dec(3) title(Interaction-term regression: CRER with BoardSize) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_BoardSizeModel.doc) label nest rep(p) setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER BoardSize CRER_BoardSize FirmSize FirmLeverage  i.Region, add(Industry FE, No, Country FE, Yes) drop(i.Region) dec(3) title(Interaction-term regression: CRER with BoardSize) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_BoardSizeModel.doc) label nest rep(p) setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER BoardSize CRER_BoardSize FirmSize FirmLeverage  i.Indus i.Region, add(Industry FE, Yes, Country FE, Yes) drop(i.Indus i.Region) dec(3) title(Interaction-term regression: CRER with BoardSize) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_BoardSizeModel.doc) label nest rep(p) setstars(*@.05, **@.01, ***@.001)]

	/***********************************\
	  CRER with BoardMemberTermDuration
	\***********************************/
		gen CRER_BoardMemberTermDuration = CRER*BoardMemberTermDuration
		asdoc reg TobinQ CRER BoardMemberTermDuration CRER_BoardMemberTermDuration FirmSize FirmLeverage , add(Industry FE, No, Country FE, No) dec(3) title(Interaction-term regression: CRER with BoardMemberTermDuration) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_BoardMemberTermDurationModel.doc) label nest rep(p) replace setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER BoardMemberTermDuration CRER_BoardMemberTermDuration FirmSize FirmLeverage  i.Indus, add(Industry FE, Yes, Country FE, No) drop(i.Indus) dec(3) title(Interaction-term regression: CRER with BoardMemberTermDuration) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_BoardMemberTermDurationModel.doc) label nest rep(p) setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER BoardMemberTermDuration CRER_BoardMemberTermDuration FirmSize FirmLeverage  i.Region, add(Industry FE, No, Country FE, Yes) drop(i.Region) dec(3) title(Interaction-term regression: CRER with BoardMemberTermDuration) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_BoardMemberTermDurationModel.doc) label nest rep(p) setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER BoardMemberTermDuration CRER_BoardMemberTermDuration FirmSize FirmLeverage  i.Indus i.Region, add(Industry FE, Yes, Country FE, Yes) drop(i.Indus i.Region) dec(3) title(Interaction-term regression: CRER with BoardMemberTermDuration) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_BoardMemberTermDurationModel.doc) label nest rep(p) setstars(*@.05, **@.01, ***@.001)]

	/***********************************\
	  CRER with IndependentBoardMembers
	\***********************************/
		gen CRER_IndependentBoardMembers = CRER*IndependentBoardMembers
		asdoc reg TobinQ CRER IndependentBoardMembers CRER_IndependentBoardMembers FirmSize FirmLeverage , add(Industry FE, No, Country FE, No) dec(3) title(Interaction-term regression: CRER with IndependentBoardMembers) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_IndependentBoardMembersModel.doc) label nest rep(p) replace setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER IndependentBoardMembers CRER_IndependentBoardMembers FirmSize FirmLeverage  i.Indus, add(Industry FE, Yes, Country FE, No) drop(i.Indus) dec(3) title(Interaction-term regression: CRER with IndependentBoardMembers) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_IndependentBoardMembersModel.doc) label nest rep(p) setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER IndependentBoardMembers CRER_IndependentBoardMembers FirmSize FirmLeverage  i.Region, add(Industry FE, No, Country FE, Yes) drop(i.Region) dec(3) title(Interaction-term regression: CRER with IndependentBoardMembers) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_IndependentBoardMembersModel.doc) label nest rep(p) setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER IndependentBoardMembers CRER_IndependentBoardMembers FirmSize FirmLeverage  i.Indus i.Region, add(Industry FE, Yes, Country FE, Yes) drop(i.Indus i.Region) dec(3) title(Interaction-term regression: CRER with IndependentBoardMembers) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_IndependentBoardMembersModel.doc) label nest rep(p) setstars(*@.05, **@.01, ***@.001)]
		
	/************************\
	  CRER with CEO on board
	\************************/
		asdoc reg TobinQ CRER CEOBoardMember ChairmanisexCEO CEOCompensationLinktoTSR CRER_CEOBoardMember CRER_ChairmanisexCEO CRER_CEOCompensationLinktoTSR FirmSize FirmLeverage , add(Industry FE, No, Country FE, No) dec(3) title(Interaction-term regression: CRER with CEO on board) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_OverallModel.doc) label nest rep(p) replace setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER CEOBoardMember ChairmanisexCEO CEOCompensationLinktoTSR CRER_CEOBoardMember CRER_ChairmanisexCEO CRER_CEOCompensationLinktoTSR FirmSize FirmLeverage  i.Indus, add(Industry FE, Yes, Country FE, No) drop(i.Indus) dec(3) title(Interaction-term regression: CRER with CEO on board) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_OverallModel.doc) label nest rep(p) setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER CEOBoardMember ChairmanisexCEO CEOCompensationLinktoTSR CRER_CEOBoardMember CRER_ChairmanisexCEO CRER_CEOCompensationLinktoTSR FirmSize FirmLeverage  i.Region, add(Industry FE, No, Country FE, Yes) drop(i.Region) dec(3) title(Interaction-term regression: CRER with CEO on board) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_OverallModel.doc) label nest rep(p) setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER CEOBoardMember ChairmanisexCEO CEOCompensationLinktoTSR CRER_CEOBoardMember CRER_ChairmanisexCEO CRER_CEOCompensationLinktoTSR FirmSize FirmLeverage  i.Indus i.Region, add(Industry FE, Yes, Country FE, Yes) drop(i.Indus i.Region) dec(3) title(Interaction-term regression: CRER with CEO on board) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_OverallModel.doc) label nest rep(p) setstars(*@.05, **@.01, ***@.001)]
	
		
	/************************\
	  CRER with CEO on IndependentBoardMembers
	\************************
		gen CRER_CEOBoardMember = CRER*CEOBoardMember
		asdoc reg TobinQ CRER CEOBoardMember CRER_CEOBoardMember FirmSize FirmLeverage ROA, add(Industry FE, No, Country FE, No) dec(3) title(Interaction-term regression: CRER with CEO on board) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_CEOBoardMemberModel.doc) label nest replace setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER CEOBoardMember CRER_CEOBoardMember FirmSize FirmLeverage ROA i.Indus, add(Industry FE, Yes, Country FE, No) drop(i.Indus) dec(3) title(Interaction-term regression: CRER with CEO on board) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_CEOBoardMemberModel.doc) label nest setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER CEOBoardMember CRER_CEOBoardMember FirmSize FirmLeverage ROA i.Region, add(Industry FE, No, Country FE, Yes) drop(i.Region) dec(3) title(Interaction-term regression: CRER with CEO on board) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_CEOBoardMemberModel.doc) label nest setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER CEOBoardMember CRER_CEOBoardMember FirmSize FirmLeverage ROA i.Indus i.Region, add(Industry FE, Yes, Country FE, Yes) drop(i.Indus i.Region) dec(3) title(Interaction-term regression: CRER with CEO on board) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_CEOBoardMemberModel.doc) label nest setstars(*@.05, **@.01, ***@.001)]

	/******************************\
	  CRER with Chairman is ex-CEO
	\******************************/
		gen CRER_ChairmanisexCEO = CRER*ChairmanisexCEO
		asdoc reg TobinQ CRER ChairmanisexCEO CRER_ChairmanisexCEO FirmSize FirmLeverage ROA, add(Industry FE, No, Country FE, No) dec(3) title(Interaction-term regression: CRER with Chairman is ex-CEO) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_ChairmanisexCEOModel.doc) label nest replace setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER ChairmanisexCEO CRER_ChairmanisexCEO FirmSize FirmLeverage ROA i.Indus, add(Industry FE, Yes, Country FE, No) drop(i.Indus) dec(3) title(Interaction-term regression: CRER with Chairman is ex-CEO) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_ChairmanisexCEOModel.doc) label nest setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER ChairmanisexCEO CRER_ChairmanisexCEO FirmSize FirmLeverage ROA i.Region, add(Industry FE, No, Country FE, Yes) drop(i.Region) dec(3) title(Interaction-term regression: CRER with Chairman is ex-CEO) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_ChairmanisexCEOModel.doc) label nest setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER ChairmanisexCEO CRER_ChairmanisexCEO FirmSize FirmLeverage ROA i.Indus i.Region, add(Industry FE, Yes, Country FE, Yes) drop(i.Indus i.Region) dec(3) title(Interaction-term regression: CRER with Chairman is ex-CEO) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_ChairmanisexCEOModel.doc) label nest setstars(*@.05, **@.01, ***@.001)]

	/************************************\
	  CRER with CEOCompensationLinktoTSR
	\************************************/
		gen CRER_CEOCompensationLinktoTSR = CRER*CEOCompensationLinktoTSR
		asdoc reg TobinQ CRER CEOCompensationLinktoTSR CRER_CEOCompensationLinktoTSR FirmSize FirmLeverage ROA, add(Industry FE, No, Country FE, No) dec(3) title(Interaction-term regression: CRER with CEOCompensationLinktoTSR) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_CEOCompensationLinktoTSRModel.doc) label nest replace setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER CEOCompensationLinktoTSR CRER_CEOCompensationLinktoTSR FirmSize FirmLeverage ROA i.Indus, add(Industry FE, Yes, Country FE, No) drop(i.Indus) dec(3) title(Interaction-term regression: CRER with CEOCompensationLinktoTSR) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_CEOCompensationLinktoTSRModel.doc) label nest setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER CEOCompensationLinktoTSR CRER_CEOCompensationLinktoTSR FirmSize FirmLeverage ROA i.Region, add(Industry FE, No, Country FE, Yes) drop(i.Region) dec(3) title(Interaction-term regression: CRER with CEOCompensationLinktoTSR) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_CEOCompensationLinktoTSRModel.doc) label nest setstars(*@.05, **@.01, ***@.001)
		asdoc reg TobinQ CRER CEOCompensationLinktoTSR CRER_CEOCompensationLinktoTSR FirmSize FirmLeverage ROA i.Indus i.Region, add(Industry FE, Yes, Country FE, Yes) drop(i.Indus i.Region) dec(3) title(Interaction-term regression: CRER with CEOCompensationLinktoTSR) save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_9_CRER_CEOCompensationLinktoTSRModel.doc) label nest setstars(*@.05, **@.01, ***@.001)]
