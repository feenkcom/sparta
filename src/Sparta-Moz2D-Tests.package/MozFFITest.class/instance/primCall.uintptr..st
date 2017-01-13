private - ffi
primCall: aCallback uintptr: aNumber

	^ self ffiCall: #(ulong moz2d_test_ffi_callback_uintptr_t(FFICallback aCallback, ulong aNumber))