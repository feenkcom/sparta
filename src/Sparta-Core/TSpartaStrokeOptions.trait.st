"
I define an api of stroke options object.
Stroke options are used in stroking operations.
"
Trait {
	#name : #TSpartaStrokeOptions,
	#category : 'Sparta-Core'
}

{ #category : #accessing }
TSpartaStrokeOptions classSide >> default [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaStrokeOptions classSide >> defaultWidth [
	^ 1.0
]

{ #category : #'cap styles' }
TSpartaStrokeOptions >> capButt [
	^ self explicitRequirement
]

{ #category : #'cap styles' }
TSpartaStrokeOptions >> capRound [
	^ self explicitRequirement
]

{ #category : #'cap styles' }
TSpartaStrokeOptions >> capSquare [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaStrokeOptions >> dashOffset: aFloat [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaStrokeOptions >> dashPattern: anArrayOfFloats [
	^ self explicitRequirement
]

{ #category : #'join styles' }
TSpartaStrokeOptions >> joinBevel [
	^ self explicitRequirement
]

{ #category : #'join styles' }
TSpartaStrokeOptions >> joinMiter [
	^ self explicitRequirement
]

{ #category : #'join styles' }
TSpartaStrokeOptions >> joinMiterOrBevel [
	^ self explicitRequirement
]

{ #category : #'join styles' }
TSpartaStrokeOptions >> joinRound [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaStrokeOptions >> miterLimit: aFloat [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaStrokeOptions >> width: aFloat [
	^ self explicitRequirement
]
