"
Flood filter primitive creates a rectangle filled with specified color.

https://www.w3.org/TR/SVG/filters.html#feFloodElement

The rectangle is as large as the filter primitive subregion established by the ‘x’, ‘y’, ‘width’ and ‘height’ attributes on the ‘area’ of Filter node.
"
Trait {
	#name : #TSpartaFloodFilter,
	#category : 'Sparta-Core-Filters'
}

{ #category : #accessing }
TSpartaFloodFilter >> color: aColor [
	^ self explicitRequirement
]
