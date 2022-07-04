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
	log using "D:\Master Thesis\202106_DataAnalysis\202106_LOG_File\202106_5_CRERdistribution.log", text append
*cmdlog: saves every command used in stata.
	cmdlog using "D:\Master Thesis\202106_DataAnalysis\202106_LOGCMD_File\202106_5_CRERdistributioncmd.log", append
**********************************************************************************************************************

/***********************************************************************************************************\
 Corporate real estate ownership ratios by industry and country
\***********************************************************************************************************/
	use "D:\Master Thesis\202106_DataAnalysis\202106_DTA_File\202106_EUS_dataset.dta"
	asdoc, row(\i, \i, \i, Overall, \i, \i, \i,  US, \i, \i, \i, EU, \i) title(Corporate real estate ownership ratios by industry and country), save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_5_CRERdistribution.doc) replace
	asdoc, row(\i, Mean, SD, Min, Max, Mean, SD, Min, Max, Mean, SD, Min, Max)
	*Basic Materials
		*Overall
		sum CRER if Sector == "Basic Materials"
		asdoc, accum(`r(mean)', `r(sd)', `r(min)', `r(max)')
		*US
		sum CRER if Sector == "Basic Materials" & Country == "United States of America"
		asdoc, accum(`r(mean)', `r(sd)', `r(min)', `r(max)')
		*EU
		sum CRER if Sector == "Basic Materials" & Country != "United States of America"
		asdoc, accum(`r(mean)', `r(sd)', `r(min)', `r(max)')
		asdoc, row(Basic Materials, $accum) dec(2)
	*Consumer Cyclicals
		*Overall
		sum CRER if Sector == "Consumer Cyclicals"
		asdoc, accum(`r(mean)', `r(sd)', `r(min)', `r(max)')
		*US
		sum CRER if Sector == "Consumer Cyclicals" & Country == "United States of America"
		asdoc, accum(`r(mean)', `r(sd)', `r(min)', `r(max)')
		*EU
		sum CRER if Sector == "Consumer Cyclicals" & Country != "United States of America"
		asdoc, accum(`r(mean)', `r(sd)', `r(min)', `r(max)')
		asdoc, row(Consumer Cyclicals, $accum) dec(2)
	*Consumer Non-Cyclicals
		*Overall
		sum CRER if Sector == "Consumer Non-Cyclicals"
		asdoc, accum(`r(mean)', `r(sd)', `r(min)', `r(max)')
		*US
		sum CRER if Sector == "Consumer Non-Cyclicals" & Country == "United States of America"
		asdoc, accum(`r(mean)', `r(sd)', `r(min)', `r(max)')
		*EU
		sum CRER if Sector == "Consumer Non-Cyclicals" & Country != "United States of America"
		asdoc, accum(`r(mean)', `r(sd)', `r(min)', `r(max)')
		asdoc, row(Consumer Non-Cyclicals, $accum) dec(2)
	*Energy
		*Overall
		sum CRER if Sector == "Energy"
		asdoc, accum(`r(mean)', `r(sd)', `r(min)', `r(max)')
		*US
		sum CRER if Sector == "Energy" & Country == "United States of America"
		asdoc, accum(`r(mean)', `r(sd)', `r(min)', `r(max)')
		*EU
		sum CRER if Sector == "Energy" & Country != "United States of America"
		asdoc, accum(`r(mean)', `r(sd)', `r(min)', `r(max)')
		asdoc, row(Energy, $accum) dec(2)
	*Financials
		*Overall
		sum CRER if Sector == "Financials"
		asdoc, accum(`r(mean)', `r(sd)', `r(min)', `r(max)')
		*US
		sum CRER if Sector == "Financials" & Country == "United States of America"
		asdoc, accum(`r(mean)', `r(sd)', `r(min)', `r(max)')
		*EU
		sum CRER if Sector == "Financials" & Country != "United States of America"
		asdoc, accum(`r(mean)', `r(sd)', `r(min)', `r(max)')
		asdoc, row(Financials, $accum) dec(2)
	*Healthcare
		*Overall
		sum CRER if Sector == "Healthcare"
		asdoc, accum(`r(mean)', `r(sd)', `r(min)', `r(max)')
		*US
		sum CRER if Sector == "Healthcare" & Country == "United States of America"
		asdoc, accum(`r(mean)', `r(sd)', `r(min)', `r(max)')
		*EU
		sum CRER if Sector == "Healthcare" & Country != "United States of America"
		asdoc, accum(`r(mean)', `r(sd)', `r(min)', `r(max)')
		asdoc, row(Healthcare, $accum) dec(2)
	*Industrials
		*Overall
		sum CRER if Sector == "Industrials"
		asdoc, accum(`r(mean)', `r(sd)', `r(min)', `r(max)')
		*US
		sum CRER if Sector == "Industrials" & Country == "United States of America"
		asdoc, accum(`r(mean)', `r(sd)', `r(min)', `r(max)')
		*EU
		sum CRER if Sector == "Industrials" & Country != "United States of America"
		asdoc, accum(`r(mean)', `r(sd)', `r(min)', `r(max)')
		asdoc, row(Industrials, $accum) dec(2)
	*Technology
		*Overall
		sum CRER if Sector == "Technology"
		asdoc, accum(`r(mean)', `r(sd)', `r(min)', `r(max)')
		*US
		sum CRER if Sector == "Technology" & Country == "United States of America"
		asdoc, accum(`r(mean)', `r(sd)', `r(min)', `r(max)')
		*EU
		sum CRER if Sector == "Technology" & Country != "United States of America"
		asdoc, accum(`r(mean)', `r(sd)', `r(min)', `r(max)')
		asdoc, row(Technology, $accum) dec(2)
	*Utilities
		*Overall
		sum CRER if Sector == "Utilities"
		asdoc, accum(`r(mean)', `r(sd)', `r(min)', `r(max)')
		*US
		sum CRER if Sector == "Utilities" & Country == "United States of America"
		asdoc, accum(`r(mean)', `r(sd)', `r(min)', `r(max)')
		*EU
		sum CRER if Sector == "Utilities" & Country != "United States of America"
		asdoc, accum(`r(mean)', `r(sd)', `r(min)', `r(max)')
		asdoc, row(Utilities, $accum) dec(2)
	*All sectors
		*Overall
		sum CRER
		asdoc, accum(`r(mean)', `r(sd)', `r(min)', `r(max)')
		*US
		sum CRER if Country == "United States of America"
		asdoc, accum(`r(mean)', `r(sd)', `r(min)', `r(max)')
		*EU
		sum CRER if Country != "United States of America"
		asdoc, accum(`r(mean)', `r(sd)', `r(min)', `r(max)')
		asdoc, row(All sectors, $accum) dec(2)
