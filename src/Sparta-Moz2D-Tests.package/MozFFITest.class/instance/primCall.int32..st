private - ffi
primCall: aCallback int32: aNumber

	^ self ffiCall: #(int32 moz2d_test_ffi_callback_int32_t(FFICallback aCallback, int32 aNumber))