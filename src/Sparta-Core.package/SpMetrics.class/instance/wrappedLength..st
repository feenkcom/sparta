metrics
wrappedLength: aNumber

	self
		assert: [ measureText ]
		description: [ 'I must have been requested text metrics in order to computed wrapped length' ].

	wrappedLength := aNumber