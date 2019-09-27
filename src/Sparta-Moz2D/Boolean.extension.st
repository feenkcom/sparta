Extension { #name : #Boolean }

{ #category : #'*Sparta-Moz2D' }
Boolean >> asMozPreference [
	^ MozBooleanPreference value: self
]
