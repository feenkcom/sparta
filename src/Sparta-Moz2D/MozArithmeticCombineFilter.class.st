Class {
	#name : #MozArithmeticCombineFilter,
	#superclass : #MozDoubleSourceFilter,
	#traits : 'TSpartaArithmeticCombineFilter',
	#classTraits : 'TSpartaArithmeticCombineFilter classTrait',
	#category : 'Sparta-Moz2D-Filters'
}

{ #category : #accessing }
MozArithmeticCombineFilter class >> filterType [
	^ MozFilterType ARITHMETIC_COMBINE
]

{ #category : #accessing }
MozArithmeticCombineFilter >> coefficients: anArrayOrFloat [
	"Must be of size one or four"
	|array|

	self assert: [
		anArrayOrFloat isCollection
			ifTrue: [ anArrayOrFloat size = 4 ]
			ifFalse: [ true ] ]
		description: [ 'Must have four coefficients!' ].
		
	array := anArrayOrFloat isCollection
		ifTrue: [ anArrayOrFloat ]
		ifFalse: [ Array new: 4 withAll: anArrayOrFloat ].
	
	self
		privateSetAttributeFloatArray: array
		index: MozArithmeticCombineFilterAtts ATT_ARITHMETIC_COMBINE_COEFFICIENTS
]
