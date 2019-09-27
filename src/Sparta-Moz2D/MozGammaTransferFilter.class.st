"
I am a specific gamma transfer filter.

https://docs.webplatform.org/wiki/svg/elements/feComponentTransfer
https://www.w3.org/TR/filter-effects/#feComponentTransferElement
"
Class {
	#name : #MozGammaTransferFilter,
	#superclass : #MozTransferFilter,
	#traits : 'TSpartaGammaTransferFilter',
	#classTraits : 'TSpartaGammaTransferFilter classTrait',
	#category : 'Sparta-Moz2D-Filters'
}

{ #category : #accessing }
MozGammaTransferFilter class >> filterType [
	^ MozFilterType GAMMA_TRANSFER
]

{ #category : #accessing }
MozGammaTransferFilter >> amplitudeAlpha: aFloat [

	self
		primSetAttributeFloat: aFloat
		index: MozGammaTransferFilterAtts ATT_GAMMA_TRANSFER_AMPLITUDE_A
]

{ #category : #accessing }
MozGammaTransferFilter >> amplitudeBlue: aFloat [

	self
		primSetAttributeFloat: aFloat
		index: MozGammaTransferFilterAtts ATT_GAMMA_TRANSFER_AMPLITUDE_B
]

{ #category : #accessing }
MozGammaTransferFilter >> amplitudeGreen: aFloat [

	self
		primSetAttributeFloat: aFloat
		index: MozGammaTransferFilterAtts ATT_GAMMA_TRANSFER_AMPLITUDE_G
]

{ #category : #accessing }
MozGammaTransferFilter >> amplitudeRed: aFloat [

	self
		primSetAttributeFloat: aFloat
		index: MozGammaTransferFilterAtts ATT_GAMMA_TRANSFER_AMPLITUDE_R
]

{ #category : #accessing }
MozGammaTransferFilter >> exponentAlpha: aFloat [

	self
		primSetAttributeFloat: aFloat
		index: MozGammaTransferFilterAtts ATT_GAMMA_TRANSFER_EXPONENT_A
]

{ #category : #accessing }
MozGammaTransferFilter >> exponentBlue: aFloat [

	self
		primSetAttributeFloat: aFloat
		index: MozGammaTransferFilterAtts ATT_GAMMA_TRANSFER_EXPONENT_B
]

{ #category : #accessing }
MozGammaTransferFilter >> exponentGreen: aFloat [

	self
		primSetAttributeFloat: aFloat
		index: MozGammaTransferFilterAtts ATT_GAMMA_TRANSFER_EXPONENT_G
]

{ #category : #accessing }
MozGammaTransferFilter >> exponentRed: aFloat [

	self
		primSetAttributeFloat: aFloat
		index: MozGammaTransferFilterAtts ATT_GAMMA_TRANSFER_EXPONENT_R
]

{ #category : #accessing }
MozGammaTransferFilter >> offsetAlpha: aFloat [

	self
		primSetAttributeFloat: aFloat
		index: MozGammaTransferFilterAtts ATT_GAMMA_TRANSFER_OFFSET_A
]

{ #category : #accessing }
MozGammaTransferFilter >> offsetBlue: aFloat [

	self
		primSetAttributeFloat: aFloat
		index: MozGammaTransferFilterAtts ATT_GAMMA_TRANSFER_OFFSET_B
]

{ #category : #accessing }
MozGammaTransferFilter >> offsetGreen: aFloat [

	self
		primSetAttributeFloat: aFloat
		index: MozGammaTransferFilterAtts ATT_GAMMA_TRANSFER_OFFSET_G
]

{ #category : #accessing }
MozGammaTransferFilter >> offsetRed: aFloat [

	self
		primSetAttributeFloat: aFloat
		index: MozGammaTransferFilterAtts ATT_GAMMA_TRANSFER_OFFSET_R
]
