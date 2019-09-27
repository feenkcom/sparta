"
enum ConvolveMatrixAtts
{
   ATT_CONVOLVE_MATRIX_KERNEL_SIZE = 0,         // IntSize
   ATT_CONVOLVE_MATRIX_KERNEL_MATRIX,            // Float[]
   ATT_CONVOLVE_MATRIX_DIVISOR,                     // Float
   ATT_CONVOLVE_MATRIX_BIAS,                         // Float
   ATT_CONVOLVE_MATRIX_TARGET,                      // IntPoint
   ATT_CONVOLVE_MATRIX_SOURCE_RECT,               // IntRect
   ATT_CONVOLVE_MATRIX_EDGE_MODE,                  // ConvolveMatrixEdgeMode
   ATT_CONVOLVE_MATRIX_KERNEL_UNIT_LENGTH,    // Size
   ATT_CONVOLVE_MATRIX_PRESERVE_ALPHA,          // bool
};
"
Class {
	#name : #MozConvolveMatrixFilterAtts,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'ATT_CONVOLVE_MATRIX_BIAS',
		'ATT_CONVOLVE_MATRIX_DIVISOR',
		'ATT_CONVOLVE_MATRIX_EDGE_MODE',
		'ATT_CONVOLVE_MATRIX_KERNEL_MATRIX',
		'ATT_CONVOLVE_MATRIX_KERNEL_SIZE',
		'ATT_CONVOLVE_MATRIX_KERNEL_UNIT_LENGTH',
		'ATT_CONVOLVE_MATRIX_PRESERVE_ALPHA',
		'ATT_CONVOLVE_MATRIX_SOURCE_RECT',
		'ATT_CONVOLVE_MATRIX_TARGET'
	],
	#category : 'Sparta-Moz2D-Filters Enum'
}

{ #category : #'accessing enum' }
MozConvolveMatrixFilterAtts class >> ATT_CONVOLVE_MATRIX_BIAS [
	"This method was automatically generated"
	^ ATT_CONVOLVE_MATRIX_BIAS
]

{ #category : #'accessing enum' }
MozConvolveMatrixFilterAtts class >> ATT_CONVOLVE_MATRIX_DIVISOR [
	"This method was automatically generated"
	^ ATT_CONVOLVE_MATRIX_DIVISOR
]

{ #category : #'accessing enum' }
MozConvolveMatrixFilterAtts class >> ATT_CONVOLVE_MATRIX_EDGE_MODE [
	"This method was automatically generated"
	^ ATT_CONVOLVE_MATRIX_EDGE_MODE
]

{ #category : #'accessing enum' }
MozConvolveMatrixFilterAtts class >> ATT_CONVOLVE_MATRIX_KERNEL_MATRIX [
	"This method was automatically generated"
	^ ATT_CONVOLVE_MATRIX_KERNEL_MATRIX
]

{ #category : #'accessing enum' }
MozConvolveMatrixFilterAtts class >> ATT_CONVOLVE_MATRIX_KERNEL_SIZE [
	"This method was automatically generated"
	^ ATT_CONVOLVE_MATRIX_KERNEL_SIZE
]

{ #category : #'accessing enum' }
MozConvolveMatrixFilterAtts class >> ATT_CONVOLVE_MATRIX_KERNEL_UNIT_LENGTH [
	"This method was automatically generated"
	^ ATT_CONVOLVE_MATRIX_KERNEL_UNIT_LENGTH
]

{ #category : #'accessing enum' }
MozConvolveMatrixFilterAtts class >> ATT_CONVOLVE_MATRIX_PRESERVE_ALPHA [
	"This method was automatically generated"
	^ ATT_CONVOLVE_MATRIX_PRESERVE_ALPHA
]

{ #category : #'accessing enum' }
MozConvolveMatrixFilterAtts class >> ATT_CONVOLVE_MATRIX_SOURCE_RECT [
	"This method was automatically generated"
	^ ATT_CONVOLVE_MATRIX_SOURCE_RECT
]

{ #category : #'accessing enum' }
MozConvolveMatrixFilterAtts class >> ATT_CONVOLVE_MATRIX_TARGET [
	"This method was automatically generated"
	^ ATT_CONVOLVE_MATRIX_TARGET
]

{ #category : #'enum declaration' }
MozConvolveMatrixFilterAtts class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		ATT_CONVOLVE_MATRIX_KERNEL_SIZE 0      		"IntSize"
		ATT_CONVOLVE_MATRIX_KERNEL_MATRIX 1        "Float[]"
		ATT_CONVOLVE_MATRIX_DIVISOR 2              "Float"
		ATT_CONVOLVE_MATRIX_BIAS 3                 "Float"
		ATT_CONVOLVE_MATRIX_TARGET 4               "IntPoint"
		ATT_CONVOLVE_MATRIX_SOURCE_RECT 5          "IntRect"
		ATT_CONVOLVE_MATRIX_EDGE_MODE 6            "ConvolveMatrixEdgeMode"
		ATT_CONVOLVE_MATRIX_KERNEL_UNIT_LENGTH 7   "Size"
		ATT_CONVOLVE_MATRIX_PRESERVE_ALPHA 8       "bool"
	)
]

{ #category : #'class initialization' }
MozConvolveMatrixFilterAtts class >> initialize [
	self initializeEnumeration
]
