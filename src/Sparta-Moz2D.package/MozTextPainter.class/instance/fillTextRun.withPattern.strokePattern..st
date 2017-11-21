drawing
fillTextRun: aTextRun withPattern: aFillPattern strokePattern: aStrokePattern
	| aMetricsProvider aDrawMode |
	self
		assert: [ aTextRun isNotNil ]
		description: [ 'A text run must not be nil' ].
	aMetricsProvider := aTextRun metricsProvider.
	aMetricsProvider ifNil: [ aMetricsProvider := self metricsProvider ].
	clip
		ifTrue: [ | aMetrics |
			aMetrics := self metrics.
			aMetrics measureFont: false.
			aMetricsProvider measure: aTextRun in: aMetrics.
			end := end min: aMetrics wrappedEnd ].
	aDrawMode := drawMode ifNil: [ MozTextDrawMode GLYPH_FILL value ].
	aDrawMode := aDrawMode | MozTextDrawMode GLYPH_STROKE value.
	self
		primDraw: aTextRun
		provider:
			(aMetricsProvider
				ifNotNil: #propertyProvider
				ifNil: [ FFIExternalObject null ])
		x: baseline x
		y: baseline y
		node: aDrawMode
		dOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])
		sOptions: (strokeOptions ifNil: [ canvas defaultStrokeOptions ])
		fPattern: (aFillPattern asMozPatternOn: canvas)
		sPattern: (aStrokePattern asMozPatternOn: canvas)