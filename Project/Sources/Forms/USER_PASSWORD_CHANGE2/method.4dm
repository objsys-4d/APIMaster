Case of 
	: (Form event code:C388=On Load:K2:1)
		//C_LONGINT(vChngPwd_UserID)
		C_TEXT:C284(vChngPwd_NewPwd; vChngPwd_ConfPwd)
		vChngPwd_NewPwd:=""
		vChngPwd_ConfPwd:=""
		OBJECT SET FONT:C164(*; "ChngPwd_@"; "%Password")
		OBJECT SET ENABLED:C1123(bttnChangePw; False:C215)
		
	: (Form event code:C388=On Data Change:K2:15)
		If (vChngPwd_NewPwd=vChngPwd_ConfPwd)
			OBJECT SET ENABLED:C1123(bttnChangePw; True:C214)
		Else 
			If (vChngPwd_NewPwd#"") & (vChngPwd_ConfPwd#"")
				ALERT:C41("Passwords do not match.")
			End if 
			OBJECT SET ENABLED:C1123(bttnChangePw; False:C215)
		End if 
		
	: (Form event code:C388=On Clicked:K2:4)
		
		
	: (Form event code:C388=On Unload:K2:2)
		
End case 