"
enum GammaTransferAtts
{
   ATT_GAMMA_TRANSFER_DISABLE_R = ATT_TRANSFER_DISABLE_R,
   ATT_GAMMA_TRANSFER_DISABLE_G = ATT_TRANSFER_DISABLE_G,
   ATT_GAMMA_TRANSFER_DISABLE_B = ATT_TRANSFER_DISABLE_B,
   ATT_GAMMA_TRANSFER_DISABLE_A = ATT_TRANSFER_DISABLE_A,
   ATT_GAMMA_TRANSFER_AMPLITUDE_R,                   // Float
   ATT_GAMMA_TRANSFER_AMPLITUDE_G,                   // Float
   ATT_GAMMA_TRANSFER_AMPLITUDE_B,                   // Float
   ATT_GAMMA_TRANSFER_AMPLITUDE_A,                   // Float
   ATT_GAMMA_TRANSFER_EXPONENT_R,                     // Float
   ATT_GAMMA_TRANSFER_EXPONENT_G,                     // Float
   ATT_GAMMA_TRANSFER_EXPONENT_B,                     // Float
   ATT_GAMMA_TRANSFER_EXPONENT_A,                     // Float
   ATT_GAMMA_TRANSFER_OFFSET_R,                        // Float
   ATT_GAMMA_TRANSFER_OFFSET_G,                        // Float
   ATT_GAMMA_TRANSFER_OFFSET_B,                        // Float
   ATT_GAMMA_TRANSFER_OFFSET_A                         // Float
};
"
Class {
	#name : #MozGammaTransferFilterAtts,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'ATT_GAMMA_TRANSFER_AMPLITUDE_A',
		'ATT_GAMMA_TRANSFER_AMPLITUDE_B',
		'ATT_GAMMA_TRANSFER_AMPLITUDE_G',
		'ATT_GAMMA_TRANSFER_AMPLITUDE_R',
		'ATT_GAMMA_TRANSFER_EXPONENT_A',
		'ATT_GAMMA_TRANSFER_EXPONENT_B',
		'ATT_GAMMA_TRANSFER_EXPONENT_G',
		'ATT_GAMMA_TRANSFER_EXPONENT_R',
		'ATT_GAMMA_TRANSFER_OFFSET_A',
		'ATT_GAMMA_TRANSFER_OFFSET_B',
		'ATT_GAMMA_TRANSFER_OFFSET_G',
		'ATT_GAMMA_TRANSFER_OFFSET_R'
	],
	#category : 'Sparta-Moz2D-Filters Enum'
}

{ #category : #'accessing enum' }
MozGammaTransferFilterAtts class >> ATT_GAMMA_TRANSFER_AMPLITUDE_A [
	"This method was automatically generated"
	^ ATT_GAMMA_TRANSFER_AMPLITUDE_A
]

{ #category : #'accessing enum' }
MozGammaTransferFilterAtts class >> ATT_GAMMA_TRANSFER_AMPLITUDE_B [
	"This method was automatically generated"
	^ ATT_GAMMA_TRANSFER_AMPLITUDE_B
]

{ #category : #'accessing enum' }
MozGammaTransferFilterAtts class >> ATT_GAMMA_TRANSFER_AMPLITUDE_G [
	"This method was automatically generated"
	^ ATT_GAMMA_TRANSFER_AMPLITUDE_G
]

{ #category : #'accessing enum' }
MozGammaTransferFilterAtts class >> ATT_GAMMA_TRANSFER_AMPLITUDE_R [
	"This method was automatically generated"
	^ ATT_GAMMA_TRANSFER_AMPLITUDE_R
]

{ #category : #'accessing enum' }
MozGammaTransferFilterAtts class >> ATT_GAMMA_TRANSFER_EXPONENT_A [
	"This method was automatically generated"
	^ ATT_GAMMA_TRANSFER_EXPONENT_A
]

{ #category : #'accessing enum' }
MozGammaTransferFilterAtts class >> ATT_GAMMA_TRANSFER_EXPONENT_B [
	"This method was automatically generated"
	^ ATT_GAMMA_TRANSFER_EXPONENT_B
]

{ #category : #'accessing enum' }
MozGammaTransferFilterAtts class >> ATT_GAMMA_TRANSFER_EXPONENT_G [
	"This method was automatically generated"
	^ ATT_GAMMA_TRANSFER_EXPONENT_G
]

{ #category : #'accessing enum' }
MozGammaTransferFilterAtts class >> ATT_GAMMA_TRANSFER_EXPONENT_R [
	"This method was automatically generated"
	^ ATT_GAMMA_TRANSFER_EXPONENT_R
]

{ #category : #'accessing enum' }
MozGammaTransferFilterAtts class >> ATT_GAMMA_TRANSFER_OFFSET_A [
	"This method was automatically generated"
	^ ATT_GAMMA_TRANSFER_OFFSET_A
]

{ #category : #'accessing enum' }
MozGammaTransferFilterAtts class >> ATT_GAMMA_TRANSFER_OFFSET_B [
	"This method was automatically generated"
	^ ATT_GAMMA_TRANSFER_OFFSET_B
]

{ #category : #'accessing enum' }
MozGammaTransferFilterAtts class >> ATT_GAMMA_TRANSFER_OFFSET_G [
	"This method was automatically generated"
	^ ATT_GAMMA_TRANSFER_OFFSET_G
]

{ #category : #'accessing enum' }
MozGammaTransferFilterAtts class >> ATT_GAMMA_TRANSFER_OFFSET_R [
	"This method was automatically generated"
	^ ATT_GAMMA_TRANSFER_OFFSET_R
]

{ #category : #'enum declaration' }
MozGammaTransferFilterAtts class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		ATT_GAMMA_TRANSFER_AMPLITUDE_R 4 		"Float"
		ATT_GAMMA_TRANSFER_AMPLITUDE_G 5 		"Float"
		ATT_GAMMA_TRANSFER_AMPLITUDE_B 6 		"Float"
		ATT_GAMMA_TRANSFER_AMPLITUDE_A 7 		"Float"
		ATT_GAMMA_TRANSFER_EXPONENT_R 8 		"Float"
		ATT_GAMMA_TRANSFER_EXPONENT_G 9 		"Float"
		ATT_GAMMA_TRANSFER_EXPONENT_B 10 		"Float"
		ATT_GAMMA_TRANSFER_EXPONENT_A 11 		"Float"
		ATT_GAMMA_TRANSFER_OFFSET_R 12 		"Float"
		ATT_GAMMA_TRANSFER_OFFSET_G 13 		"Float"
		ATT_GAMMA_TRANSFER_OFFSET_B 14 		"Float"
		ATT_GAMMA_TRANSFER_OFFSET_A 15 		"Float"
	)
]

{ #category : #'class initialization' }
MozGammaTransferFilterAtts class >> initialize [
	self initializeEnumeration
]
