*This do-flies running under stata versions
version 15.0

/********************************************************************************************************************\
  Project Title: Grace's master thesis
  Author       : Thanyapat W. [Grace]
  Start Date   : 01 June 2021
  Last Modified: 01 June 2021
  Description  : This is a master-do files of Grace's master thesis.
				 Included all process about the data.
\********************************************************************************************************************/

clear
capture log close
capture cmdlog close
set more off

**********************************************************************************************************************
*Directory: File location
	cd "D:\Master Thesis\202106_DataAnalysis"
*log: record everything done in stata.
	log using "D:\Master Thesis\202106_DataAnalysis\202106_LOG_File\202106_0_Master.log", text append
*cmdlog: saves every command used in stata.
	cmdlog using "D:\Master Thesis\202106_DataAnalysis\202106_LOGCMD_File\202106_0_Mastercmd.log", append
**********************************************************************************************************************

/***********************\
  Prepare Data in Excel
\***********************/
	/********************************************************************************************************************\
		1.  To gather data I start with download data from datastream: https://eikon.thomsonreuters.com/index.html
				User: finlyc@ccu.edu.tw or sbteyfc@ccu.edu.tw
				Pass: CCUfin789
	\********************************************************************************************************************/
	
	/********************************************************************************************************************\
		2.  Rename and format variables
			/***********************************************************************************************************\
				Work Flow:
					- Unmerge and unwrap all title(head of the column)
					- Rename title (better not to have space in title)
					- Select Fiscal Year row and replace all FY* with year number 
							e.g. FY0 = 2020, FY-1 = 2019
					- Copy all and place as value
					- Select first row (ctrl+shif+right), replace "empty" with # then replace # with "empty"
					- Go to last column of title row -> ctrl+shift+left until reach the first column value
					- Click fn+f5 you will see "go to window" -> special -> blank -> ok
					- !Don't click anything! now the cursor should be on the first blank cell of the row
					- Type "=" in that first blank cell and select cell before then click ctrl+enter
					- Use (=CONCATENATE(text1,text2)) in empty row to combine title and year
						> copy the "concatenate cell" -> go to row2 -> ctrl+shift+right
						> the cursor should be at the last column that contain value -> paste
						> copy the last cell -> ctrl+shift+left -> cursor move back to the first cell -> paste
					- Move Identifire,CompanyName,CountrryofHQ in the same row as concatenate
					- Copy concatenate row and paste as value in the same row
					- Delete other row (above or below) until have only concatenate and value cell
					- Copy all title and paste in all sheet
			\***********************************************************************************************************/
			These files stored in "D:\Master Thesis\202106_DataAnalysis\202106_RawExcel_File"
	\********************************************************************************************************************/

/**********************\
  Manage Data in Stata
\**********************/
	/********************************************************************************************************************\
		1.  Data in those files are in wide format
			Therefore, I have to reshape its into long format (panel)
			Stored in "D:\Master Thesis\202106_DataAnalysis\202106_DTA_File"
			In this step the variables be in panel format
			After reshape I will save it as .dta 
	\********************************************************************************************************************/
			do "D:\Master Thesis\202106_DataAnalysis\202106_DO_File\202106_1_Reshape.do"

	/********************************************************************************************************************\
		2.  Now the data is in panel form I will combine all industries into one dta file
			Stored in "D:\Master Thesis\202106_DataAnalysis\202106_DTA_File\202106_EUS.dta"
	\********************************************************************************************************************/
			do "D:\Master Thesis\202106_DataAnalysis\202106_DO_File\202106_2_Append.do"

	/********************************************************************************************************************\
		3.  Manage variables
			4.1 Label and rename exist variables
			4.2 Generate and drop variables
				- Dependent Variables
				- Independent Variables
				- Control Variables
				- Others Variables
			4.3 Label new variables
			4.4 Announce to stata that data is a panel
	\********************************************************************************************************************/
			do "D:\Master Thesis\202106_DataAnalysis\202106_DO_File\202106_3_ManageVariables.do"	
	/********************************************************************************************************************\
		4.  Summary observation
	\********************************************************************************************************************/
			do "D:\Master Thesis\202106_DataAnalysis\202106_DO_File\202106_4_SumObs.do"
	/********************************************************************************************************************\
		5.  CRER ownership by region and industries
	\********************************************************************************************************************/
			do "D:\Master Thesis\202106_DataAnalysis\202106_DO_File\202106_5_CRERdistribution.do"
	/********************************************************************************************************************\
		6.  Descriptive statistic 
	\********************************************************************************************************************/
			do "D:\Master Thesis\202106_DataAnalysis\202106_DO_File\202106_6_DescriptiveStat.do"
	/********************************************************************************************************************\
		7.  Pearson pair-wise Correlation 
	\********************************************************************************************************************/
			do "D:\Master Thesis\202106_DataAnalysis\202106_DO_File\202106_7_pwcorr.do"
	/********************************************************************************************************************\
		8. Baseline model
	\********************************************************************************************************************/
			do "D:\Master Thesis\202106_DataAnalysis\202106_DO_File\202106_8_BaselineModel.do"
	/********************************************************************************************************************\
		9.Interaction-term model
	\********************************************************************************************************************/
			do "D:\Master Thesis\202106_DataAnalysis\202106_DO_File\202106_9_CRER_CEOchar_Model.do"
	/********************************************************************************************************************\
		10.Graph
	\********************************************************************************************************************/
			do "D:\Master Thesis\202106_DataAnalysis\202106_DO_File\202106_10_Graph.do"
