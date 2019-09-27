Extension { #name : #Integer }

{ #category : #'*Sparta-Moz2D' }
Integer >> asMozPreference [
	^ MozIntegerPreference value: self
]
