"
Morphology filter primitive performs ""fattening"" or ""thinning"" of artwork. It is particularly useful for fattening or thinning an alpha channel.

https://www.w3.org/TR/SVG/filters.html#feMorphologyElement

The dilation (or erosion) kernel is a rectangle with a width of 2*x-radius and a height of 2*y-radius. In dilation, the output pixel is the individual component-wise maximum of the corresponding R,G,B,A values in the input image's kernel rectangle. In erosion, the output pixel is the individual component-wise minimum of the corresponding R,G,B,A values in the input image's kernel rectangle.

Frequently this operation will take place on alpha-only images, such as that produced by the built-in input, SourceAlpha. In that case, the implementation might want to optimize the single channel case.

If the input has infinite extent and is constant (e.g FillPaint where the fill is a solid color), this operation has no effect. If the input has infinite extent and the filter result is the input to an ‘feTile’, the filter is evaluated with periodic boundary conditions.

Because ‘Morphology’ operates on premultipied color values, it will always result in color values less than or equal to the alpha channel.
"
Trait {
	#name : #TSpartaMorphologyFilter,
	#category : 'Sparta-Core-Filters'
}

{ #category : #accessing }
TSpartaMorphologyFilter >> dilate [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaMorphologyFilter >> erode [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaMorphologyFilter >> radius: aPoint [
	^ self explicitRequirement
]
