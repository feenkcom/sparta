Class {
	#name : #MozExtendModeTest,
	#superclass : #MozEnumTest,
	#category : 'Sparta-Moz2D-Tests'
}

{ #category : #accessing }
MozExtendModeTest >> enum [
	"This method was automatically generated"
	^ MozExtendMode
]

{ #category : #tests }
MozExtendModeTest >> testCLAMP [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum CLAMP item asString) value
		equals: self enum CLAMP value
]

{ #category : #tests }
MozExtendModeTest >> testREFLECT [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum REFLECT item asString) value
		equals: self enum REFLECT value
]

{ #category : #tests }
MozExtendModeTest >> testREPEAT [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum REPEAT item asString) value
		equals: self enum REPEAT value
]

{ #category : #tests }
MozExtendModeTest >> testREPEAT_X [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum REPEAT_X item asString) value
		equals: self enum REPEAT_X value
]

{ #category : #tests }
MozExtendModeTest >> testREPEAT_Y [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum REPEAT_Y item asString) value
		equals: self enum REPEAT_Y value
]

{ #category : #'private - ffi' }
MozExtendModeTest >> valueNamed: aName in: anAddress [
	"This method was automatically generated"
	^ self ffiCall: #(bool moz2d_test_ExtendMode(String aName, int* anAddress))
]
