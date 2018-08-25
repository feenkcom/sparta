"
enum TableTransferAtts
{
   ATT_TABLE_TRANSFER_DISABLE_R = ATT_TRANSFER_DISABLE_R,
   ATT_TABLE_TRANSFER_DISABLE_G = ATT_TRANSFER_DISABLE_G,
   ATT_TABLE_TRANSFER_DISABLE_B = ATT_TRANSFER_DISABLE_B,
   ATT_TABLE_TRANSFER_DISABLE_A = ATT_TRANSFER_DISABLE_A,
   ATT_TABLE_TRANSFER_TABLE_R,                      // Float[]
   ATT_TABLE_TRANSFER_TABLE_G,                      // Float[]
   ATT_TABLE_TRANSFER_TABLE_B,                      // Float[]
   ATT_TABLE_TRANSFER_TABLE_A                        // Float[]
};
"
Class {
	#name : #MozTableTransferFilterAtts,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'ATT_TABLE_TRANSFER_TABLE_A',
		'ATT_TABLE_TRANSFER_TABLE_B',
		'ATT_TABLE_TRANSFER_TABLE_G',
		'ATT_TABLE_TRANSFER_TABLE_R'
	],
	#category : 'Sparta-Moz2D-Filters Enum'
}

{ #category : #'accessing enum' }
MozTableTransferFilterAtts class >> ATT_TABLE_TRANSFER_TABLE_A [
	"This method was automatically generated"
	^ ATT_TABLE_TRANSFER_TABLE_A
]

{ #category : #'accessing enum' }
MozTableTransferFilterAtts class >> ATT_TABLE_TRANSFER_TABLE_B [
	"This method was automatically generated"
	^ ATT_TABLE_TRANSFER_TABLE_B
]

{ #category : #'accessing enum' }
MozTableTransferFilterAtts class >> ATT_TABLE_TRANSFER_TABLE_G [
	"This method was automatically generated"
	^ ATT_TABLE_TRANSFER_TABLE_G
]

{ #category : #'accessing enum' }
MozTableTransferFilterAtts class >> ATT_TABLE_TRANSFER_TABLE_R [
	"This method was automatically generated"
	^ ATT_TABLE_TRANSFER_TABLE_R
]

{ #category : #'enum declaration' }
MozTableTransferFilterAtts class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		ATT_TABLE_TRANSFER_TABLE_R 4 	"Float[]"
		ATT_TABLE_TRANSFER_TABLE_G 5 	"Float[]"
		ATT_TABLE_TRANSFER_TABLE_B 6 	"Float[]"
		ATT_TABLE_TRANSFER_TABLE_A 7 	"Float[]"
	)
]

{ #category : #'class initialization' }
MozTableTransferFilterAtts class >> initialize [
	self initializeEnumeration
]
