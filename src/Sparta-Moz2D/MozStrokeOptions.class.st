Class {
	#name : #MozStrokeOptions,
	#superclass : #FFIExternalStructure,
	#traits : 'TSpartaStrokeOptions',
	#classTraits : 'TSpartaStrokeOptions classTrait',
	#instVars : [
		'hasDashes'
	],
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
		'default',
		'session',
		'sample'
	],
	#category : #'Sparta-Moz2D'
}

{ #category : #converting }
MozStrokeOptions class >> asExternalTypeOn: generator [
	"use handle ivar to hold my instance"
	^ FFIExternalObjectType objectClass: self
]

{ #category : #cleanup }
MozStrokeOptions class >> cleanUp [
	<script: 'self cleanUp'>
	super cleanUp.
	
	default := nil.
	sample := nil.
	session := nil.
]

{ #category : #accessing }
MozStrokeOptions class >> default [
	session == Smalltalk session
		ifFalse: [
			default := nil.
			session := Smalltalk session ].

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

{ #category : #finalization }
MozStrokeOptions class >> finalizeResourceData: aHandle [
	| aDashBuffer |
	
	"Call the class specific free frunction if aHandle is still a valid external address."
	aHandle isNull
		ifTrue: [ ^ self ].

	aDashBuffer := ExternalData fromHandle: (aHandle pointerAt: OFFSET_PRIVATEDASHPATTERN) type: ExternalType float asPointerType.
	aDashBuffer isNull
		ifFalse:  [ aDashBuffer free ].
	aHandle free
]

{ #category : #accessing }
MozStrokeOptions class >> sample [
	^ sample ifNil: [ sample := self new ]
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

{ #category : #converting }
MozStrokeOptions >> asExternalDuring: aBlock [
	| anExternalOptions |
	
	self isExternal
		ifTrue: [ aBlock value: self ].

	anExternalOptions := self cloneToExternal.
	[ aBlock value: anExternalOptions ]
		ensure: [ anExternalOptions free ]
]

{ #category : #'external resource management' }
MozStrokeOptions >> autoRelease [
	"I reference an external array to hold dash pattern which should be release when I am released.
	Therefore I require a specialized #free function.

	Note, I implement #resourceData and #finalizeResourceData: on class side"
	FFIExternalResourceManager addResource: self
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

{ #category : #copying }
MozStrokeOptions >> clone [
	self
		assert: [ self isExternal not ]
		description: [ 'Must be in pharo memory' ].
		
	^ self deepCopy
]

{ #category : #copying }
MozStrokeOptions >> cloneToExternal [
	| aCloneAddress aClone |

	aCloneAddress := ExternalAddress allocate: self class structureSize.

	aClone := self class basicNew.
	aClone setHandle: aCloneAddress.

	"Setting default values according to backend specification"
	aClone width: self width.
	aClone lineJoin: self lineJoin.
	aClone lineCap: self lineCap.
	aClone miterLimit: self miterLimit.
	aClone dashOffset: self dashOffset.
	aClone dashPattern: self dashPattern.

	^ aClone
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
	| aBuffer |
	
	hasDashes := anArrayOfFloats isNotEmpty.
	self privateDashLength: anArrayOfFloats size.
	
	aBuffer := anArrayOfFloats
		ifEmpty: [ ExternalData fromHandle: ExternalAddress null type: ExternalType float ]
		ifNotEmpty: [
			| anExternalArray | 
			anExternalArray := FFIExternalArray externalNewType: 'float' size: anArrayOfFloats size.
			anArrayOfFloats withIndexDo: [ :dash :index | anExternalArray at: index put: dash asFloat ].
			anExternalArray ].

	self privateDashPattern: aBuffer
]

{ #category : #finalization }
MozStrokeOptions >> free [
	self freeDashes.
	super free
]

{ #category : #finalization }
MozStrokeOptions >> freeDashes [
	| aDashBuffer |

	hasDashes
		ifFalse: [ ^ self ].

	(handle notNil and:[ handle isExternalAddress ])
		ifFalse: [ ^ self ].
		
	aDashBuffer := self privateDashPattern.
	aDashBuffer isNull
		ifFalse:  [ aDashBuffer free ].
	hasDashes := false
]

{ #category : #accessing }
MozStrokeOptions >> hasDashes [
	<return: #Boolean>

	^ hasDashes isNotNil and: [ hasDashes ]
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

	"Setting default values according to backend specification"
	self width: self class defaultWidth.
	self joinMiterOrBevel.
	self capButt.
	self miterLimit: 10.0.
	self dashOffset: 0.
	self dashPattern: #()
]

{ #category : #'private - testing' }
MozStrokeOptions >> isExternal [
	^ self getHandle isExternalAddress
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
	^handle platformSizeTAt: OFFSET_PRIVATEDASHLENGTH
]

{ #category : #'accessing structure variables' }
MozStrokeOptions >> privateDashLength: anObject [
	"This method was automatically generated"
	^handle platformSizeTAt: OFFSET_PRIVATEDASHLENGTH put: anObject
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

{ #category : #'initialize-release' }
MozStrokeOptions >> resourceData [
	^ self getHandle
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
