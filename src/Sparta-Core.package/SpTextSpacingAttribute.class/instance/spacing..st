accessing
spacing: aNumber

	self
		assert: [ spacing isNil ]
		description: [ 'I am immutable and can not be modified' ].

	spacing := aNumber