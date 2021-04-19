Class {
	#name : #SpartaCairoPathBuilder,
	#superclass : #Object,
	#traits : 'TSpartaPathBuilder + TSpartaCairoLibrary',
	#classTraits : 'TSpartaPathBuilder classTrait + TSpartaCairoLibrary classTrait',
	#instVars : [
		'absolute',
		'canvas',
		'endPoint',
		'lastControlPoint',
		'fillRule'
	],
	#category : #'Sparta-Cairo-Path'
}

{ #category : #'instance creation' }
SpartaCairoPathBuilder class >> evenOdd: aSpartaCanvas [
	^ SpartaCairoPathBuilder new fillRule: (SpartaCairoFillRule CAIRO_FILL_RULE_EVEN_ODD)
]

{ #category : #'instance creation' }
SpartaCairoPathBuilder class >> winding: aSpartaCanvas [
	^ SpartaCairoPathBuilder new fillRule: (SpartaCairoFillRule CAIRO_FILL_RULE_WINDING)
]

{ #category : #'path commands' }
SpartaCairoPathBuilder >> absolute [
	absolute := true
]

{ #category : #private }
SpartaCairoPathBuilder >> angleOfVector: v [
	| n acos |
	
	n := v normalized.
	acos := n x arcCos.
	
	^ v y < 0
		ifTrue: [ Float pi * 2 - acos ]
		ifFalse: [ acos ]
]

{ #category : #'path commands' }
SpartaCairoPathBuilder >> arcAround: aCenterPoint radius: aRadius startAngle: aStartAngle endAngle: anEndAngle [
	| aCenter |
	
	aCenter := self toAbsolute: aCenterPoint.

	self
		primArcCenterX: aCenter x
		centerY: aCenter y
		radius: aRadius
		startAngle: aStartAngle
		endAngle: anEndAngle.
		
	endPoint := self currentPoint.
	lastControlPoint := nil
]

{ #category : #private }
SpartaCairoPathBuilder >> arcTo: aPoint angle: angle cw: aBool [
	"Add a clockwise arc segment, starting from current path endpoint and
	ending at andPt. Angle should be specified in radians"
	| start end center v radius startAngle endAngle cwAngle |
	
	lastControlPoint := nil.

	angle isZero
		ifTrue: [ ^ self lineTo: aPoint ].
	
	start := endPoint.
	endPoint := end := self toAbsolute: aPoint.
	
	start = end
		ifTrue: [ ^ self ].

	"we have to transform the input. because Cario expects 
	the center , radius, starting and ending angle,
	and we have the starting point, the ending point , and the angle.
	"
	cwAngle := aBool
		ifTrue: [ angle ]
		ifFalse: [ angle negated ].

	center := self calcCenter: start end: end  angle: cwAngle.
	v := (start - center).
	radius := v r.
	startAngle := self angleOfVector: v.
	endAngle := self angleOfVector: (end-center).
	aBool ifTrue: [ self primArcCenterX: center x centerY: center y  radius: radius  startAngle: startAngle endAngle: endAngle ]
		ifFalse: [ self primArcNegativeCenterX: center x centerY: center y  radius: radius  startAngle: startAngle  endAngle: endAngle ]
		
]

{ #category : #private }
SpartaCairoPathBuilder >> calcCenter: start end: end angle: angle [

	| v  center radius len m |	

	v := end - start.
	
	m := SpartaMatrix new rotateByRadians: (Float pi - angle   /2).

	v := m transform: v.
	len := v r.
	radius := len / 2 / (angle /2) sin.
	
	center := v * (radius/len) + start.

	^ center
]

{ #category : #accessing }
SpartaCairoPathBuilder >> canvas [
	^ canvas
]

{ #category : #accessing }
SpartaCairoPathBuilder >> canvas: aCanvas [
	canvas := aCanvas.
	
	self primNewPath.
	self moveTo: 0@0
]

{ #category : #'path commands' }
SpartaCairoPathBuilder >> close [
	"Close the current figure, this will essentially generate a line segment
 	from the current point to the starting point for the current figure"

	self primClosePath.
	
	endPoint := self currentPoint.
	lastControlPoint := nil
]

{ #category : #'path commands' }
SpartaCairoPathBuilder >> currentPoint [
	"Point the current subpath is at - or where the next subpath will start
	if there is no active subpath."
	
	| aX aY aPoint |
	
	"since we use pointers to doubles we must create a copy of original values to not scratch them"
	aX := ExternalAddress allocate: (FFIExternalType resolveType: 'double') externalTypeSize.
	aY := ExternalAddress allocate: (FFIExternalType resolveType: 'double') externalTypeSize.

	self primCurrentPointX: aX Y: aY.
	aPoint := (aX doubleAt: 1)@ (aY doubleAt: 1).
	
	aX free.
	aY free.
	
	^ aPoint
]

{ #category : #'path commands' }
SpartaCairoPathBuilder >> curveVia: cp1 and: cp2 to: aPoint [
	|  pt1 |

	pt1 := self toAbsolute: cp1.
	lastControlPoint := self toAbsolute: cp2.
	endPoint := self toAbsolute: aPoint.

	self primCurveViaX: pt1 x Y: pt1 y viaX: lastControlPoint x Y: lastControlPoint y toX: endPoint x Y: endPoint y
]

{ #category : #'path commands' }
SpartaCairoPathBuilder >> curveVia: aControlPoint to: anEndPoint [
	| pt0 pt1 cp1 cp2 twoThirds |
	"Quad bezier curve"

	pt0 := endPoint.
	pt1 := self toAbsolute: aControlPoint.
	endPoint := self toAbsolute: anEndPoint.
	lastControlPoint := nil.
	
"Any quadratic spline can be expressed as a cubic (where the cubic term is zero). The end points of the cubic will be the same as the quadratic's.

	CP0 = QP0
	CP3 = QP2

The two control points for the cubic are:

	CP1 = QP0 + 2/3 *(QP1-QP0)
	CP2 = QP2 + 2/3 *(QP1-QP2)"

	twoThirds := (2/3) asFloat.

	cp1 := pt1 - pt0 * twoThirds + pt0.
	cp2 := pt1 - endPoint * twoThirds + endPoint.
	
	self primCurveViaX: cp1 x Y: cp1 y viaX: cp2 x Y: cp2 y toX: endPoint x Y: endPoint y

]

{ #category : #accessing }
SpartaCairoPathBuilder >> fillRule [
	<return: #SpartaCairoFillRule>

	^ fillRule
]

{ #category : #accessing }
SpartaCairoPathBuilder >> fillRule: aSpartaCairoFillRule [
	fillRule := aSpartaCairoFillRule
]

{ #category : #'path commands' }
SpartaCairoPathBuilder >> finish [
	endPoint := 0@0.
	lastControlPoint := nil.
	
	^ self primCopyPath
		autoRelease;
		fillRule: self fillRule
]

{ #category : #initialization }
SpartaCairoPathBuilder >> initialize [
	super initialize.

	absolute := true.
	endPoint := 0@0.
	lastControlPoint := nil.
	fillRule := SpartaCairoFillRule CAIRO_FILL_RULE_WINDING
]

{ #category : #'path commands' }
SpartaCairoPathBuilder >> lineTo: aPoint [
	
	endPoint := self toAbsolute: aPoint.
	lastControlPoint := nil.

	self primLineToX: endPoint x Y: endPoint y
]

{ #category : #'path commands' }
SpartaCairoPathBuilder >> moveTo: aPoint [
		
	endPoint := self toAbsolute: aPoint.
	lastControlPoint := nil.
	
	self primMoveToX: endPoint x Y: endPoint y
]

{ #category : #'private - ffi' }
SpartaCairoPathBuilder >> primArcCenterX: centerX centerY: centerY radius: aRadius startAngle: aStartAngle endAngle: anEndAngle [ 

	self ffiCall: #(void cairo_arc (
			SpartaCairoCanvas canvas,
			double centerX,
			double centerY,
			double aRadius,
			double aStartAngle,
			double anEndAngle) )
]

{ #category : #'private - ffi' }
SpartaCairoPathBuilder >> primArcNegativeCenterX: centerX centerY: centerY radius: aRadius startAngle: aStartAngle endAngle: anEndAngle [ 

	self ffiCall: #(void cairo_arc_negative (
			SpartaCairoCanvas canvas,
			double centerX,
			double centerY,
			double aRadius,
			double aStartAngle,
			double anEndAngle) )
				
			
]

{ #category : #'private - ffi' }
SpartaCairoPathBuilder >> primClosePath [
	
	self ffiCall: #(void cairo_close_path ( SpartaCairoCanvas canvas ) )
]

{ #category : #'private - ffi' }
SpartaCairoPathBuilder >> primCopyPath [

	^ self ffiCall: #(SpartaCairoPath cairo_copy_path ( SpartaCairoCanvas canvas ) )
]

{ #category : #'private - ffi' }
SpartaCairoPathBuilder >> primCurrentPointX: aX Y: aY [

	^ self ffiCall: #( void cairo_get_current_point (
		SpartaCairoCanvas canvas,
		double * aX,
		double * aY ) )
]

{ #category : #'private - ffi' }
SpartaCairoPathBuilder >> primCurveViaX: x1 Y: y1 viaX: x2 Y: y2 toX: x3 Y: y3 [
	
	^ self ffiCall: #(void cairo_curve_to (
			SpartaCairoCanvas canvas,
			double x1,
			double y1,
			double x2,
			double y2,
			double x3,
			double y3 ) )
]

{ #category : #'private - ffi' }
SpartaCairoPathBuilder >> primLineToX: aX Y: aY [
	
	^ self ffiCall: #(void cairo_line_to (
		SpartaCairoCanvas canvas, 
		double aX,
		double aY ) )
]

{ #category : #'private - ffi' }
SpartaCairoPathBuilder >> primMoveToX: aX Y: aY [
	
	^ self ffiCall: #(void cairo_move_to (
		SpartaCairoCanvas canvas,
		double aX,
		double aY ) )
]

{ #category : #'private - ffi' }
SpartaCairoPathBuilder >> primNewPath [	
	^ self ffiCall: #( void cairo_new_path ( SpartaCairoCanvas canvas ) )
]

{ #category : #'path commands' }
SpartaCairoPathBuilder >> relative [
	absolute := false
]

{ #category : #private }
SpartaCairoPathBuilder >> toAbsolute: aPoint [
	"Convert a given point to absolute path coordinates within user space"
	<return: #Point>

	^ absolute
		ifTrue: [ aPoint ]
		ifFalse: [ endPoint + aPoint ]
]
