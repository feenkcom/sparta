private - ffi
primCall: aCallback uint64: aNumber

	^ self ffiCall: #(uint64 moz2d_test_ffi_callback_uint64_t(FFICallback aCallback, uint64 aNumber))