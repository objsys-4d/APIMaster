//%attributes = {}
Case of   //USPSI_BuildConnectionString
		  //  $0: txt XML string up to the data
		  //$1: txt module ("ShippingAPI.dll"...etc)
		  //$2: txt API ("API=Verify"...etc)
		  //$3: txt XML ("AddressValidateRequest"...etc)
	Else 
		C_TEXT:C284($0;$connection_t)
		C_TEXT:C284($1;$module_t)
		C_TEXT:C284($2;$api_t)
		C_TEXT:C284($3;$xml_t)
		C_TEXT:C284($userID_t;$content_t)
End case 

$userID_t:=" USERID=\""+<>userName_t+"\""
$module_t:=$1
$api_t:="API="+$2
$xml_t:="XML=<"+$3+$userID_t
$connection_t:="http://production.shippingapis.com/"
$content_t:=$content_t+$module_t
$content_t:=$content_t+"?"+$api_t
$content_t:=$content_t+"&"+$xml_t+">"
$0:=$connection_t+$content_t
