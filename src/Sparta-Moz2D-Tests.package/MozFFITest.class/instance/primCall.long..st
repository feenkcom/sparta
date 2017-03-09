private - ffi
primCall: aCallback long: aNumber

	^ self ffiCall: #(long moz2d_test_ffi_callback_long(FFICallback aCallback, long aNumber))