"
I define an API of user font set that allows custom fonts to be used without the need to install them in the system
"
Trait {
	#name : #TSpUserFontSet,
	#category : #'Sparta-Core-Text'
}

{ #category : #adding }
TSpUserFontSet >> add: aUserFontFace [
	self explicitRequirement
]
