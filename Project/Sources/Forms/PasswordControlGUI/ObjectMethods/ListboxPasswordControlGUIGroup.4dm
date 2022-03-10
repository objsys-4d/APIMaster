


C_LONGINT:C283($vlGroup; $vlPosition; $i; $vlOwner)
C_TEXT:C284($vtName)

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		vtNameQuery:=""
		
		$vlGroup:=alGroupNumbers{ListboxPasswordControlGUIGroup}
		
		ARRAY LONGINT:C221($alGroupmembers; 0)
		GET GROUP PROPERTIES:C613($vlGroup; $vtName; $vlOwner; $alGroupmembers)
		
		ARRAY LONGINT:C221(alDisplayUserID; 0)
		ARRAY TEXT:C222(atDisplayUserName; 0)
		ARRAY DATE:C224(adDisplayLastLogin; 0)
		ARRAY BOOLEAN:C223(abDisplayUserActive; 0)
		For ($i; 1; Size of array:C274($alGroupmembers))
			
			$vlPosition:=Find in array:C230(alUserID; $alGroupmembers{$i})
			If ($vlPosition>0)
				APPEND TO ARRAY:C911(alDisplayUserID; alUserID{$vlPosition})
				APPEND TO ARRAY:C911(atDisplayUserName; atUserName{$vlPosition})
				APPEND TO ARRAY:C911(adDisplayLastLogin; adLastLogin{$vlPosition})
				
				APPEND TO ARRAY:C911(abDisplayUserActive; Not:C34(Is user deleted:C616(alUserID{$vlPosition})))
				
			End if 
			
		End for 
		SORT ARRAY:C229(atDisplayUserName; alDisplayUserID; adDisplayLastLogin; abDisplayUserActive; >)
		
End case 