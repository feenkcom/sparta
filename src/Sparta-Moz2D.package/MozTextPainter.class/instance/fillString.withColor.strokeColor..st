drawing
fillString: aString withColor: aFillColor strokeColor: aStrokeColor
	| metricsProvider textRun aDrawMode |
	self
		assert: [ aString isNotNil ]
		description: [ 'String must not be nil' ].

	self
		assert: [ font isNotNil ]
		description: [ 'Font must not be nil' ].

	metricsProvider := self createMetricsProvider.
	textRun := font makeTextRun: string canvas: canvas flags: metricsProvider flags.

	aDrawMode := drawMode ifNil: [ MozTextDrawMode GLYPH_FILL value ].
	aStrokeColor isTransparent
		ifFalse: [ aDrawMode := aDrawMode | MozTextDrawMode GLYPH_STROKE value ].
	
	self
		primDrawTextRun: textRun
		provider: metricsProvider propertyProvider
		x: baseline x
		y: baseline y
		drawMode: aDrawMode
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])
		strokeOptions: (strokeOptions ifNil: [ canvas defaultStrokeOptions ])
		fillR: aFillColor red
		fillG: aFillColor green
		fillB: aFillColor blue
		fillA: aFillColor alpha
		strokeR: aStrokeColor red
		strokeG: aStrokeColor green
		strokeB: aStrokeColor blue
		strokeA: aStrokeColor alpha