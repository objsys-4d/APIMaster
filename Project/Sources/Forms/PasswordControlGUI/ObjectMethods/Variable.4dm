

C_TEXT:C284($vtQueryText; $vtText)
C_LONGINT:C283($i)

Case of 
	: (Form event code:C388=On After Keystroke:K2:26)
		
		$vtText:=Get edited text:C655
		
		If (Length:C16($vtText)>2)
			$vtQueryText:="@"+$vtText+"@"
			
			ARRAY LONGINT:C221(alDisplayUserID; 0)
			ARRAY TEXT:C222(atDisplayUserName; 0)
			ARRAY DATE:C224(adDisplayLastLogin; 0)
			ARRAY BOOLEAN:C223(abDisplayUserActive; 0)
			For ($i; 1; Size of array:C274(atUserName))
				
				If (atUserName{$i}=$vtQueryText)
					APPEND TO ARRAY:C911(alDisplayUserID; alUserID{$i})
					APPEND TO ARRAY:C911(atDisplayUserName; atUserName{$i})
					APPEND TO ARRAY:C911(adDisplayLastLogin; adLastLogin{$i})
					
					APPEND TO ARRAY:C911(abDisplayUserActive; Not:C34(Is user deleted:C616(alUserID{$i})))
					
				End if 
				
			End for 
			
			SORT ARRAY:C229(atDisplayUserName; alDisplayUserID; adDisplayLastLogin; abDisplayUserActive; >)
			
		Else 
			
			COPY ARRAY:C226(alUserID; alDisplayUserID)
			COPY ARRAY:C226(atUserName; atDisplayUserName)
			COPY ARRAY:C226(adLastLogin; adDisplayLastLogin)
			COPY ARRAY:C226(abUserActive; abDisplayUserActive)
			
		End if 
		
		
End case 