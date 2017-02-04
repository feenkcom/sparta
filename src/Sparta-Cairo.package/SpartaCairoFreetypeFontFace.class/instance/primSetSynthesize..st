private - ffi
primSetSynthesize: aNumber

	^ self ffiCall: #(void cairo_ft_font_face_set_synthesize ( self, uint aNumber ) )