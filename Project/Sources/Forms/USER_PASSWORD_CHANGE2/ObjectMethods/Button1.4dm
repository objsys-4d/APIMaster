If (vChngPwd_NewPwd="")
	ALERT:C41("New Password cannot be blank.")
Else 
	If (vChngPwd_NewPwd#vChngPwd_ConfPwd)
		ALERT:C41("The New Password and the Confirm Password fields does not match!")
	Else 
		ACCEPT:C269
	End if 
End if 