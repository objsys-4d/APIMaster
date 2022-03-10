//%attributes = {}
// ----------------------------------------------------
// User name (OS): Edu
// Date and time: 02/22/22, 22:39:36
// ----------------------------------------------------
// Method: userLogin_Verify
// Description
// verify password for the selected User in the User Login listbox
//
// Parameters
// ----------------------------------------------------

If (Form:C1466.userLoginlb.position>0)
	
	If (vtPassword=Form:C1466.userLoginlb.item.userPassword)
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