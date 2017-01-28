private - ffi
primAddRef: aHandle

	^ self ffiCall: #( void cairo_reference ( void* aHandle ) )