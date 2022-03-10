//%attributes = {}

// ----------------------------------------------------
// User name (OS): Edu
// Date and time: 01/06/21, 21:48:55
// ----------------------------------------------------
// Method: SYS_LongNameToFolderName
// Description
// 
//
// Parameters
// ----------------------------------------------------
C_BOOLEAN:C305($end)
C_TEXT:C284($1; $text; $0)
C_LONGINT:C283($viLen; $viPos; $viChar; $viDirSymbol)
$text:=$1

$viDirSymbol:=Character code:C91(Folder separator:K24:12)
Repeat 
	If (Character code:C91(Substring:C12($text; Length:C16($text)))=$viDirSymbol)
		$text:=Substring:C12($text; 1; Length:C16($text)-1)
	Else 
		$end:=True:C214
	End if 
Until ($end) | (Length:C16($text)=0)

$viLen:=Length:C16($text)
$viPos:=0
For ($viChar; $viLen; 1; -1)
	If (Character code:C91($text[[$viChar]])=$viDirSymbol)
		$viPos:=$viChar
		$viChar:=0
	End if 
End for 
If ($viPos>0)
	$0:=Substring:C12($text; $viPos+1)
Else 
	$0:=$text
End if 