//%attributes = {}
//1/11/2019-Util_MethodTracker (Current method name)// Modified by: Mike Beatty (11/26/18)


// ----------------------------------------------------
// User name (OS): Mike Beatty
// Date and time: 07/14/17, 15:31:59
// ----------------------------------------------------
// Method: pXFilePasswordControlFM
// Description
// 
//
// Parameters
// ----------------------------------------------------

C_LONGINT:C283($i; $vlCode; $vlLength)
C_TEXT:C284($vtChar; $vtMessage; $vtNewPassword; $vtNewPasswordHash; $vtText)
C_BOOLEAN:C305($vblength; $vbLowercase; $vbNumeric; $vbPasswordMatch; $vbSameChars; $vbSpecialChar; $vbUnique; $vbUppercase)

Case of 
	: (Form event code:C388=On After Edit:K2:43)
		
		If ((vtPassword1="") & (vtPassword2=""))
			For ($i; 1; Size of array:C274(ListBoxPasswordControl))
				LISTBOX SET ROW COLOR:C1270(ListBoxPasswordControl; $i; 0x00FF0000)
			End for 
		End if 
		
		If (vbPasswordMatch=False:C215)
			
			OBJECT SET ENABLED:C1123(bPasswordControlAccept; False:C215)
			LISTBOX SET ROW COLOR:C1270(ListBoxPasswordControl; 7; 0x00FF0000)
			LISTBOX SET ROW COLOR:C1270(ListBoxPasswordControl; 8; 0x00FF0000)
			
		End if 
		
		
	: (Form event code:C388=On Load:K2:1)
		For ($i; 1; Size of array:C274(atPasswordCriteria))
			LISTBOX SET ROW COLOR:C1270(ListBoxPasswordControl; $i; 0x00FF0000)
		End for 
		
		QUERY:C277(; ="PasswordControl"; *)
		QUERY:C277(;  & ; =fCurrentUser)
		
		ORDER BY:C49(; ; <)
		REDUCE SELECTION:C351(; 4)
		
		ARRAY TEXT:C222(atPasswordList; 0)
		SELECTION TO ARRAY:C260(; atPasswordList)  //this will be a hashed list
		
		
		
		
		OBJECT SET ENABLED:C1123(bPasswordControlAccept; False:C215)
		//obscure the new password being set
		OBJECT SET FONT:C164(vtPassword1; "%Password")
		OBJECT SET FONT:C164(vtPassword2; "%Password")
		
		vbPasswordMatch:=False:C215
		
	: (Form event code:C388=On Data Change:K2:15)
		
		
		
	: (Form event code:C388=On After Keystroke:K2:26)
		C_BOOLEAN:C305($vbLowercase; $vbNumeric; $vbSameChars; $vbSpecialChar; $vbUppercase; $vbPasswordMatch; $vblength; $vbUnique)
		
		
		$vtText:=Get edited text:C655
		$vlLength:=Length:C16($vtText)
		$vbSameChars:=True:C214
		
		ARRAY TEXT:C222($atTextArray; 0)
		ARRAY LONGINT:C221($alCharacterCodeArray; 0)
		
		For ($i; 1; Length:C16($vtText))
			$vtChar:=Substring:C12($vtText; $i; 1)
			$vlCode:=Character code:C91($vtChar)
			APPEND TO ARRAY:C911($atTextArray; $vtChar)
			APPEND TO ARRAY:C911($alCharacterCodeArray; $vlCode)
		End for 
		
		For ($i; 1; Length:C16($vtText))
			$vtChar:=Substring:C12($vtText; $i; 1)
			//$vlCode:=Character code($vtNewPassword[[$i]])
			$vlCode:=Character code:C91($vtChar)
			
			Case of 
				: ($vlCode=64)
					
					
				: (($vlCode>=65) & ($vlCode<=90))  //A-Z
					$vbUppercase:=True:C214
					
				: (($vlCode>=97) & ($vlCode<=122))  //a-z
					$vbLowercase:=True:C214
					
				: (Find in array:C230(atArrayCharSpecial; $vtChar)#-1)  //a-z
					$vbSpecialChar:=True:C214
					
				: (Find in array:C230(atArrayCharNumeric; $vtChar)#-1)  //0-9
					$vbNumeric:=True:C214
					
				Else 
					
			End case 
			
			If (Count in array:C907($alCharacterCodeArray; $vlCode)>2)
				$vbSameChars:=False:C215
			End if 
			
		End for 
		
		
		If ($vlLength>=8)
			$vblength:=True:C214
			LISTBOX SET ROW COLOR:C1270(ListBoxPasswordControl; 1; 0xFF00)
		Else 
			$vblength:=False:C215
			LISTBOX SET ROW COLOR:C1270(ListBoxPasswordControl; 1; 0x00FF0000)
		End if 
		
		If ($vbSameChars)
			LISTBOX SET ROW COLOR:C1270(ListBoxPasswordControl; 2; 0xFF00)
		Else 
			LISTBOX SET ROW COLOR:C1270(ListBoxPasswordControl; 2; 0x00FF0000)
		End if 
		
		If (($vbLength) & (vbPasswordMatch))
			If (($vtText=vtPassword2) | (vtPassword1=$vtText))
				$vbPasswordMatch:=True:C214
				LISTBOX SET ROW COLOR:C1270(ListBoxPasswordControl; 7; 0xFF00)
			Else 
				$vbPasswordMatch:=False:C215
				LISTBOX SET ROW COLOR:C1270(ListBoxPasswordControl; 7; 0x00FF0000)
			End if 
			
		Else 
			$vbPasswordMatch:=False:C215
			LISTBOX SET ROW COLOR:C1270(ListBoxPasswordControl; 7; 0x00FF0000)
		End if 
		
		
		If ($vbLowercase)
			LISTBOX SET ROW COLOR:C1270(ListBoxPasswordControl; 3; 0xFF00)
		Else 
			LISTBOX SET ROW COLOR:C1270(ListBoxPasswordControl; 3; 0x00FF0000)
		End if 
		
		If ($vbUppercase)
			LISTBOX SET ROW COLOR:C1270(ListBoxPasswordControl; 4; 0xFF00)
		Else 
			LISTBOX SET ROW COLOR:C1270(ListBoxPasswordControl; 4; 0x00FF0000)
		End if 
		
		If ($vbNumeric)
			LISTBOX SET ROW COLOR:C1270(ListBoxPasswordControl; 5; 0xFF00)
		Else 
			LISTBOX SET ROW COLOR:C1270(ListBoxPasswordControl; 5; 0x00FF0000)
		End if 
		
		If ($vbSpecialChar)
			LISTBOX SET ROW COLOR:C1270(ListBoxPasswordControl; 6; 0xFF00)
		Else 
			LISTBOX SET ROW COLOR:C1270(ListBoxPasswordControl; 6; 0x00FF0000)
		End if 
		
		
		
		If (($vbLowercase) & ($vbNumeric) & ($vbPasswordMatch) & ($vbSameChars) & ($vbSpecialChar) & ($vbUppercase) & ($vblength))
			$vtNewPassword:=$vtText
			$vtNewPasswordHash:=Generate digest:C1147($vtNewPassword; MD5 digest:K66:1)
			
			If (Find in array:C230(atPasswordList; $vtNewPasswordHash)=-1)
				$vbUnique:=True:C214
				LISTBOX SET ROW COLOR:C1270(ListBoxPasswordControl; 8; 0xFF00)
			Else 
				$vbUnique:=False:C215
				LISTBOX SET ROW COLOR:C1270(ListBoxPasswordControl; 8; 0x00FF0000)
			End if 
			
			If ($vbUnique)
				OBJECT SET ENABLED:C1123(bPasswordControlAccept; True:C214)
			Else 
				OBJECT SET ENABLED:C1123(bPasswordControlAccept; False:C215)
			End if 
			
		Else 
			
			OBJECT SET ENABLED:C1123(bPasswordControlAccept; False:C215)
		End if 
		
		
	: (Form event code:C388=On Close Box:K2:21)
		
		BEEP:C151
		$vtMessage:="You must enter a new password."
		ALERT:C41($vtMessage)
		
End case 