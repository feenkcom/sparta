Extension { #name : #ByteArray }

{ #category : #'*Sparta-Core' }
ByteArray >> asSpartaFontSource [
	^ SpUserFontSourceBuffer new buffer: self
]
