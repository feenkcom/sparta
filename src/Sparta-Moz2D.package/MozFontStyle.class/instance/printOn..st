printing
printOn: aStream

	aStream nextPutAll: self class name, ' ('; cr.
	aStream tab; nextPutAll: 'style: ', self printStyle; cr.
	aStream tab; nextPutAll: 'size: ', self size asString; cr.
	aStream tab; nextPutAll: 'weight: ', self weight asString; cr.
	aStream tab; nextPutAll: 'stretch: ', self stretch asString; cr.
	aStream tab; nextPutAll: 'language: ', self language; space.
	aStream nextPutAll: ')'; cr.