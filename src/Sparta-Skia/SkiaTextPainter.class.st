Class {
	#name : 'SkiaTextPainter',
	#superclass : 'SpartaTextPainter',
	#category : 'Sparta-Skia-Builders'
}

{ #category : 'private - drawing' }
SkiaTextPainter >> fillGlyphs: aByteArray font: aSkiaFont withColor: aColor antialias: isAntialias [
	SkiaTextBlob glyphs: aByteArray font: aSkiaFont during: [ :aTextBlob |
		aColor = Color black
			ifTrue: [
				^ canvas surfaceCanvas
					drawTextBlobBlack: aTextBlob
					at: baseline
					antialias: isAntialias ].

		canvas surfaceCanvas
			drawTextBlob: aTextBlob
			at: baseline
			color: aColor
			antialias: isAntialias ]
]

{ #category : 'drawing' }
SkiaTextPainter >> fillString: aString withColor: aFillColor strokeColor: aStrokeColor [	
	SkiaPaint newDuring: [ :aSkiaPaint |
		SkiaTextBlob string: aString font: font during: [ :aTextBlob |
			canvas surfaceCanvas
				drawTextBlob: aTextBlob
				at: baseline
				paint: (self setPaint: aSkiaPaint forColor: aFillColor) ] ]
]

{ #category : 'drawing' }
SkiaTextPainter >> fillString: aString withColor: aFillColor strokePaint: aStrokePaint [
]

{ #category : 'drawing' }
SkiaTextPainter >> fillTextRun: aTextRun withColor: aFillColor strokeColor: aStrokeColor [

	"blend mode = SrcOver, alpha = 1, antialias = true"
	drawOptions ifNil: [
		^ self
			fillGlyphs: aTextRun glyphs
			font: aTextRun font
			withColor: aFillColor
			antialias: true ].

	drawOptions blendMode = SkiaBlendMode SrcOver
		ifTrue: [
			| aColor |
			
			aColor := (drawOptions alpha closeTo: 1.0)
				ifTrue: [ aFillColor ]
				ifFalse: [ aFillColor alpha: aFillColor alpha * drawOptions alpha ].
				
			^ self
				fillGlyphs: aTextRun glyphs
				font: aTextRun font
				withColor: aColor
				antialias: drawOptions antialias ].
			
	SkiaPaint newDuring: [ :aSkiaPaint |
		SkiaTextBlob glyphs: aTextRun glyphs font: aTextRun font during: [ :aTextBlob |
			canvas surfaceCanvas
				drawTextBlob: aTextBlob
				at: baseline
				paint: (self setPaint: aSkiaPaint forColor: aFillColor) ] ]
]

{ #category : 'instance creation' }
SkiaTextPainter >> metricsProvider [
	"Instantiate and return a backend specific metrics provider that handles SpMetrics request.
	Note: metrics provider is created according to current font and text properties and therefore
	should be instantiated only after text painter is fully configured"
	<return: #SpartaMetricsProvider>

	^ SkiaMetricsProvider new font: font
]

{ #category : 'private' }
SkiaTextPainter >> setPaint: aSkiaPaint forColor: aColor [
	| theDrawOptions |

	theDrawOptions := drawOptions ifNil: [ canvas defaultDrawOptions ].
	aSkiaPaint
		color: (aColor alpha: aColor alpha * theDrawOptions alpha);
		antialias: theDrawOptions antialias;
		blendMode: theDrawOptions blendMode.

	^ aSkiaPaint
]

{ #category : 'private' }
SkiaTextPainter >> setPaintForMeasurement: aSkiaPaint [
	| theDrawOptions |

	theDrawOptions := drawOptions ifNil: [ canvas defaultDrawOptions ].
	aSkiaPaint
		antialias: theDrawOptions antialias;
		blendMode: theDrawOptions blendMode.

	^ aSkiaPaint
]

{ #category : 'instance creation' }
SkiaTextPainter >> textRun [
	"Instantiate and return a text run containing glyphs for current string according
	to choosen font and various text properties"
	<return: #TSpTextRun>
	
	^ SkiaPaint newDuring: [ :aSkiaPaint |
		SkiaTextRun fromString: text font: font paint: (self setPaintForMeasurement: aSkiaPaint) ]
]

{ #category : 'instance creation' }
SkiaTextPainter >> textRunWithMetrics: aSpartaMetrics batch: aSpartaBatcher whenFinishedDo: aFinishedBlock [
	| aMetricsProvider |

	aSpartaMetrics
		canvas: canvas;
		spacing: spacing.
		
	aMetricsProvider := self metricsProvider.

	aSpartaBatcher
		textRunFrom: text
		font: font
		paint: [ :aSkiaPaint | self setPaintForMeasurement: aSkiaPaint ]
		whenFinishedDo: [ :aSkiaTextRun |
			aMetricsProvider measure: aSkiaTextRun in: aSpartaMetrics.
			aFinishedBlock value: aSkiaTextRun ]
]
