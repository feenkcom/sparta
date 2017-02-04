private - ffi
primStatus

	^ self ffiCall: #(SpartaCairoStatus cairo_font_face_status ( self ) )