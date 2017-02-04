private - ffi
primAddRef: aHandle

	^ self ffiCall: #(void* cairo_scaled_font_reference ( void* aHandle ) )