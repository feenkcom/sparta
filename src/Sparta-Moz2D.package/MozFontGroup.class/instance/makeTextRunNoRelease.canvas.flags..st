instance creation
makeTextRunNoRelease: aString canvas: canvas flags: aFlags
	| byteArray |
	byteArray := (ZnCharacterEncoder newForEncoding: 'utf16')
		beLittleEndian;
		encodeString: aString.

	^ (self
		primMakeTextRun: byteArray
		drawTarget: canvas
		length: byteArray size / 2
		initialBreaks: nil "Didn't manage to make them work"
		initialBreaksCount: 0
		appUnitsPerDevUnit: 1
		flags: aFlags)
			yourself