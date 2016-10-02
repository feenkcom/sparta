drawing
fillString: aString withPattern: aFillPattern strokePattern: aStrokePattern
	| metricsProvider textRun aDrawMode |
	self
		assert: [ aString isNotNil ]
		description: [ 'String must not be nil' ].

	self
		assert: [ font isNotNil ]
		description: [ 'Font must not be nil' ].

	metricsProvider := self createMetricsProvider.
	textRun := font makeTextRun: string canvas: canvas flags: metricsProvider flags.
	clip ifTrue: [ 
		maxWidth ifNotNil: [ metricsProvider width: maxWidth ].
		metricsProvider measureTextRun: textRun.
		end := end min: metricsProvider longestSubstring ].
	aDrawMode := drawMode ifNil: [ MozTextDrawMode GLYPH_FILL value ].
	aDrawMode := aDrawMode | MozTextDrawMode GLYPH_STROKE value.

	self
		primDrawTextRun: textRun
		provider: metricsProvider propertyProvider
		x: baseline x
		y: baseline y
		drawMode: aDrawMode
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])
		strokeOptions: (strokeOptions ifNil: [ canvas defaultStrokeOptions ])
		fillPattern: (aFillPattern asMozPatternOn: canvas)
		strokePattern: (aStrokePattern asMozPatternOn: canvas)