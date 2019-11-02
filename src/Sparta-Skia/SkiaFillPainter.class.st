Class {
	#name : #SkiaFillPainter,
	#superclass : #SpartaFillPainter,
	#category : #'Sparta-Skia-Core'
}

{ #category : #drawing }
SkiaFillPainter >> fillPath: aPath withSolidColor: aColor [
	| aSkiaPaint theDrawOptions |
	
	theDrawOptions := self ensuredDrawOptions.

	aSkiaPaint := SkiaPaint new.
	aSkiaPaint
		color: (aColor alpha: aColor alpha * theDrawOptions alpha);
		antialias: theDrawOptions antialias;
		blendMode: theDrawOptions blendMode.

	canvas surfaceCanvas
		drawPath: aPath
		paint: aSkiaPaint
]

{ #category : #drawing }
SkiaFillPainter >> fillRectangle: aRectangle withSolidColor: aColor [
	| aSkiaPaint theDrawOptions |
	
	theDrawOptions := self ensuredDrawOptions.

	aSkiaPaint := SkiaPaint new.
	aSkiaPaint
		color: (aColor alpha: aColor alpha * theDrawOptions alpha);
		antialias: theDrawOptions antialias;
		blendMode: theDrawOptions blendMode.

	canvas surfaceCanvas
		drawRectangle: aRectangle
		paint: aSkiaPaint
]
