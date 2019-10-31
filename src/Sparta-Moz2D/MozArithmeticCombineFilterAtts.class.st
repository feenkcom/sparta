Class {
	#name : #MozArithmeticCombineFilterAtts,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'ATT_ARITHMETIC_COMBINE_COEFFICIENTS'
	],
	#category : 'Sparta-Moz2D-Filters Enum'
}

{ #category : #'accessing enum' }
MozArithmeticCombineFilterAtts class >> ATT_ARITHMETIC_COMBINE_COEFFICIENTS [
	"This method was automatically generated"
	^ ATT_ARITHMETIC_COMBINE_COEFFICIENTS
]

{ #category : #'enum declaration' }
MozArithmeticCombineFilterAtts class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		ATT_ARITHMETIC_COMBINE_COEFFICIENTS 0 	"Float[4]"
	)
]

{ #category : #'class initialization' }
MozArithmeticCombineFilterAtts class >> initialize [
	self initializeEnumeration
]
