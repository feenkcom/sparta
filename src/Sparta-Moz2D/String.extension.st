Extension { #name : #String }

{ #category : #'*Sparta-Moz2D' }
String >> asMozPreference [
	^ MozStringPreference value: self
]
