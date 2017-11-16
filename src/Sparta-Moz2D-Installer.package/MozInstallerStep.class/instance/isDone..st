accessing
isDone: anObject
	isDone := anObject.
	
	isDone
		ifTrue: [ self announce: #done ]
		ifFalse: [ self announce: #ready ]