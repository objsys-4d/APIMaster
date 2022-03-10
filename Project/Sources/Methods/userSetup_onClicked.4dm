//%attributes = {}

// ----------------------------------------------------
// User name (OS): Edu
// Date and time: 03/10/22, 19:54:39
// ----------------------------------------------------
// Method: userSetup_onClicked
// Description
// 
//
// Parameters
// ----------------------------------------------------
Case of 
	: (FORM Event:C1606.objectName="systemUserlb")
		OBJECT SET ENABLED:C1123(bttnUserRemove; Not:C34(Form:C1466.systemUserlb.position=0))
		
		
	: (FORM Event:C1606.objectName="userActive_obj")
		
		
	: (FORM Event:C1606.objectName="bttnUserAdd")
		vtuserUUID:=""
		If (GEN_Dlg_CenterWindow2(<>NullPtr; "USER_AddUser"; "System Users -> Add Users")=1)
			//reload records
			Users_LoadSys
		End if 
		
	: (FORM Event:C1606.objectName="bttnUserRemove")
		CONFIRM:C162("Are you sure you want to remove "+Form:C1466.systemUserlb.item.user_firstName+" "+Form:C1466.systemUserlb.item.user_lastName+" from the list?"; "Yes"; "No")
		If (OK=1)
			$oUserDelete:=Form:C1466.systemUserlb.item
			$status:=$oUserDelete.drop()
			If ($status.success)
				Users_LoadSys
			End if 
		End if 
		
End case 
