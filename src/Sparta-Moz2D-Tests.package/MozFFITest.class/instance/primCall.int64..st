private - ffi
primCall: aCallback int64: aNumber

	^ self ffiCall: #(int64 moz2d_test_ffi_callback_int64_t(FFICallback aCallback, int64 aNumber))