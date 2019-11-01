Class {
	#name : #SkiaFillPainter,
	#superclass : #SpartaFillPainter,
	#category : #'Sparta-Skia-Core'
}

{ #category : #drawing }
SkiaFillPainter >> fillPath: aPath withSolidColor: aColor [
	| aPaint |

	aPaint := SkiaPaint new color: aColor.
	canvas surfaceCanvas
		drawPath: aPath paint: aPaint
]

{ #category : #drawing }
SkiaFillPainter >> fillRectangle: aRectangle withSolidColor: aColor [
	| aPaint |

	aPaint := SkiaPaint new color: aColor.
	canvas surfaceCanvas
		drawRectangle: aRectangle paint: aPaint
]
