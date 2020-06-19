Extension { #name : #Float }

{ #category : #'*Sparta-Core' }
Float >> isSpartaScalar [
	^ self >= -3.40282347e38 and: [ self <= 3.40282347e38 ]
]
