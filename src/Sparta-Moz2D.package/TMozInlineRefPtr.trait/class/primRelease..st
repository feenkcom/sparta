private - ffi
primRelease: aHandle

	^ self ffiCall: #( void moz2d_inline_ref_ptr_release( ulong aHandle ) )