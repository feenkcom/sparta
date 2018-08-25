"
I am a specific discrete transfer filter.

https://docs.webplatform.org/wiki/svg/elements/feComponentTransfer
https://www.w3.org/TR/filter-effects/#feComponentTransferElement.

Examples

	Extract alpha channel from source ignoring red, green, blue.

	canvas discreteTransferFilter
		disableRed: false;
		tableRed: 0.0;
		disableGreen: false;
		tableGreen: 0.0;
		disableBlue: false;
		tableBlue: 0.0;
		disableAlpha: true
"
Trait {
	#name : #TSpartaDiscreteTransferFilter,
	#category : 'Sparta-Core-Filters'
}

{ #category : #accessing }
TSpartaDiscreteTransferFilter >> tableAlpha: anArrayOrFloat [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaDiscreteTransferFilter >> tableBlue: anArrayOrFloat [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaDiscreteTransferFilter >> tableGreen: anArrayOrFloat [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaDiscreteTransferFilter >> tableRed: anArrayOrFloat [
	^ self explicitRequirement
]
