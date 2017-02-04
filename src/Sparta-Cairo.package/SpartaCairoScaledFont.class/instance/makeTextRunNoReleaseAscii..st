instance creation
makeTextRunNoReleaseAscii: aString
	| aGlyphsArrayPtr aGlyphsNumPtr aStatus aGlyphsArray aGlyphsNum  aTextRun |

	aGlyphsArrayPtr := ExternalAddress new.
	aGlyphsNumPtr := ByteArray new: FFIInt32 externalTypeSize.

	aStatus := self primTextToGlyphs: aString length: aString size glyphs: aGlyphsArrayPtr num: aGlyphsNumPtr x: 0.0 y: 0.0.
	aStatus isSuccess
		ifFalse: [ SpartaCairoError signal: aStatus ].
	
	aGlyphsNum := aGlyphsNumPtr unsignedLongAt: 1.
	aGlyphsArray := FFIExternalArray fromHandle: aGlyphsArrayPtr type: SpartaCairoGlyph size: aGlyphsNum.

	aTextRun := SpartaCairoTextRun new
		bits: 8;
		buffer: aString;
		length: aGlyphsNum;
		glyphs: aGlyphsArray;
		scaledFont: self.

	^ aTextRun