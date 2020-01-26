Class {
	#name : #SkiaFillPainter,
	#superclass : #SpartaFillPainter,
	#category : #'Sparta-Skia-Builders'
}

{ #category : #drawing }
SkiaFillPainter >> fillCircle: aSpartaCircle withLinearGradient: aSpartaLinearGradient [

	SkiaPaint newDuring: [ :aSkiaPaint |
		canvas surfaceCanvas
			drawCircle: aSpartaCircle
			paint: (self setPaint: aSkiaPaint forGradient: aSpartaLinearGradient) ]
]

{ #category : #drawing }
SkiaFillPainter >> fillCircle: aSpartaCircle withRadialGradient: aSpartaRadialGradient [

	SkiaPaint newDuring: [ :aSkiaPaint |
		canvas surfaceCanvas
			drawCircle: aSpartaCircle
			paint: (self setPaint: aSkiaPaint forGradient: aSpartaRadialGradient) ]
]

{ #category : #drawing }
SkiaFillPainter >> fillCircle: aSpartaCircle withSolidColor: aColor [
		
	SkiaPaint newDuring: [ :aSkiaPaint |
		canvas surfaceCanvas
			drawCircle: aSpartaCircle
			paint: (self setPaint: aSkiaPaint forColor: aColor) ]
]

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
		canvas surfaceCanvas
			drawImage: (canvas bitmap fromForm: aForm)
			at: aRectangle origin
			paint: (self setPaint: aSkiaPaint forForm: aForm) ]
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

	self requiresPaintForColor ifFalse: [
		^ self
			optimizedFillRectangle: aRectangle
			withColor: aColor
			antialias: self getAntialias ].
		
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

	(self requiresPaintForSurface: aSpartaSurfacePaint)
		ifFalse: [
			^ self
				optimizedFillRectangle: aRectangle
				withSurface: aSpartaSurfacePaint ].

	SkiaPaint newDuring: [ :aSkiaPaint |
		aSpartaSurfacePaint image snapshotDuring: [ :aSkiaImage |
			canvas surfaceCanvas
				drawImage: aSkiaImage
				at: aRectangle origin
				paint: (self setPaint: aSkiaPaint forSurface: aSpartaSurfacePaint) ] ]
]

{ #category : #drawing }
SkiaFillPainter >> fillRoundedRectangle: aSpartaRounedRectangle withLinearGradient: aSpartaLinearGradient [

	SkiaPaint newDuring: [ :aSkiaPaint |
		canvas surfaceCanvas
			drawRoundedRectangle: aSpartaRounedRectangle
			paint: (self setPaint: aSkiaPaint forGradient: aSpartaLinearGradient) ]
]

{ #category : #drawing }
SkiaFillPainter >> fillRoundedRectangle: aSpartaRounedRectangle withRadialGradient: aSpartaRadialGradient [

	SkiaPaint newDuring: [ :aSkiaPaint |
		canvas surfaceCanvas
			drawRoundedRectangle: aSpartaRounedRectangle
			paint: (self setPaint: aSkiaPaint forGradient: aSpartaRadialGradient) ]
]

{ #category : #drawing }
SkiaFillPainter >> fillRoundedRectangle: aSpartaRoundedRectangle withSolidColor: aColor [

	"blend mode = SrcOver, alpha = 1, antialias = true"
	self requiresPaintForColor ifFalse: [
		^ self
			optimizedFillRoundedRectangle: SpartaRoundedRectangle
			withColor: aColor
			antialias: self getAntialias ].
		
	SkiaPaint newDuring: [ :aSkiaPaint |
		canvas surfaceCanvas
			drawRoundedRectangle: SpartaRoundedRectangle
			paint: (self setPaint: aSkiaPaint forColor: aColor) ]
]

{ #category : #'private - accessing' }
SkiaFillPainter >> getAlpha [
	<return: #Boolean>

	^ drawOptions
		ifNil: [ 1.0 ]
		ifNotNil: [ drawOptions alpha ]
]

{ #category : #'private - accessing' }
SkiaFillPainter >> getAntialias [
	<return: #Boolean>

	^ drawOptions
		ifNil: [ true ]
		ifNotNil: [ drawOptions antialias ]
]

{ #category : #'private - drawing' }
SkiaFillPainter >> optimizedFillRectangle: aRectangle withColor: aColor antialias: isAntialias [
	canvas surfaceCanvas
		fillRectangle: aRectangle
		color: aColor
		antialias: isAntialias
]

{ #category : #'private - drawing' }
SkiaFillPainter >> optimizedFillRectangle: aRectangle withSurface: aSpartaSurfacePaint [
	aSpartaSurfacePaint image snapshotDuring: [ :aSkiaImage |
		canvas surfaceCanvas
			fillImage: aSkiaImage
			at: aRectangle origin ]
]

{ #category : #'private - drawing' }
SkiaFillPainter >> optimizedFillRoundedRectangle: aSpartaRoundedRectangle withColor: aColor antialias: isAntialias [
	canvas surfaceCanvas
		fillRoundedRectangle: aSpartaRoundedRectangle
		color: aColor
		antialias: isAntialias
]

{ #category : #'private - drawing' }
SkiaFillPainter >> requiresPaintForColor [
	<return: #Boolean>
	
	drawOptions
		ifNil: [ ^ false ].

	^ drawOptions blendMode ~= SkiaBlendMode SrcOver
		or: [ (drawOptions alpha closeTo: 1.0) not ]
]

{ #category : #'private - drawing' }
SkiaFillPainter >> requiresPaintForSurface: aSkiaSurfacePaint [
	<return: #Boolean>
	
	drawOptions
		ifNil: [ ^ false ].

	^ drawOptions blendMode ~= SkiaBlendMode SrcOver
		or: [ (drawOptions alpha closeTo: 1.0) not
			or: [ drawOptions antialias
				or: [ aSkiaSurfacePaint filterQuality ~= SkiaPaint defaultFilterQuality ] ] ]
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
SkiaFillPainter >> setPaint: aSkiaPaint forSurface: aSkiaSurfacePaint [
	| theDrawOptions |

	theDrawOptions := self ensuredDrawOptions.
	aSkiaPaint
		alpha: theDrawOptions alpha;
		antialias: theDrawOptions antialias;
		blendMode: theDrawOptions blendMode;
		filterQuality: aSkiaSurfacePaint filterQuality.

	^ aSkiaPaint
]
