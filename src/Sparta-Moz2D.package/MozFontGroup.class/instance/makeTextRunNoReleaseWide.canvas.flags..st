instance creation
makeTextRunNoReleaseWide: aString canvas: canvas flags: aFlags
	| aTextRun aBuffer aLength aResult |

	aBuffer := ByteArray new: aString size * FFIUInt16 externalTypeSize.
	aResult := MozFontGroup new primChar32: aString toChar16: aBuffer length: aString size.

	"If result is false"
	aResult ifFalse: [ 
		aBuffer := ZnUTF16Encoder new
			beLittleEndian;
			encodeString: aString ].

	aLength := aBuffer size / 2.

	aTextRun := (self
		primMakeTextRun: aBuffer
		drawTarget: canvas
		length: aBuffer size / 2
		initialBreaks: nil "Didn't manage to make them work"
		initialBreaksCount: 0
		appUnitsPerDevUnit: 1
		"we store reference to byte array in TextRun, so it will live during
		lifetime of textrun => mark text as persistent"
		flags: aFlags | MozTextFlags TEXT_IS_PERSISTENT value)
			yourself.
	
	aTextRun buffer: aBuffer.

	^ aTextRun