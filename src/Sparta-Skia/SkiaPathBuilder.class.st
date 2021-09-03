Class {
	#name : 'SkiaPathBuilder',
	#superclass : 'Object',
	#traits : 'TSpartaPathBuilder',
	#classTraits : 'TSpartaPathBuilder classTrait',
	#instVars : [
		'path',
		'isAbsolute'
	],
	#category : 'Sparta-Skia-Builders'
}

{ #category : 'instance creation' }
SkiaPathBuilder class >> evenOdd: aSpartaCanvas [
	^ self new fillType: SkiaPathFillType EvenOdd
]

{ #category : 'instance creation' }
SkiaPathBuilder class >> winding: aSpartaCanvas [
	^ self new fillType: SkiaPathFillType Winding
]

{ #category : 'path commands' }
SkiaPathBuilder >> absolute [
	isAbsolute := true
]

{ #category : 'path commands' }
SkiaPathBuilder >> arcAround: aCenterPoint radius: aRadius startAngle: aStartAngle endAngle: anEndAngle [
	| aRectangle aSweepAngle amountOfArcs theRestAngle aSignedPi |
	
	aRectangle := (aCenterPoint - aRadius asPoint) extent: (aRadius * 2) asPoint.
	aSweepAngle := anEndAngle - aStartAngle.
	
	"within interval (-360; 360) we can draw arc directly"
	(aSweepAngle abs < (Float pi * 2))
		ifTrue: [ ^ path arcTo: aRectangle start: aStartAngle radiansToDegrees sweep: aSweepAngle radiansToDegrees forceMove: false absolute: isAbsolute ].
	
	"requred to support negative sweep angles"
	aSignedPi := Float pi * aSweepAngle sign.
	
	"otherwise we should draw multiple arcs with sweep angle 180"
	amountOfArcs := aSweepAngle // aSignedPi.
	theRestAngle := aSweepAngle % aSignedPi.
	
	1 to: amountOfArcs do: [ :anArcIndex |
		| aCurrentStart |
		aCurrentStart := (anArcIndex - 1) * aSignedPi + aStartAngle.
		path arcTo: aRectangle start: aCurrentStart radiansToDegrees sweep: aSignedPi radiansToDegrees forceMove: false absolute: isAbsolute ].

	(theRestAngle closeTo: 0.0)
		ifTrue: [ ^ self ].
	path arcTo: aRectangle start: (anEndAngle - theRestAngle) radiansToDegrees sweep: theRestAngle radiansToDegrees forceMove: false absolute: isAbsolute
]

{ #category : 'private' }
SkiaPathBuilder >> arcTo: aToPoint angle: anAngle cw: isClockwise [
	"Add a clockwise arc segment, starting from current path endpoint and
	ending at andPt. Angle should be specified in radians.
	
	anAngle must be within interval [ - 2 Pi ... 2 Pi ]	"	
	| aTargetAngle aCurrentPoint aTargetPoint aMiddlePoint aCenter aRadius aStartAngle aCenterNormal anEndAngle |
	
	aTargetAngle := anAngle min: Float pi * 2 max: Float pi * 2 negated.
	
	"-270 angle is same as 90 and vice versa"
	aTargetAngle < 0
		ifTrue: [ aTargetAngle := (aTargetAngle + (Float pi * 2)) max: 0 ].
	
	aCurrentPoint := 0@0.
	path lastPointDo: [ :aPoint | aCurrentPoint := aPoint ].
	
	aTargetPoint := isAbsolute
		ifTrue: [ aToPoint ]
		ifFalse: [ aCurrentPoint + aToPoint ].
	
	"an arc to the same point is ambiguous and therefore ignored"
	(aTargetPoint closeTo: aCurrentPoint)
		ifTrue: [ ^ self ].

	aMiddlePoint := aCurrentPoint + ((aTargetPoint - aCurrentPoint) / 2.0).
	aCenterNormal := (aTargetPoint - aCurrentPoint) normal.
	
	isClockwise
		ifFalse: [ aCenterNormal := aCenterNormal negated ].
		
	aCenter := aMiddlePoint + (aCenterNormal * (aCurrentPoint distanceTo: aMiddlePoint) / (aTargetAngle / 2.0) tan).
	
	aRadius := aCenter distanceTo: aTargetPoint.
	
	aStartAngle := ((1 - (((aCurrentPoint distanceTo: (aCenter + (aRadius @ 0))) raisedTo: 2) / (2 * aRadius * aRadius))) min: 1 max: -1) arcCos.

	aCurrentPoint y <= aCenter y
		ifTrue: [ aStartAngle := aStartAngle negated ].

	anEndAngle := isClockwise
		ifTrue: [ aStartAngle + aTargetAngle ]
		ifFalse: [ aStartAngle - aTargetAngle ].
	
	self
		arcAround: (isAbsolute
			ifTrue: [ aCenter ]
			ifFalse: [ aCenter - aCurrentPoint ])
		radius: aRadius
		startAngle: aStartAngle
		endAngle: anEndAngle
]

{ #category : 'accessing' }
SkiaPathBuilder >> canvas: aCanvas [
	"we don't need canvas"
]

{ #category : 'path commands' }
SkiaPathBuilder >> close [
	"Close the current figure, this will essentially generate a line segment
 	from the current point to the starting point for the current figure"
	
	path close
]

{ #category : 'path commands' }
SkiaPathBuilder >> currentPoint [
	"Point the current subpath is at - or where the next subpath will start
	if there is no active subpath."
	<return: #Point>

	path lastPointDo: [ :aPoint | ^ aPoint ].
	^ 0@0
]

{ #category : 'path commands' }
SkiaPathBuilder >> curveVia: aControlPoint and: anOtherControlPoint to: anEndPoint [
	isAbsolute
		ifTrue: [ path cubicTo: anEndPoint via: aControlPoint and: anOtherControlPoint ]
		ifFalse: [ path cubicBy: anEndPoint via: aControlPoint and: anOtherControlPoint ]
]

{ #category : 'path commands' }
SkiaPathBuilder >> curveVia: aControlPoint to: anEndPoint [
	isAbsolute
		ifTrue: [ path quadTo: anEndPoint via: aControlPoint ]
		ifFalse: [ path quadBy: anEndPoint via: aControlPoint ]
]

{ #category : 'accessing' }
SkiaPathBuilder >> fillType: aSkiaPathFillType [
	path fillType: aSkiaPathFillType
]

{ #category : 'path commands' }
SkiaPathBuilder >> finish [
	^ path
]

{ #category : 'initialization' }
SkiaPathBuilder >> initialize [
	super initialize.
	
	path := SkiaPath new.
	isAbsolute := true
]

{ #category : 'path commands' }
SkiaPathBuilder >> lineTo: aPoint [
	isAbsolute
		ifTrue: [ path lineTo: aPoint ]
		ifFalse: [ path lineBy: aPoint ]
]

{ #category : 'path commands' }
SkiaPathBuilder >> moveTo: aPoint [
	isAbsolute
		ifTrue: [ path moveTo: aPoint ]
		ifFalse: [ path moveBy: aPoint ]
]

{ #category : 'path commands' }
SkiaPathBuilder >> relative [
	isAbsolute := false
]
