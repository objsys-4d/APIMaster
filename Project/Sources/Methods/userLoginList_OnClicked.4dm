//%attributes = {}
// ----------------------------------------------------
// User name (OS): Edu
// Date and time: 02/22/22, 22:19:48
// ----------------------------------------------------
// Method: userLogin_OnClicked
// Description
// 
//
// Parameters
// ----------------------------------------------------

Case of 
	: (FORM Event:C1606.objectName="btLogin")
		userLoginList_Verify
		
	: (FORM Event:C1606.objectName="userLoginlb")
		vtUser:=""
		vtPassword:=""
		If (Form:C1466.userLoginlb.position>0)
			vtUser:=Form:C1466.userLoginlb.item.user_firstName+" "+Form:C1466.userLoginlb.item.user_lastName
		End if 
		
	: (FORM Event:C1606.objectName="lbUserNamesObj")
		If (lbUserNames=0)  //clicked empty line
			vtUser:=""
			vlUserID:=0
			vtPassword:=""
		Else 
			vtUser:=atUsernames{lbUserNames}
			vlUserID:=atUsernumbers{lbUserNames}
			GOTO OBJECT:C206(*; "vtPasswordObj")
		End if 
		
End case 