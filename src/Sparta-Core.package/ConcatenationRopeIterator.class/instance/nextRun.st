accessing
nextRun
	| run attributes |
	self hasNext
		ifFalse: [ self error: 'reached end of rope' ].

	attributes := self nextAttributes.
	
	run := currentIterator nextRun.
	self moveForward: run size.

	[ self hasNext and: [ self nextAttributes = attributes ] ] whileTrue: [ 
		| nextRun |
		nextRun := currentIterator nextRun.
		run := run append: nextRun.
		self moveForward: nextRun size ].

	^ run attributes: attributes from: 1 to: run size