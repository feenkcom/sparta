instance creation
makeTextRunNoRelease: aString canvas: canvas flags: aFlags

	^ aString isWideString
		ifTrue: [ self makeTextRunNoReleaseWide: aString canvas: canvas flags: aFlags ]
		ifFalse: [ self makeTextRunNoReleaseAscii: aString canvas: canvas flags: aFlags ]