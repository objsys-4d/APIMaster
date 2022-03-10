//%attributes = {}

// ----------------------------------------------------
// User name (OS): Edu
// Date and time: 03/08/22, 22:21:35
// ----------------------------------------------------
// Method: systemUsers_changePassword
// Description
// 
//
// Parameters
// ----------------------------------------------------

C_TEXT:C284(vChngPwd_Username; vChngPwd_OldPwdTemp)
C_TEXT:C284(vChngPwd_Name)

vChngPwd_Name:=Form:C1466.User.user_lastName+", "+Form:C1466.User.user_firstName
vChngPwd_Username:=Form:C1466.User.userName
//vChngPwd_OldPwdTemp:=Form.User.userPassword

GEN_Dlg_CenterWindow2(<>NullPtr; "USER_PASSWORD_CHANGE2"; "System Users")
If (OK=1)
	Form:C1466.User.userPassword:=vChngPwd_NewPwd
End if 