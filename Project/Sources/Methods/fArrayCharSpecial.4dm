//%attributes = {}
//12/21/2018-Util_MethodTracker (Current method name)// Modified by: Mike Beatty (11/26/18)


// ----------------------------------------------------
// User name (OS): Mike Beatty
// Date and time: 07/07/17, 15:16:54
// ----------------------------------------------------
// Method: fArrayCharSpecial
// Description
// 
//
// Parameters
// ----------------------------------------------------


C_LONGINT:C283($vlCharacterStart; $i)
ARRAY TEXT:C222(atArrayCharSpecial; 0)

$vlCharacterStart:=33
For ($i; 1; 6)
	
	APPEND TO ARRAY:C911(atArrayCharSpecial; Char:C90($vlCharacterStart))
	$vlCharacterStart:=$vlCharacterStart+1
End for 

$vlCharacterStart:=60
For ($i; 1; 4)
	
	APPEND TO ARRAY:C911(atArrayCharSpecial; Char:C90($vlCharacterStart))
	$vlCharacterStart:=$vlCharacterStart+1
End for 

APPEND TO ARRAY:C911(atArrayCharSpecial; "^")  //this is ascii 94, but listed in the approved list via text  (#$%^&>=<?) - mark 01/21/2020