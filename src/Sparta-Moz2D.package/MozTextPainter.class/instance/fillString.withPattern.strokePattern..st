drawing
fillString: aString withPattern: aFillPattern strokePattern: aStrokePattern
	| aMetricsProvider aTextRun aDrawMode |
	self
		assert: [ aString isNotNil ]
		description: [ 'String must not be nil' ].

	self
		assert: [ font isNotNil ]
		description: [ 'Font must not be nil' ].

	aMetricsProvider := self metricsProvider.
	aTextRun := font makeTextRunNoRelease: text canvas: canvas flags: aMetricsProvider flags.
	clip ifTrue: [ 
		maxWidth ifNotNil: [ aMetricsProvider width: maxWidth ].
		aMetricsProvider measureTextRun: aTextRun.
		end := end min: aMetricsProvider longestSubstring ].
	aDrawMode := drawMode ifNil: [ MozTextDrawMode GLYPH_FILL value ].
	aDrawMode := aDrawMode | MozTextDrawMode GLYPH_STROKE value.

	self
		primDrawTextRun: aTextRun
		provider: aMetricsProvider propertyProvider
		x: baseline x
		y: baseline y
		drawMode: aDrawMode
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])
		strokeOptions: (strokeOptions ifNil: [ canvas defaultStrokeOptions ])
		fillPattern: (aFillPattern asMozPatternOn: canvas)
		strokePattern: (aStrokePattern asMozPatternOn: canvas).
	
	aTextRun release