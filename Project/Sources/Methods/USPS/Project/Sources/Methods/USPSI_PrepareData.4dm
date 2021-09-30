//%attributes = {}
Case of   //USPSI_HandleResult
		  //$0: xml formatted data
		  //$1: OB formatted data
		  //$2: txt: multi-data ID indicator ("Address ID" or "ZipCode ID"
	Else 
		C_TEXT:C284($0;$address_t)
		C_OBJECT:C1216($1;$data_o)
		C_BOOLEAN:C305($optional_f)
		C_LONGINT:C283($maxChars_i;$slot_i)
		C_TEXT:C284($address_t;$eleClsTg_t;$dataNm_t;$eleOpnTg_t;$dataVal_t)
		ARRAY TEXT:C222($dataNm_at;0)
End case 

$data_o:=$1
$multiEntryTerm_t:=$2

  //ElementNames that begin with - are optional and not passed thu if not supplied
  //Values in [ ] are max char lengths
  //Values after = are required len
APPEND TO ARRAY:C911($dataNm_at;"-FirmName")
APPEND TO ARRAY:C911($dataNm_at;"Address1")
APPEND TO ARRAY:C911($dataNm_at;"Address2")
APPEND TO ARRAY:C911($dataNm_at;"-City")
APPEND TO ARRAY:C911($dataNm_at;"-State")
APPEND TO ARRAY:C911($dataNm_at;"-Urbanization")
APPEND TO ARRAY:C911($dataNm_at;"-Zip5")
APPEND TO ARRAY:C911($dataNm_at;"-Zip4")

  //extarct the data val from the object using the data labels
$err_i:=1
uspsErrs_o:=New object:C1471()
If ($multiEntryTerm_t="ZipCode ID")
	$address_t:="<"+$multiEntryTerm_t+" ID='0'>"
Else 
	$address_t:="<"+$multiEntryTerm_t+" ID=\"0\">"
End if 
For ($ele_i;1;Size of array:C274($dataNm_at))
	$dataNm_t:=Replace string:C233($dataNm_at{$ele_i};"-";"")
	$optional_f:=($dataNm_t#$dataNm_at{$ele_i})
	$dataVal_t:=OB Get:C1224($data_o;$dataNm_t)
	Case of 
		: ($dataNm_t="City") & (Length:C16($dataVal_t)>15)
			OB SET:C1220(uspsErrs_o;"Error-"+String:C10($err_i);$dataNm_t+" exceeds the maximum length of 15")
			$err_i:=$err_i+1
		: ($dataNm_t="State") & ((Length:C16($dataVal_t)>2) | (Length:C16($dataVal_t)=1))
			OB SET:C1220(uspsErrs_o;"Error-"+String:C10($err_i);$dataNm_t+" must be blank or 2 characters")
			$err_i:=$err_i+1
		: ($dataNm_t="Urbanization") & (Length:C16($dataVal_t)>28)
			OB SET:C1220(uspsErrs_o;"Error-"+String:C10($err_i);$dataNm_t+" exceeds the maximum length of 28")
			$err_i:=$err_i+1
		: (($dataNm_t="Zip5") & (Length:C16($dataVal_t)>0) & (Length:C16($dataVal_t)<5))\
			 | ($dataNm_t="Zip5") & (String:C10(Num:C11($dataVal_t);"00000")#$dataVal_t)
			OB SET:C1220(uspsErrs_o;"Error-"+String:C10($err_i);$dataNm_t+" must contain exactly 5 numeric characters")
			$err_i:=$err_i+1
		Else 
			$eleOpnTg_t:="<"+$dataNm_t+">"
			$eleClsTg_t:="</"+$dataNm_t+">"
			$address_t:=$address_t+$eleOpnTg_t+$dataVal_t+$eleClsTg_t
	End case 
End for 
$0:=$address_t+"</"+$multiEntryTerm_t+">"
  //SET TEXT TO PASTEBOARD($0)
  //TRACE
