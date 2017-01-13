private - ffi
primCall: aCallback uint16: aNumber

	^ self ffiCall: #(uint16 moz2d_test_ffi_callback_uint16_t(FFICallback aCallback, uint16 aNumber))