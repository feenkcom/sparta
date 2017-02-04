instance creation
makeTextRunNoRelease: aString

	^ aString isWideString
		ifTrue: [ self makeTextRunNoReleaseWide: aString ]
		ifFalse: [ self makeTextRunNoReleaseAscii: aString ]