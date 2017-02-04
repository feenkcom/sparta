drawing
fillTextRun: aTextRun withColor: aFillColor strokeColor: aStrokeColor
	| aMetricsProvider aDrawMode |
	aMetricsProvider := aTextRun metricsProvider.
	aMetricsProvider ifNil: [ aMetricsProvider := self metricsProvider ].
	clip
		ifTrue: [ | aMetrics |
			aMetrics := self metrics.
			aMetrics measureFont: false.
			aMetricsProvider measure: aTextRun in: aMetrics.
			end := end min: aMetrics wrappedEnd ].
	aDrawMode := drawMode ifNil: [ MozTextDrawMode GLYPH_FILL value ].
	aStrokeColor isTransparent
		ifFalse: [ aDrawMode := aDrawMode | MozTextDrawMode GLYPH_STROKE value ].
	self
		primDrawTextRun: aTextRun
		provider:
			(aMetricsProvider
				ifNotNil: #propertyProvider
				ifNil: [ FFIExternalObject null ])
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