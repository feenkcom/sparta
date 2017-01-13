private - ffi
primCall: aCallback intptr: aNumber

	^ self ffiCall: #(long moz2d_test_ffi_callback_intptr_t(FFICallback aCallback, long aNumber))