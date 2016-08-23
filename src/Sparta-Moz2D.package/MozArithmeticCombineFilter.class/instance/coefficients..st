accessing
coefficients: anArrayOrFloat
	"Must be of size one or four"
	|array|

	self assert: [
		anArrayOrFloat isCollection
			ifTrue: [ anArrayOrFloat size = 4 ]
			ifFalse: [ true ] ]
		descriptionBlock: [ 'Must have four coefficients!' ].
		
	array := anArrayOrFloat isCollection
		ifTrue: [ anArrayOrFloat ]
		ifFalse: [ Array new: 4 withAll: anArrayOrFloat ].
	
	self
		privateSetAttributeFloatArray: array
		index: MozArithmeticCombineFilterAtts ATT_ARITHMETIC_COMBINE_COEFFICIENTS