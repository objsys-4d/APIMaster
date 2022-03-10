//%attributes = {}
// ----------------------------------------------------
// User name (OS): Mike Beatty
// Date and time: 07/07/17, 15:08:02
// ----------------------------------------------------
// Method: fArrayCharLowercase
// Description
// 
//
// Parameters
// ----------------------------------------------------

C_LONGINT:C283($vlCharacterStart; $i)
ARRAY TEXT:C222(atArrayCharLowercase; 0)

$vlCharacterStart:=97  //start with a
For ($i; 1; 26)
	
	APPEND TO ARRAY:C911(atArrayCharLowercase; Char:C90($vlCharacterStart))
	$vlCharacterStart:=$vlCharacterStart+1
End for 