//%attributes = {}

// ----------------------------------------------------
// User name (OS): Edu
// Date and time: 03/10/22, 23:46:18
// ----------------------------------------------------
// Method: userLogin_OnDataChange
// Description
// 
//
// Parameters
// ----------------------------------------------------

Case of 
	: (FORM Event:C1606.objectName="vtUsernameobj")
		If (vtUsername#"")
			$oUser:=ds:C1482.User.query("userName = :1"; vtUsername)
			If ($oUser.length=0)
				vtUser_UUID:=""
				vtUserErrText:="Invalid Username."
				SET TIMER:C645(60*3)
			Else 
				vtUser:=$oUser.first().user_firstName+" "+$oUser.first().user_lastName
				vtUser_UUID:=$oUser.first().UUID
			End if 
		End if 
		
End case 