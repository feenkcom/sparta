private - ffi
primFontExtents: aFontMetrics canvas: aCanvas

	^ self ffiCall: #( void cairo_font_extents (
		SpartaCairoCanvas aCanvas,
		SpartaCairoFontMetrics* aFontMetrics ) )