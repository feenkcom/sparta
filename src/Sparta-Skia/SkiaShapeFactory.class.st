Class {
	#name : 'SkiaShapeFactory',
	#superclass : 'SpartaShapeFactory',
	#category : 'Sparta-Skia-Builders'
}

{ #category : 'shapes' }
SkiaShapeFactory >> circleAt: aPoint radius: aNumber [
	"Return a closed circle shape with center at aPoint and radius aNumber"
	<return: #TSpartaPath>
	
	^ SpartaCircle center: aPoint radius: aNumber
]

{ #category : 'shapes' }
SkiaShapeFactory >> roundedRectangle: aRectangle radii: anArrayOfCornerRadii [
	"anArrayOfCornerRadii must contain 4 numbers representing corner radii:
	{
		topLeft, topRight, bottomRight, bottomLeft
	}"

	^ SpartaRoundedRectangle
		rectangle: aRectangle
		radii: (SpartaCornerRadii fromArray: anArrayOfCornerRadii)
]
