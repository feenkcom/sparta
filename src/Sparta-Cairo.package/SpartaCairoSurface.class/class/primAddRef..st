private - ffi
primAddRef: aHandle

	^ self ffiCall: #(void* cairo_surface_reference ( void* surface ) )