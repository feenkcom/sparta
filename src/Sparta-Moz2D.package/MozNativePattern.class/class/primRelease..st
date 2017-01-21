private - ffi
primRelease: aHandle

	^ self ffiCall: #(void moz2d_pattern_delete (void* aHandle) )