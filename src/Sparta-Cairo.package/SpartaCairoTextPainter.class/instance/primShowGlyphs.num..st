private - ffi
primShowGlyphs: aGlyphsArray num: aNumberOfGlyphs

	^ self ffiCall: #( void cairo_show_glyphs (
		SpartaCairoCanvas canvas,
		FFIExternalArray aGlyphsArray,
		int aNumberOfGlyphs ) )