accessing
next
	| next |
	self hasNext
		ifFalse: [ self error: 'reached end of rope' ].
	next := currentIterator next.
	self moveForward: 1.
	^ next