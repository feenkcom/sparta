private - ffi
primCall: aCallback uint8: aNumber

	^ self ffiCall: #(uint8 moz2d_test_ffi_callback_uint8_t(FFICallback aCallback, uint8 aNumber))