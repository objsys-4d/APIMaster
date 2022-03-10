//%attributes = {}
// ----------------------------------------------------
// User name (OS): Edu
// Date and time: 12/09/20, 21:55:37
// ----------------------------------------------------
// Method: GEN_TextFile_Create
// Description
// 
//
// Parameters
// ----------------------------------------------------
C_TIME:C306($vhDocRef)
C_TEXT:C284($1; $2; $FileFullPath; $TextData)
$FileFullPath:=$1
$TextData:=$2

If (Test path name:C476($FileFullPath)=Is a document:K24:1)
	DELETE DOCUMENT:C159($FileFullPath)  //replace
End if 

$vhDocRef:=Create document:C266($FileFullPath)
If (OK=1)  // If document has been created successfully
	CLOSE DOCUMENT:C267($vhDocRef)  //Closes the document
	TEXT TO DOCUMENT:C1237(Document; $TextData)
End if 

