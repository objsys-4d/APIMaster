//%attributes = {}



// ----------------------------------------------------
// User name (OS): Mike Beatty
// Date and time: 07/19/17, 13:01:15
// ----------------------------------------------------
// Method: pUserViewerEditName
// Description
// 
//
// Parameters
// ----------------------------------------------------

C_LONGINT:C283($vlcolumn; $vlrow; $vlLogin; $vlposition; $vlUserId; $vlUserNumber; $vlCounter)
C_DATE:C307($vdDate)
C_TEXT:C284($vtMessage; $vtPassword; $vtStartup; $vtUserName; $vtUserNameNew; $vtAction)
ARRAY LONGINT:C221($algroups; 0)
TRACE:C157

//LISTBOX GET CELL POSITION(ListBoxUserViewer;$vlcolumn;$vlrow)
LISTBOX GET CELL POSITION:C971(ListboxPasswordControlGUI; $vlcolumn; $vlrow)

//$vtUserName:=atUserNames{$vlrow}
//$vlUserNumber:=alUserNumbers{$vlrow}

$vtUserName:=atDisplayUserName{$vlrow}
$vlUserNumber:=alDisplayUserID{$vlrow}

CONFIRM:C162("Change user name: "+<>tab+$vtUserName; "Change"; "Cancel")
If (ok=1)
	$vtUserNameNew:=Request:C163("Please enter the new user name."; "Firstname Lastname")
	If (ok=1)
		$vlposition:=Find in array:C230(atDisplayUserName; $vtUserNameNew)
		If ($vlposition=-1)
			CONFIRM:C162("Current name: "+<>Tab+$vtUserName+<>CR+<>CR+"Updated name:"+<>Tab+$vtUserNameNew; "Change"; "Cancel")
		Else 
			$vtMessage:="This user name already exists."
			ALERT:C41($vtMessage)
		End if 
		If (ok=1)
			
			GET USER PROPERTIES:C611($vlUserNumber; $vtUserName; $vtStartup; $vtPassword; $vlLogin; $vdDate; $algroups)
			$vtAction:="EditName"
			$vlUserId:=fUserSetProperties($vlUserNumber; $vtUserNameNew; $vtStartup; "*"; $vlLogin; $vdDate; ->$algroups; $vtAction)
			
			$vlCounter:=0
			Repeat 
				$vlCounter:=$vlCounter+1
			Until ($vlUserId=$vlUserNumber)
			
			pPasswordControlAuditTrail(Current method name:C684; $vtUserName)  // Modified by: Mike Beatty (3/29/18)
			
			pPasswordControlInitializeArray
			
			//ARRAY TEXT(aUserNames;0)
			//ARRAY LONGINT(aUserNumbers;0)
			//  //ARRAY LONGINT($almembership;0)
			
			//GET USER LIST(aUserNames;aUserNumbers)
			
			//SORT ARRAY(aUserNames;aUserNumbers)
			
			//$vlPosition:=Find in array(aUserNames;vtUserName)
			$vlPosition:=Find in array:C230(atDisplayUserName; $vtUserNameNew)
			
			
			//LISTBOX SELECT ROW(ListBoxUserViewer;$vlPosition)
			//OBJECT SET SCROLL POSITION(ListBoxUserViewer;$vlPosition)
			
			LISTBOX SELECT ROW:C912(ListboxPasswordControlGUI; $vlPosition)
			OBJECT SET SCROLL POSITION:C906(ListboxPasswordControlGUI; $vlPosition)
			
		End if 
	Else 
		
	End if 
	
End if 