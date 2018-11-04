Trait {
	#name : #TSpartaTransformable,
	#category : #'Sparta-Core-Math'
}

{ #category : #transformations }
TSpartaTransformable >> multiplyBy: aMatrix [
	aMatrix spartaMultiplyWith: self transformation
]

{ #category : #transformations }
TSpartaTransformable >> rotateByDegrees: angle [

	self transformation rotateByDegrees: angle
]

{ #category : #transformations }
TSpartaTransformable >> rotateByRadians: angle [

	self transformation rotateByRadians: angle
]

{ #category : #transformations }
TSpartaTransformable >> scaleBy: aPointOrNumber [

	self transformation scaleBy: aPointOrNumber
]

{ #category : #transformations }
TSpartaTransformable >> scaleX: aX Y: aY [

	self transformation scaleX: aX Y: aY
]

{ #category : #accessing }
TSpartaTransformable >> transformation [
	<return: #SpartaMatrix>

	^ self explicitRequirement
]

{ #category : #transformations }
TSpartaTransformable >> translateBy: aPointOrNumber [

	self transformation translateBy: aPointOrNumber asPoint
]

{ #category : #transformations }
TSpartaTransformable >> translateX: aX Y: aY [

	self transformation translateX: aX Y: aY
]
