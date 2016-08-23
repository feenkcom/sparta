printing
printOn: aStream

	handle isNull
		ifTrue: [ ^ aStream nextPutAll: 'nullptr'; cr ].

	aStream nextPutAll: self class name, ' ('; cr.
	aStream tab; nextPutAll: 'extent: ', self extent asString; cr.
	aStream tab; nextPutAll: 'raster: ', self rasterType item asString; cr.
	aStream tab; nextPutAll: 'type: ', self backendType item asString; cr.
	aStream tab; nextPutAll: 'format: ', self pixelFormat item asString; cr.
	aStream tab; nextPutAll: 'stride: ', self stride asString; cr.
	aStream tab; nextPutAll: 'valid: ', self isValid asString; cr.
	aStream tab; nextPutAll: 'recording: ', self isRecording asString; cr.
	aStream tab; nextPutAll: 'subpixel aa allowed: ', self isAllowedSubpixelAA asString; cr.
	aStream tab; nextPutAll: 'handle: ', handle asString; cr.
	aStream tab; nextPutAll: 'refCount: ', self refCount asString; cr.
	aStream nextPutAll: ')'; cr.