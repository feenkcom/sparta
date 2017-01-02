metrics
textMetrics: aSpTextMetrics
	
	self
		assert: [ measureText ]
		description: [ 'I must have been requested text metrics in order to get them' ].

	textMetrics := aSpTextMetrics