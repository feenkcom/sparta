"
I am a filter primitive with one source input.

I define an API and simple dispatch mechanism of filters with single input source.

I am an abstract single source filter. I am not supposed to be used rather than to subclass. My filterType is not defined on class side.

See my subclasses for concrete filter types.

Public API and Key Messages

- source: set my input source. Input source can be another filter, a canvas or a surface
 
Internal Representation and Key Implementation Points.

    Instance Variables
	source:		<Object>


    Implementation Points
"
Class {
	#name : #MozSingleSourceFilter,
	#superclass : #MozFilter,
	#traits : 'TSpartaFilterSource',
	#classTraits : 'TSpartaFilterSource classTrait',
	#category : 'Sparta-Moz2D-Filters'
}

{ #category : #dispatch }
MozSingleSourceFilter >> sourceCanvas: aSpartaCanvas [

	"Canvases are ref counted, so no need to strong refer them"
	self primSetInputCanvas: aSpartaCanvas index: MozFilterInputs INPUT
]

{ #category : #dispatch }
MozSingleSourceFilter >> sourceFilter: aFilter [

	"Filters are ref counted, so no need to strong refer them"
	self primSetInputFilter: aFilter index: MozFilterInputs INPUT
]

{ #category : #dispatch }
MozSingleSourceFilter >> sourceSurface: aSurface [

	"Surfaces are ref counted, so no need to strong refer them"
	self primSetInputSurface: aSurface index: MozFilterInputs INPUT
]
