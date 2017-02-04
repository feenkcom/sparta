private - ffi
primCreate: aFreetypeFontFace

	^ self ffiCall: #(SpartaCairoFreetypeFontFace cairo_ft_font_face_create_for_ft_face ( void* aFreetypeFontFace, 0 ) )