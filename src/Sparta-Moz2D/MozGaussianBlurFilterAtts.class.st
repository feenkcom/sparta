"
enum DirectionalBlurAtts
{
   ATT_DIRECTIONAL_BLUR_STD_DEVIATION = 0,    // Float
   ATT_DIRECTIONAL_BLUR_DIRECTION                  // BlurDirection
};
"
Class {
	#name : #MozGaussianBlurFilterAtts,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'ATT_GAUSSIAN_BLUR_STD_DEVIATION'
	],
	#category : 'Sparta-Moz2D-Filters Enum'
}

{ #category : #'accessing enum' }
MozGaussianBlurFilterAtts class >> ATT_GAUSSIAN_BLUR_STD_DEVIATION [
	"This method was automatically generated"
	^ ATT_GAUSSIAN_BLUR_STD_DEVIATION
]

{ #category : #'enum declaration' }
MozGaussianBlurFilterAtts class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
	ATT_GAUSSIAN_BLUR_STD_DEVIATION 0 "Float"
	)
]

{ #category : #'class initialization' }
MozGaussianBlurFilterAtts class >> initialize [
	self initializeEnumeration
]
