//%attributes = {}
// ----------------------------------------------------
// User name (OS): Edu
// Date and time: 01/22/21, 14:48:07
// ----------------------------------------------------
// Method: Users_LoadSys
// Description
// 
//
// Parameters
// ----------------------------------------------------

//ALL RECORDS([USERS:14])
//ORDER BY([USERS:14]; [USERS:14]Active:8; >; [USERS:14]Username:3; >)
//SELECTION TO ARRAY([USERS:14]ID:1; arUS_ID; [USERS:14]FullName:9; arUS_Name; [USERS:14]Username:3; arUS_Username; [USERS:14]User_Password:4; arUS_Password; [USERS:14]UserGroup:10; arUS_UserGroup; [USERS:14]Active:8; arUS_UserActive; [USERS:14]Date_added:11; arUS_DateAdded)
//UNLOAD RECORD([USERS:14])
C_OBJECT:C1216($ouserData)
$ouserData:=ds:C1482.User.all()
If ($ouserData.length>0)
	//$ouserData:=$ouserData.orderBy("userActive desc, user_lastName asc")
	$ouserData:=$ouserData.orderBy("user_lastName asc")
	Form:C1466.systemUserlb.data:=$ouserData
End if 