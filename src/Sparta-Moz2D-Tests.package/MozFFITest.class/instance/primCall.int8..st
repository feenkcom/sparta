private - ffi
primCall: aCallback int8: aNumber

	^ self ffiCall: #(int8 moz2d_test_ffi_callback_int8_t(FFICallback aCallback, int8 aNumber))