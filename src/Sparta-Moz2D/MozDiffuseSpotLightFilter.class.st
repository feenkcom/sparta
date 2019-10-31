Class {
	#name : #MozDiffuseSpotLightFilter,
	#superclass : #MozDiffuseLightingFilter,
	#traits : 'TSpartaSpotLight',
	#classTraits : 'TSpartaSpotLight classTrait',
	#category : 'Sparta-Moz2D-Filters'
}

{ #category : #accessing }
MozDiffuseSpotLightFilter class >> filterType [
	^ MozFilterType SPOT_DIFFUSE
]

{ #category : #accessing }
MozDiffuseSpotLightFilter >> limitingConeAngle: aFloat [

	self 
		primSetAttributeFloat: aFloat
		index: MozLightingFilterAtts ATT_SPOT_LIGHT_LIMITING_CONE_ANGLE
]

{ #category : #accessing }
MozDiffuseSpotLightFilter >> pointsAtX: x y: y z: z [

	self
		primSetAttributeX: x
		y: y
		z: z
		index: MozLightingFilterAtts ATT_SPOT_LIGHT_POINTS_AT
]

{ #category : #accessing }
MozDiffuseSpotLightFilter >> positionX: x y: y z: z [

	self
		primSetAttributeX: x
		y: y
		z: z
		index: MozLightingFilterAtts ATT_SPOT_LIGHT_POSITION
]

{ #category : #accessing }
MozDiffuseSpotLightFilter >> specularExponent: aFloat [

	self 
		primSetAttributeFloat: aFloat
		index: MozLightingFilterAtts ATT_SPECULAR_LIGHTING_SPECULAR_EXPONENT
]
