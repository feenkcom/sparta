area
vertices
	^ self installerStep isActive
		ifTrue: [ self activeVertices ]
		ifFalse: [ self inactiveVertices ]