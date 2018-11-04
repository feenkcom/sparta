"
I am a specific linear transfer filter.

https://docs.webplatform.org/wiki/svg/elements/feComponentTransfer
https://www.w3.org/TR/filter-effects/#feComponentTransferElement
"
Trait {
	#name : #TSpartaLinearTransferFilter,
	#category : #'Sparta-Core-Filters'
}

{ #category : #accessing }
TSpartaLinearTransferFilter >> interceptAlpha: aFloat [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaLinearTransferFilter >> interceptBlue: aFloat [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaLinearTransferFilter >> interceptGreen: aFloat [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaLinearTransferFilter >> interceptRed: aFloat [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaLinearTransferFilter >> slopeAlpha: aFloat [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaLinearTransferFilter >> slopeBlue: aFloat [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaLinearTransferFilter >> slopeGreen: aFloat [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaLinearTransferFilter >> slopeRed: aFloat [
	^ self explicitRequirement
]
