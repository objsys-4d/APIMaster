//%attributes = {}
//1/10/2019-Util_MethodTracker (Current method name)// Modified by: Mike Beatty (11/26/18)


// ----------------------------------------------------
// User name (OS): Mike Beatty
// Date and time: 07/13/17, 14:50:58
// ----------------------------------------------------
// Method: pLoginValidatePasswordNew
// Description
// 
//
// Parameters
// ----------------------------------------------------
C_TEXT:C284($vtUser; $junk)
C_DATE:C307($vdUpdateDate; $lastlogin)
C_BOOLEAN:C305($vbContinue)
C_LONGINT:C283($vluserid; $numLogins)

// Modified by: Mike Beatty (3/6/19)
C_LONGINT:C283($userid)

$vtUser:=fCurrentUser

QUERY:C277(; ="PasswordControl"; *)
QUERY:C277(;  & ; =$vtUser; *)
QUERY:C277(;  & ; =True:C214)

ARRAY TEXT:C222($aUsers; 0)
ARRAY LONGINT:C221($aUserIDs; 0)

// Modified by: Jorge.Tiznado (4/23/2020)
If (<>vbSSOActive)
	COPY ARRAY:C226(<>atAllUsers; $aUsers)  // Modified by: Jorge.Tiznado (4/24/2020)
Else 
	GET USER LIST:C609($aUsers; $aUserIDs)
	$userid:=$aUserIDs{Find in array:C230($aUsers; $vtUser)}
	
	If ($userid#0)  //Change to #0 instread of >0 because the user ids in ACS are negative
		GET USER PROPERTIES:C611($userid; $junk; $junk; $junk; $numLogins; $lastlogin)
	End if 
End if 


ORDER BY:C49(; ; >)
LAST RECORD:C200()

$vdUpdateDate:=Add to date:C393(fCurrentDate; 0; 0; -60)

$vbContinue:=False:C215

Case of 
	: ($vtUser="Designer")  //do not change
		
	: ($vtUser="Administrator")  //do not change
		
	: (Records in selection:C76()=0)
		$vbContinue:=fPasswordValidate
		
	: (<$vdUpdateDate)
		APPLY TO SELECTION:C70(; :=False:C215)  //set these entries to inactive
		$vbContinue:=fPasswordValidate
		
		//remove below -- all that matters is that they changed their password in the last 60 days - mark 09/09/2020
		//: ($lastlogin<$vdUpdateDate)
		//APPLY TO SELECTION([Utility];[Utility]Boolean1:=False)  //set these entries to inactive
		//$vbContinue:=fPasswordValidate 
		
	Else 
		//don't need to update
End case 


If ($vbContinue)
	
	If (Not:C34(<>vbSSOActive))
		CHANGE PASSWORD:C186(vtPassword2)
	End if 
	
	CREATE RECORD:C68()
	:="PasswordControl"
	:=fCurrentUser
	:=fCurrentDate
	:=fCurrentDate
	:=Generate digest:C1147(vtPassword2; MD5 digest:K66:1)
	:=Generate digest:C1147(vtPassword2; SHA1 digest:K66:2)  //start capturing for future conversion - mark 12/11/19
	:=True:C214
	pUtilitySaveRecord
	
End if 

UNLOAD RECORD:C212()  //mark 12/21/18
