//%attributes = {}
//12/18/18-Util_MethodTracker (Current method name)// Modified by: Mike Beatty (11/26/18)


// ----------------------------------------------------
// User name (OS): Mike Beatty
// Date and time: 12/12/17, 11:19:01
// ----------------------------------------------------
// Method: pPasswordControlInitializeArray
// Description
// 
//
// Parameters
// ----------------------------------------------------


C_LONGINT:C283($i; $numLogins)
C_DATE:C307($lastlogin)
C_TEXT:C284($vtUserMethod; $vtUserName; $vtUserPassword)

vtNameQuery:=""

ARRAY TEXT:C222($aUsers; 0)
ARRAY LONGINT:C221($aUserIDs; 0)
GET USER LIST:C609($aUsers; $aUserIDs)

ARRAY TEXT:C222(atUserGroup; 0)
ARRAY LONGINT:C221(alGroupNumbers; 0)
ARRAY BOOLEAN:C223(abUserGroupMember; 0)
GET GROUP LIST:C610(atUserGroup; alGroupNumbers)
ARRAY BOOLEAN:C223(abUserGroupMember; Size of array:C274(atUserGroup))

ARRAY LONGINT:C221(alUserID; 0)
ARRAY TEXT:C222(atUserName; 0)
ARRAY DATE:C224(adLastLogin; 0)
ARRAY BOOLEAN:C223(abUserActive; 0)

OBJECT SET ENABLED:C1123(bPasswordChange; False:C215)  //turn off buttons on entry

For ($i; 1; Size of array:C274($aUsers))
	
	GET USER PROPERTIES:C611($aUserIDs{$i}; $vtUserName; $vtUserMethod; $vtUserPassword; $numLogins; $lastlogin; $alMemberships)
	APPEND TO ARRAY:C911(alUserID; $aUserIDs{$i})
	APPEND TO ARRAY:C911(atUserName; $aUsers{$i})
	APPEND TO ARRAY:C911(adLastLogin; $lastlogin)
	APPEND TO ARRAY:C911(abUserActive; Not:C34(Is user deleted:C616($aUserIDs{$i})))
	
	
	
End for 

COPY ARRAY:C226(alUserID; alDisplayUserID)
COPY ARRAY:C226(atUserName; atDisplayUserName)
COPY ARRAY:C226(adLastLogin; adDisplayLastLogin)
COPY ARRAY:C226(abUserActive; abDisplayUserActive)

SORT ARRAY:C229(atDisplayUserName; alDisplayUserID; adDisplayLastLogin; abDisplayUserActive; >)

// Modified by: mike.beatty (7/12/2019), added alGroupNumbers to multi-sort array, bug fix
MULTI SORT ARRAY:C718(abUserGroupMember; <; atUsergroup; >; alGroupNumbers)

