Case of 
	: (Form event code:C388=On Load:K2:1)
		userLogin_OnLoad
		
	: (Form event code:C388=On Clicked:K2:4)
		userLogin_OnClicked
		
	: (Form event code:C388=On Data Change:K2:15)
		userLogin_OnDataChange
		
	: (Form event code:C388=On Timer:K2:25)
		SET TIMER:C645(0)
		vtUserErrText:=""
End case 