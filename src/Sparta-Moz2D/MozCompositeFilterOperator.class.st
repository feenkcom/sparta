"
enum CompositeOperator
{
   COMPOSITE_OPERATOR_OVER = 0,
   COMPOSITE_OPERATOR_IN,
   COMPOSITE_OPERATOR_OUT,
   COMPOSITE_OPERATOR_ATOP,
   COMPOSITE_OPERATOR_XOR
};
"
Class {
	#name : #MozCompositeFilterOperator,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'COMPOSITE_OPERATOR_ATOP',
		'COMPOSITE_OPERATOR_IN',
		'COMPOSITE_OPERATOR_OUT',
		'COMPOSITE_OPERATOR_OVER',
		'COMPOSITE_OPERATOR_XOR'
	],
	#category : 'Sparta-Moz2D-Filters Enum'
}

{ #category : #'accessing enum' }
MozCompositeFilterOperator class >> COMPOSITE_OPERATOR_ATOP [
	"This method was automatically generated"
	^ COMPOSITE_OPERATOR_ATOP
]

{ #category : #'accessing enum' }
MozCompositeFilterOperator class >> COMPOSITE_OPERATOR_IN [
	"This method was automatically generated"
	^ COMPOSITE_OPERATOR_IN
]

{ #category : #'accessing enum' }
MozCompositeFilterOperator class >> COMPOSITE_OPERATOR_OUT [
	"This method was automatically generated"
	^ COMPOSITE_OPERATOR_OUT
]

{ #category : #'accessing enum' }
MozCompositeFilterOperator class >> COMPOSITE_OPERATOR_OVER [
	"This method was automatically generated"
	^ COMPOSITE_OPERATOR_OVER
]

{ #category : #'accessing enum' }
MozCompositeFilterOperator class >> COMPOSITE_OPERATOR_XOR [
	"This method was automatically generated"
	^ COMPOSITE_OPERATOR_XOR
]

{ #category : #'enum declaration' }
MozCompositeFilterOperator class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		COMPOSITE_OPERATOR_OVER 0
		COMPOSITE_OPERATOR_IN 1
		COMPOSITE_OPERATOR_OUT 2
		COMPOSITE_OPERATOR_ATOP 3
		COMPOSITE_OPERATOR_XOR 4
	)
]

{ #category : #'class initialization' }
MozCompositeFilterOperator class >> initialize [
	self initializeEnumeration
]
