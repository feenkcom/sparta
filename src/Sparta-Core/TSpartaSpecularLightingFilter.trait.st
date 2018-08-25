Trait {
	#name : #TSpartaSpecularLightingFilter,
	#category : 'Sparta-Core-Filters'
}

{ #category : #accessing }
TSpartaSpecularLightingFilter >> specularConstant: aFloat [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaSpecularLightingFilter >> specularExponent: aFloat [
	^ self explicitRequirement
]
