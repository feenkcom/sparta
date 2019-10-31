Class {
	#name : #MozLightingFilter,
	#superclass : #MozSingleSourceFilter,
	#traits : 'TSpartaLightingFilter',
	#classTraits : 'TSpartaLightingFilter classTrait',
	#category : 'Sparta-Moz2D-Filters'
}

{ #category : #accessing }
MozLightingFilter >> color: aColor [

	self
		primSetAttributeR: aColor red
		g: aColor green
		b: aColor blue
		a: aColor alpha
		index: MozLightingFilterAtts ATT_LIGHTING_COLOR
]

{ #category : #accessing }
MozLightingFilter >> kernelUnitLength: aPointOrFloat [

	self
		privateSetAttributeSize: aPointOrFloat
		index: MozLightingFilterAtts ATT_LIGHTING_KERNEL_UNIT_LENGTH
]

{ #category : #accessing }
MozLightingFilter >> surfaceScale: aFloat [

	self 
		primSetAttributeFloat: aFloat
		index: MozLightingFilterAtts ATT_LIGHTING_SURFACE_SCALE
]
