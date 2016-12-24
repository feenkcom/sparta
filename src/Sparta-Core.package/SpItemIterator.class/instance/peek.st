accessing
peek
	(position > 1)
		ifTrue: [ self error: 'Iterator out of bounds!' ].
	^ rope item