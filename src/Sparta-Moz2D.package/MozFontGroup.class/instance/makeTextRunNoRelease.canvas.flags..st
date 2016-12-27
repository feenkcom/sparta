instance creation
makeTextRunNoRelease: aString canvas: canvas flags: aFlags
	| byteArray aTextRun |
	byteArray := ZnUTF16Encoder new
		beLittleEndian;
		encodeString: aString.

	aTextRun := (self
		primMakeTextRun: byteArray
		drawTarget: canvas
		length: byteArray size / 2
		initialBreaks: nil "Didn't manage to make them work"
		initialBreaksCount: 0
		appUnitsPerDevUnit: 1
		"we store reference to byte array in TextRun, so it will live during
		lifetime of textrun => mark text as persistent"
		flags: aFlags | MozTextFlags TEXT_IS_PERSISTENT value)
			yourself.
	
	aTextRun buffer: byteArray.
	
	^ aTextRun