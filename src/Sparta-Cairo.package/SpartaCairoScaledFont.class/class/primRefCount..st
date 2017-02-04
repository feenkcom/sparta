private - ffi
primRefCount: aHandle

	^ self ffiCall: #(uint cairo_scaled_font_get_reference_count ( void* aHandle ) )