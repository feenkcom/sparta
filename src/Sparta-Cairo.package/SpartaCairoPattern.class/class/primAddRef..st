private - ffi
primAddRef: aHandle

	^ self ffiCall: #(void* cairo_pattern_reference (void* aHandle) )