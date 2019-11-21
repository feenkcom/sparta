Class {
	#name : #SkiaFillPainter,
	#superclass : #SpartaFillPainter,
	#category : #'Sparta-Skia-Builders'
}

{ #category : #drawing }
SkiaFillPainter >> fillPath: aPath withLinearGradient: aSpartaLinearGradient [

	SkiaPaint newDuring: [ :aSkiaPaint |
		canvas surfaceCanvas
			drawPath: aPath
			paint: (self setPaint: aSkiaPaint forGradient: aSpartaLinearGradient) ]
]

{ #category : #drawing }
SkiaFillPainter >> fillPath: aPath withRadialGradient: aSpartaRadialGradient [

	SkiaPaint newDuring: [ :aSkiaPaint |
		canvas surfaceCanvas
			drawPath: aPath
			paint: (self setPaint: aSkiaPaint forGradient: aSpartaRadialGradient) ]
]

{ #category : #drawing }
SkiaFillPainter >> fillPath: aPath withSolidColor: aColor [
	
	SkiaPaint newDuring: [ :aSkiaPaint |
		canvas surfaceCanvas
			drawPath: aPath
			paint: (self setPaint: aSkiaPaint forColor: aColor) ]
]

{ #category : #drawing }
SkiaFillPainter >> fillRectangle: aRectangle withForm: aForm [
	
	SkiaPaint newDuring: [ :aSkiaPaint |
		SkiaImage fromForm: aForm during: [ :aSkiaImage |
			canvas surfaceCanvas
				drawImage: aSkiaImage
				at: aRectangle origin
				paint: (self setPaint: aSkiaPaint forForm: aForm) ] ]
]

{ #category : #drawing }
SkiaFillPainter >> fillRectangle: aRectangle withLinearGradient: aSpartaLinearGradient [
	
	SkiaPaint newDuring: [ :aSkiaPaint |
		canvas surfaceCanvas
			drawRectangle: aRectangle
			paint: (self setPaint: aSkiaPaint forGradient: aSpartaLinearGradient) ]
]

{ #category : #drawing }
SkiaFillPainter >> fillRectangle: aRectangle withRadialGradient: aSpartaRadialGradient [

	SkiaPaint newDuring: [ :aSkiaPaint |
		canvas surfaceCanvas
			drawRectangle: aRectangle
			paint: (self setPaint: aSkiaPaint forGradient: aSpartaRadialGradient) ]
]

{ #category : #drawing }
SkiaFillPainter >> fillRectangle: aRectangle withSolidColor: aColor [
	"blend mode = SrcOver, alpha = 1, antialias = true"
	drawOptions ifNil: [
		^ self
			optimizedFillRectangle: aRectangle
			withColor: aColor
			antialias: true ].
		
	SkiaPaint newDuring: [ :aSkiaPaint |
		canvas surfaceCanvas
			drawRectangle: aRectangle
			paint: (self setPaint: aSkiaPaint forColor: aColor) ]
]

{ #category : #drawing }
SkiaFillPainter >> fillRectangle: aRectangle withSurface: aSpartaSurfacePaint [

	aSpartaSurfacePaint needsShader
		ifTrue: [ ^ self ].

	(aRectangle extent ~= aSpartaSurfacePaint image extent)
		ifTrue: [ ^ self ].

	SkiaPaint newDuring: [ :aSkiaPaint |
		aSpartaSurfacePaint image snapshotDuring: [ :aSkiaImage |
			canvas surfaceCanvas
				drawImage: aSkiaImage
				at: aRectangle origin
				paint: (self setPaint: aSkiaPaint forSurface: aSpartaSurfacePaint) ] ]
]

{ #category : #drawing }
SkiaFillPainter >> fillRoundedRectangle: aSpartaRounedRectangle withSolidColor: aColor [

	"blend mode = SrcOver, alpha = 1, antialias = true"
	drawOptions ifNil: [
		^ self
			optimizedFillRoundedRectangle: aSpartaRounedRectangle
			withColor: aColor
			antialias: true ].
		
	SkiaPaint newDuring: [ :aSkiaPaint |
		canvas surfaceCanvas
			drawRoundedRectangle: aSpartaRounedRectangle
			paint: (self setPaint: aSkiaPaint forColor: aColor) ]
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

{ #category : #private }
SkiaFillPainter >> setPaint: aSkiaPaint forColor: aColor [
	| theDrawOptions |

	theDrawOptions := self ensuredDrawOptions.
	aSkiaPaint
		color: (aColor alpha: aColor alpha * theDrawOptions alpha);
		antialias: theDrawOptions antialias;
		blendMode: theDrawOptions blendMode.

	^ aSkiaPaint
]

{ #category : #private }
SkiaFillPainter >> setPaint: aSkiaPaint forForm: aSurface [
	| theDrawOptions |

	theDrawOptions := self ensuredDrawOptions.
	aSkiaPaint
		alpha: theDrawOptions alpha;
		antialias: theDrawOptions antialias;
		blendMode: theDrawOptions blendMode.

	^ aSkiaPaint
]

{ #category : #private }
SkiaFillPainter >> setPaint: aSkiaPaint forGradient: aSkiaGradient [
	| theDrawOptions |

	theDrawOptions := self ensuredDrawOptions.
	aSkiaPaint
		shader: aSkiaGradient asShader;
		antialias: theDrawOptions antialias;
		blendMode: theDrawOptions blendMode.

	^ aSkiaPaint
]

{ #category : #private }
SkiaFillPainter >> setPaint: aSkiaPaint forSurface: aSurface [
	| theDrawOptions |

	theDrawOptions := self ensuredDrawOptions.
	aSkiaPaint
		alpha: theDrawOptions alpha;
		antialias: theDrawOptions antialias;
		blendMode: theDrawOptions blendMode.

	^ aSkiaPaint
]
