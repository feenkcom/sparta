"
enum MorphologyOperator
{
   MORPHOLOGY_OPERATOR_ERODE = 0,
   MORPHOLOGY_OPERATOR_DILATE
};
"
Class {
	#name : #MozMorphologyFilterOperator,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'MORPHOLOGY_OPERATOR_DILATE',
		'MORPHOLOGY_OPERATOR_ERODE'
	],
	#category : 'Sparta-Moz2D-Filters Enum'
}

{ #category : #'accessing enum' }
MozMorphologyFilterOperator class >> MORPHOLOGY_OPERATOR_DILATE [
	"This method was automatically generated"
	^ MORPHOLOGY_OPERATOR_DILATE
]

{ #category : #'accessing enum' }
MozMorphologyFilterOperator class >> MORPHOLOGY_OPERATOR_ERODE [
	"This method was automatically generated"
	^ MORPHOLOGY_OPERATOR_ERODE
]

{ #category : #'enum declaration' }
MozMorphologyFilterOperator class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
	MORPHOLOGY_OPERATOR_ERODE 0
	MORPHOLOGY_OPERATOR_DILATE 1
	)
]

{ #category : #'class initialization' }
MozMorphologyFilterOperator class >> initialize [
	self initializeEnumeration
]
