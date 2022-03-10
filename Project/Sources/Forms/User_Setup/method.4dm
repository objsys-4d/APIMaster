Case of 
	: (Form event code:C388=On Load:K2:1)
		C_TEXT:C284(vtuserUUID)
		Output_lbInit("systemUserlb")
		Users_LoadSys
		OBJECT SET ENABLED:C1123(bttnUserRemove; False:C215)
		
	: (Form event code:C388=On Clicked:K2:4)
		userSetup_onClicked
		
	: (Form event code:C388=On Double Clicked:K2:5)
		userSetup_onDoubleClicked
		
		If (FORM Event:C1606.objectName="userActive_obj")
			Users_LoadSys
		End if 
		
	: (Form event code:C388=On Unload:K2:2)
		
End case 