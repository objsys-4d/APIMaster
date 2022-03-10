//%attributes = {}
//12/21/2018-Util_MethodTracker (Current method name)// Modified by: Mike Beatty (11/26/18)


// ----------------------------------------------------
// User name (OS): Mike Beatty
// Date and time: 07/19/17, 13:00:26
// ----------------------------------------------------
// Method: pUserViewerAddNew
// Description
// 
//
// Parameters
// ----------------------------------------------------


C_LONGINT:C283($vlPosition)

pUserAddNew

pPasswordControlInitializeArray

//ARRAY TEXT(aUserNames;0)
//ARRAY LONGINT(aUserNumbers;0)
//  //ARRAY LONGINT($almembership;0)

//GET USER LIST(aUserNames;aUserNumbers)

//SORT ARRAY(aUserNames;aUserNumbers)

//$vlPosition:=Find in array(aUserNames;vtUserName)
$vlPosition:=Find in array:C230(atDisplayUserName; vtUserName)


//LISTBOX SELECT ROW(ListBoxUserViewer;$vlPosition)
//OBJECT SET SCROLL POSITION(ListBoxUserViewer;$vlPosition)

LISTBOX SELECT ROW:C912(ListboxPasswordControlGUI; $vlPosition)
OBJECT SET SCROLL POSITION:C906(ListboxPasswordControlGUI; $vlPosition)