//%attributes = {}



// ----------------------------------------------------
// User name (OS): Mike Beatty
// Date and time: 07/18/17, 13:28:05
// ----------------------------------------------------
// Method: pUserAddNew
// Description
// 
//
// Parameters
// ----------------------------------------------------

ARRAY TEXT:C222(aUserNames; 0)
ARRAY LONGINT:C221(aUserNumbers; 0)
//ARRAY LONGINT($almembership;0)

If (<>vbSSOActive)
	COPY ARRAY:C226(<>atAllUsers; aUserNames)  // Modified by: Jorge.Tiznado (4/24/2020)
Else 
	GET USER LIST:C609(aUserNames; aUserNumbers)
	SORT ARRAY:C229(aUserNumbers; >)
End if 


vtUserName:=Request:C163("Please enter the new user name."; "Firstname Lastname")


If (ok=1)
	// Modified by: Mike Beatty (3/6/19)
	C_LONGINT:C283($vlposition)
	C_TEXT:C284($vtStartup)
	C_LONGINT:C283($vlLogin)
	C_DATE:C307($vdDate)
	C_LONGINT:C283($vlUserId)
	C_TEXT:C284($vtMessage)
	
	$vlposition:=Find in array:C230(aUserNames; vtUserName)
	$vtStartup:=""
	$vlLogin:=1
	$vdDate:=fCurrentDate
	If ($vlposition=-1)
		If (fPasswordValidate)
			$vlUserId:=Set user properties:C612(-2; vtUserName; $vtStartup; vtPassword1; $vlLogin; $vdDate)
			If (ok=1)
				CHANGE PASSWORD:C186(vtPassword1)
				//CREATE RECORD()
				//:="PasswordControl"
				//:=vtUserName
				//:=fCurrentDate
				//:=fCurrentDate
				//:=Generate digest(vtPassword2; MD5 digest)
				//:=Generate digest(vtPassword2; SHA1 digest)  //start capturing for future conversion - mark 12/11/19
				//:=True
				//pUtilitySaveRecord
			End if 
		End if 
	Else 
		$vtMessage:="The user name "+vtUserName+" already exists."
		ALERT:C41($vtMessage)
	End if 
	
End if 
