private - ffi
primRelease: aHandle

	^ self ffiCall: #( void moz2d_ref_ptr_release( void* aHandle ) )