drawing
fillTextRun: aTextRun withColor: aFillColor strokeColor: aStrokeColor
	| aMetricsProvider aDrawMode |

	aMetricsProvider := aTextRun metricsProvider.
	
	(clip and: [ aMetricsProvider isNotNil ]) ifTrue: [ 
		maxWidth ifNotNil: [ aMetricsProvider width: maxWidth ].
		aMetricsProvider measureTextRun: aTextRun.
		end := end min: aMetricsProvider longestSubstring ].

	aDrawMode := drawMode ifNil: [ MozTextDrawMode GLYPH_FILL value ].
	aStrokeColor isTransparent
		ifFalse: [ aDrawMode := aDrawMode | MozTextDrawMode GLYPH_STROKE value ].

	self
		primDrawTextRun: aTextRun
		provider: (aMetricsProvider ifNotNil: #propertyProvider ifNil: [ FFIExternalObject null ])
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