//%attributes = {}

// ----------------------------------------------------
// User name (OS): Edu
// Date and time: 03/08/22, 22:20:26
// ----------------------------------------------------
// Method: systemUsers_Save
// Description
// 
//
// Parameters
// ----------------------------------------------------
C_OBJECT:C1216($oUserGroupMember; $status; $userGroup)
Case of 
	: (Form:C1466.User.user_lastName="")
		ALERT:C41("Last Name cannot be blank.")
		
	: (Form:C1466.User.user_firstName="")
		ALERT:C41("First Name cannot be blank.")
		
	: (Form:C1466.User.userName="")
		ALERT:C41("Username cannot be blank.")
		
	: (Form:C1466.User.userPassword="")
		ALERT:C41("Password cannot be blank.")
		
	Else 
		$status:=Form:C1466.User.save()
		If ($status.success)
			For ($i; 1; Size of array:C274(atGroup_Name))
				$userGroup:=ds:C1482.UserGroup.query("userID = :1"; Form:C1466.User.userID)
				If ($userGroup.length=0)  //user does not belong to the group
					If (ablGroup_isMember{$i})  //checkbox is checked
						$userGroup:=ds:C1482.UserGroup.new()  //add the user to the group
						$userGroup.UUID:=Generate UUID:C1066
						$userGroup.userID:=Form:C1466.User.userID
						$userGroup.groupID:=anGroup_ID{$i}
						$status:=$userGroup.save()
					End if 
				Else 
					$oUserGroupMember:=$userGroup.query("groupID = :1"; anGroup_ID{$i})
					Case of 
						: ($oUserGroupMember.length=0) & (ablGroup_isMember{$i})  //user is not a member of this group and the checkbox is checked
							$userGroup:=ds:C1482.UserGroup.new()  //add the user to the group
							$userGroup.UUID:=Generate UUID:C1066
							$userGroup.userID:=Form:C1466.User.userID
							$userGroup.groupID:=anGroup_ID{$i}
							$status:=$userGroup.save()
							
						: ($oUserGroupMember.length>0) & (Not:C34(ablGroup_isMember{$i}))  //user is a member of this group and the checkbox is unchecked
							$oUserGroupMember.drop()  //remove the user from the group
							
					End case 
				End if 
			End for 
			
			ACCEPT:C269
		Else 
			ALERT:C41("Record cannot be saved as of this time.")
		End if 
		
End case 