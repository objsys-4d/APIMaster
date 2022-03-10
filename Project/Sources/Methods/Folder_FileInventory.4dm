//%attributes = {}
// ----------------------------------------------------
// User name (OS): Edu
// Date and time: 03/04/22, 01:01:02
// ----------------------------------------------------
// Method: Folder_FileInventory
// Description
// 
//
// Parameters
// ----------------------------------------------------

C_TEXT:C284($vtSourceFolder; $files; $dateTime; $Directory; $FullPath)

$vtSourceFolder:=Select folder:C670("Select folder"; System folder:C487(Desktop:K41:16))
If (OK=1)
	ARRAY TEXT:C222($atDocumentList; 0)
	ARRAY TEXT:C222($atFilesList; 0)
	DOCUMENT LIST:C474($vtSourceFolder; $atDocumentList)
	For ($d; 1; Size of array:C274($atDocumentList))
		
		If ($atDocumentList{$d}#"@Summary@")  //exclude summary
			$fileName:=Substring:C12($atDocumentList{$d}; 1; Position:C15("RTI"; $atDocumentList{$d})+2)
			$files:=$files+$fileName+"\r"
		End if 
		
	End for   //$d
	
	If ($files="")
		ALERT:C41("No files process.")
	Else 
		
		$Directory:=Select folder:C670("Select file location to save file"; System folder:C487(Desktop:K41:16))
		If (OK=1)
			$dateTime:=String:C10(Current date:C33; ISO date GMT:K1:10)
			$dateTime:=Replace string:C233($dateTime; "-"; "")
			$dateTime:=Replace string:C233($dateTime; ":"; "")
			$FullPath:=$Directory+"FileList_"+$dateTime+".txt"
			GEN_TextFile_Create($FullPath; $files)
		End if 
	End if 
End if 