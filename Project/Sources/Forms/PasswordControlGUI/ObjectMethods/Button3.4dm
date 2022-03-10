
// ----------------------------------------------------
// User name (OS): Mike Beatty
// Date and time: 12/12/17, 11:30:37
// ----------------------------------------------------
// Method: PasswordControlGUI.Button3
// Description
// 
//
// Parameters
// ----------------------------------------------------


C_LONGINT:C283($vlRow; $vlUserID)

C_TEXT:C284($vtUserName)

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		OBJECT SET ENABLED:C1123(bPasswordChange; False:C215)  //turn off buttons on entry
		
	: (Form event code:C388=On Clicked:K2:4)
		
		$vlRow:=ListboxPasswordControlGUI
		If (atDisplayUserName{$vlRow}#"")
			$vtUserName:=atDisplayUserName{$vlRow}
			$vlUserID:=alDisplayUserID{$vlRow}
			
			pUserViewerDelete($vtUserName; $vlUserID)
		End if 
		
	Else 
		
End case 
