Class {
	#name : #SkiaPathBuilder,
	#superclass : #Object,
	#traits : 'TSpartaPathBuilder',
	#classTraits : 'TSpartaPathBuilder classTrait',
	#instVars : [
		'path',
		'isAbsolute'
	],
	#category : #'Sparta-Skia-Builders'
}

{ #category : #'instance creation' }
SkiaPathBuilder class >> evenOdd: aSpartaCanvas [
	^ self new fillType: SkiaPathFillType EvenOdd
]

{ #category : #'instance creation' }
SkiaPathBuilder class >> winding: aSpartaCanvas [
	^ self new fillType: SkiaPathFillType Winding
]

{ #category : #'path commands' }
SkiaPathBuilder >> absolute [
	isAbsolute := true
]

{ #category : #'path commands' }
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

{ #category : #accessing }
SkiaPathBuilder >> canvas: aCanvas [
	"we don't need canvas"
]

{ #category : #'path commands' }
SkiaPathBuilder >> close [
	"Close the current figure, this will essentially generate a line segment
 	from the current point to the starting point for the current figure"
	
	path close
]

{ #category : #accessing }
SkiaPathBuilder >> fillType: aSkiaPathFillType [
	path fillType: aSkiaPathFillType
]

{ #category : #'path commands' }
SkiaPathBuilder >> finish [
	^ path
]

{ #category : #initialization }
SkiaPathBuilder >> initialize [
	super initialize.
	
	path := SkiaPath new.
	isAbsolute := true
]

{ #category : #'path commands' }
SkiaPathBuilder >> lineTo: aPoint [
	isAbsolute
		ifTrue: [ path lineTo: aPoint ]
		ifFalse: [ path lineBy: aPoint ]
]

{ #category : #'path commands' }
SkiaPathBuilder >> moveTo: aPoint [
	isAbsolute
		ifTrue: [ path moveTo: aPoint ]
		ifFalse: [ path moveBy: aPoint ]
]

{ #category : #'path commands' }
SkiaPathBuilder >> relative [
	isAbsolute := false
]

{ #category : #accessing }
SkiaPathBuilder >> reset [
	isAbsolute := true.
	path := SkiaPath new
]
