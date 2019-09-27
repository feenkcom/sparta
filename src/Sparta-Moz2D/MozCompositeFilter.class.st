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
Class {
	#name : #MozCompositeFilter,
	#superclass : #MozFilter,
	#traits : 'TSpartaFilterSource + TSpartaCompositeFilter',
	#classTraits : 'TSpartaFilterSource classTrait + TSpartaCompositeFilter classTrait',
	#instVars : [
		'count'
	],
	#category : 'Sparta-Moz2D-Filters'
}

{ #category : #accessing }
MozCompositeFilter class >> filterType [
	^ MozFilterType COMPOSITE
]

{ #category : #'composion operators' }
MozCompositeFilter >> atop [

	self
		primSetAttributeEnum: MozCompositeFilterOperator COMPOSITE_OPERATOR_ATOP
		index: MozCompositeFilterAtts ATT_COMPOSITE_OPERATOR
]

{ #category : #'composion operators' }
MozCompositeFilter >> in [

	self
		primSetAttributeEnum: MozCompositeFilterOperator COMPOSITE_OPERATOR_IN
		index: MozCompositeFilterAtts ATT_COMPOSITE_OPERATOR
]

{ #category : #initialization }
MozCompositeFilter >> initialize [
	super initialize.
	
	count := 0
]

{ #category : #'composion operators' }
MozCompositeFilter >> out [

	self
		primSetAttributeEnum: MozCompositeFilterOperator COMPOSITE_OPERATOR_OUT
		index: MozCompositeFilterAtts ATT_COMPOSITE_OPERATOR
]

{ #category : #'composion operators' }
MozCompositeFilter >> over [

	self
		primSetAttributeEnum: MozCompositeFilterOperator COMPOSITE_OPERATOR_OVER
		index: MozCompositeFilterAtts ATT_COMPOSITE_OPERATOR
]

{ #category : #accessing }
MozCompositeFilter >> size [
	^ count
]

{ #category : #dispatch }
MozCompositeFilter >> sourceCanvas: aSpartaCanvas [

	"Canvases are ref counted, so no need to strong refer them"
	self primSetInputCanvas: aSpartaCanvas intIndex: self size.

	"increase counter by one"
	count := count + 1
]

{ #category : #dispatch }
MozCompositeFilter >> sourceFilter: aFilter [

	"Filters are ref counted, so no need to strong refer them"
	self primSetInputFilter: aFilter intIndex: self size.

	"increase counter by one"
	count := count + 1
]

{ #category : #dispatch }
MozCompositeFilter >> sourceSurface: aSurface [

	"Surfaces are ref counted, so no need to strong refer them"
	self primSetInputSurface: aSurface intIndex: self size.

	"increase counter by one"
	count := count + 1
]

{ #category : #'composion operators' }
MozCompositeFilter >> xor [

	self
		primSetAttributeEnum: MozCompositeFilterOperator COMPOSITE_OPERATOR_XOR
		index: MozCompositeFilterAtts ATT_COMPOSITE_OPERATOR
]
