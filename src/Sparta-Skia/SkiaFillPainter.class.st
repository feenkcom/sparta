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

{ #category : #drawing }
SkiaFillPainter >> fillPath: aPath withSolidColor: aColor [
	canvas surfaceCanvas
		drawPath: aPath
		paint: (self createPaintForColor: aColor)
]

{ #category : #drawing }
SkiaFillPainter >> fillRectangle: aRectangle withSolidColor: aColor [
	canvas surfaceCanvas
		drawRectangle: aRectangle
		paint: (self createPaintForColor: aColor)
]
