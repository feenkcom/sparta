Class {
	#name : #MozDrawTargetTypeTest,
	#superclass : #MozEnumTest,
	#category : 'Sparta-Moz2D-Tests'
}

{ #category : #accessing }
MozDrawTargetTypeTest >> enum [
	"This method was automatically generated"
	^ MozDrawTargetType
]

{ #category : #tests }
MozDrawTargetTypeTest >> testHARDWARE_RASTER [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum HARDWARE_RASTER item asString) value
		equals: self enum HARDWARE_RASTER value
]

{ #category : #tests }
MozDrawTargetTypeTest >> testSOFTWARE_RASTER [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum SOFTWARE_RASTER item asString) value
		equals: self enum SOFTWARE_RASTER value
]

{ #category : #tests }
MozDrawTargetTypeTest >> testVECTOR [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum VECTOR item asString) value
		equals: self enum VECTOR value
]

{ #category : #'private - ffi' }
MozDrawTargetTypeTest >> valueNamed: aName in: anAddress [
	"This method was automatically generated"
	^ self ffiCall: #(bool moz2d_test_DrawTargetType(String aName, int* anAddress))
]
