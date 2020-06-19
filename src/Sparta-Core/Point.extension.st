Extension { #name : #Point }

{ #category : #'*Sparta-Core' }
Point >> isSpartaScalarPoint [
	^ self x isSpartaScalar and: [ self y isSpartaScalar ]
]
