Trait {
	#name : #TSpartaDiffuseLightingFilter,
	#category : #'Sparta-Core-Filters'
}

{ #category : #accessing }
TSpartaDiffuseLightingFilter >> diffuseConstant: aFloat [
	^ self explicitRequirement
]
