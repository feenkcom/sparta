Extension { #name : #FileReference }

{ #category : #'*Sparta-Core' }
FileReference >> asSpartaFontSource [
	^ SpUserFontSourceFile new file: self
]
