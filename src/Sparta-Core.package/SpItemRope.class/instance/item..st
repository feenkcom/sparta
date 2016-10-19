initialization
item: anObject
	self
		assert: [ anObject isCollection not ]
		description: [ 'Item must not be a collection' ].
		
	item := anObject