Class {
	#name : #MozPathBuilder,
	#superclass : #FFIExternalObject,
	#traits : 'TSpartaPathBuilder + TMozLibrary + TMozRefPtr + TMozDebug',
	#classTraits : 'TSpartaPathBuilder classTrait + TMozLibrary classTrait + TMozRefPtr classTrait + TMozDebug classTrait',
	#instVars : [
		'absolute'
	],
	#pools : [
		'MozSharedPool'
	],
	#category : 'Sparta-Moz2D-Path'
}

{ #category : #'path commands' }
MozPathBuilder >> absolute [
	absolute := true
]

{ #category : #'path commands' }
MozPathBuilder >> arcAround: aCenterPoint radius: aRadius startAngle: aStartAngle endAngle: anEndAngle [
	self
		primArcOriginX: aCenterPoint x
		originY: aCenterPoint y
		radius: aRadius
		startAngle: aStartAngle
		endAngle: anEndAngle
		antiClockwise: false
		absolute: self isAbsolute
]

{ #category : #private }
MozPathBuilder >> arcTo: aPoint angle: angle cw: aBool [

	(angle = (Float pi / 2))
		"We can nicely optimize calculations for angle == PI/2"
		ifTrue: [
			self
				primArcToX: aPoint x
				originY: aPoint y
				antiClockwise: aBool not
				absolute: self isAbsolute  ]
		ifFalse: [
			self
				primArcToX: aPoint x
				originY: aPoint y
				angle: angle
				antiClockwise: aBool not
				absolute: self isAbsolute ]

	
]

{ #category : #accessing }
MozPathBuilder >> canvas: aCanvas [
	"we don't need canvas"
]

{ #category : #'path commands' }
MozPathBuilder >> close [
	"Close the current figure, this will essentially generate a line segment
 	from the current point to the starting point for the current figure"
	self primClose
]

{ #category : #'path commands' }
MozPathBuilder >> currentPoint [
	"Point the current subpath is at - or where the next subpath will start
	if there is no active subpath."
	<return: #Point>
	| aMozPoint aPoint |

	aMozPoint := MozNativePoint externalNew.
	self primCurrentPoint: aMozPoint.
	aPoint := aMozPoint asPoint.
	aMozPoint free.
	
	^ aPoint
]

{ #category : #'path commands' }
MozPathBuilder >> curveVia: cp1 and: cp2 to: aPoint [

	self
		primBezierX1: cp1 x
		Y1: cp1 y
		X2: cp2 x
		Y2: cp2 y
		X3: aPoint x
		Y3: aPoint y
		absolute: self isAbsolute
]

{ #category : #'path commands' }
MozPathBuilder >> curveVia: aControlPoint to: anEndPoint [

	self
		primQuadraticBezierX1: aControlPoint x
		Y1: aControlPoint y
		X2: anEndPoint x
		Y2: anEndPoint y
		absolute: self isAbsolute
]

{ #category : #'path commands' }
MozPathBuilder >> finish [

	^ self primFinish
		initialize;
		autoRelease
]

{ #category : #private }
MozPathBuilder >> isAbsolute [
	^ absolute
]

{ #category : #'path commands' }
MozPathBuilder >> lineTo: aPoint [

	self
		primLineToX: aPoint x
		Y: aPoint y
		absolute: self isAbsolute
]

{ #category : #'path commands' }
MozPathBuilder >> moveTo: aPoint [

	self
		primMoveToX: aPoint x
		Y: aPoint y
		absolute: self isAbsolute
]

{ #category : #'private - ffi' }
MozPathBuilder >> primArcOriginX: originX originY: originY radius: aRadius startAngle: aStartAngle endAngle: anEndAngle antiClockwise: anAntiClockwise absolute: isAbsolute [

	^ self ffiCall: #(void moz2d_path_sink_arc (
		self,
		float originX,
		float originY,
		float aRadius,
		float aStartAngle,
		float anEndAngle,
		bool anAntiClockwise,
		bool isAbsolute ) )
]

{ #category : #'private - ffi' }
MozPathBuilder >> primArcToX: endX originY: endY angle: anAngle antiClockwise: anAntiClockwise absolute: isAbsolute [

	^ self ffiCall: #(void moz2d_path_sink_arc_to_angle(
		self,
		float endX,
		float endY,
		float anAngle,
		bool anAntiClockwise,
		bool isAbsolute))
]

{ #category : #'private - ffi' }
MozPathBuilder >> primArcToX: endX originY: endY antiClockwise: anAntiClockwise absolute: isAbsolute [

	^ self ffiCall: #(void moz2d_path_sink_arc_to (
		self,
		float endX,
		float endY,
		bool anAntiClockwise,
		bool isAbsolute))
]

{ #category : #'private - ffi' }
MozPathBuilder >> primBezierX1: x1 Y1: y1 X2: x2 Y2: y2 X3: x3 Y3: y3 absolute: isAbsolute [

	^ self ffiCall: #(void moz2d_path_sink_bezier_to( self , float x1, float y1, float x2, float y2, float x3, float y3, bool isAbsolute) )
]

{ #category : #'private - ffi' }
MozPathBuilder >> primCircleArcRadius: radius directionX: dirX directionY: dirY antiClockwise: anAntiClockwise [

	^ self ffiCall: #(void moz2d_path_sink_circle_arc_to(self, float radius, int8 dirX, int8 dirY, bool anAntiClockwise))
]

{ #category : #'private - ffi' }
MozPathBuilder >> primClose [

	^ self ffiCall: #(void moz2d_path_sink_close( self ) )
]

{ #category : #'private - ffi' }
MozPathBuilder >> primCurrentPoint: aReceiverPoint [

	^ self ffiCall: #(void moz2d_path_sink_current_point( self, MozNativePoint aReceiverPoint ))
]

{ #category : #'private - ffi' }
MozPathBuilder >> primFinish [

	^ self ffiCall: #(#MozPath moz2d_path_builder_finish ( self ) )
]

{ #category : #'private - ffi' }
MozPathBuilder >> primLineToX: x Y: y absolute: isAbsolute [

	^ self ffiCall: #(void moz2d_path_sink_line_to( self , float x, float y, bool isAbsolute))
]

{ #category : #'private - ffi' }
MozPathBuilder >> primMoveToX: x Y: y absolute: isAbsolute [

	^ self ffiCall: #(void moz2d_path_sink_move_to( self , float x, float y, bool isAbsolute))
]

{ #category : #'private - ffi' }
MozPathBuilder >> primQuadraticBezierX1: x1 Y1: y1 X2: x2 Y2: y2 absolute: isAbsolute [

	^ self ffiCall: #(void moz2d_path_sink_quadratic_bezier_to( self , float x1, float y1, float x2, float y2, bool isAbsolute) )
]

{ #category : #'path commands' }
MozPathBuilder >> relative [
	absolute := false
]

{ #category : #accessing }
MozPathBuilder >> reset [
	absolute := true
]
