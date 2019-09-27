"
enum ConvolveMatrixEdgeMode
{
   EDGE_MODE_DUPLICATE = 0,
   EDGE_MODE_WRAP,
   EDGE_MODE_NONE
};
"
Class {
	#name : #MozConvolveMatrixFilterEdgeMode,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'EDGE_MODE_DUPLICATE',
		'EDGE_MODE_NONE',
		'EDGE_MODE_WRAP'
	],
	#category : 'Sparta-Moz2D-Filters Enum'
}

{ #category : #'accessing enum' }
MozConvolveMatrixFilterEdgeMode class >> EDGE_MODE_DUPLICATE [
	"This method was automatically generated"
	^ EDGE_MODE_DUPLICATE
]

{ #category : #'accessing enum' }
MozConvolveMatrixFilterEdgeMode class >> EDGE_MODE_NONE [
	"This method was automatically generated"
	^ EDGE_MODE_NONE
]

{ #category : #'accessing enum' }
MozConvolveMatrixFilterEdgeMode class >> EDGE_MODE_WRAP [
	"This method was automatically generated"
	^ EDGE_MODE_WRAP
]

{ #category : #'enum declaration' }
MozConvolveMatrixFilterEdgeMode class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		EDGE_MODE_DUPLICATE 0
		EDGE_MODE_WRAP 1
		EDGE_MODE_NONE 2
	)
]

{ #category : #'class initialization' }
MozConvolveMatrixFilterEdgeMode class >> initialize [
	self initializeEnumeration
]
