"
enum CompositeAtts
{
   ATT_COMPOSITE_OPERATOR = 0                        // CompositeOperator
};
"
Class {
	#name : #MozCompositeFilterAtts,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'ATT_COMPOSITE_OPERATOR'
	],
	#category : 'Sparta-Moz2D-Filters Enum'
}

{ #category : #'accessing enum' }
MozCompositeFilterAtts class >> ATT_COMPOSITE_OPERATOR [
	"This method was automatically generated"
	^ ATT_COMPOSITE_OPERATOR
]

{ #category : #'enum declaration' }
MozCompositeFilterAtts class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		ATT_COMPOSITE_OPERATOR 0 	"CompositeOperator"
	)
]

{ #category : #'class initialization' }
MozCompositeFilterAtts class >> initialize [
	self initializeEnumeration
]
