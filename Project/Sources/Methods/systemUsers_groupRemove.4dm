//%attributes = {}

// ----------------------------------------------------
// User name (OS): Edu
// Date and time: 03/08/22, 23:07:58
// ----------------------------------------------------
// Method: systemUsers_groupRemove
// Description
// 
//
// Parameters
// ----------------------------------------------------
C_LONGINT:C283(vSelGroupID)
C_OBJECT:C1216($status)
CONFIRM:C162("Are you sure you want to delete this Group?\rThis will also remove Users from this group.")
If (OK=1)
	$groupDelete:=ds:C1482.Group.query("groupID = :1"; vSelGroupID)
	If ($groupDelete.length>0)
		$status:=$groupDelete.drop()
		GEN_ListBox_DeleteSelection(->lbUserGroup)  //remove the line
		OBJECT SET ENABLED:C1123(*; "bttnGroupRemove"; False:C215)  //disable the button
	End if 
End if 