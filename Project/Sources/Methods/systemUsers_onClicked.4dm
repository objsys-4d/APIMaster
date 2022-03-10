//%attributes = {}
// ----------------------------------------------------
// User name (OS): Edu
// Date and time: 03/08/22, 22:18:59
// ----------------------------------------------------
// Method: systemUsers_onClicked
// Description
// 
//
// Parameters
// ----------------------------------------------------
Case of 
	: (FORM Event:C1606.objectName="bttnSave")
		systemUsers_Save
		
	: (FORM Event:C1606.objectName="bttn_ChPwd")
		systemUsers_changePassword
		
	: (FORM Event:C1606.objectName="bttnGroupAdd")
		systemUsers_groupAdd
		
	: (FORM Event:C1606.objectName="bttnGroupRemove")
		systemUsers_groupRemove
		
	: (FORM Event:C1606.objectName="lbUserGroupobj")
		If (GEN_Listbox_ClickedEmpty(->lbUserGroup))
			OBJECT SET ENABLED:C1123(bttnGroupRemove; False:C215)
			vSelGroupID:=0
		Else 
			OBJECT SET ENABLED:C1123(bttnGroupRemove; True:C214)
			vSelGroupID:=anGroup_ID{lbUserGroup}
		End if 
		
End case   //form event.object