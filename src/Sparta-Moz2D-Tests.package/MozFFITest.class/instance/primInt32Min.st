private - ffi
primInt32Min

	^ self ffiCall: #(int32 moz2d_test_ffi_fixed_signed_min_int32_t())