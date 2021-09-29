//%attributes = {}

// ----------------------------------------------------
// User name (OS): Mike Beatty
// Date and time: 06/05/21, 08:50:22
// ----------------------------------------------------
// Method: zoom_WebinarGet
// Description
// 
//
// Parameters
//
// Change History
// ----------------------------------------------------

//C_OBJECT(objZoom)

//objZoom:=New object

//objZoom.module:="webinar"
////this is Mike's user ID - will need AFSA
//objZoom.userId:="PtuwsJygRfm26vp0biIlIg"  //Form.user_LB.currentItem.id

//Form.webinar_LB.data:=zoom_Connect(objZoom)


C_OBJECT:C1216($objResponse)
$objResponse:=zoom_Connect(objZoom)

C_OBJECT:C1216($objResponse)
$objResponse:=New object:C1471
//$objResponse:=OB Copy(Form.webinar_LB.data; "webinars")

ARRAY TEXT:C222(atProperties; 0)
ARRAY LONGINT:C221(alTypes; 0)
OB GET PROPERTY NAMES:C1232($objResponse; atProperties; alTypes)

Case of 
	: (Find in array:C230(atProperties; "Message")#-1)  //message indicates data vs object
		Form:C1466.webinar_LB.data.webinars:=Null:C1517
		
	: ($objResponse.total_records>0)
		If ($objResponse.webinars.length>0)
			
			Form:C1466.webinar_LB.data.webinars:=$objResponse.webinars
		Else 
			Form:C1466.webinar_LB.data.webinars:=Null:C1517
		End if 
		
	Else 
		Form:C1466.webinar_LB.data.webinars:=Null:C1517
End case 

