"
I am a specific discrete transfer filter.

https://docs.webplatform.org/wiki/svg/elements/feComponentTransfer
https://www.w3.org/TR/filter-effects/#feComponentTransferElement.

Examples

	Extract alpha channel from source ignoring red, green, blue.

	canvas discreteTransferFilter
		disableRed: false;
		tableRed: 0.0;
		disableGreen: false;
		tableGreen: 0.0;
		disableBlue: false;
		tableBlue: 0.0;
		disableAlpha: true
"
Class {
	#name : #MozDiscreteTransferFilter,
	#superclass : #MozTransferFilter,
	#traits : 'TSpartaDiscreteTransferFilter',
	#classTraits : 'TSpartaDiscreteTransferFilter classTrait',
	#category : 'Sparta-Moz2D-Filters'
}

{ #category : #accessing }
MozDiscreteTransferFilter class >> filterType [
	^ MozFilterType DISCRETE_TRANSFER
]

{ #category : #accessing }
MozDiscreteTransferFilter >> tableAlpha: anArrayOrFloat [

	self
		privateSetAttributeFloatArray: anArrayOrFloat
		index: MozDiscreteTransferFilterAtts ATT_DISCRETE_TRANSFER_TABLE_A
]

{ #category : #accessing }
MozDiscreteTransferFilter >> tableBlue: anArrayOrFloat [

	self
		privateSetAttributeFloatArray: anArrayOrFloat
		index: MozDiscreteTransferFilterAtts ATT_DISCRETE_TRANSFER_TABLE_B
]

{ #category : #accessing }
MozDiscreteTransferFilter >> tableGreen: anArrayOrFloat [

	self
		privateSetAttributeFloatArray: anArrayOrFloat
		index: MozDiscreteTransferFilterAtts ATT_DISCRETE_TRANSFER_TABLE_G
]

{ #category : #accessing }
MozDiscreteTransferFilter >> tableRed: anArrayOrFloat [

	self
		privateSetAttributeFloatArray: anArrayOrFloat
		index: MozDiscreteTransferFilterAtts ATT_DISCRETE_TRANSFER_TABLE_R
]
