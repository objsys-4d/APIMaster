//%attributes = {}
//1/28/2019-Util_MethodTracker (Current method name)// Modified by: Mike Beatty (11/26/18)


// ----------------------------------------------------
// User name (OS): Mike Beatty
// Date and time: 07/19/17, 12:58:10
// ----------------------------------------------------
// Method: pUserViewerEditPassword
// Description
// 
//
// Parameters
// ----------------------------------------------------

C_DATE:C307($vdDate)
C_TEXT:C284($vtPassword; $vtStartup; $vtUserName; $vtMessage; $vtAction)
C_LONGINT:C283($vlLogin; $vlUserId; $vlUserNumber)
ARRAY LONGINT:C221($alGroups; 0)

C_LONGINT:C283($vlcolumn; $vlrow)
LISTBOX GET CELL POSITION:C971(ListBoxUserViewer; $vlcolumn; $vlrow)

If (Count parameters:C259=0)
	$vtUserName:=atUserNames{$vlrow}
	$vlUserNumber:=alUserNumbers{$vlrow}
	
Else 
	$vtUserName:=$1
	$vlUserNumber:=$2
	
	
End if 

CONFIRM:C162("Change the password for user "+$vtUserName+"?"; "Change"; "Cancel")
If (ok=1)
	GET USER PROPERTIES:C611($vlUserNumber; $vtUserName; $vtStartup; $vtPassword; $vlLogin; $vdDate; $alGroups)
	Case of 
			
		: ($vlUserNumber=1)  //designer, don't change
		: ($vlUserNumber=2)  //Adminsitrator, don't change
		: ($vtUserName="Designer")  //designer, don't change
		: ($vtUserName="Administrator")  //Adminsitrator, don't change
			
		: (fPasswordValidate)
			// Modified by: Mike Beatty (5/21/18)
			$vtAction:="EditPassword"
			$vlUserId:=fUserSetProperties($vlUserNumber; $vtUserName; $vtStartup; vtPassword1; $vlLogin; $vdDate; ->$alGroups; $vtAction)
			If ($vlUserId=$vlUserNumber)
				
				//CREATE RECORD()
				//:="PasswordControl"
				//:=$vtUserName
				//:=fCurrentDate
				//:=fCurrentDate
				//:=Generate digest(vtPassword2; MD5 digest)
				//:=fCurrentUser
				//:=fReturnIPAddress
				//:=fTimeStampGenerate
				//:=fCurrentTime
				//:=True
				//pUtilitySaveRecord
				$vtMessage:="Password has been changed."
				ALERT:C41($vtMessage)
				
				pPasswordControlAuditTrail(Current method name:C684; $vtUserName)
			Else 
				$vtMessage:="Password has not been changed."
				ALERT:C41($vtMessage)
			End if 
	End case 
	
End if 
