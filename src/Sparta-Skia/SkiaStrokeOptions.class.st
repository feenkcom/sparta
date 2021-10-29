Class {
	#name : #SkiaStrokeOptions,
	#superclass : #Object,
	#traits : 'TSpartaStrokeOptions',
	#classTraits : 'TSpartaStrokeOptions classTrait',
	#instVars : [
		'width',
		'dashOffset',
		'dashPattern',
		'miterLimit',
		'capStyle',
		'joinStyle'
	],
	#classInstVars : [
		'default'
	],
	#category : 'Sparta-Skia-Core'
}

{ #category : #accessing }
SkiaStrokeOptions class >> cleanUp [
	default := nil
]

{ #category : #accessing }
SkiaStrokeOptions class >> default [
	^ default ifNil: [ default := self new ]
]

{ #category : #comparing }
SkiaStrokeOptions >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ capStyle = anObject capStyle
		and: [ dashOffset = anObject dashOffset
				and: [ dashPattern = anObject dashPattern
						and: [ joinStyle = anObject joinStyle
								and: [ miterLimit = anObject miterLimit and: [ width = anObject width ] ] ] ] ]
]

{ #category : #'cap styles' }
SkiaStrokeOptions >> capButt [
	self capStyle: SkiaCapStyle Butt
]

{ #category : #'cap styles' }
SkiaStrokeOptions >> capRound [
	self capStyle: SkiaCapStyle Round
]

{ #category : #'cap styles' }
SkiaStrokeOptions >> capSquare [
	self capStyle: SkiaCapStyle Square
]

{ #category : #'cap styles' }
SkiaStrokeOptions >> capStyle [
	^ capStyle
]

{ #category : #'cap styles' }
SkiaStrokeOptions >> capStyle: aCapStyle [
	capStyle := aCapStyle
]

{ #category : #accessing }
SkiaStrokeOptions >> dashOffset [
	^ dashOffset
]

{ #category : #accessing }
SkiaStrokeOptions >> dashOffset: aFloat [
	dashOffset := aFloat
]

{ #category : #accessing }
SkiaStrokeOptions >> dashPattern [
	^ dashPattern
]

{ #category : #accessing }
SkiaStrokeOptions >> dashPattern: anArrayOfFloats [
	dashPattern := anArrayOfFloats
]

{ #category : #comparing }
SkiaStrokeOptions >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ capStyle hash
		bitXor:
			(dashOffset hash
				bitXor:
					(dashPattern hash
						bitXor: (joinStyle hash bitXor: (miterLimit hash bitXor: width hash))))
]

{ #category : #initialization }
SkiaStrokeOptions >> initialize [
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
SkiaStrokeOptions >> joinBevel [
	self joinStyle: SkiaJoinStyle Bevel
]

{ #category : #'join styles' }
SkiaStrokeOptions >> joinMiter [
	self joinStyle: SkiaJoinStyle Miter
]

{ #category : #'join styles' }
SkiaStrokeOptions >> joinMiterOrBevel [
	self joinStyle: SkiaJoinStyle Miter
]

{ #category : #'join styles' }
SkiaStrokeOptions >> joinRound [
	self joinStyle: SkiaJoinStyle Round
]

{ #category : #'join styles' }
SkiaStrokeOptions >> joinStyle [
	^ joinStyle
]

{ #category : #'join styles' }
SkiaStrokeOptions >> joinStyle: aJoinStyle [
	joinStyle := aJoinStyle
]

{ #category : #accessing }
SkiaStrokeOptions >> miterLimit [
	^ miterLimit
]

{ #category : #accessing }
SkiaStrokeOptions >> miterLimit: aFloat [
	miterLimit := aFloat
]

{ #category : #accessing }
SkiaStrokeOptions >> width [
	^ width
]

{ #category : #accessing }
SkiaStrokeOptions >> width: aFloat [
	width := aFloat
]
