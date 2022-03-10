//%attributes = {}
// ----------------------------------------------------
// User name (OS): Edu
// Date and time: 03/08/22, 21:51:43
// ----------------------------------------------------
// Method: systemUsers_onDataChange
// Description
// 
//
// Parameters
// ----------------------------------------------------

Case of 
	: (FORM Event:C1606.objectName="user_lastName_obj")
		Form:C1466.User.user_lastName:=GEN_DropSpaces(Form:C1466.User.user_lastName)
		systemUsers_userNameSuggestion
		
	: (FORM Event:C1606.objectName="user_firstName_obj")
		Form:C1466.User.user_firstName:=GEN_DropSpaces(Form:C1466.User.user_firstName)
		systemUsers_userNameSuggestion
		
	: (FORM Event:C1606.objectName="user_userName_obj")
		Form:C1466.User.userName:=GEN_DropSpaces(Form:C1466.User.userName)
		
End case 