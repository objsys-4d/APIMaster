//%attributes = {}
// ----------------------------------------------------
// User name (OS): Edu
// Date and time: 01/22/21, 15:41:48
// ----------------------------------------------------
// Method: Sys_UserLogin
// Description
// 
//
// Parameters
// ----------------------------------------------------
C_BOOLEAN:C305($0)
GEN_Dlg_CenterWindow2(<>NullPtr; "USER_LOGIN"; "User Login")
If (OK=1)
	$0:=True:C214
End if 