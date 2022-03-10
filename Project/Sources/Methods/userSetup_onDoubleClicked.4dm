//%attributes = {}

// ----------------------------------------------------
// User name (OS): Edu
// Date and time: 03/10/22, 20:03:13
// ----------------------------------------------------
// Method: userSetup_onDoubleClicked
// Description
// 
//
// Parameters
// ----------------------------------------------------
Case of 
	: (FORM Event:C1606.objectName="systemUserlb")
		
		If (Form:C1466.systemUserlb.position>0)
			C_LONGINT:C283(vUsers_ID)
			C_TEXT:C284(vUsers_Name)
			C_TEXT:C284(vUsers_UserID; vUsers_Password)
			C_TEXT:C284(vUsers_Group)
			C_BOOLEAN:C305(vUsers_Active)
			vtuserUUID:=Form:C1466.systemUserlb.item.UUID
			If (GEN_Dlg_CenterWindow2(<>NullPtr; "USER_AddUser"; "System Users -> Add Users")=1)
				Users_LoadSys
			End if 
		End if 
		
End case 