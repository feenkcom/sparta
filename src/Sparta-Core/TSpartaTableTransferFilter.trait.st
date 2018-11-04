"
I am a specific table transfer filter.

https://docs.webplatform.org/wiki/svg/elements/feComponentTransfer
https://www.w3.org/TR/filter-effects/#feComponentTransferElement
"
Trait {
	#name : #TSpartaTableTransferFilter,
	#category : #'Sparta-Core-Filters'
}

{ #category : #accessing }
TSpartaTableTransferFilter >> tableAlpha: anArrayOrFloat [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaTableTransferFilter >> tableBlue: anArrayOrFloat [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaTableTransferFilter >> tableGreen: anArrayOrFloat [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaTableTransferFilter >> tableRed: anArrayOrFloat [
	^ self explicitRequirement
]
