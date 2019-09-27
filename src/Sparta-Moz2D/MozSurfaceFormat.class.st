Class {
	#name : #MozSurfaceFormat,
	#superclass : #MozEnum,
	#classVars : [
		'A8',
		'A8R8G8B8',
		'A8R8G8B8_UINT32',
		'B8G8R8',
		'B8G8R8A8',
		'B8G8R8X8',
		'Depth',
		'HSV',
		'Lab',
		'NV12',
		'R5G6B5_UINT16',
		'R8G8B8',
		'R8G8B8A8',
		'R8G8B8X8',
		'UNKNOWN',
		'X8R8G8B8',
		'X8R8G8B8_UINT32',
		'YUV',
		'YUV422'
	],
	#category : 'Sparta-Moz2D-Enums'
}

{ #category : #'accessing enum' }
MozSurfaceFormat class >> A8 [
	"This method was automatically generated"
	^ A8
]

{ #category : #'accessing enum' }
MozSurfaceFormat class >> A8R8G8B8 [
	"This method was automatically generated"
	^ A8R8G8B8
]

{ #category : #'accessing enum' }
MozSurfaceFormat class >> A8R8G8B8_UINT32 [
	"This method was automatically generated"
	^ A8R8G8B8_UINT32
]

{ #category : #'accessing enum' }
MozSurfaceFormat class >> B8G8R8 [
	"This method was automatically generated"
	^ B8G8R8
]

{ #category : #'accessing enum' }
MozSurfaceFormat class >> B8G8R8A8 [
	"This method was automatically generated"
	^ B8G8R8A8
]

{ #category : #'accessing enum' }
MozSurfaceFormat class >> B8G8R8X8 [
	"This method was automatically generated"
	^ B8G8R8X8
]

{ #category : #'accessing enum' }
MozSurfaceFormat class >> Depth [
	"This method was automatically generated"
	^ Depth
]

{ #category : #'accessing enum' }
MozSurfaceFormat class >> HSV [
	"This method was automatically generated"
	^ HSV
]

{ #category : #'accessing enum' }
MozSurfaceFormat class >> Lab [
	"This method was automatically generated"
	^ Lab
]

{ #category : #'accessing enum' }
MozSurfaceFormat class >> NV12 [
	"This method was automatically generated"
	^ NV12
]

{ #category : #'accessing enum' }
MozSurfaceFormat class >> R5G6B5_UINT16 [
	"This method was automatically generated"
	^ R5G6B5_UINT16
]

{ #category : #'accessing enum' }
MozSurfaceFormat class >> R8G8B8 [
	"This method was automatically generated"
	^ R8G8B8
]

{ #category : #'accessing enum' }
MozSurfaceFormat class >> R8G8B8A8 [
	"This method was automatically generated"
	^ R8G8B8A8
]

{ #category : #'accessing enum' }
MozSurfaceFormat class >> R8G8B8X8 [
	"This method was automatically generated"
	^ R8G8B8X8
]

{ #category : #'accessing enum' }
MozSurfaceFormat class >> UNKNOWN [
	"This method was automatically generated"
	^ UNKNOWN
]

{ #category : #'accessing enum' }
MozSurfaceFormat class >> X8R8G8B8 [
	"This method was automatically generated"
	^ X8R8G8B8
]

{ #category : #'accessing enum' }
MozSurfaceFormat class >> X8R8G8B8_UINT32 [
	"This method was automatically generated"
	^ X8R8G8B8_UINT32
]

{ #category : #'accessing enum' }
MozSurfaceFormat class >> YUV [
	"This method was automatically generated"
	^ YUV
]

{ #category : #'accessing enum' }
MozSurfaceFormat class >> YUV422 [
	"This method was automatically generated"
	^ YUV422
]

{ #category : #'enum declaration' }
MozSurfaceFormat class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ {
	"The following values are named to reflect layout of colors in memory, from
	lowest byte to highest byte. The 32-bit value layout depends on machine
	endianness.
                    in-memory         32-bit LE value   32-bit BE value"
	#B8G8R8A8 . 0.   " [BB, GG, RR, AA]     0xAARRGGBB        0xBBGGRRAA "
	#B8G8R8X8 . 1.    " [BB, GG, RR, 00]     0x00RRGGBB        0xBBGGRR00 "
	#R8G8B8A8 . 2.    " [RR, GG, BB, AA]     0xAABBGGRR        0xRRGGBBAA "
	#R8G8B8X8 . 3.    " [RR, GG, BB, 00]     0x00BBGGRR        0xRRGGBB00 "
	#A8R8G8B8 . 4.    " [AA, RR, GG, BB]     0xBBGGRRAA        0xAARRGGBB "
	#X8R8G8B8 . 5.    " [00, RR, GG, BB]     0xBBGGRR00        0x00RRGGBB "

	#R8G8B8 . 6.
	#B8G8R8 . 7.

	"The _UINT16 suffix here indicates that the name reflects the layout when
	viewed as a uint16_t value. In memory these values are stored using native
	endianness."
	#R5G6B5_UINT16 . 8.                    " 0bRRRRRGGGGGGBBBBB "

	"This one is a single-byte, so endianness isn't an issue."
	#A8 . 9.

	"These ones are their own special cases."
	#YUV . 10.
	#NV12 . 11.
	#YUV422 . 12.
	#HSV . 13.
	#Lab . 14.
	#Depth . 15.

	"This represents the unknown format."
	#UNKNOWN . 16.

	"The following values are endian-independent synonyms. The _UINT32 suffix
	indicates that the name reflects the layout when viewed as a uint32_t
	value."
	#A8R8G8B8_UINT32 . EndianDetector isLittleEndian
			ifTrue: [ 0 ] "B8G8R8A8"
			ifFalse: [ 4 ]. "A8R8G8B8"
	#X8R8G8B8_UINT32 . EndianDetector isLittleEndian
			ifTrue: [ 1 ] "B8G8R8X8"
			ifFalse: [ 5 ]. "X8R8G8B8" }
]

{ #category : #accessing }
MozSurfaceFormat class >> externalEnum [
	^ 'SurfaceFormat'
]

{ #category : #accessing }
MozSurfaceFormat class >> externalType [
	^ FFIInt8 new
]

{ #category : #'class initialization' }
MozSurfaceFormat class >> initialize [
	super initialize
]
