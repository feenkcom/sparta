Class {
	#name : #MozStrokeOptions,
	#superclass : #FFIExternalStructure,
	#traits : 'TSpartaStrokeOptions',
	#classTraits : 'TSpartaStrokeOptions classTrait',
	#classVars : [
		'OFFSET_DASHOFFSET',
		'OFFSET_LINECAP',
		'OFFSET_LINEJOIN',
		'OFFSET_MITERLIMIT',
		'OFFSET_PRIVATEDASHLENGTH',
		'OFFSET_PRIVATEDASHPATTERN',
		'OFFSET_WIDTH'
	],
	#classInstVars : [
		'default'
	],
	#category : 'Sparta-Moz2D'
}

{ #category : #converting }
MozStrokeOptions class >> asExternalTypeOn: generator [
	"use handle ivar to hold my instance"
	^ FFIExternalObjectType objectClass: self
]

{ #category : #cleanup }
MozStrokeOptions class >> cleanUp [
	super cleanUp.
	
	default := nil
]

{ #category : #accessing }
MozStrokeOptions class >> default [
	^ default ifNil: [ default := self new ]
]

{ #category : #'field definition' }
MozStrokeOptions class >> fieldsDesc [
	"
	self rebuildFieldAccessors
	"
	^ #(
		float width;
		float miterLimit;
		float* privateDashPattern;
		size_t privateDashLength;
		float dashOffset;
		MozJoinStyle lineJoin;
		MozCapStyle lineCap
	)
]

{ #category : #comparing }
MozStrokeOptions >> = anotherObject [
	self == anotherObject
		ifTrue: [ ^ true ].
	(anotherObject isKindOf: self class)
		ifFalse: [ ^ false ].

	^ anotherObject width = self width
		and: [ anotherObject lineCap = self lineCap
			and: [ anotherObject lineJoin = self lineJoin
				and: [ anotherObject miterLimit = self miterLimit
					and: [ anotherObject dashOffset = self dashOffset
						and: [ anotherObject dashPattern = self dashPattern ] ] ] ] ]
]

{ #category : #'cap styles' }
MozStrokeOptions >> capButt [
	self lineCap: MozCapStyle BUTT
]

{ #category : #'cap styles' }
MozStrokeOptions >> capRound [
	self lineCap: MozCapStyle ROUND
]

{ #category : #'cap styles' }
MozStrokeOptions >> capSquare [
	self lineCap: MozCapStyle SQUARE
]

{ #category : #'accessing structure variables' }
MozStrokeOptions >> dashOffset [
	"This method was automatically generated"
	^handle floatAt: OFFSET_DASHOFFSET
]

{ #category : #'accessing structure variables' }
MozStrokeOptions >> dashOffset: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_DASHOFFSET put: anObject
]

{ #category : #accessing }
MozStrokeOptions >> dashPattern [
	<return: #Array of: #Number>

	(self privateDashLength isZero or: [ self privateDashPattern isNull ])
		ifTrue: [ ^ #() ].

	^ (FFIExternalArray
		fromHandle: self privateDashPattern getHandle
		type: 'float'
		size: self privateDashLength) asArray
]

{ #category : #accessing }
MozStrokeOptions >> dashPattern: anArrayOfFloats [
	| buffer |
	
	self privateDashLength: anArrayOfFloats size.
	
	anArrayOfFloats ifEmpty: [ ^ self ].

	buffer := FFIExternalArray externalNewType: 'float' size: anArrayOfFloats size.
	anArrayOfFloats withIndexDo: [ :dash :index |
		buffer at: index put: dash asFloat ].

	self privateDashPattern: buffer
]

{ #category : #comparing }
MozStrokeOptions >> hash [
	^ ((((self width hash bitXor: self lineCap hash)
			bitXor: self lineJoin hash)
				bitXor: self miterLimit hash)
					bitXor: self dashOffset hash)
						bitXor: self dashPattern hash
]

{ #category : #initialization }
MozStrokeOptions >> initialize [
	super initialize.
	
	"To handle lifecycle of external object"
	self autoRelease.

	"Setting default values according to backend specification"
	self width: self class defaultWidth.
	self joinMiterOrBevel.
	self capButt.
	self miterLimit: 10.0.
	self dashOffset: 0.
	self dashPattern: #()
]

{ #category : #'join styles' }
MozStrokeOptions >> joinBevel [
	self lineJoin: MozJoinStyle BEVEL
]

{ #category : #'join styles' }
MozStrokeOptions >> joinMiter [
	self lineJoin: MozJoinStyle MITER
]

{ #category : #'join styles' }
MozStrokeOptions >> joinMiterOrBevel [
	self lineJoin: MozJoinStyle MITER_OR_BEVEL
]

{ #category : #'join styles' }
MozStrokeOptions >> joinRound [
	self lineJoin: MozJoinStyle ROUND
]

{ #category : #'accessing structure variables' }
MozStrokeOptions >> lineCap [
	"This method was automatically generated"
	^MozCapStyle fromInteger: (handle signedByteAt: OFFSET_LINECAP)
]

{ #category : #'accessing structure variables' }
MozStrokeOptions >> lineCap: anObject [
	"This method was automatically generated"
	handle signedByteAt: OFFSET_LINECAP put: anObject value
]

{ #category : #'accessing structure variables' }
MozStrokeOptions >> lineJoin [
	"This method was automatically generated"
	^MozJoinStyle fromInteger: (handle signedByteAt: OFFSET_LINEJOIN)
]

{ #category : #'accessing structure variables' }
MozStrokeOptions >> lineJoin: anObject [
	"This method was automatically generated"
	handle signedByteAt: OFFSET_LINEJOIN put: anObject value
]

{ #category : #'accessing structure variables' }
MozStrokeOptions >> miterLimit [
	"This method was automatically generated"
	^handle floatAt: OFFSET_MITERLIMIT
]

{ #category : #'accessing structure variables' }
MozStrokeOptions >> miterLimit: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_MITERLIMIT put: anObject
]

{ #category : #'accessing structure variables' }
MozStrokeOptions >> privateDashLength [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_PRIVATEDASHLENGTH
]

{ #category : #'accessing structure variables' }
MozStrokeOptions >> privateDashLength: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_PRIVATEDASHLENGTH put: anObject
]

{ #category : #'accessing structure variables' }
MozStrokeOptions >> privateDashPattern [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_PRIVATEDASHPATTERN) type: ExternalType float asPointerType
]

{ #category : #'accessing structure variables' }
MozStrokeOptions >> privateDashPattern: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PRIVATEDASHPATTERN put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
MozStrokeOptions >> width [
	"This method was automatically generated"
	^handle floatAt: OFFSET_WIDTH
]

{ #category : #'accessing structure variables' }
MozStrokeOptions >> width: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_WIDTH put: anObject
]
