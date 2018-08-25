Class {
	#name : #MozSamplingModeTest,
	#superclass : #MozEnumTest,
	#category : 'Sparta-Moz2D-Tests'
}

{ #category : #accessing }
MozSamplingModeTest >> enum [
	"This method was automatically generated"
	^ MozSamplingMode
]

{ #category : #tests }
MozSamplingModeTest >> testGOOD [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum GOOD item asString) value
		equals: self enum GOOD value
]

{ #category : #tests }
MozSamplingModeTest >> testLINEAR [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum LINEAR item asString) value
		equals: self enum LINEAR value
]

{ #category : #tests }
MozSamplingModeTest >> testPOINT [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum POINT item asString) value
		equals: self enum POINT value
]

{ #category : #tests }
MozSamplingModeTest >> testSENTINEL [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum SENTINEL item asString) value
		equals: self enum SENTINEL value
]

{ #category : #'private - ffi' }
MozSamplingModeTest >> valueNamed: aName in: anAddress [
	"This method was automatically generated"
	^ self ffiCall: #(bool moz2d_test_SamplingFilter(String aName, int* anAddress))
]
