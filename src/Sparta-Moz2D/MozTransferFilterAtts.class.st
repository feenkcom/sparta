"
enum TransferAtts
{
   ATT_TRANSFER_DISABLE_R = 0,                      // bool
   ATT_TRANSFER_DISABLE_G,                            // bool
   ATT_TRANSFER_DISABLE_B,                            // bool
   ATT_TRANSFER_DISABLE_A                              // bool
};

"
Class {
	#name : #MozTransferFilterAtts,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'ATT_TRANSFER_DISABLE_A',
		'ATT_TRANSFER_DISABLE_B',
		'ATT_TRANSFER_DISABLE_G',
		'ATT_TRANSFER_DISABLE_R'
	],
	#category : 'Sparta-Moz2D-Filters Enum'
}

{ #category : #'accessing enum' }
MozTransferFilterAtts class >> ATT_TRANSFER_DISABLE_A [
	"This method was automatically generated"
	^ ATT_TRANSFER_DISABLE_A
]

{ #category : #'accessing enum' }
MozTransferFilterAtts class >> ATT_TRANSFER_DISABLE_B [
	"This method was automatically generated"
	^ ATT_TRANSFER_DISABLE_B
]

{ #category : #'accessing enum' }
MozTransferFilterAtts class >> ATT_TRANSFER_DISABLE_G [
	"This method was automatically generated"
	^ ATT_TRANSFER_DISABLE_G
]

{ #category : #'accessing enum' }
MozTransferFilterAtts class >> ATT_TRANSFER_DISABLE_R [
	"This method was automatically generated"
	^ ATT_TRANSFER_DISABLE_R
]

{ #category : #'enum declaration' }
MozTransferFilterAtts class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		ATT_TRANSFER_DISABLE_R 0 	"bool"
		ATT_TRANSFER_DISABLE_G 1 	"bool"
		ATT_TRANSFER_DISABLE_B 2 	"bool"
		ATT_TRANSFER_DISABLE_A 3 	"bool"
	)
]

{ #category : #'class initialization' }
MozTransferFilterAtts class >> initialize [
	self initializeEnumeration
]
