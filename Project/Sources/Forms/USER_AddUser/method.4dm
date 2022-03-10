Case of 
	: (Form event code:C388=On Load:K2:1)
		systemUsers_onLoad
		
	: (Form event code:C388=On Data Change:K2:15)
		systemUsers_onDataChange
		
	: (Form event code:C388=On Clicked:K2:4)
		systemUsers_onClicked
		
	: (Form event code:C388=On Unload:K2:2)
		vtuserUUID:=""  //reset
		
End case 