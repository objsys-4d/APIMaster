//%attributes = {}
// ----------------------------------------------------
// User name (OS): Edu
// Date and time: 01/22/21, 15:58:32
// ----------------------------------------------------
// Method: User_SetupUsers
// Description
// 
//
// Parameters
// ----------------------------------------------------

If (<>UserType="Administrator")
	GEN_Dlg_CenterWindow(<>NullPtr; "USER_Setup"; "System Users")
Else 
	ALERT:C41("You do not access to this module.")
End if 