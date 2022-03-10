//%attributes = {}
// ----------------------------------------------------
// User name (OS): Mike Beatty
// Date and time: 01/31/18, 13:22:49
// ----------------------------------------------------
// Method: pUserSetProperties
// Description - unpack an object to set a new password for existing user
// Note - this method will execute on the server
//
// Parameters
// ----------------------------------------------------

C_OBJECT:C1216(oUserUpdate)
oUserUpdate:=$1

ARRAY LONGINT:C221($alGroups; 0)
C_DATE:C307($vdLastLogin)
C_LONGINT:C283($vlNumberLogins; $vlusernum)
C_TEXT:C284($vtAdminPassword; $vtAdminUser; $vtNewPassword; $vtstartupMethod; $vtUserName; $vtAction)

// Modified by: Mike Beatty (3/6/19)
C_LONGINT:C283($vlReturn)
C_BOOLEAN:C305($vbContinue)
C_LONGINT:C283($vlPosition)

$vlusernum:=OB Get:C1224(oUserUpdate; "UserNumber")
$vtUserName:=OB Get:C1224(oUserUpdate; "UserName")
$vtstartupMethod:=OB Get:C1224(oUserUpdate; "Method")
$vtNewPassword:=OB Get:C1224(oUserUpdate; "Password")
$vlNumberLogins:=OB Get:C1224(oUserUpdate; "Logins")
$vdLastLogin:=Date:C102(OB Get:C1224(oUserUpdate; "LastLogin"))
$vtAction:=OB Get:C1224(oUserUpdate; "Action")
OB GET ARRAY:C1229(oUserUpdate; "Groups"; $alGroups)

ARRAY TEXT:C222($aUsers; 0)
ARRAY LONGINT:C221($aUserIDs; 0)

If (<>vbSSOActive)
	COPY ARRAY:C226(<>atAllUsers; $aUsers)  // Modified by: Jorge.Tiznado (4/24/2020)
Else 
	GET USER LIST:C609($aUsers; $aUserIDs)
End if 

$vtAdminUser:="Administrator"
$vtAdminPassword:="Admin*"
// Modified by: Mike Beatty (5/24/18)
If (Structure file:C489#"@Master@")
	$vtAdminPassword:="nThrive@2013"
End if 
CHANGE CURRENT USER:C289($vtAdminUser; $vtAdminPassword)

$vlReturn:=-1
If (ok=1)
	$vbContinue:=False:C215
	$vlPosition:=Find in array:C230($aUserIDs; $vlusernum)
	Case of 
		: ($vlusernum=1)  //do not edit
		: ($vlusernum=2)  //do not edit
		: ($vtAction="EditName")
			$vbContinue:=($vlPosition>-1)
		: ($vtAction="EditPassword")
			$vbContinue:=($vlPosition>-1)
		: ($vtAction="AddUser")
			$vbContinue:=($vlPosition=-1)
		: ($vtAction="DeleteUser")
			$vbContinue:=($vlPosition>-1)
		: ($vtAction="GroupChange")
			$vbContinue:=($vlPosition>-1)
	End case 
	If ($vbContinue)
		$vlReturn:=Set user properties:C612($vlusernum; $vtUserName; $vtstartupMethod; $vtNewPassword; $vlNumberLogins; $vdLastLogin; $alGroups)
	End if 
Else 
	$0:=-1
End if 

ARRAY TEXT:C222($aUsers; 0)
ARRAY LONGINT:C221($aUserIDs; 0)

//GET USER LIST($aUsers;$aUserIDs)  // Modified by: Jorge.Tiznado (4/24/2020)

$0:=$vlReturn
