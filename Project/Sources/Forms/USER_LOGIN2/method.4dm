Case of 
	: (FORM Event:C1606=On Load:K2:1)
		userLogin_OnLoad
		
	: (FORM Event:C1606=On Clicked:K2:4)
		vtUsernameobj
		
		
	: (FORM Event:C1606=On Data Change:K2:15)
		
		
	: (Form event code:C388=On Timer:K2:25)
		SET TIMER:C645(0)
		vtUserErrText:=""
		
End case 