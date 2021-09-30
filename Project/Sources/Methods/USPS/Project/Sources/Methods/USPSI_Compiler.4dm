//%attributes = {}
If (False:C215)
	C_TEXT:C284(USPSI_BuildConnectionString ;$0;$1;$2;$3)
	C_TEXT:C284(USPSI_PrepareData ;$0;$2)
	C_OBJECT:C1216(USPSI_PrepareData ;$1)
	
	C_OBJECT:C1216(USPS_CityStateLookup ;$1;$0)
	C_OBJECT:C1216(USPS_ValidateAddress ;$1;$0)
	C_OBJECT:C1216(USPS_ZipCodeLookup ;$1;$0)
	C_OBJECT:C1216(USPSI_HandleResult ;$0)
	C_TEXT:C284(USPSI_HandleResult ;$1)
Else 
	C_BOOLEAN:C305(<>inited_f;inited_f)
End if 

If (Not:C34(<>inited_f))
	C_TEXT:C284(<>userName_t;<>password_t)
End if 

If (Not:C34(inited_f))
	C_OBJECT:C1216(uspsErrs_o)
End if 
<>inited_f:=True:C214
inited_f:=True:C214
