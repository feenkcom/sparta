private - ffi
primTextToGlyphs: aBuffer length: aLength glyphs: theGlyphs num: aGlyphsCount x: aX y: aY

	^ self ffiCall: #(SpartaCairoStatus cairo_scaled_font_text_to_glyphs ( 
		self,
		double aX,
		double aY,
		void * aBuffer,
		int aLength,
		void** theGlyphs,
		int * aGlyphsCount,
		nil,
		nil,
		nil))