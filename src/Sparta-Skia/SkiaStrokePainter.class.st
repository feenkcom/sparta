Class {
	#name : 'SkiaStrokePainter',
	#superclass : 'SpartaStrokePainter',
	#category : 'Sparta-Skia-Builders'
}

{ #category : 'private - drawing' }
SkiaStrokePainter >> optimizedStrokeRectangle: aRectangle withColor: aColor width: aWidth antialias: isAntialias [
	canvas surfaceCanvas
		strokeRectangle: aRectangle
		color: aColor
		width: aWidth
		antialias: isAntialias
]

{ #category : 'private - drawing' }
SkiaStrokePainter >> optimizedStrokeRoundedRectangle: aSpartaRoundedRectangle withColor: aColor width: aWidth antialias: isAntialias [
	canvas surfaceCanvas
		strokeRoundedRectangle: aSpartaRoundedRectangle
		color: aColor
		width: aWidth
		antialias: isAntialias
]

{ #category : 'private' }
SkiaStrokePainter >> setPaint: aSkiaPaint forColor: aColor [
	| theDrawOptions theStrokeOptions |
	
	theDrawOptions := self ensuredDrawOptions.
	theStrokeOptions := self ensuredStrokeOptions.

	aSkiaPaint
		paintStyle: SkiaPaintStyle Stroke;
		color: (aColor alpha: aColor alpha * theDrawOptions alpha);
		antialias: theDrawOptions antialias;
		blendMode: theDrawOptions blendMode;
		capStyle: theStrokeOptions capStyle;
		joinStyle: theStrokeOptions joinStyle;
		strokeMiter: theStrokeOptions miterLimit;
		strokeWidth: theStrokeOptions width.
		
	theStrokeOptions dashPattern ifNotEmpty: [ :aDashPattern |
		SkiaDashPathEffect
			pattern: aDashPattern
			offset: theStrokeOptions dashOffset
			during: [ :aPathEffect | aSkiaPaint pathEffect: aPathEffect ] ].

	^ aSkiaPaint
]

{ #category : 'private' }
SkiaStrokePainter >> setPaint: aSkiaPaint forFillShadow: aSkiaBoxShadowPaint [
	| theDrawOptions |
	
	theDrawOptions := self ensuredDrawOptions.
	
	SkiaImageFilterDropShadowOnly delta: aSkiaBoxShadowPaint offset sigma: (aSkiaBoxShadowPaint radius / 1) color: aSkiaBoxShadowPaint color during: [ :anImageFilter |
		aSkiaPaint
			paintStyle: SkiaPaintStyle Fill;
			color: (Color white alpha: theDrawOptions alpha);
			antialias: theDrawOptions antialias;
			blendMode: theDrawOptions blendMode;
			imageFilter: anImageFilter ].

	^ aSkiaPaint
]

{ #category : 'private' }
SkiaStrokePainter >> setPaint: aSkiaPaint forGradient: aSkiaGradient [
	| theDrawOptions theStrokeOptions |

	theDrawOptions := self ensuredDrawOptions.
	theStrokeOptions := self ensuredStrokeOptions.
	
	aSkiaPaint
		paintStyle: SkiaPaintStyle Stroke;
		shader: aSkiaGradient asShader;
		antialias: theDrawOptions antialias;
		blendMode: theDrawOptions blendMode;
		capStyle: theStrokeOptions capStyle;
		joinStyle: theStrokeOptions joinStyle;
		strokeMiter: theStrokeOptions miterLimit;
		strokeWidth: theStrokeOptions width.
		
	theStrokeOptions dashPattern ifNotEmpty: [ :aDashPattern |
		SkiaDashPathEffect
			pattern: aDashPattern
			offset: theStrokeOptions dashOffset
			during: [ :aPathEffect | aSkiaPaint pathEffect: aPathEffect ] ].

	^ aSkiaPaint
]

{ #category : 'private' }
SkiaStrokePainter >> setPaint: aSkiaPaint forStrokeShadow: aSkiaBoxShadowPaint [
	| theDrawOptions theStrokeOptions |
	
	theDrawOptions := self ensuredDrawOptions.
	theStrokeOptions := self ensuredStrokeOptions.
	
	SkiaImageFilterDropShadowOnly delta: aSkiaBoxShadowPaint offset sigma: aSkiaBoxShadowPaint radius color: aSkiaBoxShadowPaint color during: [ :anImageFilter |
		aSkiaPaint
			paintStyle: SkiaPaintStyle Stroke;
			color: (Color white alpha: theDrawOptions alpha);
			antialias: theDrawOptions antialias;
			blendMode: theDrawOptions blendMode;
			capStyle: theStrokeOptions capStyle;
			joinStyle: theStrokeOptions joinStyle;
			strokeMiter: theStrokeOptions miterLimit;
			strokeWidth: theStrokeOptions width;
			imageFilter: anImageFilter ].

	^ aSkiaPaint
]

{ #category : 'drawing' }
SkiaStrokePainter >> strokeCircle: aSpartaCircle withBoxShadow: aSpartaBoxShadowPaint [
	SkiaPaint newDuring: [ :aSkiaPaint |
		canvas surfaceCanvas
			drawCircle: aSpartaCircle
			paint: (self setPaint: aSkiaPaint forFillShadow: aSpartaBoxShadowPaint) ]
]

{ #category : 'drawing' }
SkiaStrokePainter >> strokeCircle: aSpartaCircle withSolidColor: aColor [
	SkiaPaint newDuring: [ :aSkiaPaint |
		canvas surfaceCanvas
			drawCircle: aSpartaCircle
			paint: (self setPaint: aSkiaPaint forColor: aColor) ]
]

{ #category : 'drawing' }
SkiaStrokePainter >> strokeLine: aLine withBoxShadow: aSpartaBoxShadowPaint [
	SkiaPaint newDuring: [ :aSkiaPaint |
		canvas surfaceCanvas
			drawLine: aLine
			paint: (self setPaint: aSkiaPaint forStrokeShadow: aSpartaBoxShadowPaint) ]
]

{ #category : 'drawing' }
SkiaStrokePainter >> strokeLine: aLine withLinearGradient: aSpartaLinearGradient [
	
	SkiaPaint newDuring: [ :aSkiaPaint |
		canvas surfaceCanvas
			drawLine: aLine
			paint: (self setPaint: aSkiaPaint forGradient: aSpartaLinearGradient) ]
]

{ #category : 'drawing' }
SkiaStrokePainter >> strokeLine: aLine withRadialGradient: aSpartaRadialGradient [
	
	SkiaPaint newDuring: [ :aSkiaPaint |
		canvas surfaceCanvas
			drawLine: aLine
			paint: (self setPaint: aSkiaPaint forGradient: aSpartaRadialGradient) ]
]

{ #category : 'drawing' }
SkiaStrokePainter >> strokeLine: aLine withSolidColor: aColor [
	
	SkiaPaint newDuring: [ :aSkiaPaint |
		canvas surfaceCanvas
			drawLine: aLine
			paint: (self setPaint: aSkiaPaint forColor: aColor) ]
]

{ #category : 'drawing' }
SkiaStrokePainter >> strokePath: aPath withBoxShadow: aSpartaBoxShadowPaint [
	SkiaPaint newDuring: [ :aSkiaPaint |
		canvas surfaceCanvas
			drawPath: aPath
			paint: (self setPaint: aSkiaPaint forFillShadow: aSpartaBoxShadowPaint) ]
]

{ #category : 'drawing' }
SkiaStrokePainter >> strokePath: aPath withSolidColor: aColor [
	SkiaPaint newDuring: [ :aSkiaPaint |
		canvas surfaceCanvas
			drawPath: aPath
			paint: (self setPaint: aSkiaPaint forColor: aColor) ]
]

{ #category : 'drawing' }
SkiaStrokePainter >> strokeRectangle: aRectangle withBoxShadow: aSpartaBoxShadowPaint [
	SkiaPaint newDuring: [ :aSkiaPaint |
		canvas surfaceCanvas
			drawRectangle: aRectangle
			paint: (self setPaint: aSkiaPaint forFillShadow: aSpartaBoxShadowPaint) ]
]

{ #category : 'drawing' }
SkiaStrokePainter >> strokeRectangle: aRectangle withLinearGradient: aSpartaLinearGradient [
	
	SkiaPaint newDuring: [ :aSkiaPaint |
		canvas surfaceCanvas
			drawRectangle: aRectangle
			paint: (self setPaint: aSkiaPaint forGradient: aSpartaLinearGradient) ]
]

{ #category : 'drawing' }
SkiaStrokePainter >> strokeRectangle: aRectangle withRadialGradient: aSpartaRadialGradient [
	
	SkiaPaint newDuring: [ :aSkiaPaint |
		canvas surfaceCanvas
			drawRectangle: aRectangle
			paint: (self setPaint: aSkiaPaint forGradient: aSpartaRadialGradient) ]
]

{ #category : 'drawing' }
SkiaStrokePainter >> strokeRectangle: aRectangle withSolidColor: aColor [

	SkiaPaint newDuring: [ :aSkiaPaint |
		canvas surfaceCanvas
			drawRectangle: aRectangle
			paint: (self setPaint: aSkiaPaint forColor: aColor) ]
]

{ #category : 'drawing' }
SkiaStrokePainter >> strokeRoundedRectangle: aSpartaRectangle withBoxShadow: aSpartaBoxShadowPaint [
	SkiaPaint newDuring: [ :aSkiaPaint |
		canvas surfaceCanvas
			drawRoundedRectangle: aSpartaRectangle
			paint: (self setPaint: aSkiaPaint forFillShadow: aSpartaBoxShadowPaint) ]
]

{ #category : 'drawing' }
SkiaStrokePainter >> strokeRoundedRectangle: aSpartaRectangle withSolidColor: aColor [

	SkiaPaint newDuring: [ :aSkiaPaint |
		canvas surfaceCanvas
			drawRoundedRectangle: aSpartaRectangle
			paint: (self setPaint: aSkiaPaint forColor: aColor) ]
]
