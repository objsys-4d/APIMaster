//%attributes = {}
//12/21/2018-Util_MethodTracker (Current method name)// Modified by: Mike Beatty (11/26/18)


// ----------------------------------------------------
// User name (OS): Mike Beatty
// Date and time: 12/13/17, 10:38:04
// ----------------------------------------------------
// Method: pUserViewerDelete
// Description
// 
//
// Parameters
// ----------------------------------------------------

C_LONGINT:C283($vlcolumn; $vlrow; $vlLogin; $vlposition; $vlUserId; $vlUserNumber; $vlResult)
C_DATE:C307($vdDate)
C_TEXT:C284($vtMessage; $vtPassword; $vtStartup; $vtUserName; $vtUserNameNew)

LISTBOX GET CELL POSITION:C971(ListboxPasswordControlGUI; $vlcolumn; $vlrow)

$vtUserName:=atDisplayUserName{$vlrow}
$vlUserNumber:=alDisplayUserID{$vlrow}
// Modified by: Mike Beatty (1/31/18)
Case of 
	: ($vlUserNumber=1)  //designer, don't change
	: ($vlUserNumber=2)  //Adminsitrator, don't change
	: ($vtUserName="Designer")  //designer, don't change
	: ($vtUserName="Administrator")  //Adminsitrator, don't change
	Else 
		
		CONFIRM:C162("Delete user "+$vtUserName+"?"; "Delete"; "Cancel")
		If (ok=1)
			
			//DELETE USER($vlUserNumber)
			C_OBJECT:C1216(oUserUpdate)
			
			OB SET:C1220(oUserUpdate; "UserNumber"; $vlUserNumber)
			OB SET:C1220(oUserUpdate; "UserName"; $vtUserName)
			//OB SET(oUserUpdate;"Method";$vtstartupMethod)
			//OB SET(oUserUpdate;"Password";$vtNewPassword)
			//OB SET(oUserUpdate;"Logins";$vlNumberLogins)
			//OB SET(oUserUpdate;"LastLogin";$vdLastLogin)
			//OB SET ARRAY(oUserUpdate;"Groups";$vpgroups->)
			// Modified by: Mike Beatty (5/21/18)
			$vlResult:=pUserDelete(oUserUpdate)  //this will execute on server
			If ($vlResult=0)
				//success
			Else 
				$vtMessage:="User could not be deleted."
				ALERT:C41($vtMessage)
			End if 
			
			pPasswordControlAuditTrail(Current method name:C684; $vtUserName)  // Modified by: Mike Beatty (3/29/18)
			
			pPasswordControlInitializeArray
			
		End if 
End case 