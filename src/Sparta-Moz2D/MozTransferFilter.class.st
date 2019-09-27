"
Transfer is a filter primitive which allows the independent manipulation of each color channel (including the alpha channel) in the input graphic. It is always a child element of a filter element and is the parent of child elements (feFuncR, feFuncG, feFuncB and feFuncA) that perform each color channel manipulation.

https://docs.webplatform.org/wiki/svg/elements/feComponentTransfer
https://www.w3.org/TR/filter-effects/#feComponentTransferElement
"
Class {
	#name : #MozTransferFilter,
	#superclass : #MozSingleSourceFilter,
	#traits : 'TSpartaTransferFilter',
	#classTraits : 'TSpartaTransferFilter classTrait',
	#category : 'Sparta-Moz2D-Filters'
}

{ #category : #accessing }
MozTransferFilter >> disableAlpha: aBoolean [
	self
		primSetAttributeBool: aBoolean
		index: MozTransferFilterAtts ATT_TRANSFER_DISABLE_A
]

{ #category : #accessing }
MozTransferFilter >> disableBlue: aBoolean [
	self
		primSetAttributeBool: aBoolean
		index: MozTransferFilterAtts ATT_TRANSFER_DISABLE_B
]

{ #category : #accessing }
MozTransferFilter >> disableGreen: aBoolean [
	self
		primSetAttributeBool: aBoolean
		index: MozTransferFilterAtts ATT_TRANSFER_DISABLE_G
]

{ #category : #accessing }
MozTransferFilter >> disableRed: aBoolean [
	self
		primSetAttributeBool: aBoolean
		index: MozTransferFilterAtts ATT_TRANSFER_DISABLE_R
]
