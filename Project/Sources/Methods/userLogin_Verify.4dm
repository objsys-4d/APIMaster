//%attributes = {}

// ----------------------------------------------------
// User name (OS): Edu
// Date and time: 03/11/22, 00:20:43
// ----------------------------------------------------
// Method: userLogin_Verify
// Description
// 
//
// Parameters
// ----------------------------------------------------
var $oUserLogin : Object
var vtUser_UUID : Text

If (vtUser_UUID#"")
	$oUserLogin:=ds:C1482.User.get(vtUser_UUID)
	If (vtPassword=$oUserLogin.userPassword)
		Use (Storage:C1525)
			Storage:C1525.login:=New shared object:C1526
			Use (Storage:C1525.login)
				Storage:C1525.login.userID:=Form:C1466.userLoginlb.item.userID
				Storage:C1525.login.userName:=Form:C1466.userLoginlb.item.userName
				Storage:C1525.login.userPassword:=Form:C1466.userLoginlb.item.userPassword
				Storage:C1525.login.userlastName:=Form:C1466.userLoginlb.item.user_lastName
				Storage:C1525.login.userfirstName:=Form:C1466.userLoginlb.item.user_firstName
			End use 
		End use 
		
		ACCEPT:C269
	Else 
		vtUserErrText:="Invalid Password."
		SET TIMER:C645(60*3)
	End if 
End if 