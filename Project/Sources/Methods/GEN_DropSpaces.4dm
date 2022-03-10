//%attributes = {}

// ----------------------------------------------------
// User name (OS): Edu
// Date and time: 03/09/22, 19:22:58
// ----------------------------------------------------
// Method: GEN_DropSpaces
// Description
// This method returns a string value
// Reduces extra spaces between words to 1
//Syntax: Field/Var:=GEN_DropSpaces(Field/Var)
//Example: vName:=GEN_DropSpaces(vName)

// Parameters
//$1 - Text
//$0 - Text (return)
// ----------------------------------------------------
C_TEXT:C284($1; $0)

$String:=$1
If (Length:C16($String)#0)  //not an empty string
	//-----------delete spaces before the word(s)
	While (Substring:C12($String; 1; 1)=" ")
		$String:=Delete string:C232($String; 1; 1)
	End while 
End if 
If (Length:C16($String)#0)  //not an empty string
	//-----------delete spaces after the word(s)
	While (Substring:C12($String; Length:C16($String); 1)=" ")
		$String:=Delete string:C232($String; Length:C16($String); 1)
	End while 
End if 
If (Length:C16($String)#0)  //not an empty string  
	$Len:=Length:C16($String)
	$i:=1
	//-----------delete spaces between words
	Repeat 
		$char:=Substring:C12($String; $i; 1)
		While (Substring:C12($String; $i; 1)=" ")
			If (Substring:C12($String; $i+1; 1)#" ")
				$i:=$i+1
			Else 
				$String:=Delete string:C232($String; $i; 1)
			End if 
		End while 
		$i:=$i+1
	Until ($i>=$Len)
	//-----------end
End if 
$0:=$String

