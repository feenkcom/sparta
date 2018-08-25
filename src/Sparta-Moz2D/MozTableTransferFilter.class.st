"
I am a specific table transfer filter.

https://docs.webplatform.org/wiki/svg/elements/feComponentTransfer
https://www.w3.org/TR/filter-effects/#feComponentTransferElement
"
Class {
	#name : #MozTableTransferFilter,
	#superclass : #MozTransferFilter,
	#traits : 'TSpartaTableTransferFilter',
	#classTraits : 'TSpartaTableTransferFilter classTrait',
	#category : 'Sparta-Moz2D-Filters'
}

{ #category : #accessing }
MozTableTransferFilter class >> filterType [
	^ MozFilterType TABLE_TRANSFER
]

{ #category : #accessing }
MozTableTransferFilter >> tableAlpha: anArrayOrFloat [

	self
		privateSetAttributeFloatArray: anArrayOrFloat
		index: MozTableTransferFilterAtts ATT_TABLE_TRANSFER_TABLE_A
]

{ #category : #accessing }
MozTableTransferFilter >> tableBlue: anArrayOrFloat [

	self
		privateSetAttributeFloatArray: anArrayOrFloat
		index: MozTableTransferFilterAtts ATT_TABLE_TRANSFER_TABLE_B
]

{ #category : #accessing }
MozTableTransferFilter >> tableGreen: anArrayOrFloat [

	self
		privateSetAttributeFloatArray: anArrayOrFloat
		index: MozTableTransferFilterAtts ATT_TABLE_TRANSFER_TABLE_G
]

{ #category : #accessing }
MozTableTransferFilter >> tableRed: anArrayOrFloat [

	self
		privateSetAttributeFloatArray: anArrayOrFloat
		index: MozTableTransferFilterAtts ATT_TABLE_TRANSFER_TABLE_R
]
