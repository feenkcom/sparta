"
enum TransformFilterAtts
{
   ATT_TRANSFORM_MATRIX = 0,                         // Matrix
   ATT_TRANSFORM_FILTER                                 // Filter
};
"
Class {
	#name : #MozTransformFilterAtts,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'ATT_TRANSFORM_FILTER',
		'ATT_TRANSFORM_MATRIX'
	],
	#category : 'Sparta-Moz2D-Filters Enum'
}

{ #category : #'accessing enum' }
MozTransformFilterAtts class >> ATT_TRANSFORM_FILTER [
	"This method was automatically generated"
	^ ATT_TRANSFORM_FILTER
]

{ #category : #'accessing enum' }
MozTransformFilterAtts class >> ATT_TRANSFORM_MATRIX [
	"This method was automatically generated"
	^ ATT_TRANSFORM_MATRIX
]

{ #category : #'enum declaration' }
MozTransformFilterAtts class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		ATT_TRANSFORM_MATRIX 0  "Matrix"
		ATT_TRANSFORM_FILTER 1  "MozSamplingMode"
	)
]

{ #category : #'class initialization' }
MozTransformFilterAtts class >> initialize [
	self initializeEnumeration
]
