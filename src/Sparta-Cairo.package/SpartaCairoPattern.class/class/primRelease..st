private - ffi
primRelease: aHandle

	^ self ffiCall: #(void cairo_pattern_destroy (void* aHandle) )