Case of 
	: (Form event code:C388=On Load:K2:1)
		userLoginList_OnLoad
		
	: (Form event code:C388=On Clicked:K2:4)
		userLoginList_OnClicked
		
	: (Form event code:C388=On Timer:K2:25)
		SET TIMER:C645(0)
		vtUserErrText:=""
End case 