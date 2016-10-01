accessing
nextRun
	(position > 1)
		ifTrue: [ self error: 'Iterator out of bounds!' ].
	position := position + 1.
	^ rope