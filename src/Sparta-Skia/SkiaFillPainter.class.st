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
	canvas surfaceCanvas
		drawPath: aPath
		paint: (self createPaintForGradient: aSpartaLinearGradient)
]

{ #category : #drawing }
SkiaFillPainter >> fillPath: aPath withRadialGradient: aSpartaRadialGradient [
	canvas surfaceCanvas
		drawPath: aPath
		paint: (self createPaintForGradient: aSpartaRadialGradient)
]

{ #category : #drawing }
SkiaFillPainter >> fillPath: aPath withSolidColor: aColor [
	canvas surfaceCanvas
		drawPath: aPath
		paint: (self createPaintForColor: aColor)
]

{ #category : #drawing }
SkiaFillPainter >> fillRectangle: aRectangle withLinearGradient: aSpartaLinearGradient [
	canvas surfaceCanvas
		drawRectangle: aRectangle
		paint: (self createPaintForGradient: aSpartaLinearGradient)
]

{ #category : #drawing }
SkiaFillPainter >> fillRectangle: aRectangle withRadialGradient: aSpartaRadialGradient [
	canvas surfaceCanvas
		drawRectangle: aRectangle
		paint: (self createPaintForGradient: aSpartaRadialGradient)
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

	aSpartaSurfacePaint needsShader
		ifTrue: [ ^ self ].
		
	(aRectangle extent ~= aSpartaSurfacePaint image extent)
		ifTrue: [ ^ self ].
		
	canvas surfaceCanvas
		drawImage: aSpartaSurfacePaint image
		at: aRectangle origin
		paint: (self createPaintForSurface: aSpartaSurfacePaint)
]

{ #category : #'private - drawing' }
SkiaFillPainter >> optimizedFillRectangle: aRectangle withColor: aColor antialias: isAntialias [
	aColor = Color black
		ifTrue: [
			^ canvas surfaceCanvas
				drawRectangleBlack: aRectangle
				antialias: isAntialias ].
			
	aColor = Color white
		ifTrue: [
			^ canvas surfaceCanvas
				drawRectangleWhite: aRectangle
				antialias: isAntialias ].
	
	^ canvas surfaceCanvas
			drawRectangle: aRectangle
			color: aColor
			antialias: isAntialias
]
