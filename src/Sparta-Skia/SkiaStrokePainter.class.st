Class {
	#name : #SkiaStrokePainter,
	#superclass : #SpartaStrokePainter,
	#category : #'Sparta-Skia-Builders'
}

{ #category : #private }
SkiaStrokePainter >> createPaintForColor: aColor [
	| aSkiaPaint theDrawOptions theStrokeOptions |
	
	theDrawOptions := self ensuredDrawOptions.
	theStrokeOptions := self ensuredStrokeOptions.

	aSkiaPaint := SkiaPaint new.
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
SkiaStrokePainter >> strokeLine: aLine withSolidColor: aColor [
	canvas surfaceCanvas
		drawLine: aLine
		paint: (self createPaintForColor: aColor)
]

{ #category : #drawing }
SkiaStrokePainter >> strokePath: aPath withSolidColor: aColor [
	canvas surfaceCanvas
		drawPath: aPath
		paint: (self createPaintForColor: aColor)
]

{ #category : #drawing }
SkiaStrokePainter >> strokeRectangle: aRectangle withSolidColor: aColor [
	canvas surfaceCanvas
		drawRectangle: aRectangle
		paint: (self createPaintForColor: aColor)
]
