//%attributes = {}
// ----------------------------------------------------
// User name (OS): Edu
// Date and time: 03/10/22, 21:22:52
// ----------------------------------------------------
// Method: fUserInGroup
// Description
// method returns TRUE when user is member of group
//
// Parameters
// $1 - User ID
// $2 - Group ID
//
// Syntax sample: $isInGroup:=fUserInGroup($userID; $groupID)
// ----------------------------------------------------

var $1; $2; $userID; $groupID : Integer
var $oUserGroup : Object
var $0 : Boolean
$userID:=$1
$groupID:=$2

$oUserGroup:=ds:C1482.UserGroup.query("userID = :1 and groupID = :2"; $userID; $groupID)
If ($oUserGroup.length>0)
	$0:=True:C214
End if 