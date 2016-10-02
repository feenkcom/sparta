accessing
nextSpan
	| run attributes |
	self hasNext
		ifFalse: [ self error: 'reached end of rope' ].

	attributes := self nextAttributes.
	
	run := currentIterator nextSpan.
	self moveForward: run size.

	[ self hasNext and: [ self nextAttributes = attributes ] ] whileTrue: [ 
		| nextRun |
		nextRun := currentIterator nextSpan.
		run := run append: nextRun.
		self moveForward: nextRun size ].

	^ run attributes: attributes from: 1 to: run size