//%attributes = {}
// ----------------------------------------------------
// User name (OS): Edu
// Date and time: 02/22/22, 22:58:36
// ----------------------------------------------------
// Method: userLogin_GUI
// Description
// Opens the User Login GUI. 
// Clicking the Cancel button will close and exit the application.
//
// Parameters
// ----------------------------------------------------
C_LONGINT:C283($LWinRef)
$LWinRef:=CenterWindow(310; 500; 0; 0; 1)
DIALOG:C40("user_Login")
CLOSE WINDOW:C154
If (OK=1)
	
	
Else 
	
	QUIT 4D:C291
	
End if 