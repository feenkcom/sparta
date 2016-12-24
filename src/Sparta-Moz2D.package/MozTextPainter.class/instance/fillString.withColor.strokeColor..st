drawing
fillString: aString withColor: aFillColor strokeColor: aStrokeColor
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
	aStrokeColor isTransparent
		ifFalse: [ aDrawMode := aDrawMode | MozTextDrawMode GLYPH_STROKE value ].

	self
		primDrawTextRun: aTextRun
		provider: aMetricsProvider propertyProvider
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
		strokeA: aStrokeColor alpha.
	
	aTextRun release