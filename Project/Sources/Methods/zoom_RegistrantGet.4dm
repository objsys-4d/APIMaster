//%attributes = {}

// ----------------------------------------------------
// User name (OS): Mike Beatty
// Date and time: 06/05/21, 08:40:02
// ----------------------------------------------------
// Method: zoom_RegistrantGet
// Description
// 
//
// Parameters
//
// Change History
// ----------------------------------------------------

OBJECT SET VISIBLE:C603(*; "ListboxAbsentee"; False:C215)
OBJECT SET VISIBLE:C603(*; "ListboxParticipant"; False:C215)
OBJECT SET VISIBLE:C603(*; "ListboxRegistrant"; True:C214)


//C_OBJECT(objZoom)

//objZoom:=New object

objZoom.module:="registrant"
//objZoom.userId:="PtuwsJygRfm26vp0biIlIg"
//objZoom.webinarId:=Form.e.InventoryObject.url

C_OBJECT:C1216($objResponse)
$objResponse:=New object:C1471
$objResponse:=zoom_Connect(objZoom)

//MaxZoom
//ZoomMax

//ALERT(JSON Stringify($objResponse; *))


//TRACE
//C_OBJECT($objResponse)
//$objResponse:=New object
//$objResponse:=OB Copy(Form.registrant_LB.data; "registrants")

ARRAY TEXT:C222(atProperties; 0)
ARRAY LONGINT:C221(alTypes; 0)
OB GET PROPERTY NAMES:C1232($objResponse; atProperties; alTypes)

Case of 
	: (Find in array:C230(atProperties; "Message")#-1)  //message indicates data vs object
		//Form.eventZoom_lb.data.registrants:=Null
		
	: ($objResponse.total_records>0)
		If ($objResponse.registrants.length>0)
			For each ($loop; $objResponse.registrants)
				$loop.create_time:=Date:C102($loop.create_time)
			End for each 
			Form:C1466.eventZoom_lb.data:=$objResponse.registrants
		Else 
			//Form.eventZoom_lb.data.registrants:=Null
		End if 
		
	Else 
		//Form.eventZoom_lb.data.registrants:=Null
End case 

