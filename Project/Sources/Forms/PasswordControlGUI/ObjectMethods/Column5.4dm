
C_LONGINT:C283($vlRow; $vlUserID; $vlColumn; $vlError; $vlPosition; $vlUserGroup; $numLogins)
C_TEXT:C284($vtUserName; $vtUserGroupName; $vtUserMethod; $vtUserPassword)
C_DATE:C307($lastlogin)



Case of 
		
	: (Form event code:C388=On Data Change:K2:15)
		
		LISTBOX GET CELL POSITION:C971(ListboxPasswordControlGUI; $vlColumn; $vlRow)
		$vlUserID:=alDisplayUserID{$vlRow}
		$vtUserName:=atDisplayUserName{$vlRow}
		
		$vlUserGroup:=alGroupNumbers{Self:C308->}
		$vtUserGroupName:=atUserGroup{Self:C308->}
		
		GET USER PROPERTIES:C611($vlUserID; $vtUserName; $vtUserMethod; $vtUserPassword; $numLogins; $lastlogin; $alMemberships)
		
		$vlPosition:=Find in array:C230($alMemberships; $vlUserGroup)
		
		If (abUserGroupMember{Self:C308->})  //the value is now true
			//add to group
			APPEND TO ARRAY:C911($alMemberships; $vlUserGroup)
		Else 
			//remove from group
			DELETE FROM ARRAY:C228($alMemberships; $vlPosition; 1)
		End if 
		
		$vlError:=fUserSetProperties($vlUserID; $vtUserName; $vtUserMethod; <>ASTERISK; $numLogins; $lastlogin; ->$alMemberships)
		
		MULTI SORT ARRAY:C718(abUserGroupMember; <; atUsergroup; >; alGroupNumbers)
End case 