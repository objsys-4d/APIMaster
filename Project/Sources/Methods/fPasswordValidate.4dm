//%attributes = {}
//12/21/2018-Util_MethodTracker (Current method name)// Modified by: Mike Beatty (11/26/18)


// ----------------------------------------------------
// User name (OS): Mike Beatty
// Date and time: 07/07/17, 14:50:00
// ----------------------------------------------------
// Method: fPasswordValidate
// Description -- method to ensure the password criteria are met
// 
//
// Parameters
// ----------------------------------------------------


C_TEXT:C284($vtChar; $vtNewPassword; $vttext; $vtNewPasswordHash; $vtUser; $message)
C_LONGINT:C283($vlLength; $vlPositionNumeric; $i; $vlCode; $vlwinref)
C_BOOLEAN:C305($vbValidPassword; $vbPrevious)

C_BOOLEAN:C305($vbLength; $vbLowercase; $vbNumeric; $vbSpecialChar; $vbUppercase; $vbValidPassword; $vbSameChars)

//Update 4D Password policy
//8 chars-90 days-new pw can't be the same as last 4

//To be compliant, a password must be random characters and contain at least one numerical character, at least one alphabetic character, 
//upper and lower case alphabetic characters and at least one non-alphanumeric character (e.g., !, @, #, $, %, ^, &, *, ?, etc.). 

//build the necessary arrays
fArrayCharLowercase
fArrayCharNumeric
fArrayCharSpecial
fArrayCharUppercase

ARRAY TEXT:C222(atPasswordCriteria; 0)
$vtUser:=fSSOReturnLogin
$vttext:="The password must be at least 8 characters long."
APPEND TO ARRAY:C911(atPasswordCriteria; $vttext)
$vttext:="The password may not contain more than two of the same characters."
APPEND TO ARRAY:C911(atPasswordCriteria; $vttext)
$vttext:="The password must contain at least 1 lowercase character."
APPEND TO ARRAY:C911(atPasswordCriteria; $vttext)
$vttext:="The password must contain at least 1 uppercase character."
APPEND TO ARRAY:C911(atPasswordCriteria; $vttext)
$vttext:="The password must contain at least 1 numeric character (0-9)."
APPEND TO ARRAY:C911(atPasswordCriteria; $vttext)
$vttext:="The password must contain at least 1 special character (#$%^&>=<?)."
APPEND TO ARRAY:C911(atPasswordCriteria; $vttext)
$vttext:="The password entries must match ."
APPEND TO ARRAY:C911(atPasswordCriteria; $vttext)
$vttext:="The password must differ from the previous four passwords."
APPEND TO ARRAY:C911(atPasswordCriteria; $vttext)

vtPasswordCriteria:=""
For ($i; 1; Size of array:C274(atPasswordCriteria))
	vtPasswordCriteria:=vtPasswordCriteria+atPasswordCriteria{$i}+<>CR+<>CR
	
End for 

If (<>vbSSOActive)
	$message:="You need to set/reset your password for the Internal Payment Portal: payments.oorcm.com"+<>CR+"Remember: Your username is now: "+<>CurrentUser
	ALERT:C41($message)  //mark 04/15/2020
End if 

$vlwinref:=Open form window:C675(; "PasswordControl")
vtPassword1:=""
vtPassword2:=""
DIALOG:C40(; "PasswordControl")
CLOSE WINDOW:C154($vlwinref)

If (ok=1)
	//this code is run during the checking phase on screen, can be removed, leaving in for reference
	
	QUERY:C277(; ="PasswordControl"; *)
	QUERY:C277(;  & ; =$vtUser)
	
	ORDER BY:C49(; ; <)
	REDUCE SELECTION:C351(; 4)
	
	ARRAY TEXT:C222($atPasswordList; 0)
	//SELECTION TO ARRAY([Utility]Alpha4;$atPasswordList)  //this will be a hashed list
	SELECTION TO ARRAY:C260(; $atPasswordList)  //884551 - 3/25/2020;rebecca - Use SHA1 value; this will be a hashed list
	
	$vtNewPassword:=vtPassword1
	
	//$vtNewPasswordHash:=Generate digest($vtNewPassword;MD5 digest)
	$vtNewPasswordHash:=Generate digest:C1147($vtNewPassword; SHA1 digest:K66:2)  //884551 - 3/25/2020;rebecca - Use SHA1 value
	
	ARRAY TEXT:C222($atTextArray; 0)
	
	For ($i; 1; Length:C16($vtNewPassword))
		$vtChar:=Substring:C12($vtNewPassword; $i; 1)
		APPEND TO ARRAY:C911($atTextArray; $vtChar)
	End for 
	//API Text To Array ($vtNewPassword;"";$atTextArray)
	
	$vlLength:=Length:C16($vtNewPassword)
	//$vlPositionNumeric:=
	
	$vbValidPassword:=True:C214
	Case of 
		: ($vlLength<8)
			$vbLength:=False:C215
			
		: (Find in array:C230($atPasswordList; $vtNewPasswordHash)#-1)
			$vbPrevious:=False:C215
			
		Else 
			$vbLength:=True:C214
			$vbSameChars:=True:C214
			$vbPrevious:=True:C214
			
			For ($i; 1; $vlLength)
				$vtChar:=Substring:C12($vtNewPassword; $i; 1)
				$vlCode:=Character code:C91($vtNewPassword[[$i]])
				//I have this outside the case statement so that each elements processes
				If (Count in array:C907($atTextArray; $vtChar)>2)
					$vbSameChars:=False:C215
				End if 
				
				Case of 
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
				
			End for 
			
			
	End case 
	
	If ($vbPrevious)
		DELETE FROM ARRAY:C228(atPasswordCriteria; 7; 1)
	Else 
		$vbValidPassword:=False:C215
	End if 
	
	If ($vbSpecialChar)
		DELETE FROM ARRAY:C228(atPasswordCriteria; 6; 1)
	Else 
		$vbValidPassword:=False:C215
	End if 
	
	If ($vbNumeric)
		DELETE FROM ARRAY:C228(atPasswordCriteria; 5; 1)
	Else 
		$vbValidPassword:=False:C215
	End if 
	
	If ($vbUppercase)
		DELETE FROM ARRAY:C228(atPasswordCriteria; 4; 1)
	Else 
		$vbValidPassword:=False:C215
	End if 
	
	If ($vbLowercase)
		DELETE FROM ARRAY:C228(atPasswordCriteria; 3; 1)
	Else 
		$vbValidPassword:=False:C215
	End if 
	
	If ($vbSameChars)
		DELETE FROM ARRAY:C228(atPasswordCriteria; 2; 1)
	Else 
		$vbValidPassword:=False:C215
	End if 
	
	If ($vbLength)
		DELETE FROM ARRAY:C228(atPasswordCriteria; 1; 1)
	Else 
		$vbValidPassword:=False:C215
	End if 
	
	
	If ($vbValidPassword=True:C214)
		
		
	Else 
		$vtText:=""
		For ($i; 1; Size of array:C274(atPasswordCriteria))
			$vttext:=$vttext+atPasswordCriteria{$i}+<>CR
			
		End for 
		
		ALERT:C41($vttext)
	End if 
	
	
Else 
	
	$vbValidPassword:=False:C215
End if 

If ($vbValidPassword)
	$0:=$vbValidPassword
Else 
	//If (User in group(fCurrentUser ;"PasswordControl"))  //allow these users to bypass
	If (fUserInGroup($vtUser; "PasswordControl"))  // Modified by: Mike Beatty (8/14/19) Task 49257/TFS 823665, user in group functionality
		$0:=True:C214
	Else 
		$0:=fPasswordValidate
	End if 
End if 

