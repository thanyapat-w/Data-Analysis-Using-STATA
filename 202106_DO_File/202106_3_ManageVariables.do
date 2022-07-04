*This do-flies running under stata versions
version 15.0

/********************************************************************************************************************\
  Project Title: Grace's master thesis
  Author       : Thanyapat W. [Grace]
  Start Date   : 01 June 2021
  Last Modified: 03 June 2021
  Description  : Manage variables
					- Label and rename existing variables
					- Generate varibles and add Label use for regression
\********************************************************************************************************************/

clear
capture log close
capture cmdlog close
set more off

**********************************************************************************************************************
*Directory: File location
	cd "D:\Master Thesis\202106_DataAnalysis"
*log: record everything done in stata.
	log using "D:\Master Thesis\202106_DataAnalysis\202106_LOG_File\202106_3_ManageVariables.log", text append
*cmdlog: saves every command used in stata.
	cmdlog using "D:\Master Thesis\202106_DataAnalysis\202106_LOGCMD_File\202106_3_ManageVariablescmd.log", append
**********************************************************************************************************************

/***********************************************************************************************************\
 Now I am going to import the dataset: 202106_EUS
 Then I will rename and label to the variables that already exist
\***********************************************************************************************************/
	use "D:\Master Thesis\202106_DataAnalysis\202106_DTA_File\202106_EUS.dta"
	
	/**********************************\
	  Label and rename Exist variables	
	\**********************************/	
		label variable Identifier "Identifier (RIC)"
		label variable FiscalYear "Fiscal Year"
		label variable Name "Company Name"
		label variable Country "Country of Headquarters"
		label variable Sector "TRBC Economic Sector Name"
		label variable CashShortTerm "Cash and Short Term Investments"
		label variable ARNet "Accounts Receivable - Trade, Net"
		label variable ARGross "Accounts Receivable - Trade, Gross"
		label variable PDA "Provision for Doubtful Accounts"
		label variable TotalReceivablesNet "Total Receivables, Net"
		label variable TotalInventory "Total Inventory"
		label variable PrepaidExpenses "Prepaid Expenses"
		label variable OtherCurrentAssetsTotal "Other Current Assets, Total"
		label variable PPETotalGross "Property, Plant And Equipment, Total - Gross"
		label variable BuildingGross "Building - Gross"
		label variable LandGross "Land/Improvements - Gross"
		label variable MachineryGross "Machinery/Equipment - Gross"
		label variable ConstructionGross "Construction in Progress - Gross"
		label variable LeasesGross "Leases - Gross"
		label variable OtherPPEGross "Other Property/Plant/Equipment - Gross"
		label variable OtherPPENet "Other Property, Plant, Equipment - Net"
		label variable PPETotalNet "Property, Plant And Equipment, Total - Net"
		label variable ADTotal "Accumulated Depreciation, Total"
		label variable GoodwillNet "Goodwill, Net"
		label variable GoodwillGross "Goodwill - Gross"
		label variable AccuGoodwillAmortization "Accumulated Goodwill Amortization"
		label variable IntangiblesNet "Intangibles, Net"
		label variable IntangiblesGross "Intangibles, Gross"
		label variable AccuIntangibleAmortization "Accumulated Intangible Amortization"
		label variable NoteReceivableLongTerm "Note Receivable - Long Term"
		label variable OtherLongTermAssetsTotal "Other Long Term Assets, Total"
		label variable TotalAssetsReported "Total Assets, Reported"
		rename TotalAssetsReported TotalAssets
		label variable TotalDebt "Total Debt"
		label variable DeferredIncomeTaxLTLiability "Deferred Income Tax - LT Liability"
		label variable TotalLiabilities "Total Liabilities"
		label variable NetIncomeAfterTaxes "Net Income After Taxes"
		label variable BookValuePershare "Book Value Per Share"
		label variable BookValuePershareTotalEquity "Book Value Per Share, Total Equity"
		label variable CompanyMarketCap "Company Market Cap"
		label variable TotalEquity "Total Equity"
		label variable TotalDebtToTotalEquity "Total Debt to Total Equity"
		label variable BoardSize "Board Size"
		label variable BoardAttendance "Board Attendance"
		label variable BoardStructureType "Board Structure Type"
		label variable BoardBackgroundandSkills "Board Background and Skills"
		label variable BoardGenderDiversityPercent "Board Gender Diversity"
		rename BoardGenderDiversityPercent BoardGenderDiversity
		label variable BoardSpecificSkillsPercent "Board Specific Skills"
		rename BoardSpecificSkillsPercent BoardSpecificSkills
		label variable BoardMemberAffiliations "Board Member Affiliations"
		label variable BoardIndividualReelection "Board Individual Re-election"
		label variable BoardMemberMembershipLimits "Board Member Membership Limits"
		label variable BoardMemberTermDuration "Board Member Term Duration"
		label variable BoardMemberCompensationUSD "Board Member Compensation"
		label variable FemaleonBoard "Female on Board"
		label variable NumberofBoardMeetings "Number of Board Meetings"
		label variable AverageBoardTenure "Average Board Tenure"
		label variable NonExecutiveBoardMembers "Non-Executive Board Members"
		label variable IndependentBoardMembers "Independent Board Members"
		label variable CEOBoardMember "1 = The CEO is a board member"
		label variable CEOChairmanSeparation "1 = CEO is the chairman"
		label variable CEOCompensationLinktoTSR "1 = the CEO's compensation linked to total shareholder return (TSR)"
		label variable ChairmanisexCEO "1 =  Chairman was CEO in previous years"
	save "D:\Master Thesis\202106_DataAnalysis\202106_DTA_File\202106_EUS_dataset.dta", replace
	clear
/***********************************************************************************************************\
 Next I will create new variables use for regression
\***********************************************************************************************************/
	clear
	use "D:\Master Thesis\202106_DataAnalysis\202106_DTA_File\202106_EUS_dataset.dta"
	*Before I go further I will check missing value in each variables and consider to replace some with 0 or drop by using
		mdesc
		
	/************\
	  Drop Value
	\************/
		*Due to the definition define in Datastream
		*Provision for Doubtful Accounts is established as a contra account to receivables and expressed in a negative figure
			keep if PDA < 0 | PDA == .
		*Accumulated Depreciation, Total: Due to the nature of Accumulated Depreciation, Total as a contra account to assets, it is always a negative figure.
			keep if ADTotal < 0 | ADTotal == .
		*Accumulated Goodwill Amortization: Due to the nature of Accumulated Goodwill Amortization [AAGA] as a contra account to assets, it is always a negative figure. 
			keep if AccuGoodwillAmortization < 0 | AccuGoodwillAmortization == .
		*Due to the nature of Accumulated Intangible Amortization as a contra account to assets, Accumulated Intangible Amortization [AAMT] is always a negative figure.
			keep if AccuIntangibleAmortization < 0 | AccuIntangibleAmortization == .
	
	/*******************\
	 Dependent Variables
	\*******************/
		*Note that book value of equity = TotalEquity
		*1.The main dependent variable is Tobin's Q
			*After running, I found that STATA will not calculate missing value
				*ref. https://stats.idre.ucla.edu/stata/modules/missing-values/
				*"Whenever you add, subtract, multiply, divide, etc., values that involve missing a missing value, the result is missing."
			*Therefore, I will ged rid off missing value by drop or replace it with "0"
				*Since Total assets should not equal to "0" or . 
				*Therefore, I will drop if TotalAssets == . | TotalAssets == 0 to avoid error (Total asset use as Denominator in many equation)
					drop if TotalAssets == . | TotalAssets == 0
				*Drop MarketCap if CompanyMarketCap == . 
					drop if CompanyMarketCap == . | CompanyMarketCap == 0
				*Drop TotalEquity if TotalEquity == . | TotalEquity == 0 to avoid error (Total equity use as denominator in MB and Leverage)
					drop if TotalEquity == . | TotalEquity == 0
				*I will replace DeferredTax with 0 since DeferredTaxcan be 0
					replace DeferredIncomeTaxLTLiability = 0 if missing(DeferredIncomeTaxLTLiability)
			gen TobinQ = (TotalAssets + CompanyMarketCap - TotalEquity - DeferredIncomeTaxLTLiability) / TotalAssets
		*2.For sensitivity check I will use M/B ratio
			gen MB = CompanyMarketCap / TotalEquity
	/*******************\
	 Inpendent Variables
	\*******************/
		*1.Corporate Real Estate Ratio: CRER
			drop if PPETotalNet == . | PPETotalNet > TotalAssets
			drop if PPETotalGross == . | PPETotalGross > TotalAssets
			*Same as above I will replace "0" for all CRE varibles
				replace BuildingGross = 0 if missing(BuildingGross)
				replace LandGross = 0 if missing(LandGross)
				replace MachineryGross = 0 if missing(MachineryGross)
				replace ConstructionGross = 0 if missing(ConstructionGross)
				replace LeasesGross = 0 if missing(LeasesGross)
				replace OtherPPEGross = 0 if missing(OtherPPEGross)
				replace ADTotal = 0 if missing(ADTotal)
				*gen CRE = PPE_Total_Net_check - Equipment_Gross - NaturalResources_Gross - OtherPPE_Gross - AccDepreciation_Total 
				gen CRE = BuildingGross + LandGross + ConstructionGross
				drop if CRE <=0
				drop if CRE > TotalAssets
			*Generate Total assets gross
				replace CashShortTerm = 0 if missing(CashShortTerm)
				replace ARGross = 0 if missing(ARGross)
				replace TotalReceivablesNet = 0 if missing(TotalReceivablesNet)
				replace TotalInventory = 0 if missing(TotalInventory)
				replace PrepaidExpenses = 0 if missing(PrepaidExpenses)
				replace OtherCurrentAssetsTotal = 0 if missing(OtherCurrentAssetsTotal)
				replace PPETotalGross = 0 if missing(PPETotalGross)
				replace GoodwillGross = 0 if missing(GoodwillGross)
				replace IntangiblesGross = 0 if missing(IntangiblesGross)
				replace NoteReceivableLongTerm = 0 if missing(NoteReceivableLongTerm)
				replace OtherLongTermAssetsTotal = 0 if missing(OtherLongTermAssetsTotal)
				gen TotalAssetGross = CashShortTerm + ARGross + TotalReceivablesNet + TotalInventory + PrepaidExpenses + OtherCurrentAssetsTotal + PPETotalGross + GoodwillGross + IntangiblesGross + NoteReceivableLongTerm + OtherLongTermAssetsTotal
			*CRER using total assets gross
				gen CRER = CRE / TotalAssetGross
				drop if CRER == 1
				drop if CRER < 0.009
	/*****************\
	 Control Variables
	\*****************/
		*1.Control for firm size
			gen FirmSize = log(TotalAssets)
		*2.Control for firm leverage
			*I will drop missing TotalDebt
				drop if TotalDebt == .
			gen FirmLeverage = TotalDebt/TotalEquity
		*3.Control for ROA
			*I will drop missing NetIncome
				drop if NetIncome == .
			*Then I will generate new ROA
			gen ROA = NetIncome/TotalAssets
/***********************************************************************************************************\
 Drop variables
\***********************************************************************************************************/
	/****************\
	 Board variables
	\****************/
		drop if ChairmanisexCEO == .
		drop if CEOBoardMember == .
		drop if Sector == "Academic & Educational Services"
		save "D:\Master Thesis\202106_DataAnalysis\202106_DTA_File\202106_EUS_dataset1.dta", replace	
		clear
	/*****************\
	 Others variables
	\*****************/
		use "D:\Master Thesis\202106_DataAnalysis\202106_DTA_File\202106_EUS_dataset1.dta"
		*Create sector of industries as int by change sector from string to int
			egen Indus = group(Sector)
		*Create Unique FirmID as int by change FirmID from String int
			egen FirmID = group(Identifier Name Indus)
		*Create NumFirm to measure how many firm in each industries
			*use _n to see how many data of that firm in each year
			bysort FirmID: gen NumFirm = _n
		*Create region dummy
			gen Region = 0
			replace Region = 1 if Country != "United States of America"
	xtset FirmID FiscalYear
	save "D:\Master Thesis\202106_DataAnalysis\202106_DTA_File\202106_EUS_dataset.dta", replace
	export excel using "D:\Master Thesis\202106_DataAnalysis\202106_EUS_dataset.xlsx", sheet("Data")replace firstrow(variables)
	export excel Identifier FiscalYear Name Country Sector CashShortTerm PPETotalGross BuildingGross LandGross MachineryGross ConstructionGross LeasesGross OtherPPEGross OtherPPENet PPETotalNet TotalAssets TotalDebt DeferredIncomeTaxLTLiability TotalLiabilities NetIncomeAfterTaxes CompanyMarketCap TotalEquity TotalDebtToTotalEquity BoardSize BoardAttendance BoardStructureType BoardBackgroundandSkills BoardGenderDiversity BoardSpecificSkills BoardMemberAffiliations BoardIndividualReelection BoardMemberMembershipLimits BoardMemberTermDuration BoardMemberCompensationUSD NumberofBoardMeetings AverageBoardTenure NonExecutiveBoardMembers IndependentBoardMembers CEOBoardMember CEOChairmanSeparation CEOCompensationLinktoTSR ChairmanisexCEO TobinQ CRE TotalAssetGross CRER FirmSize FirmLeverage Indus FirmID Region using "D:\To George\Grace_dataset.xlsx", sheet("Data") sheetreplace firstrow(variables)
