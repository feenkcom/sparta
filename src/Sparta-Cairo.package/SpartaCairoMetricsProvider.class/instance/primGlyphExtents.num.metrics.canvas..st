private - ffi
primGlyphExtents: theGlyphs num: aGlyphsNum metrics: aTextMetrics canvas: aCanvas

	^ self ffiCall: #( void cairo_glyph_extents (
		SpartaCairoCanvas aCanvas,
		FFIExternalArray theGlyphs,
		int aGlyphsNum,
		SpartaCairoTextMetrics* aTextMetrics ) )