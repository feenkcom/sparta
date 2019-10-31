Class {
	#name : #MozTextPainter,
	#superclass : #SpartaTextPainter,
	#traits : 'TMozLibrary',
	#classTraits : 'TMozLibrary classTrait',
	#instVars : [
		'drawMode',
		'orientation',
		'breakPriority'
	],
	#category : 'Sparta-Moz2D-Builders'
}

{ #category : #'accessing - breaks' }
MozTextPainter >> breakNone [
	breakPriority := MozTextBreakPriority eNoBreak
]

{ #category : #'accessing - breaks' }
MozTextPainter >> breakNormal [
	breakPriority := MozTextBreakPriority eNormalBreak
]

{ #category : #'accessing - breaks' }
MozTextPainter >> breakPriority [
	^ breakPriority
]

{ #category : #'accessing - breaks' }
MozTextPainter >> breakWordWrap [
	breakPriority := MozTextBreakPriority eWordWrapBreak
]

{ #category : #accessing }
MozTextPainter >> fill [
	drawMode	ifNil: [ drawMode := 0 ].
	drawMode := drawMode | (MozTextDrawMode GLYPH_FILL value)
]

{ #category : #drawing }
MozTextPainter >> fillString: aString withColor: aFillColor strokeColor: aStrokeColor [
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
	
	self fillTextRun: aTextRun withColor: aFillColor strokeColor: aStrokeColor.
	
	aTextRun metricsProvider: nil.
	aTextRun release
]

{ #category : #drawing }
MozTextPainter >> fillString: aString withColor: aFillColor strokePaint: aStrokePaint [
	self fillString: aString withPattern: aFillColor strokePattern: aStrokePaint
]

{ #category : #drawing }
MozTextPainter >> fillString: aString withPaint: aFillPaint strokeColor: aStrokeColor [
	self fillString: aString withPattern: aFillPaint strokePattern: aStrokeColor
]

{ #category : #drawing }
MozTextPainter >> fillString: aString withPaint: aFillPaint strokePaint: aStrokePaint [
	self fillString: aString withPattern: aFillPaint strokePattern: aStrokePaint
]

{ #category : #drawing }
MozTextPainter >> fillString: aString withPattern: aFillPattern strokePattern: aStrokePattern [
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
]

{ #category : #drawing }
MozTextPainter >> fillTextRun: aTextRun withColor: aFillColor strokeColor: aStrokeColor [
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
]

{ #category : #drawing }
MozTextPainter >> fillTextRun: aTextRun withColor: aFillColor strokePaint: aStrokePaint [
	self fillTextRun: aTextRun withPattern: aFillColor strokePattern: aStrokePaint
]

{ #category : #drawing }
MozTextPainter >> fillTextRun: aTextRun withPaint: aFillPaint strokeColor: aStrokeColor [
	self fillTextRun: aTextRun withPattern: aFillPaint strokePattern: aStrokeColor
]

{ #category : #drawing }
MozTextPainter >> fillTextRun: aTextRun withPaint: aFillPaint strokePaint: aStrokePaint [
	self fillTextRun: aTextRun withPattern: aFillPaint strokePattern: aStrokePaint
]

{ #category : #drawing }
MozTextPainter >> fillTextRun: aTextRun withPattern: aFillPattern strokePattern: aStrokePattern [
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
]

{ #category : #'instance creation' }
MozTextPainter >> flags [
	| theFlags |

	"BoundingBox (text metrics bounds) will be initialized properly based on glyph extents,
	in particular, glyph extents that overflow the standard font-box (the box defined by the ascent, descent
	and advance width of the glyph). When not set, it may just be the standard font-box even if glyphs overflow"	
	theFlags := MozTextFlags TEXT_NEED_BOUNDING_BOX value.

	breakPriority canWrapHyphens
		ifTrue: [ theFlags := theFlags | MozTextFlags TEXT_ENABLE_HYPHEN_BREAKS value ].
	spacing isZero
		ifFalse: [ theFlags := theFlags |  MozTextFlags TEXT_ENABLE_SPACING value ].
		
	theFlags := theFlags | orientation value.
	
	^ theFlags
]

{ #category : #'accessing - orientation' }
MozTextPainter >> horizontal [

	orientation := MozTextOrientation HORIZONTAL
]

{ #category : #measurement }
MozTextPainter >> measure [
	| aMetrics aMetricsProvider aTextRun |
	aMetrics := self metrics.
	aMetricsProvider := self metricsProvider.
	aTextRun := self textRun.
	aMetricsProvider measure: aTextRun in: aMetrics.
	aTextRun release.
	^ aMetrics
]

{ #category : #'instance creation' }
MozTextPainter >> metrics [
	| aMetrics |

	aMetrics := SpMetrics new.
	aMetrics boxType: MozTextBoundingBoxType TIGHT_INK_EXTENTS.
	aMetrics breakPriority: breakPriority.
	aMetrics canvas: canvas.
	aMetrics length: end - start + 1.
	aMetrics lineBreakBefore: false.
	aMetrics measureFont: true.
	aMetrics measureText: true.
	aMetrics orientation: orientation.
	aMetrics isVertical: orientation isVertical.
	aMetrics spacing: spacing.
	aMetrics start: start.
	aMetrics suppressBreaks: MozTextSuppressBreak eSuppressInitialBreak.
	aMetrics width: maxWidth.

	^ aMetrics
]

{ #category : #'instance creation' }
MozTextPainter >> metricsProvider [
	^ MozTextMetricsProvider default
]

{ #category : #'private - ffi' }
MozTextPainter >> primDraw: aTextRun provider: aProvider x: x y: y mode: aDrawMode dOptions: aDrawOptions sOptions: aStrokeOptions fR: fillR fG: fillG fB: fillB fA: fillA sR: strokeR sG: strokeG sB: strokeB sA: strokeA [
	
	self ffiCall: #(void moz2d_text_run_draw_color (
		MozCanvas canvas,
		MozTextRun aTextRun,
		uint32 start,
		uint32 end,
      MozTextPropertyProvider aProvider,
		double x,
		double y,
		int aDrawMode,
		MozDrawOptions aDrawOptions,
		MozStrokeOptions aStrokeOptions,
		float fillR,
		float fillG,
		float fillB,
		float fillA,
		float strokeR,
		float strokeG,
		float strokeB,
		float strokeA ) )
]

{ #category : #'private - ffi' }
MozTextPainter >> primDraw: aTextRun provider: aProvider x: x y: y node: aDrawMode dOptions: aDrawOptions sOptions: aStrokeOptions fPattern: aFillPattern sPattern: aStrokePattern [
	
	self ffiCall: #(void moz2d_text_run_draw_pattern (
		MozCanvas canvas,
		MozTextRun aTextRun,
		uint32 start,
		uint32 end,
      MozTextPropertyProvider aProvider,
		double x,
		double y,
		int aDrawMode,
		MozDrawOptions aDrawOptions,
		MozStrokeOptions aStrokeOptions,
		MozNativePattern aFillPattern,
		MozNativePattern aStrokePattern ) )
]

{ #category : #accessing }
MozTextPainter >> reset [
	super reset.
	
	drawMode := nil
]

{ #category : #accessing }
MozTextPainter >> stroke [
	drawMode	ifNil: [ drawMode := 0 ].
	drawMode := drawMode | (MozTextDrawMode GLYPH_STROKE value)
]

{ #category : #accessing }
MozTextPainter >> strokeBelow [
	self stroke.
	drawMode := drawMode | (MozTextDrawMode GLYPH_STROKE_UNDERNEATH value)
]

{ #category : #'instance creation' }
MozTextPainter >> textRun [

	^ (font
		makeTextRunNoRelease: text
		canvas: canvas
		flags: self flags)
			metricsProvider: self metricsProvider; "do not forget to set a default metrics provider"
			yourself
]

{ #category : #'accessing - orientation' }
MozTextPainter >> verticalMixed [
	orientation := MozTextOrientation VERTICAL_MIXED
]

{ #category : #'accessing - orientation' }
MozTextPainter >> verticalSidewaysLeft [
	orientation := MozTextOrientation VERTICAL_SIDEWAYS_LEFT
]

{ #category : #'accessing - orientation' }
MozTextPainter >> verticalSidewaysRight [
	orientation := MozTextOrientation VERTICAL_SIDEWAYS_RIGHT
]

{ #category : #'accessing - orientation' }
MozTextPainter >> verticalUpright [
	orientation := MozTextOrientation VERTICAL_UPRIGHT
]
