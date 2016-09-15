private - ffi
primAddRef: aHandle

	^ self ffiCall: #(void moz2d_inline_ref_ptr_add_ref ( ulong aHandle ) )