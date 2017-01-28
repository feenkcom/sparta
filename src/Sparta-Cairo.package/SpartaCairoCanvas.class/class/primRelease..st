private - ffi
primRelease: aHandle

	^ self ffiCall: #(void cairo_destroy ( void* aHandle ) )