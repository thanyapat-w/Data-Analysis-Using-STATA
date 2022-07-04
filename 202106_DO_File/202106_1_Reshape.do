*This do-flies running under stata versions
version 15.0

/********************************************************************************************************************\
  Project Title: Grace's master thesis
  Author       : Thanyapat W. [Grace]
  Start Date   : 01 June 2021
  Last Modified: 03 June 2021
  Description  : Reshape excel from wide to long format
\********************************************************************************************************************/

clear
capture log close
capture cmdlog close
set more off

**********************************************************************************************************************
*Directory: File location
	cd "D:\Master Thesis\202106_DataAnalysis"
*log: record everything done in stata.
	log using "D:\Master Thesis\202106_DataAnalysis\202106_LOG_File\202106_1_Reshape.log", text append
*cmdlog: saves every command used in stata.
	cmdlog using "D:\Master Thesis\202106_DataAnalysis\202106_LOGCMD_File\202106_1_Reshapecmd.log", append
**********************************************************************************************************************

/*******************\
  Reshape Variables
\*******************/
	/********************************************************************************************************************\
	  Variables:
		Identifier Name Country Sector 
		
		CashShortTerm ARNet ARGross PDA TotalReceivablesNet TotalInventory PrepaidExpenses OtherCurrentAssetsTotal 
		PPETotalGross BuildingGross LandGross MachineryGross ConstructionGross LeasesGross OtherPPEGross OtherPPENet 
		PPETotalNet	ADTotal GoodwillNet GoodwillGross AccuGoodwillAmortization IntangiblesNet IntangiblesGross 
		AccuIntangibleAmortization NoteReceivableLongTerm OtherLongTermAssetsTotal TotalAssetsReported 
		TotalDebt DeferredIncomeTaxLTLiability TotalLiabilities NetIncomeAfterTaxes BookValuePershare
		BookValuePershareTotalEquity CompanyMarketCap TotalEquity TotalDebtToTotalEquity 
		
		BoardSize BoardAttendance BoardStructureType BoardBackgroundandSkills BoardGenderDiversityPercent 
		BoardSpecificSkillsPercent BoardMemberAffiliations BoardIndividualReelection BoardMemberMembershipLimits 
		BoardMemberTermDuration BoardMemberCompensationUSD FemaleonBoard NumberofBoardMeetings AverageBoardTenure 
		NonExecutiveBoardMembers IndependentBoardMembers CEOBoardMember CEOChairmanSeparation CEOCompensationLinktoTSR 
		ChairmanisexCEO
	\********************************************************************************************************************/

	/****************\
	  EU_US_Academic	
	\****************/
		*Import that file with specific sheet into STATA
			import excel "D:\Master Thesis\202106_DataAnalysis\202106_RawExcel_File\202106_EUS_Academic.xlsx", sheet("EUS_Academic") firstrow
		*reshape it choose the Variables name before year then choose IdentifierRIC then the year in header will separate into Fiscal Year
			reshape long CashShortTerm ARNet ARGross PDA TotalReceivablesNet TotalInventory PrepaidExpenses OtherCurrentAssetsTotal PPETotalGross BuildingGross LandGross MachineryGross ConstructionGross LeasesGross OtherPPEGross OtherPPENet PPETotalNet ADTotal GoodwillNet GoodwillGross AccuGoodwillAmortization IntangiblesNet IntangiblesGross AccuIntangibleAmortization NoteReceivableLongTerm OtherLongTermAssetsTotal TotalAssetsReported TotalDebt DeferredIncomeTaxLTLiability TotalLiabilities NetIncomeAfterTaxes BookValuePershare BookValuePershareTotalEquity CompanyMarketCap TotalEquity TotalDebtToTotalEquity BoardSize BoardAttendance BoardStructureType BoardBackgroundandSkills BoardGenderDiversityPercent BoardSpecificSkillsPercent BoardMemberAffiliations BoardIndividualReelection BoardMemberMembershipLimits BoardMemberTermDuration BoardMemberCompensationUSD FemaleonBoard NumberofBoardMeetings AverageBoardTenure NonExecutiveBoardMembers IndependentBoardMembers CEOBoardMember CEOChairmanSeparation CEOCompensationLinktoTSR ChairmanisexCEO, i(Identifier) j(FiscalYear)
		*Save Dataset as dta file
			save "D:\Master Thesis\202106_DataAnalysis\202106_DTA_File\202106_EUS_Academic.dta", replace
		clear

	/**********************\
	  EU_US_BasicMaterials	
	\**********************/
		*Import that file with specific sheet into STATA
			import excel "D:\Master Thesis\202106_DataAnalysis\202106_RawExcel_File\202106_EUS_BasicMaterials.xlsx", sheet("EUS_BasicMaterials") firstrow
		*reshape it choose the Variables name before year then choose IdentifierRIC then the year in header will separate into Fiscal Year
			reshape long CashShortTerm ARNet ARGross PDA TotalReceivablesNet TotalInventory PrepaidExpenses OtherCurrentAssetsTotal PPETotalGross BuildingGross LandGross MachineryGross ConstructionGross LeasesGross OtherPPEGross OtherPPENet PPETotalNet ADTotal GoodwillNet GoodwillGross AccuGoodwillAmortization IntangiblesNet IntangiblesGross AccuIntangibleAmortization NoteReceivableLongTerm OtherLongTermAssetsTotal TotalAssetsReported TotalDebt DeferredIncomeTaxLTLiability TotalLiabilities NetIncomeAfterTaxes BookValuePershare BookValuePershareTotalEquity CompanyMarketCap TotalEquity TotalDebtToTotalEquity BoardSize BoardAttendance BoardStructureType BoardBackgroundandSkills BoardGenderDiversityPercent BoardSpecificSkillsPercent BoardMemberAffiliations BoardIndividualReelection BoardMemberMembershipLimits BoardMemberTermDuration BoardMemberCompensationUSD FemaleonBoard NumberofBoardMeetings AverageBoardTenure NonExecutiveBoardMembers IndependentBoardMembers CEOBoardMember CEOChairmanSeparation CEOCompensationLinktoTSR ChairmanisexCEO, i(Identifier) j(FiscalYear)
		*Save Dataset as dta file
			save "D:\Master Thesis\202106_DataAnalysis\202106_DTA_File\202106_EUS_BasicMaterials.dta", replace
		clear

	/*************************\
	  EU_US_ConsumerCyclicals	
	\*************************/
		*Import that file with specific sheet into STATA
			import excel "D:\Master Thesis\202106_DataAnalysis\202106_RawExcel_File\202106_EUS_ConsumerCyclicals.xlsx", sheet("EUS_ConsumerCyclicals") firstrow
		*reshape it choose the Variables name before year then choose IdentifierRIC then the year in header will separate into Fiscal Year
			reshape long CashShortTerm ARNet ARGross PDA TotalReceivablesNet TotalInventory PrepaidExpenses OtherCurrentAssetsTotal PPETotalGross BuildingGross LandGross MachineryGross ConstructionGross LeasesGross OtherPPEGross OtherPPENet PPETotalNet ADTotal GoodwillNet GoodwillGross AccuGoodwillAmortization IntangiblesNet IntangiblesGross AccuIntangibleAmortization NoteReceivableLongTerm OtherLongTermAssetsTotal TotalAssetsReported TotalDebt DeferredIncomeTaxLTLiability TotalLiabilities NetIncomeAfterTaxes BookValuePershare BookValuePershareTotalEquity CompanyMarketCap TotalEquity TotalDebtToTotalEquity BoardSize BoardAttendance BoardStructureType BoardBackgroundandSkills BoardGenderDiversityPercent BoardSpecificSkillsPercent BoardMemberAffiliations BoardIndividualReelection BoardMemberMembershipLimits BoardMemberTermDuration BoardMemberCompensationUSD FemaleonBoard NumberofBoardMeetings AverageBoardTenure NonExecutiveBoardMembers IndependentBoardMembers CEOBoardMember CEOChairmanSeparation CEOCompensationLinktoTSR ChairmanisexCEO, i(Identifier) j(FiscalYear)
		*Save Dataset as dta file
			save "D:\Master Thesis\202106_DataAnalysis\202106_DTA_File\202106_EUS_ConsumerCyclicals.dta", replace
		clear

	/****************************\
	  EU_US_ConsumerNonCyclicals	
	\****************************/
		*Import that file with specific sheet into STATA
			import excel "D:\Master Thesis\202106_DataAnalysis\202106_RawExcel_File\202106_EUS_ConsumerNonCyclicals.xlsx", sheet("EUS_ConsumerNonCyclicals") firstrow
		*reshape it choose the Variables name before year then choose IdentifierRIC then the year in header will separate into Fiscal Year
			reshape long CashShortTerm ARNet ARGross PDA TotalReceivablesNet TotalInventory PrepaidExpenses OtherCurrentAssetsTotal PPETotalGross BuildingGross LandGross MachineryGross ConstructionGross LeasesGross OtherPPEGross OtherPPENet PPETotalNet ADTotal GoodwillNet GoodwillGross AccuGoodwillAmortization IntangiblesNet IntangiblesGross AccuIntangibleAmortization NoteReceivableLongTerm OtherLongTermAssetsTotal TotalAssetsReported TotalDebt DeferredIncomeTaxLTLiability TotalLiabilities NetIncomeAfterTaxes BookValuePershare BookValuePershareTotalEquity CompanyMarketCap TotalEquity TotalDebtToTotalEquity BoardSize BoardAttendance BoardStructureType BoardBackgroundandSkills BoardGenderDiversityPercent BoardSpecificSkillsPercent BoardMemberAffiliations BoardIndividualReelection BoardMemberMembershipLimits BoardMemberTermDuration BoardMemberCompensationUSD FemaleonBoard NumberofBoardMeetings AverageBoardTenure NonExecutiveBoardMembers IndependentBoardMembers CEOBoardMember CEOChairmanSeparation CEOCompensationLinktoTSR ChairmanisexCEO, i(Identifier) j(FiscalYear)
		*Save Dataset as dta file
			save "D:\Master Thesis\202106_DataAnalysis\202106_DTA_File\202106_EUS_ConsumerNonCyclicals.dta", replace
		clear

	/**************\
	  EU_US_Energy	
	\**************/
		*Import that file with specific sheet into STATA
			import excel "D:\Master Thesis\202106_DataAnalysis\202106_RawExcel_File\202106_EUS_Energy.xlsx", sheet("EUS_Energy") firstrow
		*reshape it choose the Variables name before year then choose IdentifierRIC then the year in header will separate into Fiscal Year
			reshape long CashShortTerm ARNet ARGross PDA TotalReceivablesNet TotalInventory PrepaidExpenses OtherCurrentAssetsTotal PPETotalGross BuildingGross LandGross MachineryGross ConstructionGross LeasesGross OtherPPEGross OtherPPENet PPETotalNet ADTotal GoodwillNet GoodwillGross AccuGoodwillAmortization IntangiblesNet IntangiblesGross AccuIntangibleAmortization NoteReceivableLongTerm OtherLongTermAssetsTotal TotalAssetsReported TotalDebt DeferredIncomeTaxLTLiability TotalLiabilities NetIncomeAfterTaxes BookValuePershare BookValuePershareTotalEquity CompanyMarketCap TotalEquity TotalDebtToTotalEquity BoardSize BoardAttendance BoardStructureType BoardBackgroundandSkills BoardGenderDiversityPercent BoardSpecificSkillsPercent BoardMemberAffiliations BoardIndividualReelection BoardMemberMembershipLimits BoardMemberTermDuration BoardMemberCompensationUSD FemaleonBoard NumberofBoardMeetings AverageBoardTenure NonExecutiveBoardMembers IndependentBoardMembers CEOBoardMember CEOChairmanSeparation CEOCompensationLinktoTSR ChairmanisexCEO, i(Identifier) j(FiscalYear)
		*Save Dataset as dta file
			save "D:\Master Thesis\202106_DataAnalysis\202106_DTA_File\202106_EUS_Energy.dta", replace
		clear

	/*****************\
	  EU_US_Financial	
	\*****************/
		*Import that file with specific sheet into STATA
			import excel "D:\Master Thesis\202106_DataAnalysis\202106_RawExcel_File\202106_EUS_Financials.xlsx", sheet("EUS_Financials") firstrow
		*reshape it choose the Variables name before year then choose IdentifierRIC then the year in header will separate into Fiscal Year
			reshape long CashShortTerm ARNet ARGross PDA TotalReceivablesNet TotalInventory PrepaidExpenses OtherCurrentAssetsTotal PPETotalGross BuildingGross LandGross MachineryGross ConstructionGross LeasesGross OtherPPEGross OtherPPENet PPETotalNet ADTotal GoodwillNet GoodwillGross AccuGoodwillAmortization IntangiblesNet IntangiblesGross AccuIntangibleAmortization NoteReceivableLongTerm OtherLongTermAssetsTotal TotalAssetsReported TotalDebt DeferredIncomeTaxLTLiability TotalLiabilities NetIncomeAfterTaxes BookValuePershare BookValuePershareTotalEquity CompanyMarketCap TotalEquity TotalDebtToTotalEquity BoardSize BoardAttendance BoardStructureType BoardBackgroundandSkills BoardGenderDiversityPercent BoardSpecificSkillsPercent BoardMemberAffiliations BoardIndividualReelection BoardMemberMembershipLimits BoardMemberTermDuration BoardMemberCompensationUSD FemaleonBoard NumberofBoardMeetings AverageBoardTenure NonExecutiveBoardMembers IndependentBoardMembers CEOBoardMember CEOChairmanSeparation CEOCompensationLinktoTSR ChairmanisexCEO, i(Identifier) j(FiscalYear)
		*Save Dataset as dta file
			save "D:\Master Thesis\202106_DataAnalysis\202106_DTA_File\202106_EUS_Financials.dta", replace
		clear

	/******************\
	  EU_US_Healthcare	
	\******************/
		*Import that file with specific sheet into STATA
			import excel "D:\Master Thesis\202106_DataAnalysis\202106_RawExcel_File\202106_EUS_Healthcare.xlsx", sheet("EUS_Healthcare") firstrow
		*reshape it choose the Variables name before year then choose IdentifierRIC then the year in header will separate into Fiscal Year
			reshape long CashShortTerm ARNet ARGross PDA TotalReceivablesNet TotalInventory PrepaidExpenses OtherCurrentAssetsTotal PPETotalGross BuildingGross LandGross MachineryGross ConstructionGross LeasesGross OtherPPEGross OtherPPENet PPETotalNet ADTotal GoodwillNet GoodwillGross AccuGoodwillAmortization IntangiblesNet IntangiblesGross AccuIntangibleAmortization NoteReceivableLongTerm OtherLongTermAssetsTotal TotalAssetsReported TotalDebt DeferredIncomeTaxLTLiability TotalLiabilities NetIncomeAfterTaxes BookValuePershare BookValuePershareTotalEquity CompanyMarketCap TotalEquity TotalDebtToTotalEquity BoardSize BoardAttendance BoardStructureType BoardBackgroundandSkills BoardGenderDiversityPercent BoardSpecificSkillsPercent BoardMemberAffiliations BoardIndividualReelection BoardMemberMembershipLimits BoardMemberTermDuration BoardMemberCompensationUSD FemaleonBoard NumberofBoardMeetings AverageBoardTenure NonExecutiveBoardMembers IndependentBoardMembers CEOBoardMember CEOChairmanSeparation CEOCompensationLinktoTSR ChairmanisexCEO, i(Identifier) j(FiscalYear)
		*Save Dataset as dta file
			save "D:\Master Thesis\202106_DataAnalysis\202106_DTA_File\202106_EUS_Healthcare.dta", replace
		clear

	/*******************\
	  EU_US_Industrials
	\*******************/
		*Import that file with specific sheet into STATA
			import excel "D:\Master Thesis\202106_DataAnalysis\202106_RawExcel_File\202106_EUS_Industrials.xlsx", sheet("EUS_Industrials") firstrow
		*reshape it choose the Variables name before year then choose IdentifierRIC then the year in header will separate into Fiscal Year
			reshape long CashShortTerm ARNet ARGross PDA TotalReceivablesNet TotalInventory PrepaidExpenses OtherCurrentAssetsTotal PPETotalGross BuildingGross LandGross MachineryGross ConstructionGross LeasesGross OtherPPEGross OtherPPENet PPETotalNet ADTotal GoodwillNet GoodwillGross AccuGoodwillAmortization IntangiblesNet IntangiblesGross AccuIntangibleAmortization NoteReceivableLongTerm OtherLongTermAssetsTotal TotalAssetsReported TotalDebt DeferredIncomeTaxLTLiability TotalLiabilities NetIncomeAfterTaxes BookValuePershare BookValuePershareTotalEquity CompanyMarketCap TotalEquity TotalDebtToTotalEquity BoardSize BoardAttendance BoardStructureType BoardBackgroundandSkills BoardGenderDiversityPercent BoardSpecificSkillsPercent BoardMemberAffiliations BoardIndividualReelection BoardMemberMembershipLimits BoardMemberTermDuration BoardMemberCompensationUSD FemaleonBoard NumberofBoardMeetings AverageBoardTenure NonExecutiveBoardMembers IndependentBoardMembers CEOBoardMember CEOChairmanSeparation CEOCompensationLinktoTSR ChairmanisexCEO, i(Identifier) j(FiscalYear)
		*Save Dataset as dta file
			save "D:\Master Thesis\202106_DataAnalysis\202106_DTA_File\202106_EUS_Industrials.dta", replace
		clear

	/******************\
	  EU_US_Technology
	\******************/
		*Import that file with specific sheet into STATA
			import excel "D:\Master Thesis\202106_DataAnalysis\202106_RawExcel_File\202106_EUS_Technology.xlsx", sheet("EUS_Technology") firstrow
		*reshape it choose the Variables name before year then choose IdentifierRIC then the year in header will separate into Fiscal Year
			reshape long CashShortTerm ARNet ARGross PDA TotalReceivablesNet TotalInventory PrepaidExpenses OtherCurrentAssetsTotal PPETotalGross BuildingGross LandGross MachineryGross ConstructionGross LeasesGross OtherPPEGross OtherPPENet PPETotalNet ADTotal GoodwillNet GoodwillGross AccuGoodwillAmortization IntangiblesNet IntangiblesGross AccuIntangibleAmortization NoteReceivableLongTerm OtherLongTermAssetsTotal TotalAssetsReported TotalDebt DeferredIncomeTaxLTLiability TotalLiabilities NetIncomeAfterTaxes BookValuePershare BookValuePershareTotalEquity CompanyMarketCap TotalEquity TotalDebtToTotalEquity BoardSize BoardAttendance BoardStructureType BoardBackgroundandSkills BoardGenderDiversityPercent BoardSpecificSkillsPercent BoardMemberAffiliations BoardIndividualReelection BoardMemberMembershipLimits BoardMemberTermDuration BoardMemberCompensationUSD FemaleonBoard NumberofBoardMeetings AverageBoardTenure NonExecutiveBoardMembers IndependentBoardMembers CEOBoardMember CEOChairmanSeparation CEOCompensationLinktoTSR ChairmanisexCEO, i(Identifier) j(FiscalYear)
		*Save Dataset as dta file
			save "D:\Master Thesis\202106_DataAnalysis\202106_DTA_File\202106_EUS_Technology.dta", replace
		clear

	/*****************\
	  EU_US_Utilities
	\*****************/
		*Import that file with specific sheet into STATA
			import excel "D:\Master Thesis\202106_DataAnalysis\202106_RawExcel_File\202106_EUS_Utilities.xlsx", sheet("EUS_Utilities") firstrow
		*reshape it choose the Variables name before year then choose IdentifierRIC then the year in header will separate into Fiscal Year
			reshape long CashShortTerm ARNet ARGross PDA TotalReceivablesNet TotalInventory PrepaidExpenses OtherCurrentAssetsTotal PPETotalGross BuildingGross LandGross MachineryGross ConstructionGross LeasesGross OtherPPEGross OtherPPENet PPETotalNet ADTotal GoodwillNet GoodwillGross AccuGoodwillAmortization IntangiblesNet IntangiblesGross AccuIntangibleAmortization NoteReceivableLongTerm OtherLongTermAssetsTotal TotalAssetsReported TotalDebt DeferredIncomeTaxLTLiability TotalLiabilities NetIncomeAfterTaxes BookValuePershare BookValuePershareTotalEquity CompanyMarketCap TotalEquity TotalDebtToTotalEquity BoardSize BoardAttendance BoardStructureType BoardBackgroundandSkills BoardGenderDiversityPercent BoardSpecificSkillsPercent BoardMemberAffiliations BoardIndividualReelection BoardMemberMembershipLimits BoardMemberTermDuration BoardMemberCompensationUSD FemaleonBoard NumberofBoardMeetings AverageBoardTenure NonExecutiveBoardMembers IndependentBoardMembers CEOBoardMember CEOChairmanSeparation CEOCompensationLinktoTSR ChairmanisexCEO, i(Identifier) j(FiscalYear)
		*Save Dataset as dta file
			save "D:\Master Thesis\202106_DataAnalysis\202106_DTA_File\202106_EUS_Utilities.dta", replace
		clear
