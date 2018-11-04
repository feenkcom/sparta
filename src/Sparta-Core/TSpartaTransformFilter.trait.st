Trait {
	#name : #TSpartaTransformFilter,
	#category : #'Sparta-Core-Filters'
}

{ #category : #accessing }
TSpartaTransformFilter >> matrix: aSpartaMatrix [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaTransformFilter >> samplingGood [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaTransformFilter >> samplingLinear [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaTransformFilter >> samplingPoint [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaTransformFilter >> samplingSentinel [
	^ self explicitRequirement
]
