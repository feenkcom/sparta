"
I am a specific linear transfer filter.

https://docs.webplatform.org/wiki/svg/elements/feComponentTransfer
https://www.w3.org/TR/filter-effects/#feComponentTransferElement
"
Class {
	#name : #MozLinearTransferFilter,
	#superclass : #MozTransferFilter,
	#traits : 'TSpartaLinearTransferFilter',
	#classTraits : 'TSpartaLinearTransferFilter classTrait',
	#category : 'Sparta-Moz2D-Filters'
}

{ #category : #accessing }
MozLinearTransferFilter class >> filterType [
	^ MozFilterType LINEAR_TRANSFER
]

{ #category : #accessing }
MozLinearTransferFilter >> interceptAlpha: aFloat [

	self
		primSetAttributeFloat: aFloat
		index: MozLinearTransferFilterAtts ATT_LINEAR_TRANSFER_INTERCEPT_A
]

{ #category : #accessing }
MozLinearTransferFilter >> interceptBlue: aFloat [

	self
		primSetAttributeFloat: aFloat
		index: MozLinearTransferFilterAtts ATT_LINEAR_TRANSFER_INTERCEPT_B
]

{ #category : #accessing }
MozLinearTransferFilter >> interceptGreen: aFloat [

	self
		primSetAttributeFloat: aFloat
		index: MozLinearTransferFilterAtts ATT_LINEAR_TRANSFER_INTERCEPT_G
]

{ #category : #accessing }
MozLinearTransferFilter >> interceptRed: aFloat [

	self
		primSetAttributeFloat: aFloat
		index: MozLinearTransferFilterAtts ATT_LINEAR_TRANSFER_INTERCEPT_R
]

{ #category : #accessing }
MozLinearTransferFilter >> slopeAlpha: aFloat [

	self
		primSetAttributeFloat: aFloat
		index: MozLinearTransferFilterAtts ATT_LINEAR_TRANSFER_SLOPE_A
]

{ #category : #accessing }
MozLinearTransferFilter >> slopeBlue: aFloat [

	self
		primSetAttributeFloat: aFloat
		index: MozLinearTransferFilterAtts ATT_LINEAR_TRANSFER_SLOPE_B
]

{ #category : #accessing }
MozLinearTransferFilter >> slopeGreen: aFloat [

	self
		primSetAttributeFloat: aFloat
		index: MozLinearTransferFilterAtts ATT_LINEAR_TRANSFER_SLOPE_G
]

{ #category : #accessing }
MozLinearTransferFilter >> slopeRed: aFloat [

	self
		primSetAttributeFloat: aFloat
		index: MozLinearTransferFilterAtts ATT_LINEAR_TRANSFER_SLOPE_R
]
