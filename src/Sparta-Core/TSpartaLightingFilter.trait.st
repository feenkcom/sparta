Trait {
	#name : #TSpartaLightingFilter,
	#category : #'Sparta-Core-Filters'
}

{ #category : #accessing }
TSpartaLightingFilter >> color: aColor [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaLightingFilter >> kernelUnitLength: aPointOrFloat [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaLightingFilter >> surfaceScale: aFloat [
	^ self explicitRequirement
]
