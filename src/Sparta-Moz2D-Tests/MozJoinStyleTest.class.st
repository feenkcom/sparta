Class {
	#name : #MozJoinStyleTest,
	#superclass : #MozEnumTest,
	#category : 'Sparta-Moz2D-Tests'
}

{ #category : #accessing }
MozJoinStyleTest >> enum [
	"This method was automatically generated"
	^ MozJoinStyle
]

{ #category : #tests }
MozJoinStyleTest >> testBEVEL [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum BEVEL item asString) value
		equals: self enum BEVEL value
]

{ #category : #tests }
MozJoinStyleTest >> testMITER [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum MITER item asString) value
		equals: self enum MITER value
]

{ #category : #tests }
MozJoinStyleTest >> testMITER_OR_BEVEL [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum MITER_OR_BEVEL item asString) value
		equals: self enum MITER_OR_BEVEL value
]

{ #category : #tests }
MozJoinStyleTest >> testROUND [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum ROUND item asString) value
		equals: self enum ROUND value
]

{ #category : #'private - ffi' }
MozJoinStyleTest >> valueNamed: aName in: anAddress [
	"This method was automatically generated"
	^ self ffiCall: #(bool moz2d_test_JoinStyle(String aName, int* anAddress))
]
