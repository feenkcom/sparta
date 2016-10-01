testing
hasNext
	^ (position < rope collection size)
		and: [ position < end ]