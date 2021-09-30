//%attributes = {"shared":true}
Case of   //USPS_ValidateAddress
		  //  $0: ob Result
		  //$1: ob Request
	Else 
		C_OBJECT:C1216($0;$response_o)
		C_OBJECT:C1216($1;$data_o)
		ARRAY TEXT:C222($elements_at;0)
		C_TEXT:C284($address_t;$request_t;$eleClsTg_t;$eleNm_t;$eleOpnTg_t;$eleVal_t;$nil_t;$response_t)
		C_LONGINT:C283($ele_i;$err_i)
End case 

$function_t:="AddressValidateRequest"
$data_o:=$1
$request_t:=USPSI_BuildConnectionString ("ShippingAPI.dll";"Verify";$function_t)
$data_t:=USPSI_PrepareData ($data_o;"Address")
If (OB Is empty:C1297(uspsErrs_o))
	$request_t:=$request_t+"<Revision>1</Revision>"+$data_t+"</"+$function_t+">"
	$err_i:=HTTP Request:C1158(HTTP POST method:K71:2;$request_t;$nil_t;$response_t)
	$response_o:=USPSI_HandleResult ($response_t)
	$0:=$response_o
Else 
	$0:=uspsErrs_o
End if 