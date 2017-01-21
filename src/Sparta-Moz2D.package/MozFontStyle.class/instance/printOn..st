printing
printOn: aStream

	aStream nextPutAll: self class name; nextPutAll: ' ('.
	self isNull
		ifFalse: [
			aStream cr.
			aStream tab; nextPutAll: 'style: '; nextPutAll: self printStyle; cr.
			aStream tab; nextPutAll: 'size: '; nextPutAll: self size asString; cr.
			aStream tab; nextPutAll: 'weight: '; nextPutAll: self weight asString; cr.
			aStream tab; nextPutAll: 'stretch: '; nextPutAll: self stretch item asString asLowercase capitalized; cr.
			aStream tab; nextPutAll: 'language: '; nextPutAll: self language; space. ]
		ifTrue: [ aStream nextPutAll: 'nil' ].
	aStream nextPutAll: ')'; cr.