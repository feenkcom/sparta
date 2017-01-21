private - ffi
primRefCount: aHandle

	^ self ffiCall: #(ulong moz2d_inline_ref_ptr_count( void* aHandle ) )