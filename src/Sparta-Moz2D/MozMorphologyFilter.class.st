"
Morphology filter primitive performs ""fattening"" or ""thinning"" of artwork. It is particularly useful for fattening or thinning an alpha channel.

https://www.w3.org/TR/SVG/filters.html#feMorphologyElement

The dilation (or erosion) kernel is a rectangle with a width of 2*x-radius and a height of 2*y-radius. In dilation, the output pixel is the individual component-wise maximum of the corresponding R,G,B,A values in the input image's kernel rectangle. In erosion, the output pixel is the individual component-wise minimum of the corresponding R,G,B,A values in the input image's kernel rectangle.

Frequently this operation will take place on alpha-only images, such as that produced by the built-in input, SourceAlpha. In that case, the implementation might want to optimize the single channel case.

If the input has infinite extent and is constant (e.g FillPaint where the fill is a solid color), this operation has no effect. If the input has infinite extent and the filter result is the input to an ‘feTile’, the filter is evaluated with periodic boundary conditions.

Because ‘Morphology’ operates on premultipied color values, it will always result in color values less than or equal to the alpha channel.
"
Class {
	#name : #MozMorphologyFilter,
	#superclass : #MozSingleSourceFilter,
	#traits : 'TSpartaMorphologyFilter',
	#classTraits : 'TSpartaMorphologyFilter classTrait',
	#category : 'Sparta-Moz2D-Filters'
}

{ #category : #accessing }
MozMorphologyFilter class >> filterType [
	^ MozFilterType MORPHOLOGY
]

{ #category : #accessing }
MozMorphologyFilter >> dilate [
	self
		primSetAttributeEnum: MozMorphologyFilterOperator MORPHOLOGY_OPERATOR_DILATE
		index: MozMorphologyFilterAtts ATT_MORPHOLOGY_OPERATOR
]

{ #category : #accessing }
MozMorphologyFilter >> erode [
	self
		primSetAttributeEnum: MozMorphologyFilterOperator MORPHOLOGY_OPERATOR_ERODE
		index: MozMorphologyFilterAtts ATT_MORPHOLOGY_OPERATOR
]

{ #category : #accessing }
MozMorphologyFilter >> radius: aPointOrInteger [

	self
		privateSetAttributeIntSize: aPointOrInteger
		index: MozMorphologyFilterAtts ATT_MORPHOLOGY_RADII
]
