private - ffi
primInt64Min

	^ self ffiCall: #(int64 moz2d_test_ffi_fixed_signed_min_int64_t())