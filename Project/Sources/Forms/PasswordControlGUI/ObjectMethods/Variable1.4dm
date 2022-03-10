
// ----------------------------------------------------
// User name (OS): Mike Beatty
// Date and time: 12/12/17, 11:37:44
// ----------------------------------------------------
// Method: PasswordControlGUI.Variable1
// Description
// 
//
// Parameters
// ----------------------------------------------------

C_TEXT:C284($vtQueryText; $vttext)
C_LONGINT:C283($i)

Case of 
	: (Form event code:C388=On After Keystroke:K2:26)
		
		$vttext:=Get edited text:C655
		
		If (Length:C16($vtText)>2)
			$vtQueryText:="@"+$vtText+"@"
			
			ARRAY TEXT:C222(atDisplayUserName; 0)
			ARRAY DATE:C224(adDisplayLastLogin; 0)
			
			For ($i; 1; Size of array:C274(atUserName))
				
				If (atUserName{$i}=$vtQueryText)
					APPEND TO ARRAY:C911(atDisplayUserName; atUserName{$i})
					APPEND TO ARRAY:C911(adDisplayLastLogin; adLastLogin{$i})
					
				End if 
				
			End for 
			
		Else 
			
			GET GROUP LIST:C610(atUserGroup; alGroupNumbers)
			
		End if 
		
		
End case 