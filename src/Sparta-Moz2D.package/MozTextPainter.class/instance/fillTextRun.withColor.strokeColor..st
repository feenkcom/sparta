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
		primDraw: aTextRun
		provider:
			(aMetricsProvider
				ifNotNil: #propertyProvider
				ifNil: [ FFIExternalObject null ])
		x: baseline x
		y: baseline y
		mode: aDrawMode
		dOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])
		sOptions: (strokeOptions ifNil: [ canvas defaultStrokeOptions ])
		fR: aFillColor red
		fG: aFillColor green
		fB: aFillColor blue
		fA: aFillColor alpha
		sR: aStrokeColor red
		sG: aStrokeColor green
		sB: aStrokeColor blue
		sA: aStrokeColor alpha