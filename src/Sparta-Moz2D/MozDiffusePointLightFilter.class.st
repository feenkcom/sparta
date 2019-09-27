Class {
	#name : #MozDiffusePointLightFilter,
	#superclass : #MozDiffuseLightingFilter,
	#traits : 'TSpartaPointLight',
	#classTraits : 'TSpartaPointLight classTrait',
	#category : 'Sparta-Moz2D-Filters'
}

{ #category : #accessing }
MozDiffusePointLightFilter class >> filterType [
	^ MozFilterType POINT_DIFFUSE
]

{ #category : #accessing }
MozDiffusePointLightFilter >> positionX: x y: y z: z [

	self
		primSetAttributeX: x
		y: y
		z: z
		index: MozLightingFilterAtts ATT_POINT_LIGHT_POSITION
]
