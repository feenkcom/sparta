private - ffi
primCall: aCallback uint32: aNumber

	^ self ffiCall: #(uint32 moz2d_test_ffi_callback_uint32_t(FFICallback aCallback, uint32 aNumber))