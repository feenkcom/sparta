printing
printOn: aStream

	aStream nextPutAll: self class name, ' ('; cr.
	aStream tab; nextPutAll: 'name: ', self name; cr.
	aStream tab; nextPutAll: 'type: ', self type item asString; cr.
	aStream tab; nextPutAll: 'named: ', self isNamed asString; cr.
	aStream tab; nextPutAll: 'generic: ', self isGeneric asString; cr.
	aStream tab; nextPutAll: 'string: ', self asString; space.
	aStream nextPutAll: ')'; cr.