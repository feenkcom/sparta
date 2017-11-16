accessing
isActive: anObject
	isActive := anObject.
	
	isActive
		ifTrue: [ self announce: #activated ]
		ifFalse: [ self announce: #deactivated ]