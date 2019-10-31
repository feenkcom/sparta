Class {
	#name : #MozSpecularDistantLightFilter,
	#superclass : #MozSpecularLightingFilter,
	#traits : 'TSpartaDistantLight',
	#classTraits : 'TSpartaDistantLight classTrait',
	#category : 'Sparta-Moz2D-Filters'
}

{ #category : #accessing }
MozSpecularDistantLightFilter class >> filterType [
	^ MozFilterType DISTANT_SPECULAR
]

{ #category : #accessing }
MozSpecularDistantLightFilter >> azimuth: aFloat [

	self 
		primSetAttributeFloat: aFloat
		index: MozLightingFilterAtts ATT_DISTANT_LIGHT_AZIMUTH
]

{ #category : #accessing }
MozSpecularDistantLightFilter >> elevation: aFloat [

	self 
		primSetAttributeFloat: aFloat
		index: MozLightingFilterAtts ATT_DISTANT_LIGHT_ELEVATION
]
