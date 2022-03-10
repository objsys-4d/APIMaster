//%attributes = {}
// ----------------------------------------------------
// User name (OS): Edu
// Date and time: 03/10/22, 20:29:51
// ----------------------------------------------------
// Method: userLogin_OnLoad
// Description
// 
//
// Parameters
// ----------------------------------------------------
var $oUserLogin : Object
var vtUser; vtPassword : Text

Output_lbInit("userLoginlb")

vtUser:=""
vtPassword:=""
OBJECT SET FONT:C164(*; "vtPasswordObj"; "%Password")

$oUserLogin:=ds:C1482.User.query("userActive = :1"; True:C214)
If ($oUserLogin#Null:C1517)
	Form:C1466.userLoginlb.data:=$oUserLogin.orderBy("userName asc")
	
End if 