*This do-flies running under stata versions
version 15.0

/********************************************************************************************************************\
  Project Title: Grace's master thesis
  Author       : Thanyapat W. [Grace]
  Start Date   : 01 June 2021
  Last Modified: 03 June 2021
  Description  : Summary Observations
\********************************************************************************************************************/

clear
capture log close
capture cmdlog close
set more off

**********************************************************************************************************************
*Directory: File location
	cd "D:\Master Thesis\202106_DataAnalysis"
*log: record everything done in stata.
	log using "D:\Master Thesis\202106_DataAnalysis\202106_LOG_File\202106_4_SumObs.log", text append
*cmdlog: saves every command used in stata.
	cmdlog using "D:\Master Thesis\202106_DataAnalysis\202106_LOGCMD_File\202106_4_SumObscmd.log", append
**********************************************************************************************************************

/***********************************************************************************************************\
 Corporate real estate ownership ratios by industry and country
\***********************************************************************************************************/
	use "D:\Master Thesis\202106_DataAnalysis\202106_DTA_File\202106_EUS_dataset.dta"
	*Summary observations
	asdoc, row(\i, Overall, \i, US, \i, EU, \i) title(Number of firms and observations from 2011 to 2020), save(D:\Master Thesis\202106_DataAnalysis\202106_Table_Results\202106_4_SumObs.doc) replace
	asdoc, row(Industry, Firms, Obs, Firms, Obs, Firms, Obs)
	
	*Basic Materials
		*Overall
		sum FirmID if Sector == "Basic Materials" & NumFirm == 1
		asdoc, accum(`r(N)')
		sum NumFirm if Sector == "Basic Materials"
		asdoc, accum(`r(N)')
		*US
		sum FirmID if Sector == "Basic Materials" & NumFirm == 1 & Country == "United States of America"
		asdoc, accum(`r(N)')
		sum NumFirm if Sector == "Basic Materials" & Country == "United States of America"
		asdoc, accum(`r(N)')
		*EU
		sum FirmID if Sector == "Basic Materials" & NumFirm == 1 & Country != "United States of America"
		asdoc, accum(`r(N)')
		sum NumFirm if Sector == "Basic Materials" & Country != "United States of America"
		asdoc, accum(`r(N)')
		asdoc, row(Basic Materials, $accum)
	*Consumer Cyclicals
		*Overall
		sum FirmID if Sector == "Consumer Cyclicals" & NumFirm == 1
		asdoc, accum(`r(N)')
		sum NumFirm if Sector == "Consumer Cyclicals"
		asdoc, accum(`r(N)')
		*US
		sum FirmID if Sector == "Consumer Cyclicals" & NumFirm == 1 & Country == "United States of America"
		asdoc, accum(`r(N)')
		sum NumFirm if Sector == "Consumer Cyclicals" & Country == "United States of America"
		asdoc, accum(`r(N)')
		*EU
		sum FirmID if Sector == "Consumer Cyclicals" & NumFirm == 1 & Country != "United States of America"
		asdoc, accum(`r(N)')
		sum NumFirm if Sector == "Consumer Cyclicals" & Country != "United States of America"
		asdoc, accum(`r(N)')
		asdoc, row(Consumer Cyclicals, $accum)
	*Consumer Non-Cyclicals
		*Overall
		sum FirmID if Sector == "Consumer Non-Cyclicals" & NumFirm == 1
		asdoc, accum(`r(N)')
		sum NumFirm if Sector == "Consumer Non-Cyclicals"
		asdoc, accum(`r(N)')
		*US
		sum FirmID if Sector == "Consumer Non-Cyclicals" & NumFirm == 1 & Country == "United States of America"
		asdoc, accum(`r(N)')
		sum NumFirm if Sector == "Consumer Non-Cyclicals" & Country == "United States of America"
		asdoc, accum(`r(N)')
		*EU
		sum FirmID if Sector == "Consumer Non-Cyclicals" & NumFirm == 1 & Country != "United States of America"
		asdoc, accum(`r(N)')
		sum NumFirm if Sector == "Consumer Non-Cyclicals" & Country != "United States of America"
		asdoc, accum(`r(N)')
		asdoc, row(Consumer Non-Cyclicals, $accum)
	*Energy
		*Overall
		sum FirmID if Sector == "Energy" & NumFirm == 1
		asdoc, accum(`r(N)')
		sum NumFirm if Sector == "Energy"
		asdoc, accum(`r(N)')
		*US
		sum FirmID if Sector == "Energy" & NumFirm == 1 & Country == "United States of America"
		asdoc, accum(`r(N)')
		sum NumFirm if Sector == "Energy" & Country == "United States of America"
		asdoc, accum(`r(N)')
		*EU
		sum FirmID if Sector == "Energy" & NumFirm == 1 & Country != "United States of America"
		asdoc, accum(`r(N)')
		sum NumFirm if Sector == "Energy" & Country != "United States of America"
		asdoc, accum(`r(N)')
		asdoc, row(Energy, $accum)
	*Financials
		*Overall
		sum FirmID if Sector == "Financials" & NumFirm == 1
		asdoc, accum(`r(N)')
		sum NumFirm if Sector == "Financials"
		asdoc, accum(`r(N)')
		*US
		sum FirmID if Sector == "Financials" & NumFirm == 1 & Country == "United States of America"
		asdoc, accum(`r(N)')
		sum NumFirm if Sector == "Financials" & Country == "United States of America"
		asdoc, accum(`r(N)')
		*EU
		sum FirmID if Sector == "Financials" & NumFirm == 1 & Country != "United States of America"
		asdoc, accum(`r(N)')
		sum NumFirm if Sector == "Financials" & Country != "United States of America"
		asdoc, accum(`r(N)')
		asdoc, row(Financials, $accum)
	*Healthcare
		*Overall
		sum FirmID if Sector == "Healthcare" & NumFirm == 1
		asdoc, accum(`r(N)')
		sum NumFirm if Sector == "Healthcare"
		asdoc, accum(`r(N)')
		*US
		sum FirmID if Sector == "Healthcare" & NumFirm == 1 & Country == "United States of America"
		asdoc, accum(`r(N)')
		sum NumFirm if Sector == "Healthcare" & Country == "United States of America"
		asdoc, accum(`r(N)')
		*EU
		sum FirmID if Sector == "Healthcare" & NumFirm == 1 & Country != "United States of America"
		asdoc, accum(`r(N)')
		sum NumFirm if Sector == "Healthcare" & Country != "United States of America"
		asdoc, accum(`r(N)')
		asdoc, row(Healthcare, $accum)
	*Industrials
		*Overall
		sum FirmID if Sector == "Industrials" & NumFirm == 1
		asdoc, accum(`r(N)')
		sum NumFirm if Sector == "Industrials"
		asdoc, accum(`r(N)')
		*US
		sum FirmID if Sector == "Industrials" & NumFirm == 1 & Country == "United States of America"
		asdoc, accum(`r(N)')
		sum NumFirm if Sector == "Industrials" & Country == "United States of America"
		asdoc, accum(`r(N)')
		*EU
		sum FirmID if Sector == "Industrials" & NumFirm == 1 & Country != "United States of America"
		asdoc, accum(`r(N)')
		sum NumFirm if Sector == "Industrials" & Country != "United States of America"
		asdoc, accum(`r(N)')
		asdoc, row(Industrials, $accum)
	*Technology
		*Overall
		sum FirmID if Sector == "Technology" & NumFirm == 1
		asdoc, accum(`r(N)')
		sum NumFirm if Sector == "Technology"
		asdoc, accum(`r(N)')
		*US
		sum FirmID if Sector == "Technology" & NumFirm == 1 & Country == "United States of America"
		asdoc, accum(`r(N)')
		sum NumFirm if Sector == "Technology" & Country == "United States of America"
		asdoc, accum(`r(N)')
		*EU
		sum FirmID if Sector == "Technology" & NumFirm == 1 & Country != "United States of America"
		asdoc, accum(`r(N)')
		sum NumFirm if Sector == "Technology" & Country != "United States of America"
		asdoc, accum(`r(N)')
		asdoc, row(Technology, $accum)
	*Utilities
		*Overall
		sum FirmID if Sector == "Utilities" & NumFirm == 1
		asdoc, accum(`r(N)')
		sum NumFirm if Sector == "Utilities"
		asdoc, accum(`r(N)')
		*US
		sum FirmID if Sector == "Utilities" & NumFirm == 1 & Country == "United States of America"
		asdoc, accum(`r(N)')
		sum NumFirm if Sector == "Utilities" & Country == "United States of America"
		asdoc, accum(`r(N)')
		*EU
		sum FirmID if Sector == "Utilities" & NumFirm == 1 & Country != "United States of America"
		asdoc, accum(`r(N)')
		sum NumFirm if Sector == "Utilities" & Country != "United States of America"
		asdoc, accum(`r(N)')
		asdoc, row(Utilities, $accum)
	*Total
		*Overall
		sum FirmID if NumFirm == 1
		asdoc, accum(`r(N)')
		sum NumFirm
		asdoc, accum(`r(N)')
		*US
		sum FirmID if NumFirm == 1 & Country == "United States of America"
		asdoc, accum(`r(N)')
		sum NumFirm if Country == "United States of America"
		asdoc, accum(`r(N)')
		*EU
		sum FirmID if NumFirm == 1 & Country != "United States of America"
		asdoc, accum(`r(N)')
		sum NumFirm if Country != "United States of America"
		asdoc, accum(`r(N)')
		asdoc, row(Total, $accum)
