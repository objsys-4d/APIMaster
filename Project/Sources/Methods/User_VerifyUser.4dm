//%attributes = {}
// ----------------------------------------------------
// User name (OS): Edu
// Date and time: 01/22/21, 16:37:05
// ----------------------------------------------------
// Method: User_VerifyUser
// Description
// 
//
// Parameters
// ----------------------------------------------------
C_TEXT:C284(<>Username; vPassword; $startup)
C_TEXT:C284(<>UserType)
C_BOOLEAN:C305(<>SuperUserMode)
C_LONGINT:C283($nbLogin)
C_DATE:C307($lastLogin)
<>SuperUserMode:=False:C215
Case of 
	: (<>Username="Administrator")
		If (Validate password:C638(2; vPassword))
			CHANGE CURRENT USER:C289(<>Username; vPassword)
			<>UserType:="Administrator"
			<>SuperUserMode:=True:C214
			ACCEPT:C269
		End if 
		
	: (<>Username="Designer")
		If (Validate password:C638(1; vPassword))
			CHANGE CURRENT USER:C289(<>Username; vPassword)
			<>UserType:="Administrator"
			<>SuperUserMode:=True:C214
			ACCEPT:C269
		End if 
		
	Else 
		QUERY:C277([USERS:14]; [USERS:14]Username:3=<>Username)
		If (Records in selection:C76([USERS:14])=0)
			ALERT:C41("Invalid User ID!")
		Else 
			
			If (vPassword=[USERS:14]User_Password:4)
				<>UserType:=[USERS:14]UserGroup:10
				If (<>UserType="Administrator")
					<>SuperUserMode:=True:C214
				End if 
				ACCEPT:C269
				UNLOAD RECORD:C212([USERS:14])
			Else 
				ALERT:C41("Incorrect password!")
			End if   //vPassword=[USERS]Sys_Password
		End if 
		
End case 
