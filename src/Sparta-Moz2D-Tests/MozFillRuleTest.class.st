Class {
	#name : #MozFillRuleTest,
	#superclass : #MozEnumTest,
	#category : 'Sparta-Moz2D-Tests'
}

{ #category : #accessing }
MozFillRuleTest >> enum [
	"This method was automatically generated"
	^ MozFillRule
]

{ #category : #tests }
MozFillRuleTest >> testFILL_EVEN_ODD [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum FILL_EVEN_ODD item asString) value
		equals: self enum FILL_EVEN_ODD value
]

{ #category : #tests }
MozFillRuleTest >> testFILL_WINDING [
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum FILL_WINDING item asString) value
		equals: self enum FILL_WINDING value
]

{ #category : #'private - ffi' }
MozFillRuleTest >> valueNamed: aName in: anAddress [
	"This method was automatically generated"
	^ self ffiCall: #(bool moz2d_test_FillRule(String aName, int* anAddress))
]
