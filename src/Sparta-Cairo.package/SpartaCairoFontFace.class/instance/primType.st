private - ffi
primType

	^ self ffiCall: #(SpartaCairoFontType cairo_font_face_get_type ( self ) )