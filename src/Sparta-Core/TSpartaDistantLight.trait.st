Trait {
	#name : #TSpartaDistantLight,
	#category : #'Sparta-Core-Filters'
}

{ #category : #accessing }
TSpartaDistantLight >> azimuth: aFloat [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaDistantLight >> elevation: aFloat [
	^ self explicitRequirement
]
