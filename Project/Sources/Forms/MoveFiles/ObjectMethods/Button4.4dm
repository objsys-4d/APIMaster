

CONFIRM:C162("Are you sure you want to MOVE files?"; "Yes"; "Cancel")
fDocumentListRecursive(vtSourceFolder; vtDestinationFolder; "move")
ALERT:C41("Copy complete.")