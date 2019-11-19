Class {
	#name : #SkiaFillPainter,
	#superclass : #SpartaFillPainter,
	#category : #'Sparta-Skia-Builders'
}

{ #category : #private }
SkiaFillPainter >> createPaintForColor: aColor [
	| aSkiaPaint theDrawOptions |

	theDrawOptions := self ensuredDrawOptions.

	aSkiaPaint := SkiaPaint new.
	aSkiaPaint
		color: (aColor alpha: aColor alpha * theDrawOptions alpha);
		antialias: theDrawOptions antialias;
		blendMode: theDrawOptions blendMode.

	^ aSkiaPaint
]

{ #category : #private }
SkiaFillPainter >> createPaintForGradient: aSkiaGradient [
	| aSkiaPaint theDrawOptions |

	theDrawOptions := self ensuredDrawOptions.

	aSkiaPaint := SkiaPaint new.
	aSkiaPaint
		shader: aSkiaGradient asShader;
		antialias: theDrawOptions antialias;
		blendMode: theDrawOptions blendMode.

	^ aSkiaPaint
]

{ #category : #private }
SkiaFillPainter >> createPaintForSurface: aSurface [
	| aSkiaPaint theDrawOptions |

	theDrawOptions := self ensuredDrawOptions.

	aSkiaPaint := SkiaPaint new.
	aSkiaPaint
		alpha: theDrawOptions alpha;
		antialias: theDrawOptions antialias;
		blendMode: theDrawOptions blendMode.

	^ aSkiaPaint
]

{ #category : #drawing }
SkiaFillPainter >> fillPath: aPath withLinearGradient: aSpartaLinearGradient [
	| aPaint  |
	
	aPaint := self createPaintForGradient: aSpartaLinearGradient.
	[ canvas surfaceCanvas
		drawPath: aPath
		paint: aPaint ] ensure: [ aPaint release ]
]

{ #category : #drawing }
SkiaFillPainter >> fillPath: aPath withRadialGradient: aSpartaRadialGradient [
	| aPaint  |
	
	aPaint := self createPaintForGradient: aSpartaRadialGradient.
	[ canvas surfaceCanvas
		drawPath: aPath
		paint: aPaint ] ensure: [ aPaint release ]
]

{ #category : #drawing }
SkiaFillPainter >> fillPath: aPath withSolidColor: aColor [
	| aPaint |
	
	aPaint := self createPaintForColor: aColor.
	[ canvas surfaceCanvas
		drawPath: aPath
		paint: aPaint ] ensure: [ aPaint release ]
]

{ #category : #drawing }
SkiaFillPainter >> fillRectangle: aRectangle withLinearGradient: aSpartaLinearGradient [
	| aPaint |
	
	aPaint := self createPaintForGradient: aSpartaLinearGradient.
	[ canvas surfaceCanvas
		drawRectangle: aRectangle
		paint: aPaint ] ensure: [ aPaint release ]
]

{ #category : #drawing }
SkiaFillPainter >> fillRectangle: aRectangle withRadialGradient: aSpartaRadialGradient [
	| aPaint |
	
	aPaint := self createPaintForGradient: aSpartaRadialGradient.
	[ canvas surfaceCanvas
		drawRectangle: aRectangle
		paint: aPaint ] ensure: [ aPaint release ]
]

{ #category : #drawing }
SkiaFillPainter >> fillRectangle: aRectangle withSolidColor: aColor [
	| aPaint |

	"blend mode = SrcOver, alpha = 1, antialias = true"
	drawOptions ifNil: [
		^ self
			optimizedFillRectangle: aRectangle
			withColor: aColor
			antialias: true ].

	aPaint := self createPaintForColor: aColor.
	[ canvas surfaceCanvas
		drawRectangle: aRectangle
		paint: (self createPaintForColor: aColor) ] ensure: [ aPaint release ]
]

{ #category : #drawing }
SkiaFillPainter >> fillRectangle: aRectangle withSurface: aSpartaSurfacePaint [
	| aPaint |

	aSpartaSurfacePaint needsShader
		ifTrue: [ ^ self ].
		
	(aRectangle extent ~= aSpartaSurfacePaint image extent)
		ifTrue: [ ^ self ].

	aPaint := (self createPaintForSurface: aSpartaSurfacePaint).
	[ canvas surfaceCanvas
		drawImage: aSpartaSurfacePaint image
		at: aRectangle origin
		paint: aPaint ] ensure: [ aPaint release ]
]

{ #category : #drawing }
SkiaFillPainter >> fillRoundedRectangle: aSpartaRounedRectangle withSolidColor: aColor [
	| aPaint |

	"blend mode = SrcOver, alpha = 1, antialias = true"
	drawOptions ifNil: [
		^ self
			optimizedFillRoundedRectangle: aSpartaRounedRectangle
			withColor: aColor
			antialias: true ].
		
	aPaint := self createPaintForColor: aColor.
	[ canvas surfaceCanvas
		drawRoundedRectangle: aSpartaRounedRectangle
		paint: (self createPaintForColor: aColor) ] ensure: [ aPaint release ]
]

{ #category : #'private - drawing' }
SkiaFillPainter >> optimizedFillRectangle: aRectangle withColor: aColor antialias: isAntialias [
	canvas surfaceCanvas
		fillRectangle: aRectangle
		color: aColor
		antialias: isAntialias
]

{ #category : #'private - drawing' }
SkiaFillPainter >> optimizedFillRoundedRectangle: aSpartaRoundedRectangle withColor: aColor antialias: isAntialias [
	canvas surfaceCanvas
		fillRoundedRectangle: aSpartaRoundedRectangle
		color: aColor
		antialias: isAntialias
]
