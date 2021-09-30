//%attributes = {}

// ----------------------------------------------------
// User name (OS): administrator
// Date and time: 09/28/21, 10:30:09
// ----------------------------------------------------
// Method: MailChimp
// Description
// 
//
// Parameters
// ----------------------------------------------------

//curl -sS -X POST "https://mandrillapp.com/api/1.0/users/ping" \
  --header 'Content-Type: application/json' \
  --data-raw '{ "key": "YOUR_API_KEY" }'
//PING
$base_URL:="https://mandrillapp.com/api/1.0/users/ping"
$API_Key:=""

C_OBJECT:C1216($oData)
$oData:=New object:C1471
$oData.key:=$API_Key
$HTTP_method:=HTTP POST method:K71:2
$vbContinue:=True:C214

If ($vbContinue)
	ARRAY TEXT:C222($hdr_names; 0)
	ARRAY TEXT:C222($hdr_values; 0)
	APPEND TO ARRAY:C911($hdr_names; "Content-Type")
	APPEND TO ARRAY:C911($hdr_values; "application/json")
	
	APPEND TO ARRAY:C911($hdr_names; "Accept-Language")
	APPEND TO ARRAY:C911($hdr_values; "en-US")
	
	
	$status:=HTTP Request:C1158($HTTP_method; $Call_URL; $request; $response; $hdr_names; $hdr_values)
	
End if 