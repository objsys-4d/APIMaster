//%attributes = {}
// ----------------------------------------------------
// User name (OS): Edu
// Date and time: 03/08/22, 23:05:12
// ----------------------------------------------------
// Method: systemUsers_groupAdd
// Description
// 
//
// Parameters
// ----------------------------------------------------
C_OBJECT:C1216($oGroup; $ogroupAdd)
C_TEXT:C284($groupName)

$groupName:=Request:C163("Enter Group Name:")
If (OK=1)
	$groupName:=GEN_DropSpaces($groupName)
	If ($groupName="")
		ALERT:C41("Group name cannot be blank.")
	Else 
		$oGroup:=ds:C1482.Group.query("groupName = :1"; $groupName)
		If ($oGroup.length=0)
			$ogroupAdd:=ds:C1482.Group.new()
			$ogroupAdd.UUID:=Generate UUID:C1066
			$ogroupAdd.groupName:=$groupName
			$status:=$ogroupAdd.save()
			
			APPEND TO ARRAY:C911(atGroup_Name; $groupName)
			APPEND TO ARRAY:C911(anGroup_ID; $ogroupAdd.groupID)
			APPEND TO ARRAY:C911(ablGroup_isMember; False:C215)
			
		Else 
			ALERT:C41("Group name already exist.")
		End if 
	End if 
End if 