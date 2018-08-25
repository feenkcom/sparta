Class {
	#name : #MozBackendTypeTest,
	#superclass : #MozEnumTest,
	#category : 'Sparta-Moz2D-Tests'
}

{ #category : #accessing }
MozBackendTypeTest >> enum [
	"This method was automatically generated"
	^ MozBackendType
]

{ #category : #tests }
MozBackendTypeTest >> testCAIRO [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum CAIRO item asString) value
		equals: self enum CAIRO value
]

{ #category : #tests }
MozBackendTypeTest >> testDIRECT2D [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum DIRECT2D item asString) value
		equals: self enum DIRECT2D value
]

{ #category : #tests }
MozBackendTypeTest >> testDIRECT2D1_1 [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum DIRECT2D1_1 item asString) value
		equals: self enum DIRECT2D1_1 value
]

{ #category : #tests }
MozBackendTypeTest >> testNONE [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum NONE item asString) value
		equals: self enum NONE value
]

{ #category : #tests }
MozBackendTypeTest >> testRECORDING [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum RECORDING item asString) value
		equals: self enum RECORDING value
]

{ #category : #tests }
MozBackendTypeTest >> testSKIA [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum SKIA item asString) value
		equals: self enum SKIA value
]

{ #category : #'private - ffi' }
MozBackendTypeTest >> valueNamed: aName in: anAddress [
	"This method was automatically generated"
	^ self ffiCall: #(bool moz2d_test_BackendType(String aName, int* anAddress))
]
