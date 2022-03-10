//%attributes = {}
//Util_MethodTracker (Current method name)  // Modified by: Mike Beatty (11/26/18)


// ----------------------------------------------------
// User name (OS): Mike Beatty
// Date and time: 12/15/17, 09:38:47
// ----------------------------------------------------
// Method: fUserSetProperties
// Description
// 
//
// Parameters
// ----------------------------------------------------


C_LONGINT:C283($vlError; $vlNumberLogins; $vlusernum)
C_TEXT:C284($vtMessage; $vtNewPassword; $vtstartupMethod; $vtUserName; $vtAction)
C_DATE:C307($vdLastLogin)
C_POINTER:C301($vpgroups)

$vlusernum:=$1
$vtUserName:=$2
$vtstartupMethod:=$3
$vtNewPassword:=$4
$vlNumberLogins:=$5
$vdLastLogin:=$6
If (Count parameters:C259>6)
	$vpgroups:=$7
Else 
	ARRAY LONGINT:C221($alGroups; 0)
	$vpgroups:=->$alGroups
End if 
If (Count parameters:C259>7)
	$vtAction:=$8
Else 
	$vtAction:=""
End if 

$vlError:=0
Case of 
	: ($vlusernum=1)  //designer - do not change
		$vtMessage:="Attempting to set password on invalid user 1."
		ALERT:C41($vtMessage)
	: ($vlusernum=2)  //administrator, do not change
		$vtMessage:="Attempting to set password on invalid user 2."
		ALERT:C41($vtMessage)
	: ($vtNewPassword="")  //administrator, do not change
		$vtMessage:="This is not a valid password."
		ALERT:C41($vtMessage)
	Else 
		
		C_OBJECT:C1216(oUserUpdate)
		
		OB SET:C1220(oUserUpdate; "UserNumber"; $vlusernum)
		OB SET:C1220(oUserUpdate; "UserName"; $vtUserName)
		OB SET:C1220(oUserUpdate; "Method"; $vtstartupMethod)
		OB SET:C1220(oUserUpdate; "Password"; $vtNewPassword)
		OB SET:C1220(oUserUpdate; "Logins"; $vlNumberLogins)
		OB SET:C1220(oUserUpdate; "LastLogin"; $vdLastLogin)
		OB SET:C1220(oUserUpdate; "Action"; $vtAction)
		OB SET ARRAY:C1227(oUserUpdate; "Groups"; $vpgroups->)
		
		$vlUserNum:=pUserSetProperties(oUserUpdate)  //this method is set to execute on server
		
		
		
		
End case 

$0:=$vlUserNum
