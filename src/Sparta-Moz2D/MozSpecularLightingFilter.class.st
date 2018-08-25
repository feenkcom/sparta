Class {
	#name : #MozSpecularLightingFilter,
	#superclass : #MozLightingFilter,
	#traits : 'TSpartaSpecularLightingFilter',
	#classTraits : 'TSpartaSpecularLightingFilter classTrait',
	#category : 'Sparta-Moz2D-Filters'
}

{ #category : #accessing }
MozSpecularLightingFilter >> specularConstant: aFloat [

	self 
		primSetAttributeFloat: aFloat
		index: MozLightingFilterAtts ATT_SPECULAR_LIGHTING_SPECULAR_CONSTANT
]

{ #category : #accessing }
MozSpecularLightingFilter >> specularExponent: aFloat [

	self 
		primSetAttributeFloat: aFloat
		index: MozLightingFilterAtts ATT_SPECULAR_LIGHTING_SPECULAR_EXPONENT
]
