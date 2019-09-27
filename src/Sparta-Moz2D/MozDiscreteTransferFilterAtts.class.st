"
enum DiscreteTransferAtts
{
   ATT_DISCRETE_TRANSFER_DISABLE_R = ATT_TRANSFER_DISABLE_R,
   ATT_DISCRETE_TRANSFER_DISABLE_G = ATT_TRANSFER_DISABLE_G,
   ATT_DISCRETE_TRANSFER_DISABLE_B = ATT_TRANSFER_DISABLE_B,
   ATT_DISCRETE_TRANSFER_DISABLE_A = ATT_TRANSFER_DISABLE_A,
   ATT_DISCRETE_TRANSFER_TABLE_R,                  // Float[]
   ATT_DISCRETE_TRANSFER_TABLE_G,                  // Float[]
   ATT_DISCRETE_TRANSFER_TABLE_B,                  // Float[]
   ATT_DISCRETE_TRANSFER_TABLE_A                   // Float[]
};
"
Class {
	#name : #MozDiscreteTransferFilterAtts,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'ATT_DISCRETE_TRANSFER_TABLE_A',
		'ATT_DISCRETE_TRANSFER_TABLE_B',
		'ATT_DISCRETE_TRANSFER_TABLE_G',
		'ATT_DISCRETE_TRANSFER_TABLE_R'
	],
	#category : 'Sparta-Moz2D-Filters Enum'
}

{ #category : #'accessing enum' }
MozDiscreteTransferFilterAtts class >> ATT_DISCRETE_TRANSFER_TABLE_A [
	"This method was automatically generated"
	^ ATT_DISCRETE_TRANSFER_TABLE_A
]

{ #category : #'accessing enum' }
MozDiscreteTransferFilterAtts class >> ATT_DISCRETE_TRANSFER_TABLE_B [
	"This method was automatically generated"
	^ ATT_DISCRETE_TRANSFER_TABLE_B
]

{ #category : #'accessing enum' }
MozDiscreteTransferFilterAtts class >> ATT_DISCRETE_TRANSFER_TABLE_G [
	"This method was automatically generated"
	^ ATT_DISCRETE_TRANSFER_TABLE_G
]

{ #category : #'accessing enum' }
MozDiscreteTransferFilterAtts class >> ATT_DISCRETE_TRANSFER_TABLE_R [
	"This method was automatically generated"
	^ ATT_DISCRETE_TRANSFER_TABLE_R
]

{ #category : #'enum declaration' }
MozDiscreteTransferFilterAtts class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		ATT_DISCRETE_TRANSFER_TABLE_R 4 	"Float[]"
		ATT_DISCRETE_TRANSFER_TABLE_G 5 	"Float[]"
		ATT_DISCRETE_TRANSFER_TABLE_B 6 	"Float[]"
		ATT_DISCRETE_TRANSFER_TABLE_A 7 	"Float[]"
	)
]

{ #category : #'class initialization' }
MozDiscreteTransferFilterAtts class >> initialize [
	self initializeEnumeration
]
