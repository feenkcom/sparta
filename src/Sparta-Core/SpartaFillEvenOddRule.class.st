"
SVG defines the even-odd rule as follows:
	Even-odd rule determines the ""insideness"" of a point on the canvas by drawing a ray from that point to infinity in any direction and counting the number of path segments from the given shape that the ray crosses. If this number is odd, the point is inside; if even, the point is outside.
"
Class {
	#name : #SpartaFillEvenOddRule,
	#superclass : #SpartaFillRule,
	#category : #'Sparta-Core-Path'
}

{ #category : #accessing }
SpartaFillEvenOddRule >> newPathBuilder: aPathBuilderClass canvas: aSpartaCanvas [
	^ aPathBuilderClass evenOdd: aSpartaCanvas
]
