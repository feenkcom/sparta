metrics
fontMetrics: aSpFontMetrics

	self
		assert: [ measureFont ]
		description: [ 'I must have been requested font metrics in order to get them' ].

	fontMetrics := aSpFontMetrics