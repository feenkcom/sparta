private - ffi
primCall: aCallback int16: aNumber

	^ self ffiCall: #(int16 moz2d_test_ffi_callback_int16_t(FFICallback aCallback, int16 aNumber))