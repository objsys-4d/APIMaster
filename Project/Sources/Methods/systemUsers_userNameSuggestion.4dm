//%attributes = {}

// ----------------------------------------------------
// User name (OS): Edu
// Date and time: 03/09/22, 19:29:52
// ----------------------------------------------------
// Method: systemUsers_userNameSuggestion
// Description
// 
//
// Parameters
// ----------------------------------------------------

If (vtuserUUID="")  //new record
	If (Form:C1466.User.user_lastName#"") & (Form:C1466.User.user_firstName#"")
		Form:C1466.User.userName:=Lowercase:C14(Substring:C12(Form:C1466.User.user_firstName; 1; 1)+Replace string:C233(Form:C1466.User.user_lastName; " "; ""))
	End if 
End if 