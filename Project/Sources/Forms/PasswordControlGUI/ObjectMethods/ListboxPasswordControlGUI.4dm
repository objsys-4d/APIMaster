
C_LONGINT:C283($i; $numLogins; $vlGroup; $vlPosition; $vlUserID)
C_TEXT:C284($vtUserMethod; $vtUserName; $vtUserPassword)
C_DATE:C307($lastlogin)

Case of 
		
	: (Form event code:C388=On Clicked:K2:4)
		// Modified by: Mike Beatty (1/31/18)
		OBJECT SET ENABLED:C1123(bEditPassword; False:C215)
		OBJECT SET ENABLED:C1123(bEditName; False:C215)
		OBJECT SET ENABLED:C1123(bDeleteUser; False:C215)
		
		$vlUserID:=alDisplayUserID{ListboxPasswordControlGUI}
		ARRAY LONGINT:C221($alMemberships; 0)
		GET USER PROPERTIES:C611($vlUserID; $vtUserName; $vtUserMethod; $vtUserPassword; $numLogins; $lastlogin; $alMemberships)
		
		Case of 
			: ($vlUserID=1)  //designer, don't change
			: ($vlUserID=2)  //Adminsitrator, don't change
			: ($vtUserName="Designer")  //designer, don't change
			: ($vtUserName="Administrator")  //Adminsitrator, don't change
				
			Else 
				$vlUserID:=alDisplayUserID{ListboxPasswordControlGUI}
				
				OBJECT SET ENABLED:C1123(bEditPassword; True:C214)
				OBJECT SET ENABLED:C1123(bEditName; True:C214)
				OBJECT SET ENABLED:C1123(bDeleteUser; True:C214)
				
				
				ARRAY TEXT:C222(atUserGroup; 0)
				ARRAY LONGINT:C221(alGroupNumbers; 0)
				ARRAY BOOLEAN:C223(abUserGroupMember; 0)
				GET GROUP LIST:C610(atUserGroup; alGroupNumbers)
				ARRAY BOOLEAN:C223(abUserGroupMember; Size of array:C274(atUserGroup))
				
				For ($i; 1; Size of array:C274($alMemberships))
					
					$vlGroup:=$alMemberships{$i}
					$vlPosition:=Find in array:C230(alGroupNumbers; $vlGroup)
					
					If ($vlPosition#-1)
						abUserGroupMember{$vlPosition}:=True:C214
					End if 
				End for 
				
				//LISTBOX SORT COLUMNS(ListboxPasswordControlGUIGroup;2;<)
				
				// SORT ARRAY(abUserGroupMember;atUsergroup;<)
				
				MULTI SORT ARRAY:C718(abUserGroupMember; <; atUsergroup; >; alGroupNumbers)
		End case 
		
End case 