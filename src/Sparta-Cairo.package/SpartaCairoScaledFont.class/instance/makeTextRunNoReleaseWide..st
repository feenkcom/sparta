instance creation
makeTextRunNoReleaseWide: aString
	| aBuffer aGlyphsArrayPtr aGlyphsNumPtr aStatus aGlyphsArray aGlyphsNum  aTextRun |

	aGlyphsArrayPtr := ExternalAddress new.
	aGlyphsNumPtr := ByteArray new: FFIInt32 externalTypeSize.

	aBuffer := UTF8TextConverter default convertToSystemString: aString.

	aStatus := self primTextToGlyphs: aBuffer length: aBuffer size glyphs: aGlyphsArrayPtr num: aGlyphsNumPtr x: 0.0 y: 0.0.
	aStatus isSuccess
		ifFalse: [ SpartaCairoError signal: aStatus ].
	
	aGlyphsNum := aGlyphsNumPtr unsignedLongAt: 1.
	aGlyphsArray := FFIExternalArray fromHandle: aGlyphsArrayPtr type: SpartaCairoGlyph size: aGlyphsNum.

	aTextRun := SpartaCairoTextRun new
		bits: 32;
		buffer: aBuffer;
		length: aGlyphsNum;
		glyphs: aGlyphsArray;
		scaledFont: self.

	^ aTextRun