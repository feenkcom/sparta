private - ffi
primInt32: aNumber

	^ self ffiCall: #(int32 moz2d_test_ffi_fixed_int32_t(int32 aNumber))