Class {
	#name : #MozSpecularPointLightFilter,
	#superclass : #MozSpecularLightingFilter,
	#traits : 'TSpartaPointLight',
	#classTraits : 'TSpartaPointLight classTrait',
	#category : 'Sparta-Moz2D-Filters'
}

{ #category : #accessing }
MozSpecularPointLightFilter class >> filterType [
	^ MozFilterType POINT_SPECULAR
]

{ #category : #accessing }
MozSpecularPointLightFilter >> positionX: x y: y z: z [

	self
		primSetAttributeX: x
		y: y
		z: z
		index: MozLightingFilterAtts ATT_POINT_LIGHT_POSITION
]
