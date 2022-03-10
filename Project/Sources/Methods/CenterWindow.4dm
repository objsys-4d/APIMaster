//%attributes = {"publishedWeb":true}
// CenterWindow, $1=WWidth $2=WHeight $3=H+right $4=V+down $5=type $6=Title $7=CB
C_LONGINT:C283($SH; $SW; $WH; $WW; $LWinRef)  // $0=LWinRef
C_LONGINT:C283($1; $2; $3; $4; $5)
C_TEXT:C284($6; $7)
$SW:=Screen width:C187/2  // Find Center of Screen (width), CenterWindow rewritten:7/29/95-HBS
$SH:=Screen height:C188/2  // Find Center of Screen (height)
$WW:=$1/2  // half of requested window width
$WH:=$2/2  // half of requested window height
Case of   // OPEN WINDOW(left;top;right;bottom;{type};{title};{closebox})
	: (Count parameters:C259=2)
		$LWinRef:=Open window:C153($SW-$WW; $SH-$WH; $SW+$WW; $SH+$WH)
	: (Count parameters:C259=4)
		$LWinRef:=Open window:C153($SW-$WW+$3; $SH-$WH+$4; $SW+$WW+$3; $SH+$WH+$4)
	: (Count parameters:C259=5)
		$LWinRef:=Open window:C153($SW-$WW+$3; $SH-$WH+$4; $SW+$WW+$3; $SH+$WH+$4; $5)
	: (Count parameters:C259=6)
		$LWinRef:=Open window:C153($SW-$WW+$3; $SH-$WH+$4; $SW+$WW+$3; $SH+$WH+$4; $5; $6)
	: (Count parameters:C259=7)
		$LWinRef:=Open window:C153($SW-$WW+$3; $SH-$WH+$4; $SW+$WW+$3; $SH+$WH+$4; $5; $6; $7)
End case 
$0:=$LWinRef