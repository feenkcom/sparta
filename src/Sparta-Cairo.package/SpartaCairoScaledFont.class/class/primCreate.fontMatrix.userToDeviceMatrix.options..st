private - ffi
primCreate: aCairoFontFace fontMatrix: aFontMatrix userToDeviceMatrix: aCTM options: theFontOptions

	^ self ffiCall: #( SpartaCairoScaledFont cairo_scaled_font_create (
		SpartaCairoFontFace aCairoFontFace,
		SpartaCairoMatrix * aFontMatrix,
		SpartaCairoMatrix * aCTM,
		SpartaCairoFontOptions theFontOptions ) )