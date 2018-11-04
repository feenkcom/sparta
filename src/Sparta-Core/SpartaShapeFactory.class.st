"
I provide a factory methods to create common shapes.
Shape factory helps to optimize common shape creation and therefore improve performance 

Public API and Key Messages

- ellipse: to create an ellipse within provided bounds
- circleAt:radius: to create a circle with center at a point and with provided radius
- roundedRectangle:radii: to create a rectangle with rounded corners

	canvas shape ellipse: (0@0 extent: 300@200).
	canvas shape circleAt: 50@50 radius: 25.
	canvas shape roundedRectangle: (0@0 extent: 300@200) radii: (BlCornerRadii radius: 12)
 
Internal Representation and Key Implementation Points.


  	It makes a lot of sense to implement shape creation methods as plugin or as part of backend
"
Class {
	#name : #SpartaShapeFactory,
	#superclass : #SpartaAbstractBuilder,
	#category : #'Sparta-Core-Builders'
}

{ #category : #shapes }
SpartaShapeFactory >> circleAt: aPoint radius: aNumber [
	"Return a closed circle shape with center at aPoint and radius aNumber"
	<return: #TSpartaPath>

	^ canvas path
		absolute;
		moveTo: aPoint + (aNumber @ 0);
		arcAround: aPoint radius: aNumber startAngle: 0 endAngle: Float pi * 2;
		close;
		finish
]

{ #category : #shapes }
SpartaShapeFactory >> ellipse: aRectangle [
	| aWidth aHeight halfWidth halfHeight halfWidth055 halfHeight055 halfWidth045 halfHeight045 |

	aWidth := aRectangle width.
	aHeight := aRectangle height.

	aWidth = aHeight
		ifTrue: [ 
			| aRadius aCenter |
			aRadius := aWidth / 2.0.
			aCenter := aRectangle origin + aRadius asPoint.
			^ self circleAt: aCenter radius: aRadius ].
		
	halfWidth := aWidth / 2.0.
	halfHeight := aHeight / 2.0.
	halfWidth055 := halfWidth * 0.55.
	halfHeight055 := halfHeight * 0.55.
	halfWidth045 := halfWidth * 0.45.
	halfHeight045 := halfHeight * 0.45.

	^ canvas path
		relative;
		moveTo: aRectangle origin;
		moveTo: halfWidth @ 0;
		curveVia: halfWidth055 @ 0 and: halfWidth @ halfHeight045 to: halfWidth @ halfHeight;
		curveVia: 0 @ halfHeight055 and: halfWidth045 negated @ halfHeight to: halfWidth negated @ halfHeight;
		curveVia: halfWidth055 negated @ 0 and: halfWidth negated @ halfHeight045 negated to: halfWidth negated @ halfHeight negated;
		curveVia: 0 @ halfHeight055 negated and: halfWidth045 @ halfHeight negated to: halfWidth @ halfHeight negated;
		close;
		finish
]

{ #category : #shapes }
SpartaShapeFactory >> line: aFromPoint to: aToPoint [
	^ SpartaLine from: aFromPoint to: aToPoint
]

{ #category : #shapes }
SpartaShapeFactory >> polygon: aCollectionOfPoints [
	"Return a closed polygon shape constructed out of provided vertices as points"
	<return: #TSpartaPath>
	| aPathBuilder |

	aPathBuilder := self canvas path absolute.
	"return empty path if there were no vertices provided"
	aCollectionOfPoints
		ifEmpty: [ ^ aPathBuilder build ].

	aPathBuilder moveTo: aCollectionOfPoints first.
	aCollectionOfPoints allButFirstDo: [ :aPoint | aPathBuilder lineTo: aPoint ].
	^ aPathBuilder close; build
]

{ #category : #shapes }
SpartaShapeFactory >> roundedRectangle: aRectangle radii: cornerRadii [
	| min tlr trr brr blr x y right bottom |

	min := (aRectangle width min: aRectangle height) / 2.0.
	tlr := cornerRadii topLeft min: min.
	trr := cornerRadii topRight min: min.
	brr := cornerRadii bottomRight min: min.
	blr := cornerRadii bottomLeft min: min.
	
	x := aRectangle left.
	y := aRectangle top.
	right := aRectangle right.
	bottom := aRectangle bottom.

	^ canvas path
		absolute;
		
		moveTo: x @ (y + tlr);
		cwArcTo: (x + tlr) @ y;
		
		lineTo: (right - trr) @ y;
		cwArcTo: right @ (y + trr);
		
		lineTo: right @ (bottom - brr);
		cwArcTo: (right - brr) @ bottom;
		
		lineTo: (x + blr) @ bottom;
		cwArcTo: x @ (bottom - blr);
		
		close;
		finish
]
