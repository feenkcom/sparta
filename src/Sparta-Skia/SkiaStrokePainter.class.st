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

{ #category : #drawing }
SkiaStrokePainter >> strokeLine: aLine withSolidColor: aColor [
	| aPaint |
	
	aPaint := self createPaintForColor: aColor.
	[ canvas surfaceCanvas
		drawLine: aLine
		paint: aPaint ] ensure: [ aPaint release ]
]

{ #category : #drawing }
SkiaStrokePainter >> strokePath: aPath withSolidColor: aColor [
	| aPaint |
	
	aPaint := self createPaintForColor: aColor.
	[ canvas surfaceCanvas
		drawPath: aPath
		paint: aPaint ] ensure: [ aPaint release ]
]

{ #category : #drawing }
SkiaStrokePainter >> strokeRectangle: aRectangle withSolidColor: aColor [
	| aPaint |
	
	aPaint := self createPaintForColor: aColor.
	[ canvas surfaceCanvas
		drawRectangle: aRectangle
		paint: aPaint ] ensure: [ aPaint release ]
]

{ #category : #drawing }
SkiaStrokePainter >> strokeRoundedRectangle: aSpartaRectangle withSolidColor: aColor [
	| aPaint |
	
	aPaint := self createPaintForColor: aColor.
	[ canvas surfaceCanvas
		drawRoundedRectangle: aSpartaRectangle
		paint: aPaint ] ensure: [ aPaint release ]
]
