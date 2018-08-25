Class {
	#name : #MozTransformFilter,
	#superclass : #MozSingleSourceFilter,
	#traits : 'TSpartaTransformFilter',
	#classTraits : 'TSpartaTransformFilter classTrait',
	#category : 'Sparta-Moz2D-Filters'
}

{ #category : #accessing }
MozTransformFilter class >> filterType [
	^ MozFilterType TRANSFORM
]

{ #category : #accessing }
MozTransformFilter >> matrix: aSpartaMatrix [

	self
		privateSetAttributeMatrix: aSpartaMatrix
		index: MozTransformFilterAtts ATT_TRANSFORM_MATRIX
]

{ #category : #accessing }
MozTransformFilter >> samplingGood [

	self
		primSetAttributeEnum: MozSamplingMode GOOD
		index: MozTransformFilterAtts ATT_TRANSFORM_FILTER
]

{ #category : #accessing }
MozTransformFilter >> samplingLinear [

	self
		primSetAttributeEnum: MozSamplingMode LINEAR
		index: MozTransformFilterAtts ATT_TRANSFORM_FILTER
]

{ #category : #accessing }
MozTransformFilter >> samplingPoint [

	self
		primSetAttributeEnum: MozSamplingMode POINT
		index: MozTransformFilterAtts ATT_TRANSFORM_FILTER
]

{ #category : #accessing }
MozTransformFilter >> samplingSentinel [

	self
		primSetAttributeEnum: MozSamplingMode SENTINEL
		index: MozTransformFilterAtts ATT_TRANSFORM_FILTER
]
