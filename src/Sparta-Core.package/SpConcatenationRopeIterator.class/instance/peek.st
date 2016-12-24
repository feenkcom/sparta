accessing
peek
	self hasNext
		ifFalse: [ self error: 'reached end of rope' ].
	^ currentIterator peek