Extension { #name : #Float }

{ #category : #'*Sparta-Skia' }
Float >> isSkiaScalar [
	^ self >= -3.40282347e38 and: [ self <= 3.40282347e38 ]
]
