//%attributes = {}
//12/21/2018-Util_MethodTracker (Current method name)// Modified by: Mike Beatty (11/26/18)


// ----------------------------------------------------
// User name (OS): Mike Beatty
// Date and time: 03/06/18, 09:16:27
// ----------------------------------------------------
// Method: fReturnIPAddress
// Description - can return either the IP address or subnet
// 
//
// Parameters
// ----------------------------------------------------

C_LONGINT:C283($error)
C_TEXT:C284($ip; $subnet; $vtReturn)

$error:=IT_MyTCPAddr($ip; $subnet)

If (Count parameters:C259>0)
	$vtReturn:=$1
Else 
	$vtReturn:="IPAddress"
End if 
Case of 
	: ($vtReturn="IPAddress")
		$0:=$ip
		
	: ($vtReturn="Subnet")
		$0:=$subnet
	Else 
		
		$0:=$ip
End case 


