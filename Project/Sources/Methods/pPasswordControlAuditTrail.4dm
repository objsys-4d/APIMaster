//%attributes = {}
//12/21/2018-Util_MethodTracker (Current method name)// Modified by: Mike Beatty (11/26/18)


// ----------------------------------------------------
// User name (OS): Mike Beatty
// Date and time: 03/29/18, 10:08:47
// ----------------------------------------------------
// Method: pPasswordControlAuditTrail
// Description
// 
//
// Parameters
// ----------------------------------------------------


C_TEXT:C284($vtAction; $vtMethod; $vtUserName)

$vtMethod:=$1
$vtUserName:=$2

Case of 
	: ($vtMethod="pUserAddNew")
		$vtAction:="Add User"
		
	: ($vtMethod="pUserViewerEditName")
		$vtAction:="Edit Name"
		
	: ($vtMethod="pUserViewerEditPassword")
		$vtAction:="Edit Password"
		
	: ($vtMethod="pUserViewerDelete")
		$vtAction:="Delete User"
		
	Else 
		$vtAction:=""
		$vtUserName:=""
End case 

//CREATE RECORD()
//:="PasswordControlAuditTrail"
//:=$vtAction
//:=$vtUserName
//:=fCurrentUser
//:=fCurrentDate
//:=fCurrentTime
//SAVE RECORD()
//UNLOAD RECORD()