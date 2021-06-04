"
I am mutable implementation of Rectangle which stores coordinates as Numbers and not Points
"
Class {
	#name : #SpartaRectangle,
	#superclass : #SpartaGeometry,
	#instVars : [
		'left',
		'top',
		'right',
		'bottom'
	],
	#category : #'Sparta-Core-Path'
}

{ #category : #'instance creation' }
SpartaRectangle class >> fromRectangle: aRectangle [
	^ self new
		rectangle: aRectangle;
		yourself
]

{ #category : #'instance creation' }
SpartaRectangle class >> origin: anOrigin extent: anExtent [

	self
		assert: [ anExtent x >= 0 and: [ anExtent y >= 0 ] ]
		description: [ 'Extent must be positive!' ].

	^ self new
		left: anOrigin x
		top: anOrigin y
		right: anOrigin x + anExtent x
		bottom: anOrigin y + anExtent y;
		yourself
]

{ #category : #converting }
SpartaRectangle >> asRectangle [
	"Convert me to immutable Rectangle.
	Note, that using left:right:top:bottom: is the fastest way to create
	a rectangle from set of numbers (faster than Point#>>corner:)"

	^ Rectangle left: left right: right top: top bottom: bottom
]

{ #category : #accessing }
SpartaRectangle >> bottom [
	^ bottom
]

{ #category : #accessing }
SpartaRectangle >> bottom: anObject [
	bottom := anObject
]

{ #category : #testing }
SpartaRectangle >> containedInRect: aRectangle [
	"Answer whether a receiver is within a aRectangle"
	<return: #Boolean>
	| aLeft aTop aRight aBottom |
	
	aLeft := aRectangle left.
	aTop := aRectangle top.
	aRight := aRectangle right.
	aBottom := aRectangle bottom.

	^ aLeft <= left and: [
		aTop <= top and: [
			aRight >= right and: [
				aBottom >= bottom ] ] ]
]

{ #category : #testing }
SpartaRectangle >> containsRect: aRectangle [
	"Answer whether aRectangle is within the receiver"
	<return: #Boolean>
	| aLeft aTop aRight aBottom |
	
	aLeft := aRectangle left.
	aTop := aRectangle top.
	aRight := aRectangle right.
	aBottom := aRectangle bottom.
	
	^ aLeft >= left and: [
		aTop >= top and: [
			aRight <= right and: [
				aBottom <= bottom ] ] ]
]

{ #category : #accessing }
SpartaRectangle >> corner [
	^ right @ bottom
]

{ #category : #'rectangle functions' }
SpartaRectangle >> expandBy: aDelta [ 
	"Outset me by delta. Delta is a Rectangle, Point, or Number."

	^ aDelta isRectangle
		ifTrue: [ self expandByMargin: aDelta ]
		ifFalse: [ aDelta isPoint
			ifTrue: [ self expandByPoint: aDelta ]
			ifFalse: [ aDelta isNumber
				ifTrue: [ self expandByNumber: aDelta ]
				ifFalse: [ self expandByMargin: aDelta ] ] ]
]

{ #category : #'rectangle functions' }
SpartaRectangle >> expandByLeft: aLeft top: aTop right: aRight bottom: aBottom [

	left := left - aLeft.
	top := top - aTop.
	right := right + aRight.
	bottom := bottom + aBottom
]

{ #category : #'rectangle functions' }
SpartaRectangle >> expandByMargin: aMargin [ 

	left := left - aMargin left.
	top := top - aMargin top.
	right := right + aMargin right.
	bottom := bottom + aMargin bottom
]

{ #category : #'rectangle functions' }
SpartaRectangle >> expandByNumber: aNumber [ 
		
	left := left - aNumber.
	top := top - aNumber.
	right := right + aNumber.
	bottom := bottom + aNumber
]

{ #category : #'rectangle functions' }
SpartaRectangle >> expandByPoint: aPoint [ 
	
	left := left - aPoint x.
	top := top - aPoint y.
	right := right + aPoint x.
	bottom := bottom + aPoint y
]

{ #category : #accessing }
SpartaRectangle >> expanded [
	"Transform me so that origin and corner are rounded to integers.
	Rounding is done by upper value on origin and lower value on corner so that
	self is inside rounded rectangle."
	
	left := left floor.
	top := top floor.
	right := right ceiling.
	bottom := bottom ceiling
]

{ #category : #accessing }
SpartaRectangle >> extent [

	^ (right - left) @ (bottom - top)
]

{ #category : #testing }
SpartaRectangle >> hasPositiveExtent [
	^ right > left and: [ bottom > top ]
]

{ #category : #accessing }
SpartaRectangle >> height [
	^ bottom - top
]

{ #category : #initialization }
SpartaRectangle >> initialize [
	super initialize.
	
	left := 0.
	top := 0.
	right := 0.
	bottom := 0
]

{ #category : #'api - sparta path' }
SpartaRectangle >> insetBy: aNumber [
	"Answer a sparta geometry that is inset from the receiver by delta. delta is a number"
	<return: #SpartaGeometry>	
	| l r t b |

	l := self left 	+ aNumber.
	r := left max: self right - aNumber.
	t := self top + aNumber.
	b := top max: self bottom - aNumber.
	
	^ self class new left: l top: t right: r bottom: b
]

{ #category : #'rectangle functions' }
SpartaRectangle >> intersect: aRectangle ifNone: aBlock [
	"Answer a Rectangle that is the area in which the receiver overlaps with 
	aRectangle. 
	If there's no overlap, evaluate the block instead"
	| aLeft aTop aRight aBottom newLeft newTop newRight newBottom |

	(self intersects: aRectangle)
		ifFalse: [ ^ aBlock value ].
	
	aLeft := aRectangle left.
	aTop := aRectangle top.
	aRight := aRectangle right.
	aBottom := aRectangle bottom.
	
	newLeft := aLeft max: left.
	newTop := aTop max: top.
	newRight := aRight min: right.
	newBottom := aBottom min: bottom.

	^ self class new
		left: newLeft
		top: newTop
		right: newRight
		bottom: newBottom
]

{ #category : #testing }
SpartaRectangle >> intersects: aRectangle [ 
	"Answer whether aRectangle intersects the receiver anywhere"
	<return: #Boolean>
	| aLeft aTop aRight aBottom |
	
	aLeft := aRectangle left.
	aTop := aRectangle top.
	aRight := aRectangle right.
	aBottom := aRectangle bottom.

	aRight <= left ifTrue: [ ^ false ].
	aBottom <= top ifTrue: [ ^ false ].
	aLeft >= right ifTrue: [ ^ false ].
	aTop >= bottom ifTrue: [ ^ false ].
	^ true
]

{ #category : #accessing }
SpartaRectangle >> left [
	^ left
]

{ #category : #accessing }
SpartaRectangle >> left: anObject [
	left := anObject
]

{ #category : #initialization }
SpartaRectangle >> left: aLeft top: aTop corner: aCorner [

	left := aLeft.
	top := aTop.
	right := aCorner x.
	bottom := aCorner y
]

{ #category : #initialization }
SpartaRectangle >> left: aLeft top: aTop right: aRight bottom: aBottom [
	left := aLeft.
	top := aTop.
	right := aRight.
	bottom := aBottom
]

{ #category : #'rectangle functions' }
SpartaRectangle >> merge: aRectangle [ 
	"Merge provided rectangle into me.
	aRectangle must not be nil"
	| useRcvr aLeft aTop aRight aBottom minX maxX minY maxY |

	useRcvr := true.

	aLeft := aRectangle left.
	aTop := aRectangle top.
	aRight := aRectangle right.
	aBottom := aRectangle bottom.

	minX := aLeft < left
		ifTrue: 
			[ useRcvr := false.
			aLeft ]
		ifFalse: [ left ].
	maxX := aRight > right
		ifTrue: 
			[ useRcvr := false.
			aRight ]
		ifFalse: [ right ].
	minY := aTop < top
		ifTrue: 
			[ useRcvr := false.
			aTop ]
		ifFalse: [ top ].
	maxY := aBottom > bottom
		ifTrue: 
			[ useRcvr := false.
			aBottom ]
		ifFalse: [ bottom ].
	
	"no need to merge do nothing"
	useRcvr 
		ifTrue: [ ^ self ].
	
	left := minX.
	top := minY.
	right := maxX.
	bottom := maxY
]

{ #category : #accessing }
SpartaRectangle >> origin [
	^ left @ top
]

{ #category : #initialization }
SpartaRectangle >> origin: anOrigin extent: anExtent [

	left := anOrigin x.
	top := anOrigin y.
	right := left + anExtent x.
	bottom := top + anExtent y
]

{ #category : #initialization }
SpartaRectangle >> rectangle: aRectangle [
	self
		left: aRectangle left
		top: aRectangle top
		right: aRectangle right
		bottom: aRectangle bottom
]

{ #category : #accessing }
SpartaRectangle >> right [
	^ right
]

{ #category : #accessing }
SpartaRectangle >> right: anObject [
	right := anObject
]

{ #category : #transforming }
SpartaRectangle >> scaleBy: aFactor [
	
	^ aFactor isPoint
		ifTrue: [ self scaleX: aFactor x Y: aFactor y ]
		ifFalse: [ aFactor isNumber
			ifTrue: [ self scaleX: aFactor Y: aFactor ]
			ifFalse: [ self scaleX: aFactor x Y: aFactor y ] ]
]

{ #category : #transforming }
SpartaRectangle >> scaleX: aX Y: aY [

	left := left * aX.
	top := top * aY.
	right := right * aX.
	bottom := bottom * aY
]

{ #category : #'api - sparta path' }
SpartaRectangle >> spartaClipOn: aSpartaCanvas with: aSpartaClipper [
	^ aSpartaClipper pushRectangle: self
]

{ #category : #'api - sparta path' }
SpartaRectangle >> spartaDrawFigureOn: aSpartaCanvas with: aSpartaFigurePainter [
	aSpartaFigurePainter drawRectangle: self
]

{ #category : #'api - sparta path' }
SpartaRectangle >> spartaFillOn: aSpartaCanvas with: aSpartaFillPainter [
	aSpartaFillPainter fillRectangle: self
]

{ #category : #'api - sparta path' }
SpartaRectangle >> spartaStrokeOn: aSpartaCanvas with: aSpartaStrokePainter [
	aSpartaStrokePainter strokeRectangle: self
]

{ #category : #'api - sparta path' }
SpartaRectangle >> strokedBoundsOn: aSpartaCanvas with: aStrokeOptions [
	"Return the bounds of the stroke of this path using the specified strokeoptions.
	These bounds are not guaranteed to be tight."
	<return: #Rectangle>

	^ (left @ top corner: right @ bottom) expandBy: aStrokeOptions width
]

{ #category : #accessing }
SpartaRectangle >> top [
	^ top
]

{ #category : #accessing }
SpartaRectangle >> top: anObject [
	top := anObject
]

{ #category : #accessing }
SpartaRectangle >> topLeft [
	"Answer the point at the top left corner of the receiver's top horizontal line"
	<return: #Point>

	^ left @ top
]

{ #category : #transforming }
SpartaRectangle >> translateBy: aPoint [

	self translateX: aPoint x Y: aPoint y
]

{ #category : #transforming }
SpartaRectangle >> translateX: aX Y: aY [

	left := left + aX.
	top := top + aY.
	right := right + aX.
	bottom := bottom + aY
]

{ #category : #accessing }
SpartaRectangle >> width [
	^ right - left
]
