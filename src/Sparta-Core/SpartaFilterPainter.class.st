"
! SpartaFilterPainter

I am an abstract filter painter used to construct filter drawing operation.

!! Overview

I am responsible for creation and execution of filter draw operation. It requires an area on which it should be applied, an offset (if not set, area origin is used instead) and actual filter primitive.

Developers should use me to create a filter drawing operation. It involves a configuration step of wanted filter and actual drawing step. I must be only created by canvas, and never directly refering my class.

!! Public API and Key Messages

- ==area:== - set an area on which filter should be applied (source area)
- ==type:== - an object representing one of filter primitives. See ==filters== protocol in *SpartaCanvas>../SpartaCanvas.class/README.md*
- ==to:== - ''(optional)'' set location on canvas where result should be blended (destination). If not set, area origin is used.
- ==drawOptions:== - ''(optional)'' set additional draw parameters, such as global alpha, composition operator and antialias.

!! Example:

[[[language=smalltalk
canvas filter
	area: (100@100 extent: 200@200);
	to: 150@150;
	type: (canvas gaussianBlurFilter
		source: canvas;
		stdDeviation: 4);
	draw.
]]]

!! Internal Representation and Key Implementation Points.

!!! Instance Variables
- destinationPoint:     ==<Point>==
- drawOptions:		==<TSpartaDrawOptions>==
- filter:		==<TSpartaFilter>==
- sourceRectangle:	==<Rectangle>==

!!! Implementation Points

I am an abstract class. Concrete backends must implement ==#draw==

"
Class {
	#name : #SpartaFilterPainter,
	#superclass : #SpartaAbstractPainter,
	#instVars : [
		'filter',
		'sourceRectangle',
		'destinationPoint',
		'drawOptions'
	],
	#category : #'Sparta-Core-Builders'
}

{ #category : #accessing }
SpartaFilterPainter >> area: aRectangle [
	"Set an area on origin canvas where filter should be applied.
	It plays a role of source area and should be specified in user
	coordinate space.
	aRectangle must not be nil"
	
	self
		assert: [ aRectangle isNotNil ]
		description: [ 'Source area must not be nil!' ].
		
	sourceRectangle := aRectangle
]

{ #category : #accessing }
SpartaFilterPainter >> drawOptions: aSpartaDrawOptions [
	"Set additional draw parameters used during drawing.
	DrawOptions define global alpha value, composition operator
	and antialias mode.
	If drawOptions are not specified during construction,
	a default ones will be used. See TSpartaDrawOptions default.
	aSpartaDrawOptions must not be nil"
	<optional>

	self
		assert: [ aSpartaDrawOptions isNotNil ]
		description: [ 'DrawOptions must not be nil!' ].
		
	drawOptions := aSpartaDrawOptions
]

{ #category : #'initialize-release' }
SpartaFilterPainter >> reset [
	"On reset set all inst.vars to nil to allow them
	be garbage collected"
	super reset.
	
	filter := nil.
	sourceRectangle := nil.
	destinationPoint := nil.
	drawOptions := nil.
]

{ #category : #accessing }
SpartaFilterPainter >> to: aPoint [
	"Set a destination point on the canvas where result of filter
	operation should be blended. aPoint should be specified in user
	coordinate space.
	If destination point is not specified an origin of source area
	will be used.
	aPoint must not be nil"
	<optional>
	
	self
		assert: [ aPoint isNotNil ]
		description: [ 'Destination point must not be nil!' ].

	destinationPoint := aPoint
]

{ #category : #accessing }
SpartaFilterPainter >> type: aSpartaFilter [
	"Set a filter primitive type to be applied on the canvas.
	aSpartaFilter is created by canvas, see 'filters' protocol in SpartaCanvas.
	To learn more about filter primitives, please refer to
	https://www.w3.org/TR/SVG/filters.html.
	aSpartaFilter must not be nil"

	self
		assert: [ aSpartaFilter isNotNil ]
		description: [ 'Filter primitive must not be nil!' ].

	filter := aSpartaFilter
]
