"
This filter primitive creates a rectangle filled with specified color.

https://www.w3.org/TR/SVG/filters.html#feFloodElement

The rectangle is as large as the filter primitive subregion established by the ‘x’, ‘y’, ‘width’ and ‘height’ attributes on the ‘area’ of Filter node.
"
Class {
	#name : #MozFloodFilter,
	#superclass : #MozSingleSourceFilter,
	#traits : 'TSpartaFloodFilter',
	#classTraits : 'TSpartaFloodFilter classTrait',
	#category : 'Sparta-Moz2D-Filters'
}

{ #category : #accessing }
MozFloodFilter class >> filterType [
	^ MozFilterType FLOOD
]

{ #category : #accessing }
MozFloodFilter >> color: aColor [
	"The ‘color’ property indicates what color to use to flood the current filter primitive subregion."
	self
		primSetAttributeR: aColor red
		g: aColor green
		b: aColor blue
		a: aColor alpha
		index: MozFloodFilterAtts ATT_FLOOD_COLOR
]
