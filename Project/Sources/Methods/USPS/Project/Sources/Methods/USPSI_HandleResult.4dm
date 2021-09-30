//%attributes = {}
Case of   //USPSI_HandleResult
		  //  $0: ob Result
		  //$1: ob Request
	Else 
		C_OBJECT:C1216($0;$response_o)
		C_TEXT:C284($1;$response_t)
		C_LONGINT:C283($char_i)
		ARRAY TEXT:C222($dataLbl_at;0)
		ARRAY TEXT:C222($groups_at;0)
		ARRAY TEXT:C222($footnotes_at;0)
		ARRAY TEXT:C222($dpvConfirmation_at;0)
		ARRAY TEXT:C222($dpvFootnotes_at;0)
End case 

$response_t:=$1

APPEND TO ARRAY:C911($groups_at;"Address ID")

APPEND TO ARRAY:C911($dataLbl_at;"Number")
APPEND TO ARRAY:C911($dataLbl_at;"Description")
APPEND TO ARRAY:C911($dataLbl_at;"ReturnText")
APPEND TO ARRAY:C911($dataLbl_at;"Address1")
APPEND TO ARRAY:C911($dataLbl_at;"Address2")
APPEND TO ARRAY:C911($dataLbl_at;"City")
APPEND TO ARRAY:C911($dataLbl_at;"State")
APPEND TO ARRAY:C911($dataLbl_at;"Zip5")
APPEND TO ARRAY:C911($dataLbl_at;"Zip4")
APPEND TO ARRAY:C911($dataLbl_at;"DeliveryPoint")
APPEND TO ARRAY:C911($dataLbl_at;"CarrierRoute")
APPEND TO ARRAY:C911($dataLbl_at;"Footnotes")
APPEND TO ARRAY:C911($dataLbl_at;"DPVConfirmation")
APPEND TO ARRAY:C911($dataLbl_at;"DPVCMRA")
APPEND TO ARRAY:C911($dataLbl_at;"DPVFootnotes")
APPEND TO ARRAY:C911($dataLbl_at;"Business")
APPEND TO ARRAY:C911($dataLbl_at;"CentralDeliveryPoint")
APPEND TO ARRAY:C911($dataLbl_at;"Vacant")

APPEND TO ARRAY:C911($footnotes_at;"A:Zip Code Corrected")
APPEND TO ARRAY:C911($footnotes_at;"B:City / State Spelling Corrected")
APPEND TO ARRAY:C911($footnotes_at;"C:Invalid City / State / Zip")
APPEND TO ARRAY:C911($footnotes_at;"D:NO ZIP+4 Assigned")
APPEND TO ARRAY:C911($footnotes_at;"E:Zip Code Assigned for Multiple Response")
APPEND TO ARRAY:C911($footnotes_at;"F:Address could not be found in the National Directory File Database")
APPEND TO ARRAY:C911($footnotes_at;"G:Information in Firm Line used for matching")
APPEND TO ARRAY:C911($footnotes_at;"H:Missing Secondary Number")
APPEND TO ARRAY:C911($footnotes_at;"I:Insufficient / Incorrect Address Data")
APPEND TO ARRAY:C911($footnotes_at;"J:Dual Address")
APPEND TO ARRAY:C911($footnotes_at;"K:Multiple Response due to Cardinal Rule")
APPEND TO ARRAY:C911($footnotes_at;"L:Address component changed")
APPEND TO ARRAY:C911($footnotes_at;"LI:Match has been converted via LACS")
APPEND TO ARRAY:C911($footnotes_at;"M:Street Name changed")
APPEND TO ARRAY:C911($footnotes_at;"N:Address Standardized")
APPEND TO ARRAY:C911($footnotes_at;"O:Lowest +4 Tie-Breaker")
APPEND TO ARRAY:C911($footnotes_at;"P:Better address exists")
APPEND TO ARRAY:C911($footnotes_at;"Q:Unique Zip Code match")
APPEND TO ARRAY:C911($footnotes_at;"R:No match due to EWS")
APPEND TO ARRAY:C911($footnotes_at;"S:Incorrect Secondary Address")
APPEND TO ARRAY:C911($footnotes_at;"T:Multiple response due to Magnet Street Syndrome")
APPEND TO ARRAY:C911($footnotes_at;"U:Unofficial Post Office name")
APPEND TO ARRAY:C911($footnotes_at;"V:Unverifiable City / State")
APPEND TO ARRAY:C911($footnotes_at;"W:Invalid Delivery Address")
APPEND TO ARRAY:C911($footnotes_at;"X:No match due to out of range alias")
APPEND TO ARRAY:C911($footnotes_at;"Y:Military match")
APPEND TO ARRAY:C911($footnotes_at;"Z:Match made using the ZIPMOVE")

APPEND TO ARRAY:C911($dpvConfirmation_at;"Y:Address was DPV confirmed for both primary and (if present) secondary numbers.")
APPEND TO ARRAY:C911($dpvConfirmation_at;"D:Address was DPV confirmed for the primary number only, and the secondary number information was missing.")
APPEND TO ARRAY:C911($dpvConfirmation_at;"S:Address was DPV confirmed for the primary number only, and the secondary number information was present by not confirmed.")
APPEND TO ARRAY:C911($dpvConfirmation_at;"N:Both primary and (if present) secondary number information failed to DPV confirm.")

APPEND TO ARRAY:C911($dpvFootnotes_at;"AA:Input address matched to the ZIP+4 file.")
APPEND TO ARRAY:C911($dpvFootnotes_at;"A1:Input address not matched to the ZIP+4 file.")
APPEND TO ARRAY:C911($dpvFootnotes_at;"BB:Matched to DPV (all components).")
APPEND TO ARRAY:C911($dpvFootnotes_at;"CC:Secondary number not matched (present but invalid).")
APPEND TO ARRAY:C911($dpvFootnotes_at;"N1:High-rise address missing secondary number.")
APPEND TO ARRAY:C911($dpvFootnotes_at;"M1:Primary number missing.")
APPEND TO ARRAY:C911($dpvFootnotes_at;"M3:Primary number invalid.")
APPEND TO ARRAY:C911($dpvFootnotes_at;"P1:Input Address RR or HC Box number Missing.")
APPEND TO ARRAY:C911($dpvFootnotes_at;"P3:Input Address PO, RR, or HC Box number Invalid.")
APPEND TO ARRAY:C911($dpvFootnotes_at;"F1:Input Address Matched to a Military Address.")
APPEND TO ARRAY:C911($dpvFootnotes_at;"G1:Input Address Matched to a General Delivery Address.")
APPEND TO ARRAY:C911($dpvFootnotes_at;"U1:nput Address Matched to a Unique ZIP Code™.")

  //SET TEXT TO PASTEBOARD($response_t)
  //TRACE
$returnText_t:=""
$note_t:=""
For ($lbl_i;1;Size of array:C274($dataLbl_at))
	$dataNm_t:=$dataLbl_at{$lbl_i}
	$opnTg_t:="<"+$dataNm_t+">"
	$clsTg_t:="</"+$dataNm_t+">"
	$dataValBeg_i:=Position:C15($opnTg_t;$response_t)+Length:C16($opnTg_t)
	$dataValEnd_i:=Position:C15($clsTg_t;$response_t)-1
	$dataVal_t:=Substring:C12($response_t;$dataValBeg_i;$dataValEnd_i-$dataValBeg_i+1)
	OB SET:C1220($response_o;$dataNm_t;$dataVal_t)
	Case of 
		: ($dataNm_t="Description")
			$errNum_t:=OB Get:C1224($response_o;"Number")  //error encountered - stop
			If ($errNum_t="80040B19")  //fatal err - no address info returned - invalid user id?
				$lbl_i:=Size of array:C274($dataLbl_at)
			End if 
		: ($dataNm_t="ReturnText")
			$returnText_t:=OB Get:C1224($response_o;"ReturnText")
		: ($dataNm_t="Footnotes") & ($dataVal_t#"")
			  //handle footnotes individually
			For ($char_i;1;Length:C16($dataVal_t))
				$row_i:=Find in array:C230($footnotes_at;($dataVal_t[[$char_i]]+":@"))
				If ($row_i=-1)
					$note_t:=$note_t+"\r"+"Received unhandled footnote code: "+$dataVal_t[[$char_i]]
				Else 
					$note_t:=$note_t+"\r"+Substring:C12($footnotes_at{$row_i};3)
				End if 
			End for 
		: ($dataNm_t="DPVConfirmation") & ($dataVal_t#"")
			  //handle footnotes individually
			For ($char_i;1;Length:C16($dataVal_t))
				$row_i:=Find in array:C230($dpvConfirmation_at;($dataVal_t[[$char_i]]+":@"))
				$note_t:=$note_t+"\r"+Substring:C12($dpvConfirmation_at{$row_i};3)
			End for 
		: ($dataNm_t="DPVFootnotes") & ($dataVal_t#"")
			For ($char_i;1;Length:C16($dataVal_t);2)
				$row_i:=Find in array:C230($dpvFootnotes_at;(Substring:C12($dataVal_t;$char_i;2)+":@"))
				$note_t:=$note_t+"\r"+Substring:C12($dpvFootnotes_at{$row_i};4)
			End for 
	End case 
End for 
OB REMOVE:C1226($response_o;"Number")
If ($errNum_t#"")
	OB SET:C1220($response_o;"Error#";$errNum_t)
Else 
	OB REMOVE:C1226($response_o;"Description")
End if 
$returnText_t:=$returnText_t+$note_t
OB REMOVE:C1226($response_o;"ReturnText")
If ($returnText_t#"")
	OB SET:C1220($response_o;"ReturnText";$returnText_t)
End if 
$0:=$response_o