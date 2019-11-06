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

{ #category : #drawing }
SkiaTextPainter >> fillString: aString withColor: aFillColor strokeColor: aStrokeColor [
]

{ #category : #drawing }
SkiaTextPainter >> fillString: aString withColor: aFillColor strokePaint: aStrokePaint [
]

{ #category : #'accessing - orientation' }
SkiaTextPainter >> horizontal [
]

{ #category : #'instance creation' }
SkiaTextPainter >> metricsProvider [
	"Instantiate and return a backend specific metrics provider that handles SpMetrics request.
	Note: metrics provider is created according to current font and text properties and therefore
	should be instantiated only after text painter is fully configured"
	<return: #SpartaMetricsProvider>

	^ SkiaMetricsProvider new font: font
]

{ #category : #'instance creation' }
SkiaTextPainter >> textRun [
	"Instantiate and return a text run containing glyphs for current string according
	to choosen font and various text properties"
	<return: #TSpTextRun>
	
	^ SkiaTextRun fromString: text font: font
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
