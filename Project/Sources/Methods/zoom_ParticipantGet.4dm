//%attributes = {}

// ----------------------------------------------------
// User name (OS): Mike Beatty
// Date and time: 06/05/21, 08:43:20
// ----------------------------------------------------
// Method: zoom_ParticipantGet
// Description
// 
//
// Parameters
//
// Change History
// ----------------------------------------------------

OBJECT SET VISIBLE:C603(*; "ListboxAbsentee"; False:C215)
OBJECT SET VISIBLE:C603(*; "ListboxParticipant"; True:C214)
OBJECT SET VISIBLE:C603(*; "ListboxRegistrant"; False:C215)

//C_OBJECT(objZoom)

//objZoom:=New object

objZoom.module:="participant"
//objZoom.userId:="PtuwsJygRfm26vp0biIlIg"
//objZoom.webinarId:=Form.e.InventoryObject.url
C_OBJECT:C1216($objResponse)
$objResponse:=New object:C1471
$objResponse:=zoom_Connect(objZoom)


//$objResponse:=OB Copy(Form.participant_LB.data; "participants")

ARRAY TEXT:C222(atProperties; 0)
ARRAY LONGINT:C221(alTypes; 0)
OB GET PROPERTY NAMES:C1232($objResponse; atProperties; alTypes)

Case of 
	: (Find in array:C230(atProperties; "Message")#-1)  //message indicates data vs object
		//Form.eventZoom_lb.data.participants:=Null
		
	: ($objResponse.total_records>0)
		If ($objResponse.participants.length>0)
			For each ($loop; $objResponse.participants)
				$loop.survey:=False:C215
			End for each 
			
			For each ($loop; $objResponse.participants)
				$loop.join_time:=Time string:C180(Time:C179($loop.join_time))
			End for each 
			Form:C1466.eventZoom_lb.data:=$objResponse.participants
		Else 
			//Form.eventZoom_lb.data.participants:=Null
		End if 
		
	Else 
		//Form.eventZoom_lb.data.participants:=Null
End case 