Trait {
	#name : #TSpartaArithmeticCombineFilter,
	#category : 'Sparta-Core-Filters'
}

{ #category : #accessing }
TSpartaArithmeticCombineFilter >> coefficients: anArrayOrFloat [
	"Must be of size one or four"

	^ self explicitRequirement
]
