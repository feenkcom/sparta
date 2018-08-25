Class {
	#name : #SpartaCairoMatrix,
	#superclass : #FFIExternalStructure,
	#traits : 'TSpartaCairoLibrary',
	#classTraits : 'TSpartaCairoLibrary classTrait',
	#classVars : [
		'OFFSET_SHX',
		'OFFSET_SHY',
		'OFFSET_SX',
		'OFFSET_SY',
		'OFFSET_X',
		'OFFSET_Y'
	],
	#category : 'Sparta-Cairo-External'
}

{ #category : #'instance creation' }
SpartaCairoMatrix class >> externalFromSpartaMatrix: aSpartaMatrix [

	^ self externalNew
		initX: aSpartaMatrix x
		y: aSpartaMatrix y
		sx: aSpartaMatrix sx
		sy: aSpartaMatrix sy
		shx: aSpartaMatrix shx
		shy: aSpartaMatrix shy;
		yourself
]

{ #category : #'field definition' }
SpartaCairoMatrix class >> fieldsDesc [
	"
	self rebuildFieldAccessors
	"
	^ #(
		double sx; double shx;
		double shy; double sy;
		double x; double y;	
	)
]

{ #category : #'instance creation' }
SpartaCairoMatrix class >> fromSpartaMatrix: aSpartaMatrix [

	^ self new
		initX: aSpartaMatrix x
		y: aSpartaMatrix y
		sx: aSpartaMatrix sx
		sy: aSpartaMatrix sy
		shx: aSpartaMatrix shx
		shy: aSpartaMatrix shy;
		yourself
]

{ #category : #'instance creation' }
SpartaCairoMatrix class >> scale: aFactor [
	
	^ self new
		initX: 0
		y: 0
		sx: (aFactor isPoint ifTrue: [ aFactor x ] ifFalse: [ aFactor ])
		sy: (aFactor isPoint ifTrue: [ aFactor y ] ifFalse: [ aFactor ])
		shx: 0
		shy: 0;
		yourself
]

{ #category : #initialization }
SpartaCairoMatrix >> initX: aX y: aY sx: aSx sy: aSy shx: aShX shy: aShY [
	self primInitX: aX y: aY sx: aSx sy: aSy shx: aShX shy: aShY
]

{ #category : #transformations }
SpartaCairoMatrix >> invert [

	self primInvert
]

{ #category : #initialization }
SpartaCairoMatrix >> loadIdentity [

	self primLoadIdentity
]

{ #category : #'private - ffi' }
SpartaCairoMatrix >> primInitX: aX y: aY sx: aSx sy: aSy shx: aShX shy: aShY [

	^ self ffiCall: #( void cairo_matrix_init (
			self,
			double aSx,
			double aShY,
			double aShX,
			double aSy,
			double aX,
			double aY ) )
]

{ #category : #'private - ffi' }
SpartaCairoMatrix >> primInvert [

	^ self ffiCall: #(SpartaCairoStatus cairo_matrix_invert ( self ) )
]

{ #category : #'private - ffi' }
SpartaCairoMatrix >> primLoadIdentity [

	^ self ffiCall: #( void cairo_matrix_init_identity ( self ) )
]

{ #category : #'private - ffi' }
SpartaCairoMatrix >> primScaleX: aX Y: aY [

	^ self ffiCall: #( void cairo_matrix_scale (
			self,
			double aX,
			double aY ) )
]

{ #category : #transformations }
SpartaCairoMatrix >> scaleBy: aPoint [

	self primScaleX: aPoint x Y: aPoint y
]

{ #category : #'accessing structure variables' }
SpartaCairoMatrix >> shx [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_SHX
]

{ #category : #'accessing structure variables' }
SpartaCairoMatrix >> shx: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_SHX put: anObject
]

{ #category : #'accessing structure variables' }
SpartaCairoMatrix >> shy [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_SHY
]

{ #category : #'accessing structure variables' }
SpartaCairoMatrix >> shy: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_SHY put: anObject
]

{ #category : #'accessing structure variables' }
SpartaCairoMatrix >> sx [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_SX
]

{ #category : #'accessing structure variables' }
SpartaCairoMatrix >> sx: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_SX put: anObject
]

{ #category : #'accessing structure variables' }
SpartaCairoMatrix >> sy [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_SY
]

{ #category : #'accessing structure variables' }
SpartaCairoMatrix >> sy: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_SY put: anObject
]

{ #category : #'accessing structure variables' }
SpartaCairoMatrix >> x [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_X
]

{ #category : #'accessing structure variables' }
SpartaCairoMatrix >> x: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_X put: anObject
]

{ #category : #'accessing structure variables' }
SpartaCairoMatrix >> y [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_Y
]

{ #category : #'accessing structure variables' }
SpartaCairoMatrix >> y: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_Y put: anObject
]
