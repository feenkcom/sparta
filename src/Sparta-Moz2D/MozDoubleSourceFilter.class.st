"
I am a filter primitive with two source inputs
"
Class {
	#name : #MozDoubleSourceFilter,
	#superclass : #MozFilter,
	#traits : 'TSpartaFilterSource + TSpartaFilterSecondSource',
	#classTraits : 'TSpartaFilterSource classTrait + TSpartaFilterSecondSource classTrait',
	#category : 'Sparta-Moz2D-Filters'
}

{ #category : #dispatch }
MozDoubleSourceFilter >> secondSourceCanvas: aSpartaCanvas [

	"Canvases are ref counted, so no need to strong refer them"
	self primSetInputCanvas: aSpartaCanvas index: MozFilterInputs INPUT
]

{ #category : #dispatch }
MozDoubleSourceFilter >> secondSourceFilter: aFilter [

	"Filters are ref counted, so no need to strong refer them"
	self primSetInputFilter: aFilter index: MozFilterInputs SECOND_INPUT
]

{ #category : #dispatch }
MozDoubleSourceFilter >> secondSourceSurface: aSurface [

	"Surfaces are ref counted, so no need to strong refer them"
	self primSetInputSurface: aSurface index: MozFilterInputs SECOND_INPUT
]

{ #category : #dispatch }
MozDoubleSourceFilter >> sourceCanvas: aSpartaCanvas [

	"Canvases are ref counted, so no need to strong refer them"
	self primSetInputCanvas: aSpartaCanvas index: MozFilterInputs INPUT
]

{ #category : #dispatch }
MozDoubleSourceFilter >> sourceFilter: aFilter [

	"Filters are ref counted, so no need to strong refer them"
	self primSetInputFilter: aFilter index: MozFilterInputs INPUT
]

{ #category : #dispatch }
MozDoubleSourceFilter >> sourceSurface: aSurface [

	"Surfaces are ref counted, so no need to strong refer them"
	self primSetInputSurface: aSurface index: MozFilterInputs INPUT
]
