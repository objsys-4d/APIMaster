//%attributes = {}
//12/21/2018-Util_MethodTracker (Current method name)// Modified by: Mike Beatty (11/26/18)


// ----------------------------------------------------
// User name (OS): Mike Beatty
// Date and time: 03/06/18, 09:32:11
// ----------------------------------------------------
// Method: pUserDelete
// Description
// Note - this method will execute on the server
//
// Parameters
// ----------------------------------------------------



C_OBJECT:C1216(oUserUpdate)
oUserUpdate:=$1

ARRAY LONGINT:C221($alGroups; 0)
C_DATE:C307($vdLastLogin)
C_LONGINT:C283($vlNumberLogins; $vlUserNumber; $vlResult)
C_TEXT:C284($vtAdminPassword; $vtAdminUser; $vtNewPassword; $vtstartupMethod; $vtUserName)

$vlUserNumber:=OB Get:C1224(oUserUpdate; "UserNumber")
$vtUserName:=OB Get:C1224(oUserUpdate; "UserName")

$vtAdminUser:="Administrator"
$vtAdminPassword:="Admin*"
CHANGE CURRENT USER:C289($vtAdminUser; $vtAdminPassword)

$vlResult:=-1
If (ok=1)
	Case of 
		: ($vlUserNumber=1)  //do not delete
		: ($vlUserNumber=2)  //do not delete
			
		Else 
			DELETE USER:C615($vlUserNumber)
			If (ok=1)
				$vlResult:=0
			End if 
	End case 
	
End if 

$vtAdminUser:="designer"
$vtAdminPassword:="abs*luteAdmin"
CHANGE CURRENT USER:C289($vtAdminUser; $vtAdminPassword)

$0:=$vlResult