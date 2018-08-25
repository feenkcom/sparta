Class {
	#name : #SpartaCairoStrokeOptions,
	#superclass : #Object,
	#traits : 'TSpartaStrokeOptions',
	#classTraits : 'TSpartaStrokeOptions classTrait',
	#instVars : [
		'width',
		'miterLimit',
		'dashOffset',
		'dashPattern',
		'lineCap',
		'lineJoin'
	],
	#classInstVars : [
		'default'
	],
	#category : 'Sparta-Cairo'
}

{ #category : #cleanup }
SpartaCairoStrokeOptions class >> cleanUp [
	super cleanUp.
	
	default := nil
]

{ #category : #accessing }
SpartaCairoStrokeOptions class >> default [
	^ default ifNil: [ default := self new ]
]

{ #category : #'cap styles' }
SpartaCairoStrokeOptions >> capButt [
	self lineCap: SpartaCairoCapStyle CAIRO_LINE_CAP_BUTT
]

{ #category : #'cap styles' }
SpartaCairoStrokeOptions >> capRound [
	self lineCap: SpartaCairoCapStyle CAIRO_LINE_CAP_ROUND
]

{ #category : #'cap styles' }
SpartaCairoStrokeOptions >> capSquare [
	self lineCap: SpartaCairoCapStyle CAIRO_LINE_CAP_SQUARE
]

{ #category : #accessing }
SpartaCairoStrokeOptions >> dashOffset [
	^ dashOffset
]

{ #category : #accessing }
SpartaCairoStrokeOptions >> dashOffset: aFloat [
	dashOffset := aFloat
]

{ #category : #accessing }
SpartaCairoStrokeOptions >> dashPattern [
	^ dashPattern
]

{ #category : #accessing }
SpartaCairoStrokeOptions >> dashPattern: anArrayOfFloats [
	dashPattern := anArrayOfFloats
]

{ #category : #initialization }
SpartaCairoStrokeOptions >> initialize [
	super initialize.


	"Setting default values according to backend specification"
	self width: self class defaultWidth.
	self joinMiterOrBevel.
	self capButt.
	self miterLimit: 10.0.
	self dashOffset: 0.
	self dashPattern: #()
]

{ #category : #'join styles' }
SpartaCairoStrokeOptions >> joinBevel [
	self lineJoin: SpartaCairoJoinStyle CAIRO_LINE_JOIN_BEVEL
]

{ #category : #'join styles' }
SpartaCairoStrokeOptions >> joinMiter [
	self lineJoin: SpartaCairoJoinStyle CAIRO_LINE_JOIN_MITER
]

{ #category : #'join styles' }
SpartaCairoStrokeOptions >> joinMiterOrBevel [
	self lineJoin: SpartaCairoJoinStyle CAIRO_LINE_JOIN_MITER
]

{ #category : #'join styles' }
SpartaCairoStrokeOptions >> joinRound [
	self lineJoin: SpartaCairoJoinStyle CAIRO_LINE_JOIN_ROUND
]

{ #category : #accessing }
SpartaCairoStrokeOptions >> lineCap [
	^ lineCap
]

{ #category : #accessing }
SpartaCairoStrokeOptions >> lineCap: aLineCap [
	lineCap := aLineCap
]

{ #category : #accessing }
SpartaCairoStrokeOptions >> lineJoin [
	^ lineJoin
]

{ #category : #accessing }
SpartaCairoStrokeOptions >> lineJoin: aLineJoin [
	lineJoin := aLineJoin
]

{ #category : #accessing }
SpartaCairoStrokeOptions >> miterLimit [
	^ miterLimit
]

{ #category : #accessing }
SpartaCairoStrokeOptions >> miterLimit: aFloat [
	miterLimit := aFloat
]

{ #category : #accessing }
SpartaCairoStrokeOptions >> width [
	^ width
]

{ #category : #accessing }
SpartaCairoStrokeOptions >> width: aFloat [
	width := aFloat
]
