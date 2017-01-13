private - ffi
primInt8Min

	^ self ffiCall: #(int8 moz2d_test_ffi_fixed_signed_min_int8_t())