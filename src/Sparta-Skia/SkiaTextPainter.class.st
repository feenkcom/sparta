Class {
	#name : #SkiaTextPainter,
	#superclass : #SpartaTextPainter,
	#category : #'Sparta-Skia-Builders'
}

{ #category : #'accessing - breaks' }
SkiaTextPainter >> breakNone [
	"The line has no break opportunities"
]

{ #category : #'accessing - breaks' }
SkiaTextPainter >> breakNormal [
	"The line has a break opportunity determined by the standard line-breaking algorithm."
]

{ #category : #'accessing - breaks' }
SkiaTextPainter >> breakWordWrap [
	"The line has a break opportunity only within a word.
	With break-word-wrap we will break at this point only if
	there are no other break opportunities in the line."
]

{ #category : #private }
SkiaTextPainter >> createPaintForColor: aColor [
	| aSkiaPaint theDrawOptions |

	theDrawOptions := drawOptions ifNil: [ canvas defaultDrawOptions ].

	aSkiaPaint := SkiaPaint new.
	aSkiaPaint
		color: (aColor alpha: aColor alpha * theDrawOptions alpha);
		antialias: theDrawOptions antialias;
		blendMode: theDrawOptions blendMode.

	^ aSkiaPaint
]

{ #category : #drawing }
SkiaTextPainter >> fillString: aString withColor: aFillColor strokeColor: aStrokeColor [
	| aSkiaPaint aSkiaTextBlob |

	aSkiaTextBlob := SkiaTextBlob string: aString font: font.
	aSkiaPaint := self createPaintForColor: aFillColor.
	
	canvas surfaceCanvas drawTextBlob: aSkiaTextBlob at: baseline paint: aSkiaPaint
]

{ #category : #drawing }
SkiaTextPainter >> fillString: aString withColor: aFillColor strokePaint: aStrokePaint [
]

{ #category : #drawing }
SkiaTextPainter >> fillTextRun: aTextRun withColor: aFillColor strokeColor: aStrokeColor [	
	canvas surfaceCanvas
		drawTextBlob: aTextRun textBlob
		at: baseline
		paint: (self createPaintForColor: aFillColor)
]

{ #category : #'accessing - orientation' }
SkiaTextPainter >> horizontal [
]

{ #category : #measurement }
SkiaTextPainter >> measure [
	| aMetrics aMetricsProvider aTextRun |
	aMetrics := self metrics.
	aMetricsProvider := self metricsProvider.
	aTextRun := self textRun.
	aMetricsProvider measure: aTextRun in: aMetrics.
	aTextRun release.
	^ aMetrics
]

{ #category : #'instance creation' }
SkiaTextPainter >> metrics [
	"Instantiate and return a metrics container object used during text mearument process"
	<return: #SpartaMetrics>
	
	^ SpartaMetrics new
]

{ #category : #'instance creation' }
SkiaTextPainter >> metricsProvider [
	"Instantiate and return a backend specific metrics provider that handles SpMetrics request.
	Note: metrics provider is created according to current font and text properties and therefore
	should be instantiated only after text painter is fully configured"
	<return: #SpartaMetricsProvider>

	^ SkiaMetricsProvider new font: font; paint: (self createPaintForColor: paint)
]

{ #category : #'instance creation' }
SkiaTextPainter >> textRun [
	"Instantiate and return a text run containing glyphs for current string according
	to choosen font and various text properties"
	<return: #TSpTextRun>
	
	^ (SkiaTextRun fromString: text font: font) metricsProvider: self metricsProvider
]

{ #category : #'accessing - orientation' }
SkiaTextPainter >> verticalMixed [
]

{ #category : #'accessing - orientation' }
SkiaTextPainter >> verticalSidewaysLeft [
]

{ #category : #'accessing - orientation' }
SkiaTextPainter >> verticalSidewaysRight [
]

{ #category : #'accessing - orientation' }
SkiaTextPainter >> verticalUpright [
]
