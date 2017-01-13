private - ffi
primRelease: aHandle

	^ self ffiCall: #(void moz2d_plain_ptr_release(ulong aHandle))