private - ffi
primUIntptr: aNumber

	^ self ffiCall: #(ulong moz2d_test_ffi_fixed_uintptr_t(ulong aNumber))