private - ffi
primRelease: aHandle

	^ self ffiCall: #(void cairo_scaled_font_destroy ( void* aHandle ) )