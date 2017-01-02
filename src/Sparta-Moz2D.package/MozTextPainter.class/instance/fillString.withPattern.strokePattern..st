drawing
fillString: aString withPattern: aFillPattern strokePattern: aStrokePattern
	| aMetricsProvider aTextRun |
	self
		assert: [ aString isNotNil ]
		description: [ 'String must not be nil' ].

	self
		assert: [ font isNotNil ]
		description: [ 'Font must not be nil' ].

	aMetricsProvider := self metricsProvider.
	aTextRun := self textRun.
	aTextRun metricsProvider: aMetricsProvider.
	
	self fillTextRun: aTextRun withPattern: aFillPattern strokePattern: aStrokePattern.
	
	aTextRun metricsProvider: nil.
	aTextRun release