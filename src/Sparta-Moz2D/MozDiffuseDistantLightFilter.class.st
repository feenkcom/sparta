Class {
	#name : #MozDiffuseDistantLightFilter,
	#superclass : #MozDiffuseLightingFilter,
	#traits : 'TSpartaDistantLight',
	#classTraits : 'TSpartaDistantLight classTrait',
	#category : 'Sparta-Moz2D-Filters'
}

{ #category : #accessing }
MozDiffuseDistantLightFilter class >> filterType [
	^ MozFilterType DISTANT_DIFFUSE
]

{ #category : #accessing }
MozDiffuseDistantLightFilter >> azimuth: aFloat [

	self 
		primSetAttributeFloat: aFloat
		index: MozLightingFilterAtts ATT_DISTANT_LIGHT_AZIMUTH
]

{ #category : #accessing }
MozDiffuseDistantLightFilter >> elevation: aFloat [

	self 
		primSetAttributeFloat: aFloat
		index: MozLightingFilterAtts ATT_DISTANT_LIGHT_ELEVATION
]
