printing
printOn: aStream
	aStream nextPutAll: self class name; nextPutAll: ' ('.

	self isNull
		ifFalse: [
			aStream cr.
			aStream tab; nextPutAll: 'fonts: '; nextPutAll: self asString; cr.
			aStream tab; nextPutAll: 'size: '; nextPutAll: self size asString; cr.
			aStream tab; nextPutAll: 'default: '; nextPutAll: self defaultFontType item asString; cr ]
		ifTrue: [ aStream nextPutAll: 'nil' ].
	aStream nextPutAll: ')'; cr