"
enum ColorMatrixFilterAtts
{
   ATT_COLOR_MATRIX_MATRIX = 0,                     // Matrix5x4
   ATT_COLOR_MATRIX_ALPHA_MODE                      // AlphaMode
};
"
Class {
	#name : #MozColorMatrixFilterAtts,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'ATT_COLOR_MATRIX_ALPHA_MODE',
		'ATT_COLOR_MATRIX_MATRIX'
	],
	#category : 'Sparta-Moz2D-Filters Enum'
}

{ #category : #'accessing enum' }
MozColorMatrixFilterAtts class >> ATT_COLOR_MATRIX_ALPHA_MODE [
	"This method was automatically generated"
	^ ATT_COLOR_MATRIX_ALPHA_MODE
]

{ #category : #'accessing enum' }
MozColorMatrixFilterAtts class >> ATT_COLOR_MATRIX_MATRIX [
	"This method was automatically generated"
	^ ATT_COLOR_MATRIX_MATRIX
]

{ #category : #'enum declaration' }
MozColorMatrixFilterAtts class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		ATT_COLOR_MATRIX_MATRIX 0  "Matrix5x4"
		ATT_COLOR_MATRIX_ALPHA_MODE	1 "AlphaMode"
	)
]

{ #category : #'class initialization' }
MozColorMatrixFilterAtts class >> initialize [
	self initializeEnumeration
]
