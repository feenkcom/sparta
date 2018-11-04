"
I add single source input functionality to the Filter primitive.

Classes that use me must implment #sourceFilter: and #sourceSurface:
"
Trait {
	#name : #TSpartaFilterSource,
	#category : #'Sparta-Core-Filters-Traits'
}

{ #category : #accessing }
TSpartaFilterSource >> source: aFilterOrSurface [
	aFilterOrSurface asFilterSourceOn: self
]

{ #category : #dispatch }
TSpartaFilterSource >> sourceCanvas: aSpartaCanvas [
	^ self explicitRequirement
]

{ #category : #dispatch }
TSpartaFilterSource >> sourceFilter: aFilter [
	^ self explicitRequirement
]

{ #category : #dispatch }
TSpartaFilterSource >> sourceSurface: aSurface [
	^ self explicitRequirement
]
