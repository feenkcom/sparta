"
enum LinearTransferAtts
{
   ATT_LINEAR_TRANSFER_DISABLE_R = ATT_TRANSFER_DISABLE_R,
   ATT_LINEAR_TRANSFER_DISABLE_G = ATT_TRANSFER_DISABLE_G,
   ATT_LINEAR_TRANSFER_DISABLE_B = ATT_TRANSFER_DISABLE_B,
   ATT_LINEAR_TRANSFER_DISABLE_A = ATT_TRANSFER_DISABLE_A,
   ATT_LINEAR_TRANSFER_SLOPE_R,                     // Float
   ATT_LINEAR_TRANSFER_SLOPE_G,                     // Float
   ATT_LINEAR_TRANSFER_SLOPE_B,                     // Float
   ATT_LINEAR_TRANSFER_SLOPE_A,                     // Float
   ATT_LINEAR_TRANSFER_INTERCEPT_R,               // Float
   ATT_LINEAR_TRANSFER_INTERCEPT_G,               // Float
   ATT_LINEAR_TRANSFER_INTERCEPT_B,               // Float
   ATT_LINEAR_TRANSFER_INTERCEPT_A                // Float
};
"
Class {
	#name : #MozLinearTransferFilterAtts,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'ATT_LINEAR_TRANSFER_INTERCEPT_A',
		'ATT_LINEAR_TRANSFER_INTERCEPT_B',
		'ATT_LINEAR_TRANSFER_INTERCEPT_G',
		'ATT_LINEAR_TRANSFER_INTERCEPT_R',
		'ATT_LINEAR_TRANSFER_SLOPE_A',
		'ATT_LINEAR_TRANSFER_SLOPE_B',
		'ATT_LINEAR_TRANSFER_SLOPE_G',
		'ATT_LINEAR_TRANSFER_SLOPE_R'
	],
	#category : 'Sparta-Moz2D-Filters Enum'
}

{ #category : #'accessing enum' }
MozLinearTransferFilterAtts class >> ATT_LINEAR_TRANSFER_INTERCEPT_A [
	"This method was automatically generated"
	^ ATT_LINEAR_TRANSFER_INTERCEPT_A
]

{ #category : #'accessing enum' }
MozLinearTransferFilterAtts class >> ATT_LINEAR_TRANSFER_INTERCEPT_B [
	"This method was automatically generated"
	^ ATT_LINEAR_TRANSFER_INTERCEPT_B
]

{ #category : #'accessing enum' }
MozLinearTransferFilterAtts class >> ATT_LINEAR_TRANSFER_INTERCEPT_G [
	"This method was automatically generated"
	^ ATT_LINEAR_TRANSFER_INTERCEPT_G
]

{ #category : #'accessing enum' }
MozLinearTransferFilterAtts class >> ATT_LINEAR_TRANSFER_INTERCEPT_R [
	"This method was automatically generated"
	^ ATT_LINEAR_TRANSFER_INTERCEPT_R
]

{ #category : #'accessing enum' }
MozLinearTransferFilterAtts class >> ATT_LINEAR_TRANSFER_SLOPE_A [
	"This method was automatically generated"
	^ ATT_LINEAR_TRANSFER_SLOPE_A
]

{ #category : #'accessing enum' }
MozLinearTransferFilterAtts class >> ATT_LINEAR_TRANSFER_SLOPE_B [
	"This method was automatically generated"
	^ ATT_LINEAR_TRANSFER_SLOPE_B
]

{ #category : #'accessing enum' }
MozLinearTransferFilterAtts class >> ATT_LINEAR_TRANSFER_SLOPE_G [
	"This method was automatically generated"
	^ ATT_LINEAR_TRANSFER_SLOPE_G
]

{ #category : #'accessing enum' }
MozLinearTransferFilterAtts class >> ATT_LINEAR_TRANSFER_SLOPE_R [
	"This method was automatically generated"
	^ ATT_LINEAR_TRANSFER_SLOPE_R
]

{ #category : #'enum declaration' }
MozLinearTransferFilterAtts class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		ATT_LINEAR_TRANSFER_SLOPE_R 4 			"Float"
		ATT_LINEAR_TRANSFER_SLOPE_G 5 			"Float"
		ATT_LINEAR_TRANSFER_SLOPE_B 6 			"Float"
		ATT_LINEAR_TRANSFER_SLOPE_A 7 			"Float"
		ATT_LINEAR_TRANSFER_INTERCEPT_R 8 	"Float"
		ATT_LINEAR_TRANSFER_INTERCEPT_G 9 	"Float"
		ATT_LINEAR_TRANSFER_INTERCEPT_B 10 	"Float"
		ATT_LINEAR_TRANSFER_INTERCEPT_A 11 	"Float"
	)
]

{ #category : #'class initialization' }
MozLinearTransferFilterAtts class >> initialize [
	self initializeEnumeration
]
