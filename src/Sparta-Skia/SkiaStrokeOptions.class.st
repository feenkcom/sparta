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
	#category : #'Sparta-Skia-Core'
}

{ #category : #accessing }
SkiaStrokeOptions class >> cleanUp [
	default := nil
]

{ #category : #accessing }
SkiaStrokeOptions class >> default [
	^ default ifNil: [ default := self new ]
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
SkiaStrokeOptions >> dashOffset: aFloat [
	dashOffset := aFloat
]

{ #category : #accessing }
SkiaStrokeOptions >> dashPattern: anArrayOfFloats [
	dashPattern := anArrayOfFloats
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
SkiaStrokeOptions >> miterLimit: aFloat [
	miterLimit := aFloat
]

{ #category : #accessing }
SkiaStrokeOptions >> width: aFloat [
	width := aFloat
]
