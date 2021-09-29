//%attributes = {}

// ----------------------------------------------------
// User name (OS): Mike Beatty
// Date and time: 06/18/21, 13:19:40
// ----------------------------------------------------
// Method: zoom_Connect
// Description
// 
//
// Parameters
//
// Change History
// ----------------------------------------------------


If (False:C215)
	// METHOD: Zoom TEST
	// AUTHOR: MFERGUSON 5/21
	// PURPOSE: TEST Zoom SETTING FROM CONSOLE
	//
	//still need to figure out JWT config
	//connection - we need consistent connection string, error handling, ability to see/modify keys
	//staff creates webinar, add to inventory table
	//we need to  know webinar ID
	//we find invoice items that macth webinar product line, purchased today?
	//from invoice item, we get order EID, find person record
	//from person record, we get email, send note
	
	//we get person info, contact Zoom
End if 

C_OBJECT:C1216($0)
C_OBJECT:C1216($1)

//create an object to hold parametrs for POST/users/{userId}/webinars

//$objResponse:=maf_Zoom_WebinarCreate($objZoom)


C_TEXT:C284($t_Consumer_Key; $t_Token; $t_Nonce; $t_Epoch_TimeStamp; $t_Realm; $t_Url; $URL; $vtUser)
C_TEXT:C284($t_SigningKey; $t_Consumer_Secret; $t_Token_Secret; $t_Signature)
C_TEXT:C284(t_Method; $t_Epoch_TimeStamp)
C_TEXT:C284($t_BaseString; $t_SigningKey)
//C_TEXT($0)
C_TEXT:C284($t_Response; $t_JWT)
C_LONGINT:C283(l_ReturnCode)
C_OBJECT:C1216($PayLoad_Object; $1)
C_TEXT:C284($t_Text; t_Result; $HTTP_method)
t_Result:=""

C_OBJECT:C1216($request)
C_OBJECT:C1216($response)
$request:=New object:C1471
$response:=New object:C1471

C_OBJECT:C1216(objZoom)
objZoom:=New object:C1471
objZoom.module:="webinar"
objZoom.userId:="PtuwsJygRfm26vp0biIlIg"
objZoom.webinarId:="8285649782"  //Form.e.InventoryObject.url

$objCall:=objZoom

$objCall:=$1

// THESE TOKENS ARE FOR MY SANDBOX ACCOUNT WHICH ANYONE SHOULD BE ABLE TO 
// ACCESS WITH THESE CREDETIALS
C_TEXT:C284($API_Key; $API_Secret; $IM_Chat_History_Token; $JWT_Token; $jwt_signature)
$API_Key:="aV5emclBSXOdFP247Kr5wA"
$API_Secret:="Ukm7CHzFBYGMr7oE3iIyqXBubr5Pn4xML5Qo"
$IM_Chat_History_Token:="eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJQdHV3c0p5Z1JmbTI2dnAwYmlJbElnIn0.lTh9fwQZ04OjSDyU1_U1jcJtJeUFPiLF8RRYkwvTTA4"

$JWT_TokenNew:="eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOm51bGwsImlzcyI6ImFWNWVtY2xCU1hPZEZQMjQ3S3I1d0EiLCJleHAiOjE2MzMzNTU0NDAsImlhdCI6MTYzMjc1MDY0MH0.w86urV9DuKgc0C614GDXDRrrgPmHy5BhwBSM6YA0yGE"
$base_URL:="https://api.zoom.us/v2/users/"  // get a list of users on the zoom account

//objCall.userId:="PtuwsJygRfm26vp0biIlIg" 

$vtModule:=$objCall.module

$vbContinue:=True:C214
Case of 
		
	: ($vtModule="user")
		$HTTP_method:=HTTP GET method:K71:1
		$Call_URL:=$base_URL+"?status=active&page_size=30"  //t users
		
	: ($vtModule="webinar")
		
		$vtUser:=$objCall.userId
		
		$HTTP_method:=HTTP GET method:K71:1
		$vtUser:=$vtUser+"/webinars"
		$Call_URL:=$base_URL+$vtUser
		
	: ($vtModule="webinarDetails")
		
		$base_URL:="https://api.zoom.us/v2"
		
		$vlwebinarId:=$objCall.webinarId
		
		$HTTP_method:=HTTP GET method:K71:1
		$vtWebinar:="/webinars"+"/"+String:C10($vlwebinarId)  //+"/registrants"
		
		$Call_URL:=$base_URL+$vtWebinar
		
	: ($vtModule="registrant")
		
		$base_URL:="https://api.zoom.us/v2/"
		$vlwebinarId:=$objCall.webinarId
		
		$HTTP_method:=HTTP GET method:K71:1
		$vtWebinar:="/webinars"+"/"+String:C10($vlwebinarId)+"/registrants"
		//$Call_URL:=$base_URL+$vtUser+$vtWebinar
		$Call_URL:=$base_URL+$vtWebinar
		
	: ($vtModule="participant")
		$vtUser:=$objCall.userId
		
		$base_URL:="https://api.zoom.us/v2/"
		$vlwebinarId:=$objCall.webinarId
		
		$HTTP_method:=HTTP GET method:K71:1
		//$vtWebinar:="/past_webinars"+"/"+String($vlwebinarId)+"/participants"
		$vtWebinar:="metrics/webinars"+"/"+String:C10($vlwebinarId)+"/participants"
		
		//$Call_URL:=$base_URL+$vtUser+$vtWebinar
		$Call_URL:=$base_URL+$vtWebinar
		
		$vtModule:=$objCall.request
		
	: ($vtModule="absentee")
		
		$base_URL:="https://api.zoom.us/v2/"
		$vlwebinarId:=$objCall.webinarId
		
		$HTTP_method:=HTTP GET method:K71:1
		$vtWebinar:="/past_webinars"+"/"+String:C10($vlwebinarId)+"/absentees"
		//$Call_URL:=$base_URL+$vtUser+$vtWebinar
		$Call_URL:=$base_URL+$vtWebinar
		
	: ($vtModule="webinarCreate")
		$vtUser:=$objCall.userid  // user id of host
		$base_URL:="https://api.zoom.us/v2/"
		$Call_URL:=$base_URL+"users/"+$vtUser+"/webinars"
		
		$request:=OB Copy:C1225($objCall.request)
		$HTTP_method:=HTTP POST method:K71:2
		
	Else 
		$vbContinue:=False:C215
End case 


If ($vbContinue)
	ARRAY TEXT:C222($hdr_names; 0)
	ARRAY TEXT:C222($hdr_values; 0)
	
	APPEND TO ARRAY:C911($hdr_names; "Authorization")
	APPEND TO ARRAY:C911($hdr_values; "Bearer "+$JWT_TokenNew)
	
	APPEND TO ARRAY:C911($hdr_names; "Content-Type")
	APPEND TO ARRAY:C911($hdr_values; "application/json")
	
	APPEND TO ARRAY:C911($hdr_names; "Accept")
	APPEND TO ARRAY:C911($hdr_values; "*/*")
	
	APPEND TO ARRAY:C911($hdr_names; "Accept-Encoding")
	APPEND TO ARRAY:C911($hdr_values; "gzip, deflate, br")
	
	APPEND TO ARRAY:C911($hdr_names; "Accept-Language")
	APPEND TO ARRAY:C911($hdr_values; "en-US")
	
	
	$status:=HTTP Request:C1158($HTTP_method; $Call_URL; $request; $response; $hdr_names; $hdr_values)
	
End if 

$0:=$response

