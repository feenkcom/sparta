Trait {
	#name : #TSpartaTransformable,
	#category : #'Sparta-Core-Math'
}

{ #category : #'api - transformations' }
TSpartaTransformable >> multiplyBy: aMatrix [
	aMatrix spartaMultiplyWith: self transformation
]

{ #category : #'api - transformations' }
TSpartaTransformable >> rotateByDegrees: angle [
	self rotateByRadians: angle degreesToRadians
]

{ #category : #'api - transformations' }
TSpartaTransformable >> rotateByRadians: angle [

	self transformation rotateByRadians: angle
]

{ #category : #'api - transformations' }
TSpartaTransformable >> scaleBy: aPointOrNumber [

	aPointOrNumber isPoint
		ifTrue: [ self scaleX: aPointOrNumber x Y: aPointOrNumber y ]
		ifFalse: [ self scaleX: aPointOrNumber Y: aPointOrNumber ]
]

{ #category : #'api - transformations' }
TSpartaTransformable >> scaleX: aX Y: aY [

	self transformation scaleX: aX Y: aY
]

{ #category : #accessing }
TSpartaTransformable >> transformation [
	<return: #SpartaMatrix>

	^ self explicitRequirement
]

{ #category : #'api - transformations' }
TSpartaTransformable >> translateBy: aPointOrNumber [

	aPointOrNumber isPoint
		ifTrue: [ self translateX: aPointOrNumber x Y: aPointOrNumber y ]
		ifFalse: [ self translateX: aPointOrNumber Y: aPointOrNumber ]
]

{ #category : #'api - transformations' }
TSpartaTransformable >> translateX: aX Y: aY [

	self transformation translateX: aX Y: aY
]
