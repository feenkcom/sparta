printing
printOn: aStream

	handle isNull
		ifTrue: [ ^ aStream nextPutAll: 'nullptr'; cr ].

	aStream nextPutAll: self class name, ' ('; cr.
	aStream tab; nextPutAll: 'extent: ', self extent asString; cr.
	aStream tab; nextPutAll: 'type: ', self type item asString; cr.
	aStream tab; nextPutAll: 'format: ', self format item asString; cr.
	aStream tab; nextPutAll: 'handle: ', handle asString; cr.
	aStream tab; nextPutAll: 'refCount: ', self refCount asString; cr.
	aStream nextPutAll: ')'; cr.