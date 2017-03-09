private - ffi
primCall: aCallback int: aNumber

	^ self ffiCall: #(int moz2d_test_ffi_callback_int(FFICallback aCallback, int aNumber))