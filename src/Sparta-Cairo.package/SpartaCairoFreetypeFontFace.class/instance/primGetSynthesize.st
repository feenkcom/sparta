private - ffi
primGetSynthesize

	^ self ffiCall: #(uint cairo_ft_font_face_get_synthesize ( self ) )