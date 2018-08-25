Class {
	#name : #SpartaMatrix,
	#superclass : #Object,
	#instVars : [
		'sx',
		'shx',
		'x',
		'shy',
		'sy',
		'y'
	],
	#category : 'Sparta-Core-Math'
}

{ #category : #accessing }
SpartaMatrix class >> scale: aPoint [

	^ self new scaleBy: aPoint
]

{ #category : #accessing }
SpartaMatrix class >> translation: aPoint [

	^ self new translateBy: aPoint
]

{ #category : #comparing }
SpartaMatrix >> = anObject [
	"Return true if I am equals to the given object, false otherwise"
	<return: #Boolean>

	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	
	^ x = anObject x and: [ 
		y = anObject y and: [ 
			sx = anObject sx and: [ 
				sy = anObject sy and: [ 
					shx = anObject shx and: [ 
						shy = anObject shy ] ] ] ] ]
]

{ #category : #transformations }
SpartaMatrix >> clearTranslation [
	"reset a translation from matrix, leaving only scale and rotation"
	
	x := y := 0.0
]

{ #category : #'initialize-release' }
SpartaMatrix >> initialize [
	self loadIdentity
]

{ #category : #'vector-transform' }
SpartaMatrix >> inverseTransform: aPoint [ 
"  (we assume matrix is never degenerate)"
	| px py y0 x0 |
	
	px := aPoint x.
	py := aPoint y.
	"for rotations around +/- half pi"
	(sx = 0 and:[ sy = 0]) ifTrue:[
		^ self inverseTransformHalfPi: aPoint.
		].
	"for rotations around +/- pi or 0"
	(shx = 0 and:[ shy = 0]) ifTrue:[
		^ self inverseTransformPiOrZero: aPoint.
		].
    "otherwise:
     Given straight transformation formulae:
		
	px := x0*sx + y0*shx + x.
	py := x0*shy + y0*sy + y.
	
	we doing inverse one, trying to find x0,y0 for rest of given variables (px,py,x,y,sx,sy,shx,shy).
	
	x0 := px - x - (shx*y0) / sx.
	y0 := py - y - (shy*x0) / sy.
	
	y0 := py - y - (shy*(px - x - (shx*y0) / sx)) / sy.

	sy * y0  == py - y - (shy*(px - x - (shx*y0) / sx)).

	sx * sy * y0  == (sx*(py - y)) - (shy*(px - x - (shx*y0))).

	sx * sy * y0  == sx*py - (sx*y) - (shy*px) + (shy*x) + (shy*shx*y0).

	(sx * sy * y0) - (shy*shx*y0)  == sx*py - (sx*y) - (shy*px) + (shy*x) .
	
	y0* ((sx * sy) - (shy*shx))  == sx*py - (sx*y) - (shy*px) + (shy*x) .

"
	y0  := sx*py - (sx*y) - (shy*px) + (shy*x) / ((sx * sy) - (shy*shx)).
	x0 := px - x - (shx*y0) / sx.

	^ x0@y0
	
]

{ #category : #private }
SpartaMatrix >> inverseTransformHalfPi: aPoint [
	"assume sx,sy = 0
		
	px := y0*shx + x.
	py := x0*shy + y.
	
	we doing inverse one, trying to find x0,y0 for rest of given variables (px,py,x,y,sx,sy,shx,shy)"
	| px py y0 x0 |
	
	px := aPoint x.
	py := aPoint y.

	x0 := py - y  / shy.
	y0 := px - x  / shx.

	^ x0@y0
	
]

{ #category : #private }
SpartaMatrix >> inverseTransformPiOrZero: aPoint [
	"assume shx,shy = 0
		
	px := x0*sx + x.
	py := y0*sy + y.
	we doing inverse one, trying to find x0,y0 for rest of given variables (px,py,x,y,sx,sy,shx,shy)"
	
	| px py y0 x0 |
	
	px := aPoint x.
	py := aPoint y.

	x0 := px - x / sx.
	y0 := py - y / sy.

	^ x0@y0
	
]

{ #category : #accessing }
SpartaMatrix >> inverted [
	"answer an inverse transformation of receiver"
	| det |
	det := sx * sy - (shx * shy).
	^ self class new
		sx: sy / det;
		sy: sy / det;
		shx: shx * -1 / det;
		shy: shy * -1 / det;
		x: shx * y - (x * sy) / det;
		y: shy * x - (sx * y) / det;
		yourself
]

{ #category : #testing }
SpartaMatrix >> isIdentity [
	^ x = 0.0 and: [ y = 0.0 and: [ sx = 1.0 and: [sy = 1.0 and: [ shx = 0.0 and: [ shy = 0.0 ] ] ] ] ]
]

{ #category : #testing }
SpartaMatrix >> isPureTranslation [
	"Return true if the receiver specifies no rotation or scaling."

	^ sx = 1.0 and: [sy = 1.0 and: [ shx = 0.0 and: [ shy = 0.0 ] ] ]
]

{ #category : #transformations }
SpartaMatrix >> loadAffineTransform: m [

	x := m x.
	y := m y.
	sx := m sx.
	sy := m sy.
	shx := m shx.
	shy := m shy.
]

{ #category : #transformations }
SpartaMatrix >> loadIdentity [
	"initialize with identity transform"
	sx := sy := 1.0.
	shx := shy := x := y := 0.0.
	
	
]

{ #category : #transformations }
SpartaMatrix >> multiplyBy: m [

	"multiply receiver by given affine matrix"
"
| sx   shx   x   |        | sx'   shx'   x'   | 
| shy sy     y    |   *    | shy' sy'     y'   |
|  0     0     1   |        | 0  	0   		1	|       

"	
	
	| nsx nshx nx nshy nsy ny |
	
	nsx := sx * m sx + (shx  * m shy).
	nshx := sx * m shx + (shx * m sy).
	nx := sx * m x + (shx * m y) + x.
	
	nshy := shy * m sx + (sy * m shy).
	nsy := shy * m shx  + (sy * m sy).
	ny := shy* m x + (sy * m y) + y.
	
	sx := nsx.
	sy := nsy.
	shx := nshx.
	shy := nshy.
	x := nx.
	y := ny.		
]

{ #category : #printing }
SpartaMatrix >> printOn: aStream [
	|array|
	"| sx   shx   x  |
	 | shy  sy    y  | 
	 |  0    0    1  | "
	array := { sx . shx. x. shy. sy. y . 0.0. 0.0. 1.0 } collect: [ :float |
		|rawString|
		rawString := (float round: 3) asString.
		[ rawString size < 5 ] whileTrue: [ rawString := ' ', rawString ].
		rawString ].
	
	aStream nextPutAll: '|'; nextPutAll: (array at: 1); nextPutAll: (array at: 2); nextPutAll: (array at: 3); nextPutAll: '  |'; cr.
	aStream nextPutAll: ' |'; nextPutAll: (array at: 4); nextPutAll: (array at: 5); nextPutAll: (array at: 6); nextPutAll: '  |'; cr.
	aStream nextPutAll: ' |'; nextPutAll: (array at: 7); nextPutAll: (array at: 8); nextPutAll: (array at: 9); nextPutAll: '  |'.
]

{ #category : #transformations }
SpartaMatrix >> restoreAfter: aBlock [
	|previous|
	previous := self copy.
	aBlock ensure: [ 	self loadAffineTransform: previous ]
]

{ #category : #transformations }
SpartaMatrix >> rotateByDegrees: angle [


	^ self rotateByRadians: angle degreesToRadians
]

{ #category : #transformations }
SpartaMatrix >> rotateByRadians: angle [

	"multiply receiver by rotation matrix

| sx   shx   x   |        | cos -sin 0  |             | (sx*cos)+(shx*sin)   (-sx*sin+shx*cos)  x |
| shy sy     y   |   *   | sin   cos 0 |   ===> | (shy*cos)+(sy*sin)   (-shy*sin)+sy*cos) y |
|  0     0     1   |       | 0     0   1   |             |        0                                 0                1  |

"
	| cos sin newSx newSy |
	
	cos := angle cos.
	sin := angle sin.
	
	
	newSx := sx*cos + (shx*sin).
	newSy := sy*cos - (shy*sin).
	
	shx := shx*cos - (sx*sin).
	shy := shy*cos + (sy*sin).

	sx := newSx.
	sy := newSy
]

{ #category : #accessing }
SpartaMatrix >> scale [
	^ sx@sy
]

{ #category : #transformations }
SpartaMatrix >> scaleBy: factor [

	"multiply receiver by uniform scale matrix

| sx   shx   x   |       | (f x) 0 0  |             | sx*(f x)    shx*(f y)  x |
| shy sy     y   |   *   | 0 (f y) 0  |    ===> | shy*(f x)     sy*(f y)    y |
|  0     0     1  |        | 0 0     1  |                |  0      0              1  |

"	
	factor isPoint ifTrue: [
		sx := sx*factor x.
		shx := shx*factor y.
		sy := sy*factor y.
		shy := shy*factor x. 		
	] ifFalse: [
		sx := sx*factor.
		shx := shx*factor.
		sy := sy*factor.
		shy := shy*factor. ]

]

{ #category : #transformations }
SpartaMatrix >> scaleX: fx Y: fy [

	"multiply receiver by scale matrix

| sx   shx   x   |        | fx 0 0  |              | sx*fx    shx*fx  x |
| shy sy     y   |   *   | 0 fy 0  |    ===> | shy*fy  sy*fy   y |
|  0     0     1   |       | 0 0  1  |              |  0          0        1  |

"
	sx := sx*fx.
	shx := shx*fx.
	sy := sy*fy.
	shy := shy*fy.

]

{ #category : #accessing }
SpartaMatrix >> shx [
	^ shx
]

{ #category : #accessing }
SpartaMatrix >> shx: number [
	shx := number
]

{ #category : #accessing }
SpartaMatrix >> shy [
	^ shy
]

{ #category : #accessing }
SpartaMatrix >> shy: number [
	shy := number
]

{ #category : #dispatch }
SpartaMatrix >> spartaMultiplyWith: aSpartaMatrix [
	aSpartaMatrix multiplyBy: self
]

{ #category : #accessing }
SpartaMatrix >> sx [
	^ sx
]

{ #category : #accessing }
SpartaMatrix >> sx: number [
	sx := number
]

{ #category : #accessing }
SpartaMatrix >> sy [
	^ sy
]

{ #category : #accessing }
SpartaMatrix >> sy: number [
	sy := number
]

{ #category : #'vector-transform' }
SpartaMatrix >> transform: aPoint [ 
	| px py |

	px := aPoint x.
	py := aPoint y.
	^ Point 
		x: (sx*px +(shx*py) + x)
		y: (shy*px + (sy*py) + y) 
]

{ #category : #'vector-transform' }
SpartaMatrix >> transformRectangle: aSpartaRectangle [
	"In-place transform rectangle according to my transformation.
	(local to global transformation)"
	| newLeft newTop newRight newBottom aLeft aTop aRight aBottom |

	self isIdentity
		ifTrue: [ ^ aSpartaRectangle ].

	aLeft := aSpartaRectangle left.
	aTop := aSpartaRectangle top.
	aRight := aSpartaRectangle right.
	aBottom := aSpartaRectangle bottom.

	newLeft := self transformX: aLeft with: aTop.
	newTop := self transformY: aTop with: aLeft.
	newRight := self transformX: aRight with: aBottom.
	newBottom := self transformY: aBottom with: aRight.

	aLeft := newLeft min: newRight.
	aRight := newLeft max: newRight.
	aTop := newTop min: newBottom.
	aBottom := newTop max: newBottom.

	aSpartaRectangle
		left: aLeft
		top: aTop
		right: aRight
		bottom: aBottom.

	^ aSpartaRectangle
]

{ #category : #'vector-transform' }
SpartaMatrix >> transformX: aNumber [ 

	^ (sx * aNumber) abs
]

{ #category : #'vector-transform' }
SpartaMatrix >> transformX: px Y: py [
	" transform x and y coordinates by receiver. Answer a Point"
	^ Point 
		x: (sx*px +(shx*py) + x)
		y: (shy*px + (sy*py) + y) 
]

{ #category : #'vector-transform' }
SpartaMatrix >> transformX: aX with: aY [
	"Transform X coordinate taking Y coordinate into account.
	I am useful if you care about only one coordinate and don't
	want to waste object creation operation on unneeded Point"
	<return: #Number>

	^ (sx * aX) + (shx * aY) + x
]

{ #category : #'vector-transform' }
SpartaMatrix >> transformY: aNumber [ 

	^ (sy * aNumber) abs
]

{ #category : #'vector-transform' }
SpartaMatrix >> transformY: aY with: aX [
	"Transform Y coordinate taking X coordinate into account.
	I am useful if you care about only one coordinate and don't
	want to waste object creation operation on unneeded Point"
	<return: #Number>

	^ (shy * aX) + (sy * aY) + y
]

{ #category : #transformations }
SpartaMatrix >> translateBy: aPoint [

	^ self translateX: aPoint x Y: aPoint y
]

{ #category : #transformations }
SpartaMatrix >> translateX: aX Y: aY [


" multiply receiver by translation matrix :

| sx   shx   x   |        | 1  0  px |             |	sx  shx  (sx*px + shx*py + x) |
| shy sy     y   |   *   | 0  1  py |   ===> | shy  sy  (shy*px + sy*py + y)  |
|  0     0     1   |       | 0  0   1  |             |  0     0    1  |

"
	x := aX "(sx*px) + (shx*py)" + x.
	y := aY "(shy*px) + (sy*py)" + y.

]

{ #category : #accessing }
SpartaMatrix >> translation [
	^ x@y
]

{ #category : #accessing }
SpartaMatrix >> translation: aPoint [
	x := aPoint x.
	y := aPoint y.
]

{ #category : #transformations }
SpartaMatrix >> transposed [
	
	| s |
	s := shx.
	shx := shy.
	shy := s.
]

{ #category : #accessing }
SpartaMatrix >> x [
	^ x
]

{ #category : #accessing }
SpartaMatrix >> x: number [
	x := number
]

{ #category : #accessing }
SpartaMatrix >> y [
	^ y
]

{ #category : #accessing }
SpartaMatrix >> y: number [
	y := number
]
