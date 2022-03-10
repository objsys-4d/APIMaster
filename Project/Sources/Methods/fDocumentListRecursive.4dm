//%attributes = {}
// ----------------------------------------------------
// User name (OS): Edu
// Date and time: 03/02/22, 23:19:13
// ----------------------------------------------------
// Method: fDocumentListRecursive
// Description
// 
//
// Parameters
// ----------------------------------------------------
C_TEXT:C284($vtSourceFolder; $vtDestinationFolder; $vtFolderPath; $rootFolder)
C_LONGINT:C283($d; $f)
C_BOOLEAN:C305(vblOverwrite; vbIncludeSub)

$vtSourceFolder:=$1
$vtDestinationFolder:=$2
$vtAction:=$3

$rootFolder:=SYS_LongNameToFolderName($vtSourceFolder)
$vtDestinationFolder:=$vtDestinationFolder+$rootFolder+Folder separator:K24:12
If (Test path name:C476($vtDestinationFolder)=Is a folder:K24:2)
Else 
	CREATE FOLDER:C475($vtDestinationFolder; *)
End if 

ARRAY TEXT:C222($atDocumentList; 0)
DOCUMENT LIST:C474($vtSourceFolder; $atDocumentList)
For ($d; 1; Size of array:C274($atDocumentList))
	$sourceFileName:=$vtSourceFolder+$atDocumentList{$d}
	$destinationFileName:=$vtDestinationFolder+$atDocumentList{$d}
	If (vblOverwrite)
		COPY DOCUMENT:C541($sourceFileName; $destinationFileName; *)
	Else 
		If (Test path name:C476($destinationFileName)=Is a document:K24:1)
			$dateTime:=String:C10(Current date:C33; ISO date GMT:K1:10)
			$dateTime:=Replace string:C233($dateTime; "-"; "")
			$dateTime:=Replace string:C233($dateTime; ":"; "")
			$destinationFileName:=$vtDestinationFolder+"Copy_"+$dateTime+"_"+$atDocumentList{$d}
		End if 
		COPY DOCUMENT:C541($sourceFileName; $destinationFileName)
	End if 
	If ($vtAction="move")
		DELETE DOCUMENT:C159($sourceFileName)
	End if 
	
End for   //$d

If (vbIncludeSub)  //include subfolders
	//process sub folders
	ARRAY TEXT:C222($atFolderList; 0)
	FOLDER LIST:C473($vtSourceFolder; $atFolderList)
	For ($f; 1; Size of array:C274($atFolderList))
		$vtCurentFolder:=$vtSourceFolder+$atFolderList{$f}+Folder separator:K24:12
		fDocumentListRecursive($vtCurentFolder; $vtDestinationFolder; $vtAction)
	End for 
	
End if 
