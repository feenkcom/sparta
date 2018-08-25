Class {
	#name : #MozCapStyleTest,
	#superclass : #MozEnumTest,
	#category : 'Sparta-Moz2D-Tests'
}

{ #category : #accessing }
MozCapStyleTest >> enum [
	"This method was automatically generated"
	^ MozCapStyle
]

{ #category : #tests }
MozCapStyleTest >> testBUTT [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum BUTT item asString) value
		equals: self enum BUTT value
]

{ #category : #tests }
MozCapStyleTest >> testROUND [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum ROUND item asString) value
		equals: self enum ROUND value
]

{ #category : #tests }
MozCapStyleTest >> testSQUARE [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum SQUARE item asString) value
		equals: self enum SQUARE value
]

{ #category : #'private - ffi' }
MozCapStyleTest >> valueNamed: aName in: anAddress [
	"This method was automatically generated"
	^ self ffiCall: #(bool moz2d_test_CapStyle(String aName, int* anAddress))
]
