Class {
	#name : #MozSpecularSpotLightFilter,
	#superclass : #MozSpecularLightingFilter,
	#traits : 'TSpartaSpotLight',
	#classTraits : 'TSpartaSpotLight classTrait',
	#category : 'Sparta-Moz2D-Filters'
}

{ #category : #accessing }
MozSpecularSpotLightFilter class >> filterType [
	^ MozFilterType SPOT_SPECULAR
]

{ #category : #accessing }
MozSpecularSpotLightFilter >> limitingConeAngle: aFloat [

	self 
		primSetAttributeFloat: aFloat
		index: MozLightingFilterAtts ATT_SPOT_LIGHT_LIMITING_CONE_ANGLE
]

{ #category : #accessing }
MozSpecularSpotLightFilter >> pointsAtX: x y: y z: z [

	self
		primSetAttributeX: x
		y: y
		z: z
		index: MozLightingFilterAtts ATT_SPOT_LIGHT_POINTS_AT
]

{ #category : #accessing }
MozSpecularSpotLightFilter >> positionX: x y: y z: z [

	self
		primSetAttributeX: x
		y: y
		z: z
		index: MozLightingFilterAtts ATT_SPOT_LIGHT_POSITION
]

{ #category : #accessing }
MozSpecularSpotLightFilter >> specularExponent: aFloat [

	self 
		primSetAttributeFloat: aFloat
		index: MozLightingFilterAtts ATT_SPECULAR_LIGHTING_SPECULAR_EXPONENT
]
