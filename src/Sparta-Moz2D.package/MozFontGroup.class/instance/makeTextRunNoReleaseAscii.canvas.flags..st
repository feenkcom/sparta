instance creation
makeTextRunNoReleaseAscii: aString canvas: canvas flags: aFlags
	| aTextRun aBuffer aLength |
	
	aBuffer := aString. "we can use it directly, without convertation"
	aLength := aBuffer size.

	aTextRun := (self
		primMakeTextRunASCII: aBuffer
		drawTarget: canvas
		length: aLength
		initialBreaks: nil "Didn't manage to make them work"
		initialBreaksCount: 0
		appUnitsPerDevUnit: 1
		"we store reference to byte array in TextRun, so it will live during
		lifetime of textrun => mark text as persistent"
		flags: aFlags | MozTextFlags TEXT_IS_PERSISTENT value)
			yourself.

	aTextRun buffer: aBuffer.
	aTextRun length: aString size.
	aTextRun bits: 8.

	^ aTextRun