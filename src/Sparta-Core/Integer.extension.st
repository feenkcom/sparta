Extension { #name : #Integer }

{ #category : #'*Sparta-Core' }
Integer >> isSpartaScalar [
	^ self asFloat isSpartaScalar
]
