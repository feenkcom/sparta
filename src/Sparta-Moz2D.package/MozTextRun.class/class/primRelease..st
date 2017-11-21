private - ffi
primRelease: aHandle
	^ self ffiCall: #( void moz2d_text_run_release ( void* aHandle ) )