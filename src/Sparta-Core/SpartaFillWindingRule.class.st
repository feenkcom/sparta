"
SVG defines the non-zero winding rule as follows:
	Non-zero winding rule determines the ""insideness"" of a point on the canvas by drawing a ray from that point to infinity in any direction and then examining the places where a segment of the shape crosses the ray. Starting with a count of zero, add one each time a path segment crosses the ray from left to right and subtract one each time a path segment crosses the ray from right to left. After counting the crossings, if the result is zero then the point is outside the path. Otherwise, it is inside.

"
Class {
	#name : #SpartaFillWindingRule,
	#superclass : #SpartaFillRule,
	#category : #'Sparta-Core-Path'
}

{ #category : #accessing }
SpartaFillWindingRule >> newPathBuilder: aPathBuilderClass canvas: aSpartaCanvas [
	^ aPathBuilderClass winding: aSpartaCanvas
]
