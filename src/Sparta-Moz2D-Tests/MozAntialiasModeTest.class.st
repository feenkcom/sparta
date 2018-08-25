Class {
	#name : #MozAntialiasModeTest,
	#superclass : #MozEnumTest,
	#category : 'Sparta-Moz2D-Tests'
}

{ #category : #accessing }
MozAntialiasModeTest >> enum [
	"This method was automatically generated"
	^ MozAntialiasMode
]

{ #category : #tests }
MozAntialiasModeTest >> testDEFAULT [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum DEFAULT item asString) value
		equals: self enum DEFAULT value
]

{ #category : #tests }
MozAntialiasModeTest >> testGRAY [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum GRAY item asString) value
		equals: self enum GRAY value
]

{ #category : #tests }
MozAntialiasModeTest >> testNONE [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum NONE item asString) value
		equals: self enum NONE value
]

{ #category : #tests }
MozAntialiasModeTest >> testSUBPIXEL [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum SUBPIXEL item asString) value
		equals: self enum SUBPIXEL value
]

{ #category : #'private - ffi' }
MozAntialiasModeTest >> valueNamed: aName in: anAddress [
	"This method was automatically generated"
	^ self ffiCall: #(bool moz2d_test_AntialiasMode(String aName, int* anAddress))
]
