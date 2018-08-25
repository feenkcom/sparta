"
!! TSpartaPathBuilder

I declare an API of a path builder.

!! Overview

I provide a set of methods to create an arbitrary vector path.
I can work in both relative and absolute mode, that influences on how path is created.

!! Public API and Key Messages

- ==absolute== - switch to absolute coordinates mode. Every Point provided as argument to my methods is supposed to be specified in global coordinates.
- ==relative== - switch to relative coordinates mode. Points provided as arguments are treated as related deltas from current path's end point.
- ==moveTo:== - moves current end point to a Point.
- ==lineTo:== - adds a line segment from current end point to a Point
- ==curveVia:to:== - adds a Quadratic Bezier curve via an anchor point to aPoint
- ==curveVia:and:to:== - adds a Cubic Bezier curve via two anchor points to a Point
- ==*ArcTo:== - adds an arc segment to a Point.
- ==close== - closes a path, connecting current end point with start point with line
- ==finish== - to end path construction and return an instance SpartaPath. Any message send to PathBuilder after finish will result in a crash.

!! Example:

Create a rectangle path similar to (20@20 corner: 40@40):
[[[language=smalltalk
path := canvas path
	relative;
	moveTo: 20@20;
	lineTo: 0@20;
	lineTo: (20@0) negated;
	lineTo: (0@20) negated;
	close;
	finish.
]]]

!! Internal Representation and Key Implementation Points.


    Implementation Points

"
Trait {
	#name : #TSpartaPathBuilder,
	#category : 'Sparta-Core-Path'
}

{ #category : #'path commands' }
TSpartaPathBuilder >> absolute [
	^ self explicitRequirement
]

{ #category : #'path commands' }
TSpartaPathBuilder >> arcAround: aCenterPoint radius: aRadius startAngle: aStartAngle endAngle: anEndAngle [
	^ self explicitRequirement
]

{ #category : #private }
TSpartaPathBuilder >> arcTo: aPoint angle: angle cw: aBool [
	"Add a clockwise arc segment, starting from current path endpoint and
	ending at andPt. Angle should be specified in radians"
	^ self explicitRequirement
]

{ #category : #'path commands' }
TSpartaPathBuilder >> build [
	^ self finish
]

{ #category : #accessing }
TSpartaPathBuilder >> canvas: aCanvas [
	self explicitRequirement
]

{ #category : #'path commands' }
TSpartaPathBuilder >> ccwArcTo: aPoint [

	^ self arcTo: aPoint angle: Float pi / 2 cw: false
]

{ #category : #'path commands' }
TSpartaPathBuilder >> ccwArcTo: newEndPoint angle: angle [
	"Add a counter-clockwise arc segment, starting from current path endpoint and
	ending at andPt. Angle should be specified in radians"

	^ self arcTo: newEndPoint angle: angle cw: false
]

{ #category : #'path commands' }
TSpartaPathBuilder >> close [
	"Close the current figure, this will essentially generate a line segment
 	from the current point to the starting point for the current figure"
	^ self explicitRequirement
]

{ #category : #'path commands' }
TSpartaPathBuilder >> currentPoint [
	"Point the current subpath is at - or where the next subpath will start
	if there is no active subpath."
	<return: #Point>

	^ self explicitRequirement
]

{ #category : #'path commands' }
TSpartaPathBuilder >> curveVia: cp1 and: cp2 to: aPoint [
	^ self explicitRequirement
]

{ #category : #'path commands' }
TSpartaPathBuilder >> curveVia: aControlPoint to: anEndPoint [
	^ self explicitRequirement
]

{ #category : #'path commands' }
TSpartaPathBuilder >> cwArcTo: aPoint [
	"Add a clockwise arc segment, starting from current path endpoint and
	ending at aPoint assuming that angle is Pi/2"

	self arcTo: aPoint angle: Float pi / 2 cw: true
]

{ #category : #'path commands' }
TSpartaPathBuilder >> cwArcTo: aPoint angle: aFloatAngleInRadians [
	"Add a clockwise arc segment, starting from current path endpoint and
	ending at aPoint. Angle should be specified in radians."

	self arcTo: aPoint angle: aFloatAngleInRadians cw: true
]

{ #category : #'path commands' }
TSpartaPathBuilder >> finish [
	^ self explicitRequirement
]

{ #category : #'path commands' }
TSpartaPathBuilder >> lineTo: aPoint [
	^ self explicitRequirement
]

{ #category : #'path commands' }
TSpartaPathBuilder >> moveTo: aPoint [
	^ self explicitRequirement
]

{ #category : #'path commands' }
TSpartaPathBuilder >> relative [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaPathBuilder >> reset [
	self explicitRequirement
]
