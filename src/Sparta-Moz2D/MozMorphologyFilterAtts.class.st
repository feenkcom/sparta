"
enum MorphologyFilterAtts
{
   ATT_MORPHOLOGY_RADII = 0,                         // IntSize
   ATT_MORPHOLOGY_OPERATOR                            // MorphologyOperator
};

"
Class {
	#name : #MozMorphologyFilterAtts,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'ATT_MORPHOLOGY_OPERATOR',
		'ATT_MORPHOLOGY_RADII'
	],
	#category : 'Sparta-Moz2D-Filters Enum'
}

{ #category : #'accessing enum' }
MozMorphologyFilterAtts class >> ATT_MORPHOLOGY_OPERATOR [
	"This method was automatically generated"
	^ ATT_MORPHOLOGY_OPERATOR
]

{ #category : #'accessing enum' }
MozMorphologyFilterAtts class >> ATT_MORPHOLOGY_RADII [
	"This method was automatically generated"
	^ ATT_MORPHOLOGY_RADII
]

{ #category : #'enum declaration' }
MozMorphologyFilterAtts class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
	ATT_MORPHOLOGY_RADII 0 "IntSize"
	ATT_MORPHOLOGY_OPERATOR 1 "MorphologyOperator"
	)
]

{ #category : #'class initialization' }
MozMorphologyFilterAtts class >> initialize [
	self initializeEnumeration
]
