"
I add a second source input functionality to the Filter primitive.

Classes that use me must implment #secondSourceFilter: and #secondSourceSurface:
"
Trait {
	#name : #TSpartaFilterSecondSource,
	#category : #'Sparta-Core-Filters-Traits'
}

{ #category : #accessing }
TSpartaFilterSecondSource >> secondSource: aFilterOrSurface [
	aFilterOrSurface asFilterSecondSourceOn: self
]

{ #category : #dispatch }
TSpartaFilterSecondSource >> secondSourceCanvas: aSpartaCanvas [
	^ self explicitRequirement
]

{ #category : #dispatch }
TSpartaFilterSecondSource >> secondSourceFilter: aFilter [
	^ self explicitRequirement
]

{ #category : #dispatch }
TSpartaFilterSecondSource >> secondSourceSurface: aSurface [
	^ self explicitRequirement
]
