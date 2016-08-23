printing
printOn: aStream

	aStream nextPutAll: self class name, ' ('; cr.
	aStream tab; nextPutAll: 'fonts: ', self asString; cr.
	aStream tab; nextPutAll: 'size: ', self size asString; cr.
	aStream tab; nextPutAll: 'default: ', self defaultFontType item asString; cr.
	aStream nextPutAll: ')'; cr.