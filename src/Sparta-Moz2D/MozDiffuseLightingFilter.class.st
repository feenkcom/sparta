Class {
	#name : #MozDiffuseLightingFilter,
	#superclass : #MozLightingFilter,
	#traits : 'TSpartaDiffuseLightingFilter',
	#classTraits : 'TSpartaDiffuseLightingFilter classTrait',
	#category : 'Sparta-Moz2D-Filters'
}

{ #category : #accessing }
MozDiffuseLightingFilter >> diffuseConstant: aFloat [

	self 
		primSetAttributeFloat: aFloat
		index: MozLightingFilterAtts ATT_DIFFUSE_LIGHTING_DIFFUSE_CONSTANT
]
