//%attributes = {}
TRACE:C157

//webinars
C_OBJECT:C1216(objZoom; $oResponse)
objZoom:=New object:C1471
objZoom.module:="webinar"
objZoom.userId:="PtuwsJygRfm26vp0biIlIg"
objZoom.webinarId:="8285649782"  //Form.e.InventoryObject.url

//$objCall:=objZoom

$oResponse:=zoom_Connect(objZoom)


//webinarDetails
C_OBJECT:C1216(objZoom2; $oResponse2)
objZoom2:=New object:C1471
objZoom2.module:="webinarDetails"
objZoom2.userId:="PtuwsJygRfm26vp0biIlIg"
objZoom2.webinarId:=$oResponse.webinars[0].id

$oResponse2:=zoom_Connect(objZoom2)

