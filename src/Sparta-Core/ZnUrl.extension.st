Extension { #name : #ZnUrl }

{ #category : #'*Sparta-Core' }
ZnUrl >> asSpartaFontSource [
	^ SpUserFontSourceUrl new url: self
]
