private - ffi
primAddRef: aHandle

	^ self ffiCall: #(ulong moz2d_ref_ptr_add_ref ( void* aHandle ) )