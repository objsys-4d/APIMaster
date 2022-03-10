//%attributes = {}

// ----------------------------------------------------
// User name (OS): Edu
// Date and time: 03/08/22, 21:51:12
// ----------------------------------------------------
// Method: systemUsers_onLoad
// Description
// 
//
// Parameters
// ----------------------------------------------------

C_TEXT:C284(vtuserUUID)
C_LONGINT:C283(vSelGroupID)
ARRAY TEXT:C222(atUserGroups; 0)
LIST TO ARRAY:C288("User Group"; atUserGroups)

C_OBJECT:C1216(voGroups; $oUserGroupMember; $loop)
OBJECT SET FONT:C164(*; "obj.User.Pwd"; "%Password")
OBJECT SET ENABLED:C1123(*; "bttnGroupRemove"; False:C215)
ARRAY TEXT:C222(atGroup_Name; 0)
ARRAY LONGINT:C221(anGroup_ID; 0)
ARRAY BOOLEAN:C223(ablGroup_isMember; 0)
voGroups:=ds:C1482.Group.all()

If (vtuserUUID="")
	Form:C1466.User:=ds:C1482.User.new()
	Form:C1466.User.userActive:=True:C214  //set active by default
	For each ($loop; voGroups)
		APPEND TO ARRAY:C911(atGroup_Name; $loop.groupName)
		APPEND TO ARRAY:C911(anGroup_ID; $loop.groupID)
		APPEND TO ARRAY:C911(ablGroup_isMember; False:C215)
	End for each 
	
Else 
	//user record
	Form:C1466.User:=ds:C1482.User.get(vtuserUUID)
	
	For each ($loop; voGroups)
		APPEND TO ARRAY:C911(atGroup_Name; $loop.groupName)
		APPEND TO ARRAY:C911(anGroup_ID; $loop.groupID)
		
		$oUserGroupMember:=ds:C1482.UserGroup.query("groupID = :1 and userID = :2"; $loop.groupID; Form:C1466.User.userID)
		If ($oUserGroupMember.length=0)
			APPEND TO ARRAY:C911(ablGroup_isMember; False:C215)
		Else 
			APPEND TO ARRAY:C911(ablGroup_isMember; True:C214)
		End if 
		
	End for each 
	
	
	
End if 