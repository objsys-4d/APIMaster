//%attributes = {}
//12/21/2018-Util_MethodTracker (Current method name)// Modified by: Mike Beatty (11/26/18)


// ----------------------------------------------------
// User name (OS): Mike Beatty
// Date and time: 07/07/17, 15:15:16
// ----------------------------------------------------
// Method: fArrayCharNumeric
// Description
// 
//
// Parameters
// ----------------------------------------------------


C_LONGINT:C283($vlCharacterStart; $i)

ARRAY TEXT:C222(atArrayCharNumeric; 0)

$vlCharacterStart:=48  //start with 1
For ($i; 1; 10)
	
	APPEND TO ARRAY:C911(atArrayCharNumeric; Char:C90($vlCharacterStart))
	$vlCharacterStart:=$vlCharacterStart+1
End for 