instance creation
makeTextRunNoReleaseWide: aString canvas: canvas flags: aFlags
	| aTextRun aBuffer aLength aResult aBit |

	aBuffer := ByteArray new: aString size * FFIUInt16 externalTypeSize.
	aResult := MozFontGroup new primChar32: aString toChar16: aBuffer length: aString size.
	aLength := aBuffer size / 2.
	aBit := 16.
	"If result is false we was unable to convert char32 to char16.
	No problem, use built-in encoder. It is a rare case and may happen
	for smiles or other high value UTF symbols"
	aResult ifFalse: [ 
		| aDelta |

		aBuffer := ZnUTF16Encoder new
			beLittleEndian;
			encodeString: aString.
		"How many characters take 4 bits.
		Characters 0-65535 take 2 bits, other 4 bits"
		aDelta := (aBuffer size - (aString size * FFIUInt16 externalTypeSize)) / 2.
		aLength := aString size + aDelta.
		aBit := 32 ].

	aTextRun := (self
		primMakeTextRun: aBuffer
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
	aTextRun bits: aBit.

	^ aTextRun