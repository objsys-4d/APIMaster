//%attributes = {}

C_OBJECT:C1216($addr_o;$result_o)
USPSI_Compiler 
USPSI_Registrationmail 
Case of 
	: (False:C215)
		OB SET:C1220($addr_o;"Zip5";"20024")
		$result_o:=USPS_CityStateLookup ($addr_o)
	: (False:C215)  //Address Verification Test
		OB SET:C1220($addr_o;"Address1";"")
		OB SET:C1220($addr_o;"Address2";"6406 Ivy Lane")
		OB SET:C1220($addr_o;"City";"Greenbelt")
		OB SET:C1220($addr_o;"State";"MD")
		OB SET:C1220($addr_o;"Urbanization";"1234567890123456789012345678")
		OB SET:C1220($addr_o;"Zip5";"01235")
		OB SET:C1220($addr_o;"Zip4";"")
		$result_o:=USPS_ValidateAddress ($addr_o)
		TRACE:C157
	: (True:C214)  //ZipCode Lookup Test
		OB SET:C1220($addr_o;"Address1";"")
		OB SET:C1220($addr_o;"Address2";"8 Wildwood Drive")
		OB SET:C1220($addr_o;"City";"Old Lyme")
		OB SET:C1220($addr_o;"State";"CT")
		OB SET:C1220($addr_o;"Zip5";"06371")
		OB SET:C1220($addr_o;"Zip4";"")
		$result_o:=USPS_ZipCodeLookup ($addr_o)
		TRACE:C157
End case 