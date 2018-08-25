Extension { #name : #Color }

{ #category : #'*Sparta-Moz2D' }
Color >> asMozPatternOn: aMozCanvas [
	^ aMozCanvas pattern color: self
]
