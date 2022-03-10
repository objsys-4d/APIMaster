If (<>Username="Designer") | (<>Username="Administrator")
	vSysLogIn_Name:=<>Username
	OBJECT SET ENABLED:C1123(bOK; True:C214)
Else 
	GEN_GetFieldValue(->[USERS:14]; ->[USERS:14]Username:3; -><>Username; ->[USERS:14]FullName:9; ->vSysLogIn_Name)
	If (vSysLogIn_Name="")
		vSysLogIn_Name:="Invalid User ID!"
		OBJECT SET ENABLED:C1123(bOK; False:C215)
	Else 
		OBJECT SET ENABLED:C1123(bOK; True:C214)
	End if 
End if 