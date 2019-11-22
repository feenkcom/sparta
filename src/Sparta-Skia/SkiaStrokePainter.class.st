Class {
	#name : #SkiaStrokePainter,
	#superclass : #SpartaStrokePainter,
	#category : #'Sparta-Skia-Builders'
}

{ #category : #'private - drawing' }
SkiaStrokePainter >> optimizedStrokeRectangle: aRectangle withColor: aColor width: aWidth antialias: isAntialias [
	canvas surfaceCanvas
		strokeRectangle: aRectangle
		color: aColor
		width: aWidth
		antialias: isAntialias
]

{ #category : #'private - drawing' }
SkiaStrokePainter >> optimizedStrokeRoundedRectangle: aSpartaRoundedRectangle withColor: aColor width: aWidth antialias: isAntialias [
	canvas surfaceCanvas
		strokeRoundedRectangle: aSpartaRoundedRectangle
		color: aColor
		width: aWidth
		antialias: isAntialias
]

{ #category : #private }
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

	^ aSkiaPaint
]

{ #category : #drawing }
SkiaStrokePainter >> strokeCircle: aSpartaCircle withSolidColor: aColor [
	SkiaPaint newDuring: [ :aSkiaPaint |
		canvas surfaceCanvas
			drawCircle: aSpartaCircle
			paint: (self setPaint: aSkiaPaint forColor: aColor) ]
]

{ #category : #drawing }
SkiaStrokePainter >> strokeLine: aLine withSolidColor: aColor [
	
	SkiaPaint newDuring: [ :aSkiaPaint |
		canvas surfaceCanvas
			drawLine: aLine
			paint: (self setPaint: aSkiaPaint forColor: aColor) ]
]

{ #category : #drawing }
SkiaStrokePainter >> strokePath: aPath withSolidColor: aColor [

	SkiaPaint newDuring: [ :aSkiaPaint |
		canvas surfaceCanvas
			drawPath: aPath
			paint: (self setPaint: aSkiaPaint forColor: aColor) ]
]

{ #category : #drawing }
SkiaStrokePainter >> strokeRectangle: aRectangle withSolidColor: aColor [

	SkiaPaint newDuring: [ :aSkiaPaint |
		canvas surfaceCanvas
			drawRectangle: aRectangle
			paint: (self setPaint: aSkiaPaint forColor: aColor) ]
]

{ #category : #drawing }
SkiaStrokePainter >> strokeRoundedRectangle: aSpartaRectangle withSolidColor: aColor [

	SkiaPaint newDuring: [ :aSkiaPaint |
		canvas surfaceCanvas
			drawRoundedRectangle: aSpartaRectangle
			paint: (self setPaint: aSkiaPaint forColor: aColor) ]
]
