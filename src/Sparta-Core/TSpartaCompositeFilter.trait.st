"
I am a composite filter and can have an arbitrary amount of input soures

https://www.w3.org/TR/SVG/filters.html#feCompositeElement

Example:

	""Merge"" filter primitive is just a composite filter with OVER composion mode.

	merge := canvas compositeFilter
		over;
		source: filter1;
		source:filter2;
		source: filter3;
		source: filter4
		...
"
Trait {
	#name : #TSpartaCompositeFilter,
	#category : 'Sparta-Core-Filters'
}

{ #category : #'composion operators' }
TSpartaCompositeFilter >> atop [
	^ self explicitRequirement
]

{ #category : #'composion operators' }
TSpartaCompositeFilter >> in [
	^ self explicitRequirement
]

{ #category : #'composion operators' }
TSpartaCompositeFilter >> out [
	^ self explicitRequirement
]

{ #category : #'composion operators' }
TSpartaCompositeFilter >> over [
	^ self explicitRequirement
]

{ #category : #'composion operators' }
TSpartaCompositeFilter >> xor [
	^ self explicitRequirement
]
